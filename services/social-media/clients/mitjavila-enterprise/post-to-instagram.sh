#!/bin/bash

# Mitjavila Enterprise — Instagram Posting Script (Updated)
# Uses Meta Graph API to post to Instagram with images
# Requires: .env.local with INSTAGRAM_BUSINESS_ACCOUNT_ID and INSTAGRAM_PAGE_ACCESS_TOKEN

set -e

# Load credentials from .env.local
if [ -f "$(dirname "$0")/.env.local" ]; then
    source "$(dirname "$0")/.env.local"
else
    echo "❌ Error: .env.local not found"
    exit 1
fi

# Check required variables
if [ -z "$INSTAGRAM_BUSINESS_ACCOUNT_ID" ] || [ -z "$INSTAGRAM_PAGE_ACCESS_TOKEN" ]; then
    echo "❌ Error: Missing Instagram credentials in .env.local"
    exit 1
fi

# Parse arguments
IMAGE_URL="${1:-}"
CAPTION="${2:-}"

if [ -z "$IMAGE_URL" ]; then
    echo "Usage: $0 \"<image_url>\" \"<caption>\""
    echo ""
    echo "Examples:"
    echo "  $0 \"https://example.com/image.jpg\" \"📱 Check out our new service!\""
    echo "  $0 \"https://unsplash.com/photo-123.jpg\" \"Amazing content! #MitjavilaEnterprise\""
    exit 1
fi

# API endpoints
API_VERSION="v19.0"
MEDIA_ENDPOINT="https://graph.instagram.com/${API_VERSION}/${INSTAGRAM_BUSINESS_ACCOUNT_ID}/media"
PUBLISH_ENDPOINT="https://graph.instagram.com/${API_VERSION}/${INSTAGRAM_BUSINESS_ACCOUNT_ID}/media_publish"

echo "📤 Posting to Instagram (@mitjavilaenterprise)..."
echo "🖼️  Image: ${IMAGE_URL:0:50}..."
if [ -n "$CAPTION" ]; then
    echo "📝 Caption: ${CAPTION:0:50}..."
fi
echo ""

# Step 1: Create media container with image
echo "⏳ Step 1: Creating media container..."

CONTAINER_RESPONSE=$(curl -s -X POST "$MEDIA_ENDPOINT" \
  -d "image_url=$IMAGE_URL" \
  -d "caption=$CAPTION" \
  -d "access_token=$INSTAGRAM_PAGE_ACCESS_TOKEN")

CONTAINER_ID=$(echo "$CONTAINER_RESPONSE" | grep -o '"id":"[^"]*"' | head -1 | cut -d'"' -f4)

if [ -z "$CONTAINER_ID" ]; then
    echo "❌ Failed to create media container"
    echo "Response: $CONTAINER_RESPONSE"
    exit 1
fi

echo "✅ Container created: $CONTAINER_ID"
echo ""

# Wait for media to be processed
echo "⏳ Waiting for media to process (this may take a moment)..."
sleep 3
echo "✅ Media ready"
echo ""

# Step 2: Publish the container (go live)
echo "⏳ Step 2: Publishing to Instagram feed..."

PUBLISH_RESPONSE=$(curl -s -X POST "$PUBLISH_ENDPOINT" \
  -d "creation_id=$CONTAINER_ID" \
  -d "access_token=$INSTAGRAM_PAGE_ACCESS_TOKEN")

POST_ID=$(echo "$PUBLISH_RESPONSE" | grep -o '"id":"[^"]*"' | head -1 | cut -d'"' -f4)

if [ -z "$POST_ID" ]; then
    echo "❌ Failed to publish post"
    echo "Response: $PUBLISH_RESPONSE"
    exit 1
fi

echo "✅ Post published!"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎉 POST SUCCESSFUL!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Post ID: $POST_ID"
echo "Account: @mitjavilaenterprise"
echo "Time: $(date '+%Y-%m-%d %H:%M:%S %Z')"
echo ""
echo "View on Instagram:"
echo "https://www.instagram.com/mitjavilaenterprise"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
