<p align="center">
    <img src="https://user-images.githubusercontent.com/1342803/36623515-7293b4ec-18d3-11e8-85ab-4e2f8fb38fbd.png" width="320" alt="API Template">
    <br>
    <br>
    <a href="http://docs.vapor.codes/4.0/">
        <img src="http://img.shields.io/badge/read_the-docs-2196f3.svg" alt="Documentation">
    </a>
    <a href="https://discord.gg/vapor">
        <img src="https://img.shields.io/discord/431917998102675485.svg" alt="Team Chat">
    </a>
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://circleci.com/gh/vapor/api-template">
        <img src="https://circleci.com/gh/vapor/api-template.svg?style=shield" alt="Continuous Integration">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-5.2-brightgreen.svg" alt="Swift 5.2">
    </a>
</p>

<h1>Skate-Budapest Vapor Backend</h1>

Simple backend for Skate-Budapest iOS app using Swift with Vapor web framework.


## Specification

- See the [API Documentation](https://balazs630.github.io/Skate-Budapest-Vapor/) (Swagger with ReDoc)
- Preview spec version for branch [`[gh-pages]`](https://github.com/balazs630/Skate-Budapest-Vapor/tree/gh-pages)


## Installation

Install [Xcode 11.4 or greater](https://itunes.apple.com/us/app/xcode/id497799835?mt=12) from the Mac App Store. Vapor 4 requires Swift 5.2 or greater.

Install PostgreSQL and pgAdmin with [Homebrew](https://brew.sh):
```
brew install --cask pgadmin4
brew install postgresql@9.6
```

Start PostgreSQL service:
```
brew services start postgresql@9.6
```

Create separate user and database for `development` and `testing` environments with pgAdmin. See dotenv configurations as an example.

Steps:
- create new server called `skate-budapest-local`
  - host: localhost
  - port: 5432
  - maintenance database: postgres
  - username: `whoami` (check default user)
- create a new user for both environments (without password) and with `Login privileges` only
- create a new database for both environments, set it's owner user
  
Execute seed data/migration sql scripts into the databases from the `/Resources` folder.

Clone the project, then open `Package.swift` in Xcode. It will download the dependencies and prepare the targets with Swift Package Manager.


## Deployment

If you're running the service from Xcode, make sure to add a custom working directory:

`SkateBudapestVapor > Edit Scheme... > Run > Options >  Use custom working directory > 'browse project root here...'`

It's needed to load dotenv files properly.

See [this guide](VM%20INSTANCE%20README.md) how I managed to host the service on Ubuntu with Google Cloud on a Compute Engine instance.


## Uptime check
Using Uptime Robot with endpoint checks in every minute, see [public status page](http://uptimerobot.libertyskate.hu/).

Sends e-mail notification/SMS if the endpoints are down.
