#!/bin/bash

# Prompt for commit type
read -p "Commit Type (build, ci, docs, feat, fix, perf, refactor, test): " commit_type
if [ -z "$commit_type" ]; then
  echo "Commit type cannot be empty."
  exit 1
fi

valid_commit_types=("build" "ci" "docs" "feat" "fix" "perf" "refactor" "test")
if [[ ! " ${valid_commit_types[@]} " =~ " $commit_type " ]]; then
  echo "Invalid commit type. Please choose from the valid types."
  exit 1
fi

# Prompt for commit scope
read -p "Scope: " commit_scope

# Prompt for commit summary
read -p "Short Summary: " commit_summary

# Prompt for breaking change information
read -p "Breaking Change (leave empty if none): " breaking_change
read -p "Breaking Change Description (leave empty if none): " breaking_change_desc
read -p "Issue Number (leave empty if none): " issue_number

# Generate the commit message
commit_message="$commit_type($commit_scope): $commit_summary"

# Add breaking change information if provided
if [ -n "$breaking_change" ]; then
  commit_message="$commit_message\n\nBREAKING CHANGE: $breaking_change"
  if [ -n "$breaking_change_desc" ]; then
    commit_message="$commit_message\n\n$breaking_change_desc"
  fi
fi

# Add issue number if provided
if [ -n "$issue_number" ]; then
  commit_message="$commit_message\n\nFixes #$issue_number"
fi

# Output the final commit message
echo -e "$commit_message"

# Perform the actual git commit
git commit -m "$commit_message"
