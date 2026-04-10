#!/bin/bash

# Mitjavila Enterprise — Facebook Posting Script
# Posts to the Mitjavila Enterprise Facebook page via the Graph API
# Usage: ./post-to-facebook.sh "Your message text here"

# Load credentials from .env.local
source ./.env.local

# Check if message was provided
if [ -z "$1" ]; then
    echo "Usage: ./post-to-facebook.sh \"Your message text here\""
    exit 1
fi

MESSAGE="$1"
PAGE_ID=$FACEBOOK_PAGE_ID
ACCESS_TOKEN=$FACEBOOK_PAGE_ACCESS_TOKEN

echo "📱 Posting to Mitjavila Enterprise..."
echo "Message: $MESSAGE"
echo ""

# Make the API call
RESPONSE=$(curl -s -X POST \
  "https://graph.facebook.com/v19.0/${PAGE_ID}/feed" \
  -d "message=${MESSAGE}" \
  -d "access_token=${ACCESS_TOKEN}")

# Check for errors (simple string search instead of jq)
if echo "$RESPONSE" | grep -q '"error"'; then
    echo "❌ Error posting to Facebook:"
    echo "$RESPONSE"
    exit 1
else
    # Extract post ID from response (basic parsing)
    POST_ID=$(echo "$RESPONSE" | grep -o '"id":"[^"]*"' | head -1 | cut -d'"' -f4)
    if [ -n "$POST_ID" ]; then
        echo "✅ Post successful!"
        echo "Post ID: $POST_ID"
        echo "URL: https://www.facebook.com/$POST_ID"
    else
        echo "⚠️ Response received but couldn't parse post ID:"
        echo "$RESPONSE"
    fi
fi
