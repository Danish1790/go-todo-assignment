# Use official Go image as the build environment
FROM golang:1.19

# Set working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum first to cache dependencies
COPY go.mod go.sum ./
COPY .env ./

# Download dependencies
RUN go mod download

# Copy the entire source code
COPY . .

# Expose port (adjust if your app uses a different one)
EXPOSE 8080

# Command to run the app (same as your local 'go run main.go')
CMD ["go", "run", "main.go"]
