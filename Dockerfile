FROM ibmcom/swift-ubuntu:latest

WORKDIR /app
ADD . ./

RUN swift package clean
RUN swift build -c release

EXPOSE 8080

ENTRYPOINT [".build/release/Run", "--hostname", "0.0.0.0", "--port", "8080"]