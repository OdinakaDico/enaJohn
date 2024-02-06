#!/bin/bash

# Set the subject and body of the email
SUBJECT="New Blog Post Published!"
BODY="A new post has been published on my blog. Check it out at: https://github.com/23W-GBAC/enaJohn/tree/main"

# Define the file containing subscriber email addresses
SUBSCRIBERS_FILE="subscribers.txt"

# Check if the subscribers file exists
if [ ! -f "$SUBSCRIBERS_FILE" ]; then
    echo "Subscribers file not found: $SUBSCRIBERS_FILE"
    exit 1
fi

# Loop through the list of email
while IFS= read -r email; do
    # Send the email using the 'mail' command
    echo "$BODY" | mail -s "$SUBJECT" "$email"
done < "$SUBSCRIBERS_FILE"

