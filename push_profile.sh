#!/usr/bin/env bash
# Create + push the jotika-meaw profile repo using GitHub PAT / CLI token
# Usage: ./push_profile.sh <GITHUB_TOKEN>
set -euo pipefail

TOKEN="${1:?Usage: ./push_profile.sh <TOKEN>}"
PROFILE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Verifying token..."
LOGIN=$(curl -s --max-time 8 -H "Authorization: Bearer ${TOKEN}" https://api.github.com/user | grep -oP '"login":\s*"\K[^"]+' || true)
if [[ "$LOGIN" != "jotika-meaw" ]]; then
  echo "WARNING: Token authenticates as '${LOGIN:-none}' (expected 'jotika-meaw'). Continuing push..."
fi

echo "==> Checking if repo jotika-meaw/jotika-meaw exists..."
EXISTS=$(curl -s -o /dev/null -w "%{http_code}" --max-time 8 -H "Authorization: Bearer ${TOKEN}" https://api.github.com/repos/jotika-meaw/jotika-meaw)
if [[ "$EXISTS" == "404" ]]; then
  echo "==> Creating repo jotika-meaw/jotika-meaw (public)..."
  RESP=$(curl -s --max-time 10 -X POST -H "Authorization: Bearer ${TOKEN}" \
    -H "Accept: application/vnd.github+json" \
    https://api.github.com/user/repos \
    -d '{"name":"jotika-meaw","description":"Profile README — Jotika Das: CSE Student, ML/NLP Enthusiast & Aspiring CS Researcher","public":true,"has_issues":false,"has_projects":false,"has_wiki":false}')
  echo "$RESP" | grep -q '"full_name"' && echo "    Repo created ✓" || echo "    Creation response: $RESP"
else
  echo "    Repo already exists (HTTP $EXISTS)"
fi

echo "==> Initializing & Pushing..."
cd "$PROFILE_DIR"
git init -b main 2>/dev/null || git checkout -b main 2>/dev/null || true
git config user.name "jotika-meaw"
git config user.email "jotikadas@gmail.com" 2>/dev/null || true
git add .
git commit -m "Initial profile setup with contribution snake & stats" 2>/dev/null || true
git remote remove origin 2>/dev/null || true
git remote add origin "https://jotika-meaw:${TOKEN}@github.com/jotika-meaw/jotika-meaw.git"
git push -u origin main --force
git remote set-url origin "https://github.com/jotika-meaw/jotika-meaw.git"
echo ""
echo "✅ DONE! Profile live at: https://github.com/jotika-meaw"
