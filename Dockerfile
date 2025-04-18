# Build stage
FROM golang:1.23.0 AS builder
WORKDIR /app

# Copy dependencies first
COPY go.mod go.sum ./
RUN go mod download

# Copy source code
COPY . .

# Compile the Go binary for Linux
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app main.go

# Use a minimal runtime image (Debian instead of Alpine)
FROM debian:latest
WORKDIR /root/

# Copy the compiled Go binary
COPY --from=builder /app/app .

# Ensure it's executable
RUN chmod +x app

# Expose port
EXPOSE 7500

# Run the application
CMD ["./app"]

