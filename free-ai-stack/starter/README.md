# 🚀 starter — الملفات الجاهزة للتشغيل

كل الملفات دي مرتبطة بالدليل الرئيسي [`../README.md`](../README.md). مش محتاج تعدّل حاجة غير `.env`.

## الملفات

| الملف | إيه هو |
|-------|--------|
| `docker-compose.yml` | n8n + LiteLLM + Open WebUI + Postgres (+ Ollama اختياري) |
| `.env.example` | كل المفاتيح والإعدادات — انسخه لـ `.env` |
| `litellm-config.yaml` | مفتاح واحد لكل الموديلات المجانية + fallback تلقائي |
| `mcp.json` | إعداد MCP (GitHub, filesystem, playwright, postgres...) |
| `ai-agent-cron.yml` | أتمتة مجانية على GitHub Actions — انسخه لـ `.github/workflows/` |
| `gh-multi-account.sh` | إدارة أكتر من حساب GitHub + رفع الأسرار |
| `init-db.sql` | إنشاء قواعد litellm و n8n أول مرة |

## التشغيل في 4 خطوات

```bash
cd free-ai-stack/starter

# 1) الإعدادات
cp .env.example .env
nano .env                      # حط مفتاح واحد على الأقل (Groq أسهل واحد)

# 2) شغّل الحزمة الأساسية
docker compose up -d

# 3) تأكد إن كل حاجة تمام
docker compose ps
curl -s http://localhost:4000/health/liveliness

# 4) جرّب مفتاح LiteLLM
curl -s http://localhost:4000/v1/chat/completions \
  -H "Authorization: Bearer $LITELLM_MASTER_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model":"fast","messages":[{"role":"user","content":"قول أهلاً بالعربي"}]}'
```

**الروابط:** n8n → <http://localhost:5678> · Open WebUI → <http://localhost:3000> · LiteLLM → <http://localhost:4000>

## موديل محلي كمان

```bash
docker compose --profile local up -d ollama
docker exec -it free-ai-stack-ollama-1 ollama pull qwen3:8b
```

## تشغيل الـ cron على GitHub

```bash
mkdir -p .github/workflows
cp ai-agent-cron.yml .github/workflows/
gh secret set GROQ_API_KEY --body "gsk_..."
git add .github && git commit -m "ci: daily ai digest" && git push
gh workflow run ai-agent-cron.yml
gh run watch
```

## Troubleshooting

| المشكلة | الحل |
|---------|------|
| `Error decrypting value` من LiteLLM | ممنوع تغيّر `LITELLM_SALT_KEY` بعد أول تشغيل — رجّعه أو امسح volume الداتابيز |
| البورت مستخدم | غيّر `N8N_PORT` / `LITELLM_PORT` / `WEBUI_PORT` في `.env` |
| `model not found` | اسم الموديل اتغير عند المزود — راجع console بتاعه وعدّل `litellm-config.yaml` |
| 429 من Groq | قلّل `rpm` أو خلي الـ fallback يشتغل (متظبط بالفعل) |
| عايز تصفّر كل حاجة | `docker compose down -v` (⚠️ بيمسح الداتا) |

## نشر على سيرفر حقيقي

```bash
# على VPS (Ubuntu)
sudo apt install -y docker.io docker-compose-v2
git clone <repo> && cd free-ai-stack/starter
cp .env.example .env && nano .env
docker compose up -d

# بدل فتح بورتات: Cloudflare Tunnel (مجاني)
cloudflared tunnel login
cloudflared tunnel create free-ai
cloudflared tunnel route dns free-ai n8n.example.com
cloudflared tunnel run --url http://localhost:5678 free-ai
```
