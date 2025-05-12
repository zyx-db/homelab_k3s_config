# Use a lightweight base image with curl (e.g., Alpine Linux)
FROM alpine:latest

# Install curl (and any other dependency you might need)
RUN apk --no-cache add curl

# Copy the script into the container
COPY update-ddns.sh /usr/local/bin/update-ddns.sh
RUN chmod +x /usr/local/bin/update-ddns.sh

# Set default command to execute the update script
CMD ["/usr/local/bin/update-ddns.sh"]
