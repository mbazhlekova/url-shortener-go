# Specify the base image for the go app
FROM golang:1.17
# Specify that we need to execute any commands in this directory
WORKDIR /go/src/github.com/url-shortener-go
# Copy everything from this project into the filesystem of the container
COPY . .
# Init project
RUN go mod init
# Obtain the package needed to run the code
RUN go get -u github.com/lib/pq
# Compile the binary exe for our app
RUN go build -o main .
# Start the application
CMD ["./main"]