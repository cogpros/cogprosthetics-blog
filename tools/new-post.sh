#!/bin/bash
# new-post.sh — Create a new Jekyll blog post with correct date handling.
# Usage: ./tools/new-post.sh "Post Title Here" "category1,category2"
#
# Uses bare date (YYYY-MM-DD) to avoid Jekyll's UTC conversion bug.
# Timezone: America/Regina (Saskatchewan, no DST).

set -euo pipefail

BLOG_DIR="$(cd "$(dirname "$0")/.." && pwd)"
POSTS_DIR="${BLOG_DIR}/_posts"

if [ -z "${1:-}" ]; then
  echo "Usage: $0 \"Post Title\" [\"category1,category2\"]"
  exit 1
fi

TITLE="$1"
CATEGORIES="${2:-}"

# Date in Regina timezone (no DST)
DATE=$(TZ=America/Regina date +%Y-%m-%d)

# Slug: lowercase, spaces to hyphens, strip non-alphanumeric
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9 ]//g' | tr ' ' '-' | sed 's/--*/-/g' | sed 's/^-//;s/-$//')

FILENAME="${DATE}-${SLUG}.md"
FILEPATH="${POSTS_DIR}/${FILENAME}"

if [ -f "$FILEPATH" ]; then
  echo "File already exists: $FILEPATH"
  exit 1
fi

# Build categories array
if [ -n "$CATEGORIES" ]; then
  CAT_ARRAY=$(echo "$CATEGORIES" | tr ',' '\n' | sed 's/^ *//;s/ *$//' | paste -sd',' - | sed 's/,/, /g')
  CAT_LINE="categories: [$CAT_ARRAY]"
else
  CAT_LINE="categories: []"
fi

cat > "$FILEPATH" << EOF
---
layout: post
title: "$TITLE"
date: $DATE
$CAT_LINE
---

[Write content here]
EOF

echo "Created: $FILEPATH"
echo "Date: $DATE"
echo "URL: /${DATE//-/\/}/${SLUG}/"
