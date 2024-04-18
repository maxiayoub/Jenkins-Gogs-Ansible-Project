#!/bin/bash


BUILD_STATUS="$1"

# SMTP server settings for Gmail
SMTP_SERVER="smtp.gmail.com"
SMTP_PORT="587"
SMTP_USERNAME="maximousfrayoub1@gmail.com"

# Recipient email address
TO="maximousfr.ayoubmehanne@gmail.com"

# Email subject and body
SUBJECT="Jenkins Pipeline Notification"
BODY="Pipeline executed on: $(date)\nPipeline Status: ${BUILD_STATUS}."

# Construct the email message
MESSAGE="Subject: $SUBJECT\n\n$BODY"

# Send the email using Curl
curl --url "smtp://$SMTP_SERVER:$SMTP_PORT" \
     --ssl-reqd \
     --mail-from "$SMTP_USERNAME" \
     --mail-rcpt "$TO" \
     --user "$SMTP_USERNAME:$SMTP_PASSWORD" \
     --tlsv1.2 \
     -T <(echo -e "$MESSAGE")

echo "Email sent to $TO"

