## Setting up production environment


## **Ubuntu 18.04 LTS**
### **Ubuntu Server public IP: 35.185.80.180**

Set permanent public IP for VM instance in Google Cloud Compute:
* VM details page / network interface: default / External IP address menu / + Reserve static address
* (or attach previously reserved static IP to the VM instance)

Allow Firewall rules:
* "default-allow-http" firewall rule is required for Let's encrypt renewal process
* "default-allow-https" is required for secure connection to the API from mobile

```bash
sudo apt-get update
sudo apt-get upgrade
```


### **Prepare new A record on domain registrar**
We need to point a purchased domain to the VM's static IP address in order to have a secure https connection to this API later...
Login to the domain registrar's admin page. In my case it's under Cpanel / DNS zone editor. 

Create a new "A" record: 
- name: skatebudapest.libertyskate.hu
- IP: 35.185.80.180


### **PostgreSQL install, configure**
```bash
sudo add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-9.6
sudo -s
sudo -u postgres psql postgres
\password postgres
\q
exit
```

```bash
sudo nano /etc/postgresql/9.6/main/pg_hba.conf
```
Add:
>host    all             all           0.0.0.0/0         md5  

Whitelist all IP address, I'll limit the list of incoming IP addresses with GCP Firewall rules in the next step.

```bash
sudo nano /etc/postgresql/9.6/main/postgresql.conf
```

Modify to: 
>listen_addresses = '*'  
 
```bash
sudo service postgresql restart
```


### **Enable external access for PostgreSQL**
Google Cloud Console / VPC network / Firewall rules / + Create Firewall rule
 
 >Name: default-allow-postgres  
 >Type: Ingress  
 >Targets: Apply to all  
 >IP ranges: my-ip-here/32  
 >Ports: tcp:5432  
 >Action: Allow  
 
 ### **Manage databases**
 
Install [TablePlus](https://tableplus.com) / [pgAdmin](https://www.pgadmin.org) database manager on dev Macintosh:
```
brew cask install tableplus
brew cask install pgadmin4
```

* Add new server connection: connect with default user/pass/database: postgres/postgres/postgres
* Create a new main database with a new user using pgAdmin
* Execute seed data/migration sql scripts into the database from the `/Resources` folder.


### **Nginx web server install, configuration**
```bash
sudo apt-get install nginx
systemctl status nginx
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
```

```bash
sudo nano /etc/nginx/snippets/ssl-params.conf
```

>ssl_protocols TLSv1 TLSv1.1 TLSv1.2;  
>ssl_prefer_server_ciphers on;  
>ssl_ciphers "EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH";  
>ssl_ecdh_curve secp384r1;  
>ssl_session_cache shared:SSL:10m;  
>ssl_session_tickets off;  
>ssl_stapling on;  
>ssl_stapling_verify on;  
>resolver 8.8.8.8 8.8.4.4 valid=300s;  
>resolver_timeout 5s;  
>add_header Strict-Transport-Security "max-age=63072000; includeSubdomains";  
>add_header X-Frame-Options DENY;  
>add_header X-Content-Type-Options nosniff;  

```bash
sudo rm /etc/nginx/sites-available/default
sudo rm /etc/nginx/sites-enabled/default
sudo touch /etc/nginx/sites-enabled/skate-budapest-vapor
sudo nano /etc/nginx/sites-enabled/skate-budapest-vapor
```

>server {  
>    server_name skatebudapest.libertyskate.hu;  
>    listen 80 default_server;  
>    listen [::]:80 default_server;  
>  
>    listen 443 ssl http2 default_server;  
>    listen [::]:443 ssl http2 default_server;  
>    include snippets/ssl-params.conf;  
>  
>    try_files $uri @proxy;  
>    location @proxy {  
>        proxy_pass http://localhost:8080;  
>        proxy_pass_header Server;  
>        proxy_set_header Host $host;  
>        proxy_set_header X-Real-IP $remote_addr;  
>        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;  
>        proxy_pass_header Server;  
>        proxy_connect_timeout 3s;  
>        proxy_read_timeout 10s;  
>    }  
>}  

Raise max body size in the "http" section - tipically for multipart requests (default is 1MB)
```bash
sudo nano /etc/nginx/nginx.conf
```
> client_max_body_size 20M;

Verify:
```bash
sudo nginx -t
```

Expected output:
>nginx: the configuration file /etc/nginx/nginx.conf syntax is ok  
>nginx: configuration file /etc/nginx/nginx.conf test is successful  

```bash
sudo reboot
```

Test connection (nginx 502 should appear): https://skatebudapest.libertyskate.hu


### **Create SSL certificate with Let's encrypt**
Self-signed certificates are not publicly trusted, it has problems with iOS App Transport Security (ATS). So we need a Certificate Authority (CA) for this: Let's encrypt.
Previously we pointed the domain to the VM's static public IP.

```bash
sudo add-apt-repository ppa:certbot/certbot
sudo apt install python-certbot-nginx

sudo certbot --nginx -d skatebudapest.libertyskate.hu
```

Enter an email address and agree to the terms of service.
Select 1: No redirect - Make no further changes to the webserver configuration.

Verify that the "ssl_certificate" and the "ssl_certificate_key" is added to the configuration:
```bash
sudo nano /etc/nginx/sites-enabled/skate-budapest-vapor
```

List certificates, expiry dates, verify no errors:
```bash
sudo certbot certificates
```

The certificate auto-renewal script is saved here as a cron job automatically:
```bash
sudo nano /etc/cron.d/certbot
```

Check if the auto-renewal works:
```bash
sudo certbot renew --dry-run
```

Verify browser's security indicator. (nginx 502 should appear with a lock sign): https://skatebudapest.libertyskate.hu


### **Install Swift**
Install Swift Dependencies:
```bash
sudo apt-get update
sudo apt-get install clang libicu-dev libatomic1 build-essential pkg-config
```

Install Vapor's system dependencies:
```bash
sudo apt-get install openssl libssl-dev zlib1g-dev libsqlite3-dev
```

Take a look at Linux install notes on [Swift's Downloads page](https://swift.org/download/#using-downloads)

Download and decompress the Swift toolchain:
```bash
wget https://swift.org/builds/swift-5.2.4-release/ubuntu1804/swift-5.2.4-RELEASE/swift-5.2.4-RELEASE-ubuntu18.04.tar.gz
tar xzf swift-5.2.4-RELEASE-ubuntu18.04.tar.gz
```

Move Swift somewhere easy to acess:
```bash
sudo mkdir /swift
sudo mv swift-5.2.4-RELEASE-ubuntu18.04 /swift/5.2.4
```

Add Swift to /usr/bin so it can be executed by vapor and root:
```bash
sudo ln -s /swift/5.2.4/usr/bin/swift /usr/bin/swift
```

Verify:
```bash
swift --version
```


### **Configure Git, clone project**
```bash
git config --global user.email "balazs630@icloud.com"
git config --global user.name "Horváth Balázs"
git clone https://github.com/balazs630/Skate-Budapest-Vapor.git
```


### **Set permanent env variables for Vapor API (Postgres & Mailgun secrets)**
```bash
sudo nano ~/.profile
```

Add:
>export SKTBPST_SERVER_PROD_API_KEY="value-here"  

>export SKTBPST_PSQL_IP="value-here"  
>export SKTBPST_PSQL_PORT="value-here"  
>export SKTBPST_PSQL_USERNAME="value-here"  
>export SKTBPST_PSQL_DATABASE="value-here"  
>export SKTBPST_PSQL_PASSWORD="value-here"  

>export SKTBPST_MAILGUN_API_KEY="value-here"  
>export SKTBPST_MAILGUN_DOMAIN="value-here"  


### **Clean build folder after a change**
```bash
cd ~/development/Skate-Budapest-Vapor/ ; git pull
sudo rm -R ~/development/Skate-Budapest-Vapor/.build
```


### **Manual run**
```bash
tmux
free -m
swift build --package-path /home/balazs630uk/development/Skate-Budapest-Vapor/ --configuration release
/home/balazs630uk/development/Skate-Budapest-Vapor/.build/release/Run serve --env production
```
Close tmux:
> Ctrl+B, followed by D

Close ssh session.


### **Automatic startup script**
In case of any GCP service outage or maintanance, we can fire up our API automatically after a reboot.

Create a startup script for the Vapor API: 
```bash
sudo touch ~/development/startup.sh
sudo nano ~/development/startup.sh
```

Add:
>#! /bin/bash  
>  
>swift build --package-path /home/balazs630uk/development/Skate-Budapest-Vapor/ --configuration release  
>/home/balazs630uk/development/Skate-Budapest-Vapor/.build/release/Run serve --env production  

```bash
sudo chmod +x ~/development/startup.sh
```

Configure startup script for the Compute Engine instance with GCP Console.

Select the instance > `Edit`,  Custom metadada `+ Add item`:

Key:
```
startup-script
```

Value:
```bash
#! /bin/bash

echo "User: $(whoami)"
echo "Working directory: $(pwd)"

sudo -H -u balazs630uk tmux new-session -d -s skate-budapest
sudo -H -u balazs630uk tmux send -t skate-budapest /home/balazs630uk/development/startup.sh ENTER
```
We need to switch to our user account `balazs630uk` because startup scripts are executed as `root` by defualt - which is managed by GCP.

Inspect startup-script logs:
```bash
sudo journalctl -u google-startup-scripts.service
```

Try out startup script:
```bash
sudo reboot
```


### **Restore tmux session**
Attach:
```bash
tmux a
```
or

```bash
tmux a -t skate-budapest
```
