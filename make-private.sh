#!/bin/bash

# This script makes all your public GitHub repositories private
# Requirements: GitHub CLI (gh) and jq installed

USERNAME="youssefelalem"

echo "🔍 Fetching public repositories..."

gh repo list "$USERNAME" --limit 1000 --json name,visibility | jq -r '.[] | select(.visibility=="PUBLIC") | .name' | while read repo; do
  clean_repo=$(echo "$repo" | tr -d '\r')
  echo "⏳ Making $clean_repo private..."
  gh repo edit "$USERNAME/$clean_repo" --visibility private --accept-visibility-change-consequences
  echo "✅ Done with $clean_repo"
done

echo "🎉 All public repositories have been made private."
