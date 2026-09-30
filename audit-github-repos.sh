#!/bin/bash

base_path=~/Documents/github

echo "🔍 Scanning GitHub repositories under: $base_path"
echo "------------------------------------------------------------"

for repo in "$base_path"/*/; do
  echo "📁 Repository: $(basename "$repo")"
  
  # Move into the repo
  cd "$repo" || { echo "❌ Cannot access $repo"; continue; }

  if [ -d .git ]; then
    echo "  ✅ Git repository detected"

    # Check remotes
    remotes=$(git remote -v)
    if [ -z "$remotes" ]; then
      echo "  ⚠️  No remote set"
    else
      echo "  🔗 Remote(s):"
      echo "$remotes" | sed 's/^/    /'
    fi

    # Check for .gitignore
    if [ -f .gitignore ]; then
      echo "  ✅ .gitignore found"
    else
      echo "  ⚠️  .gitignore missing"
    fi

    # Check for .editorconfig
    if [ -f .editorconfig ]; then
      echo "  ✅ .editorconfig found"
    else
      echo "  ⚠️  .editorconfig missing"
    fi

    # Check git status
    status=$(git status --porcelain)
    if [ -n "$status" ]; then
      echo "  ⚠️  Uncommitted changes:"
      echo "$status" | sed 's/^/    /'
    else
      echo "  ✅ Working directory clean"
    fi

  else
    echo "  ❌ Not a Git repository (no .git folder)"
  fi

  echo "------------------------------------------------------------"
done

echo "✅ Audit complete."

