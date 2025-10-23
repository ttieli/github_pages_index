#!/bin/bash

# Fetch GitHub Pages Projects Script
# This script fetches all repositories with GitHub Pages enabled

set -e

echo "========================================"
echo "GitHub Pages Projects Fetcher"
echo "========================================"
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "GitHub CLI (gh) is not installed."
    echo ""
    echo "Please install it first:"
    echo "  macOS: brew install gh"
    echo "  Other: https://cli.github.com/manual/installation"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo "Not authenticated with GitHub CLI."
    echo "Please run: gh auth login"
    exit 1
fi

GITHUB_USERNAME="ttieli"

echo -e "${YELLOW}Fetching repositories for user: $GITHUB_USERNAME${NC}"
echo ""

# Create temporary file for results
TEMP_FILE=$(mktemp)
OUTPUT_FILE="github-pages-projects.txt"
HTML_SNIPPET_FILE="github-pages-projects.html"

echo "Scanning repositories..."
echo ""

# Fetch all public repositories
REPOS=$(gh repo list "$GITHUB_USERNAME" --limit 100 --json name,description,url,homepageUrl,isPrivate,isFork --jq '.[] | select(.isPrivate == false)')

# Counter
TOTAL_REPOS=0
PAGES_REPOS=0

# Clear output files
> "$OUTPUT_FILE"
> "$HTML_SNIPPET_FILE"
> "$TEMP_FILE"

echo "Repository Name | Description | Pages URL | Repo URL" >> "$OUTPUT_FILE"
echo "---------------|-------------|-----------|----------" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Process each repository
while IFS= read -r repo; do
    REPO_NAME=$(echo "$repo" | jq -r '.name')
    DESCRIPTION=$(echo "$repo" | jq -r '.description // "No description"')
    REPO_URL=$(echo "$repo" | jq -r '.url')
    HOMEPAGE_URL=$(echo "$repo" | jq -r '.homepageUrl // ""')
    IS_FORK=$(echo "$repo" | jq -r '.isFork')

    ((TOTAL_REPOS++))

    # Check if repository has GitHub Pages enabled
    PAGES_INFO=$(gh api "repos/$GITHUB_USERNAME/$REPO_NAME/pages" 2>/dev/null || echo "")

    if [ -n "$PAGES_INFO" ]; then
        PAGES_URL=$(echo "$PAGES_INFO" | jq -r '.html_url // ""')

        if [ -n "$PAGES_URL" ]; then
            ((PAGES_REPOS++))

            # Skip forks unless they have a custom homepage
            if [ "$IS_FORK" = "true" ] && [ -z "$HOMEPAGE_URL" ]; then
                continue
            fi

            echo -e "${GREEN}✓${NC} $REPO_NAME"
            echo "  Pages: $PAGES_URL"
            echo "  Description: $DESCRIPTION"
            echo ""

            # Save to text file
            echo "$REPO_NAME | $DESCRIPTION | $PAGES_URL | $REPO_URL" >> "$TEMP_FILE"
        fi
    fi
done < <(echo "$REPOS" | jq -c '.')

# Sort and save results
if [ -s "$TEMP_FILE" ]; then
    sort -f "$TEMP_FILE" >> "$OUTPUT_FILE"
fi

echo "" >> "$OUTPUT_FILE"
echo "Total repositories scanned: $TOTAL_REPOS" >> "$OUTPUT_FILE"
echo "Repositories with GitHub Pages: $PAGES_REPOS" >> "$OUTPUT_FILE"

# Generate HTML snippets
echo "<!-- GitHub Pages Projects -->" > "$HTML_SNIPPET_FILE"
echo "<!-- Copy these <article> blocks into your index.html -->" >> "$HTML_SNIPPET_FILE"
echo "" >> "$HTML_SNIPPET_FILE"

while IFS='|' read -r name desc url repo_url; do
    # Trim whitespace
    name=$(echo "$name" | xargs)
    desc=$(echo "$desc" | xargs)
    url=$(echo "$url" | xargs)

    # Escape special characters in description
    desc=$(echo "$desc" | sed 's/"/\&quot;/g')

    cat >> "$HTML_SNIPPET_FILE" << EOF
<article class="project-card">
  <h2 class="project-title">
    <a href="$url" class="project-link">$name</a>
  </h2>
  <p class="project-description">$desc</p>
</article>

EOF
done < "$TEMP_FILE"

# Clean up
rm -f "$TEMP_FILE"

echo "========================================"
echo -e "${GREEN}Scan Complete!${NC}"
echo "========================================"
echo ""
echo "Results saved to:"
echo -e "${BLUE}1. $OUTPUT_FILE${NC} - Text format summary"
echo -e "${BLUE}2. $HTML_SNIPPET_FILE${NC} - Ready-to-use HTML snippets"
echo ""
echo "Total repositories scanned: $TOTAL_REPOS"
echo "Repositories with GitHub Pages: $PAGES_REPOS"
echo ""

if [ $PAGES_REPOS -gt 0 ]; then
    echo -e "${YELLOW}Next Steps:${NC}"
    echo "1. Review the projects in: $HTML_SNIPPET_FILE"
    echo "2. Copy the <article> blocks you want"
    echo "3. Paste them into index.html (replace the sample projects)"
    echo "4. Customize descriptions if needed"
    echo "5. Commit and push:"
    echo "   git add index.html"
    echo "   git commit -m 'Update with real GitHub Pages projects'"
    echo "   git push"
    echo ""
    echo "Your HTML snippets are ready to use! 🎉"
else
    echo -e "${YELLOW}No repositories with GitHub Pages found.${NC}"
    echo ""
    echo "To enable GitHub Pages on a repository:"
    echo "1. Go to repository Settings → Pages"
    echo "2. Select branch and folder"
    echo "3. Click Save"
fi
