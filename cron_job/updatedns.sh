#!/bin/sh
# Retrieve the current public IP
IP=$(curl -s https://api.ipify.org)

# Check if IP retrieval was successful
if [ -z "$IP" ]; then
  echo "Failed to retrieve IP address"
  exit 1
fi

echo "Current public IP is ${IP}"

# Update Cloudflare DNS record (A record example)
curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/${CF_ZONE_ID}/dns_records/${CF_RECORD_ID}" \
     -H "Authorization: Bearer ${CF_API_TOKEN}" \
     -H "Content-Type: application/json" \
     --data "{\"type\":\"A\",\"name\":\"${CF_RECORD_NAME}\",\"content\":\"${IP}\",\"ttl\":1,\"proxied\":false}"

echo "DNS update request sent to Cloudflare."

