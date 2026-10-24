#!/usr/bin/env bash
# ============================================================
#  gh-multi-account.sh — إدارة أكتر من حساب GitHub + أسرار الريبو
#  الاستخدام:
#    ./gh-multi-account.sh status
#    ./gh-multi-account.sh switch work-user
#    ./gh-multi-account.sh run-as work-user -- gh repo list work-org
#    ./gh-multi-account.sh push-secrets            # يرفع .env كـ secrets
#    ./gh-multi-account.sh protect                 # تفعيل حماية الفرع main
#
#  ⚠️ GitHub ToS: حساب شخصي مجاني واحد لكل شخص. استخدم Organizations
#     للفصل بين الشغل الشخصي والشركة، مش حسابات إضافية.
# ============================================================
set -euo pipefail

cmd="${1:-status}"

need() { command -v "$1" >/dev/null 2>&1 || { echo "❌ محتاج $1"; exit 1; }; }
need gh

case "$cmd" in
  status)
    echo "== الحسابات المسجّلة =="
    gh auth status || true
    echo
    echo "== هوية git الحالية =="
    git config --get user.name  || echo "(مش متظبطة)"
    git config --get user.email || echo "(مش متظبطة)"
    ;;

  switch)
    user="${2:?استخدم: switch <username>}"
    gh auth switch --user "$user"
    echo "✅ بقيت $user"
    ;;

  whoami)
    gh api user --jq '.login + " (" + (.name // "no-name") + ")"'
    ;;

  token)
    user="${2:?استخدم: token <username>}"
    gh auth token --user "$user"
    ;;

  run-as)
    user="${2:?استخدم: run-as <username> -- <command>}"
    shift 2
    [ "${1:-}" = "--" ] && shift
    GH_TOKEN="$(gh auth token --user "$user")" "$@"
    ;;

  push-secrets)
    [ -f .env ] || { echo "❌ مفيش .env هنا"; exit 1; }
    repo="$(gh repo view --json nameWithOwner --jq .nameWithOwner)"
    echo "هرفع الأسرار من .env إلى $repo"
    while IFS='=' read -r key value; do
      [[ -z "$key" || "$key" =~ ^# ]] && continue
      [[ -z "$value" ]] && continue
      # تخطي إعدادات مش أسرار
      case "$key" in
        POSTGRES_USER|POSTGRES_DB|TZ|N8N_PORT|N8N_HOST|N8N_PROTOCOL|N8N_WEBHOOK_URL|LITELLM_PORT|WEBUI_PORT|OLLAMA_PORT) continue ;;
      esac
      printf '%s' "$value" | gh secret set "$key" --repo "$repo" >/dev/null
      echo "  ✅ $key"
    done < .env
    echo "خلصت. شوف: gh secret list"
    ;;

  protect)
    repo="$(gh repo view --json nameWithOwner --jq .nameWithOwner)"
    branch="${2:-main}"
    gh api -X PUT "repos/$repo/branches/$branch/protection" \
      -H "Accept: application/vnd.github+json" \
      -f "required_status_checks=null" \
      -F "enforce_admins=false" \
      -F "required_pull_request_reviews[required_approving_review_count]=1" \
      -F "restrictions=null" >/dev/null
    echo "✅ حماية مفعّلة على $branch"
    ;;

  help|*)
    sed -n '2,20p' "$0"
    ;;
esac
