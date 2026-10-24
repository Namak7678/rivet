# 🧰 الدليل الكامل: كل الأدوات المجانية على GitHub + وكلاء AI + الأتمتة + طرق الربط بيك وبكل حساباتك

> **آخر تحقق: 24 أكتوبر 2026.** كل أرقام النجوم (★) والتراخيص وتواريخ آخر تحديث في الجداول دي **مسحوبة مباشرة من GitHub API** النهاردة، مش من مقالات قديمة.
> الحدود المجانية بتتغير كل شوية (في 2026 اتقفل GitHub Models، واتشال الـ free tier من Gemini CLI، واتخفض Oracle Always Free) — فكل رقم هنا مكتوب جنبه تاريخ التحقق.
> كل الأكواد جاهزة للنسخ، والملفات العملية في [`starter/`](starter/).

---

## 📑 الفهرس

1. [الخريطة السريعة — ابدأ من هنا](#1-الخريطة-السريعة--ابدأ-من-هنا)
2. [GitHub نفسه: إيه اللي مجاني فعلًا في 2026](#2-github-نفسه-إيه-اللي-مجاني-فعلًا-في-2026)
3. [وكلاء AI مجانيين (Agents)](#3-وكلاء-ai-مجانيين-agents)
4. [أدوات الأتمتة المجانية (Automation)](#4-أدوات-الأتمتة-المجانية-automation)
5. [نماذج و APIs مجانية (Free LLM) + الفخاخ](#5-نماذج-و-apis-مجانية-free-llm--الفخاخ)
6. [MCP: العصب اللي بيربط كل حاجة](#6-mcp-العصب-اللي-بيربط-كل-حاجة)
7. [طرق الربط: إزاي توصّل كل ده بيك وببعضه](#7-طرق-الربط-إزاي-توصّل-كل-ده-بيك-وببعضه)
8. [ربط كل حساباتك (Multi-Account Playbook)](#8-ربط-كل-حساباتك-multi-account-playbook)
9. [استضافة مجانية تشغّل الـ agents 24/7](#9-استضافة-مجانية-تشغّل-الـ-agents-247)
10. [4 Blueprints جاهزة (انسخ وشغّل)](#10-4-blueprints-جاهزة-انسخ-وشغّل)
11. [الأمان والفخاخ القانونية](#11-الأمان-والفخاخ-القانونية)
12. [خطة 7 أيام](#12-خطة-7-أيام)
13. [المصادر](#13-المصادر)

---

## 1. الخريطة السريعة — ابدأ من هنا

لو مش عايز تقرا كله، دي التوليفات اللي بتشتغل فعلًا بـ **0 دولار**:

| # | الهدف | التوليفة | التكلفة |
|---|--------|-----------|---------|
| 1 | مساعد شخصي على واتساب/تيليجرام | `OpenClaw` + `Groq` أو `OpenRouter` + VPS مجاني (Oracle) | $0 |
| 2 | أتمتة يومية بدون سيرفر | `GitHub Actions` (cron) + `Groq`/`NVIDIA NIM` + Issue/Telegram | $0 |
| 3 | شات واجهة لعيلتك/فريقك | `Open WebUI` أو `LibreChat` + `Ollama` (محلي) أو `LiteLLM` | $0 |
| 4 | agent يكتب كود ويفتح PR | `Copilot Free` أو `Cline`/`Continue` + `GitHub MCP Server` + Actions CI | $0 |
| 5 | RAG على ملفاتك | `Docling` + `pgvector`/`Qdrant` + `Rivet`/`Dify`/`Langflow` | $0 |
| 6 | أتمتة تطبيقات (Zapier بديل) | `n8n` (self-host) أو `Activepieces` على VPS/Docker | $0 |

**أهم 3 حقائق قبل ما تبدأ:**

1. **GitHub Models اتقفل نهائيًا 30 يوليو 2026** — أي شرح قديم بيقول "خد مفتاح LLM مجاني من GitHub" بقى غلط.
2. **مفيش "مجاني بلا حدود"** — كل مزوّد مجاني عنده RPM/RPD، والحل الصح هو **fallback chain** بين 3–4 مزودين (شرحه في [قسم 7.5](#75-llm-gateway-واحد-لكل-المفاتيح-litellm)).
3. **الحسابات المتعددة مش حل للحدود** — GitHub بيسمح بحساب شخصي مجاني واحد لكل شخص، والتحايل بيقفل الحسابات. البديل الشرعي: **Organizations** (مجانية) + مفاتيح من مزوّدين مختلفين.

---

## 2. GitHub نفسه: إيه اللي مجاني فعلًا في 2026

### 2.1 جدول الميزات المجانية (خطة Free الشخصية)

| الميزة | الحد المجاني | ملاحظات مهمة |
|--------|--------------|---------------|
| مستودعات Public + Private | **غير محدود** | ومتعاونين غير محدودين كمان |
| **GitHub Actions** | **غير محدود على الريبو العام** (standard runners) | الريبو الخاص: **2,000 دقيقة/شهر** (Linux) + 500MB artifacts + 10GB cache |
| Actions — أقصى مدة Job | 6 ساعات | Workflow كامل: 35 يوم |
| Actions — تزامن | 20 job متوازي (Free) | Pro: 40، Team: 60 |
| Actions — **cron** | **كل 5 دقايق كحد أدنى**، بتوقيت UTC | Scheduled workflows بتتقفل أوتوماتيك لو الريبو العام مافيهوش نشاط **60 يوم** |
| **Codespaces** | **120 core-hour/شهر** + 15GB storage | للحساب الشخصي فقط — حسابات الـ Organizations مالهاش حصة مجانية |
| **GitHub Pages** | موقع 1GB + ~100GB bandwidth/شهر | static فقط، من ريبو public على الخطة المجانية |
| **GitHub Packages** | 500MB | صور Docker العامة مجانية |
| **Git LFS** | 1GB storage + 1GB/شهر نقل | بيخلص بسرعة — خزّن الميديا بره |
| **Copilot Free** | **2,000 completion + ~50 محادثة/شهر** | اختيار الموديل Auto فقط، ومفيش code review ولا cloud agent |
| **Copilot for Students** | Copilot **Pro** مجانًا | محتاج تفعيل GitHub Education |
| **gh CLI** | مجاني بالكامل | أقوى من الويب في الأتمتة |
| **GitHub MCP Server** | مجاني | يحتاج PAT، وفيه نسخة remote |
| Dependabot + Secret scanning | مجاني | code scanning مجاني على الريبو العام |
| Issues / Projects / Discussions / Wikis / Gists | مجاني | Projects فيه views وroadmaps |
| Environments + Secrets | مجاني | Secrets مش بتظهر في اللوجز |
| **GitHub Models** | ❌ **اتقفل 30 يوليو 2026** | الـ playground والـ inference API والـ BYOK كله اتشال |

### 2.2 إعدادات لازم تعملها أول يوم

```bash
# 1) سجّل دخول
gh auth login

# 2) فعّل الـ CLI extensions المفيدة
gh extension install github/gh-copilot        # لو عندك Copilot
gh extension install dlvhdr/gh-dash           # داشبورد في التيرمنال

# 3) تأكد إن الـ workflows بتشتغل بصلاحيات أقل
# (ضيف ده في أول كل workflow)
# permissions:
#   contents: read
```

### 2.3 نصائح توفير الحصة

- **خلي الأتمتة في ريبو Public** → Actions مجاني وغير محدود، والـ minutes مابتتحسبش.
- **متعملش Build على macOS/Windows** إلا للضرورة — multiplier بيوكل الدقايق أسرع.
- **Cache** للـ dependencies: `actions/cache` أو `setup-node` بـ `cache: 'yarn'`.
- **Self-hosted runner** على جهازك = مجاني تمامًا (وبلاش platform fee — اتأجلت).
- **Codespaces**: اقفل الـ codespace بعد الشغل — الـ storage بيتحسب وهو مقفول.

---
## 3. وكلاء AI مجانيين (Agents)

> الأرقام دي من GitHub API بتاريخ **2026-10-24**. ★ = عدد النجوم، والتاريخ = آخر push.
> **الترخيص** هو أهم عمود: لو مكتوب AGPL أو ELv2 أو "Other (custom)" اقرأ [قسم 11](#11-الأمان-والفخاخ-القانونية) قبل ما تحطه في منتج تجاري.

### 3.1 وكلاء شخصيين (Personal Agents) — الأقوى في 2026

| الأداة | ★ | الترخيص | آخر تحديث | ليه؟ |
|--------|---|---------|-----------|------|
| [openclaw/openclaw](https://github.com/openclaw/openclaw) | 392.9k | MIT | 2026-10-24 | مساعد شخصي self-hosted بيربط واتساب/تيليجرام/ديسكورد/Slack/iMessage و20+ قناة، BYO model |
| [NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent) | 256.5k | MIT | 2026-10-24 | agent "بيكبر معاك": مهام مجدولة (cron)، ذاكرة، تحسين ذاتي |
| [Significant-Gravitas/AutoGPT](https://github.com/Significant-Gravitas/AutoGPT) | 187.7k | MIT + **Polyform Shield** (مجلد `autogpt_platform`) | 2026-10-24 | بقى platform كامل لبناء agents وتشغيلها، مش مجرد demo |
| [browser-use/browser-use](https://github.com/browser-use/browser-use) | 119.0k | MIT | 2026-10-24 | agent بيستخدم المتصفح زي الإنسان — forms، تسجيل، scraping |
| [OpenHands/OpenHands](https://github.com/OpenHands/OpenHands) | 91.7k | MIT | 2026-10-23 | منصة coding agents (زي Devin مفتوح المصدر) — تشغله self-hosted |

**التوصية:** ابدأ بـ **OpenClaw** لو عايز مساعد في الشات، و**Hermes Agent** لو عايز مهام مجدولة وذاكرة طويلة.

```bash
# OpenClaw — الطريقة الرسمية
curl -fsSL https://openclaw.ai/install.sh | bash
openclaw onboard --install-daemon
openclaw channels login            # QR للواتساب أو توكن تيليجرام
openclaw gateway --port 18789
```

### 3.2 وكلاء البرمجة (Coding Agents) — كلهم مجانيين، بتدفع الموديل بس

| الأداة | ★ | الترخيص | آخر تحديث | الشكل |
|--------|---|---------|-----------|-------|
| [cline/cline](https://github.com/cline/cline) | 70.8k | Apache-2.0 | 2026-10-24 | إضافة VS Code + CLI + SDK |
| [openinterpreter/open-interpreter](https://github.com/openinterpreter/open-interpreter) | 68.7k | Apache-2.0 | 2026-10-11 | agent في التيرمنال بينفذ كود |
| [aaif-goose/goose](https://github.com/aaif-goose/goose) | 55.6k | Apache-2.0 | 2026-10-23 | desktop + CLI، 70+ MCP extension |
| [Aider-AI/aider](https://github.com/Aider-AI/aider) | 49.7k | Apache-2.0 | 2026-05-22 | pair programming — **التطوير بطّأ، خد بالك** |
| [continuedev/continue](https://github.com/continuedev/continue) | 36.3k | Apache-2.0 | 2026-10-22 | إضافة IDE + CI checks، MCP |
| [openai/codex](https://github.com/openai/codex) | **130.7k** | Apache-2.0 | 2026-10-23 | CLI + cloud agent من OpenAI — محتاج خطة ChatGPT للاستخدام الجاد |

**مجاني بجد من غير مفتاح؟** `GitHub Copilot Free` (2,000 completion/شهر + agent mode محدود). للطلبة: **Copilot Pro مجانًا**.
**مفاتيح مجانية + Cline/Continue** = أقوى تركيبة عمليًا (شوف [قسم 5](#5-نماذج-و-apis-مجانية-free-llm--الفخاخ)).

### 3.3 أطر بناء الـ Agents (Frameworks)

| الإطار | ★ | الترخيص | اللغة | الأنسب لـ |
|--------|---|---------|-------|-----------|
| [langchain-ai/langgraph](https://github.com/langchain-ai/langgraph) | 43.8k | MIT | Python/TS | workflows فيها state وcheckpoint وhuman-in-the-loop |
| [crewAIInc/crewAI](https://github.com/crewAIInc/crewAI) | 60.0k | MIT | Python | فريق agents بأدوار — أسرع demo |
| [agno-agi/agno](https://github.com/agno-agi/agno) | 42.9k | Apache-2.0 | Python | agents خفيفة وسريعة + memory |
| [openai/openai-agents-python](https://github.com/openai/openai-agents-python) | 30.2k | MIT | Python/TS | primitives بسيطة (agents/handoffs/guardrails) |
| [microsoft/agent-framework](https://github.com/microsoft/agent-framework) | 14.3k | MIT | Python/.NET | **البديل الرسمي لـ AutoGen** |
| [google/adk-python](https://github.com/google/adk-python) | 22.0k | Apache-2.0 | Python/Java/Go/TS | agents على Google Cloud |
| [pydantic/pydantic-ai](https://github.com/pydantic/pydantic-ai) | 20.8k | MIT | Python | outputs مضمونة الـ schema |
| [huggingface/smolagents](https://github.com/huggingface/smolagents) | 30.0k | Apache-2.0 | Python | "barebones" — أقل كود ممكن |
| [mastra-ai/mastra](https://github.com/mastra-ai/mastra) | 29.0k | Apache-2.0 | TypeScript | agents/workflows في JS |
| [vercel/ai](https://github.com/vercel/ai) | 27.5k | Apache-2.0 | TypeScript | AI SDK — UI streaming + tools |
| [run-llama/llama_index](https://github.com/run-llama/llama_index) | 52.6k | MIT | Python/TS | RAG وdocument agents |
| [microsoft/autogen](https://github.com/microsoft/autogen) | 61.5k | MIT (code) | Python/.NET | ⚠️ **وضع صيانة** — انتقل لـ agent-framework |

**قاعدة الاختيار:** محتاج تحكم كامل → `LangGraph`. عايز نتيجة بسرعة → `CrewAI`. TypeScript → `Mastra`/`Vercel AI SDK`. Type-safe outputs → `Pydantic AI`.

### 3.4 بناة مرئيين (Visual Builders) — من غير كود

| الأداة | ★ | الترخيص | آخر تحديث | ملاحظة |
|--------|---|---------|-----------|--------|
| [langgenius/dify](https://github.com/langgenius/dify) | 159.4k | Apache معدّل (**ممنوع multi-tenant SaaS**) | 2026-10-24 | agents + RAG + workflows + API |
| [langflow-ai/langflow](https://github.com/langflow-ai/langflow) | 156.0k | MIT | 2026-10-23 | flows بتتعرّض كـ API أو MCP tool |
| [n8n-io/n8n](https://github.com/n8n-io/n8n) | 208.4k | Sustainable Use (fair-code) | 2026-10-23 | أقوى تكامل مع 400+ خدمة |
| [FlowiseAI/Flowise](https://github.com/FlowiseAI/Flowise) | 55.5k | — | ⚠️ **Archived 2026-08-13** | **متستخدمهوش** في مشروع جديد |
| [Ironclad/rivet](https://github.com/Ironclad/rivet) | 4.7k | MIT | 2026-08-26 | node editor للـ prompts + **MCP nodes** + TypeScript lib (ده الريبو اللي إحنا فيه) |

> 💡 Rivet تحديدًا فيه nodes جاهزة لـ **MCP Discovery / MCP Tool Call / MCP Get Prompt** — يعني تقدر توصّل أي MCP server بالـ graph بتاعك من غير كود.

---
## 4. أدوات الأتمتة المجانية (Automation)

### 4.1 مقارنة سريعة

| الأداة | ★ | الترخيص | Self-host | لا كود؟ | الأنسب لـ |
|--------|---|---------|-----------|---------|-----------|
| [n8n-io/n8n](https://github.com/n8n-io/n8n) | 208.4k | Sustainable Use | ✅ Docker (سهل) | ✅ | أتمتة أعمال + AI Agent node + 400 تكامل |
| [activepieces/activepieces](https://github.com/activepieces/activepieces) | 25.2k | MIT (+EE) | ✅ | ✅ | بديل Zapier برخصة MIT، ~400 MCP server |
| [windmill-labs/windmill](https://github.com/windmill-labs/windmill) | 18.3k | AGPL-3.0 | ✅ | جزئي | scripts + internal tools، code-first |
| [node-red/node-red](https://github.com/node-red/node-red) | 23.8k | Apache-2.0 | ✅ | ✅ | IoT وأحداث الأجهزة |
| [huginn/huginn](https://github.com/huginn/huginn) | 50.1k | MIT | ✅ | ✅ | مراقبة الويب و RSS (قديم بس شغال) |
| [kestra-io/kestra](https://github.com/kestra-io/kestra) | 30.0k | Apache-2.0 | ✅ | YAML | orchestration وdata pipelines |
| [triggerdotdev/trigger.dev](https://github.com/triggerdotdev/trigger.dev) | 16.6k | Apache-2.0 | ✅ | كود | background jobs وagents طويلة |
| [apache/airflow](https://github.com/apache/airflow) | 47.3k | Apache-2.0 | ✅ | كود | data engineering |
| [temporalio/temporal](https://github.com/temporalio/temporal) | 23.9k | MIT | ✅ | كود | durable workflows |
| [automatisch/automatisch](https://github.com/automatisch/automatisch) | 14.0k | AGPL-3.0 | ✅ | ✅ | ⚠️ آخر push **2026-02-11** — مش مشروع نشط |

### 4.2 الخدمات السحابية المجانية (بدون سيرفر)

| الخدمة | الحد المجاني | ملاحظة |
|--------|--------------|--------|
| **GitHub Actions** | غير محدود (ريبو عام) | أفضل scheduler مجاني — cron كل 5 دقايق |
| **Cloudflare Workers** | 100,000 request/يوم + Cron Triggers | مجاني بالكامل، وبدون كارت |
| **Google Apps Script** | 90 دقيقة تنفيذ/يوم، triggers كل دقيقة | تكامل خرافي مع Gmail/Sheets/Drive |
| **Pipedream** | خطة مجانية بحدود شهرية | webhooks + كود Node/Python |
| **Make** | 1,000 operations/شهر | سهل جدًا |
| **Zapier** | 100 tasks/شهر + Zaps من خطوتين | للاختبار فقط |
| **IFTTT** | 2 applets | محدود جدًا |
| **Vercel / Netlify** | Hobby (personal, non-commercial) | functions + cron |

> ⚠️ **مهم:** معظم الخطط المجانية السحابية بتمنع الاستخدام التجاري. لو الأتمتة لشغل/شركة → self-host على VPS (شوف [قسم 9](#9-استضافة-مجانية-تشغّل-الـ-agents-247)).

### 4.3 docker-compose جاهز (n8n + LiteLLM + Postgres)

الملف كامل في [`starter/docker-compose.yml`](starter/docker-compose.yml):

```bash
cd free-ai-stack/starter
cp .env.example .env       # حط المفاتيح
docker compose up -d
# n8n  → http://localhost:5678
# LiteLLM → http://localhost:4000
```

---

## 5. نماذج و APIs مجانية (Free LLM) + الفخاخ

### 5.1 الوضع الحقيقي في أكتوبر 2026

| المزوّد | نماذج مجانية | الحدود | كارت؟ | الفخ |
|---------|--------------|--------|-------|------|
| **Groq** | `gpt-oss-120b`, `gpt-oss-20b`, `qwen3.8-27b` | **30 RPM، 1,000 طلب/يوم، 8K TPM، 200K توكن/يوم** لكل موديل | لا | الحدود لكل organization مش لكل مفتاح |
| **Google AI Studio** | Gemini 3.x Flash/Flash-Lite، Gemma 4 | حدود لكل موديل — بتظهر في AI Studio بس | لا | البيانات بتُستخدم للتدريب **خارج EU/UK/EEA** (أنت في NL → مستثنى) |
| **OpenRouter** | ~19 موديل `:free` | **20 RPM، 50 طلب/يوم** — أو **1,000/يوم** لو اشتريت $10 مرة واحدة | لا | مزودين الـ free ممكن يسجلوا الـ prompts |
| **NVIDIA NIM** | Nemotron، gpt-oss، GLM | **40 RPM** + حد يومي لكل موديل | لا | محتاج NVIDIA Developer Program، والمدخلات ممكن تُستخدم للتحسين |
| **Cloudflare Workers AI** | 50+ موديل مفتوح | **10,000 Neuron/يوم** + Workers 100k req/يوم | لا | الموديلات الكبيرة بتاكل Neurons بسرعة |
| **Mistral** | Mistral Small/Medium، Codestral | حدود شهرية (خطة Free) | لا | تغيّرت **7 أكتوبر 2026** — راجع لوحة الحساب |
| **Cerebras** | gpt-oss-120b | تجربة $5/30 يوم | **آه** (من يوليو 2026) | مش مجاني مستدام |
| **Ollama (محلي)** | Llama/Qwen/Gemma/DeepSeek... | حدود جهازك بس | لا | محتاج GPU/RAM كويسة |
| ~~GitHub Models~~ | — | ❌ **اتقفل 30 يوليو 2026** | — | أي شرح قديم = ميت |
| ~~Gemini CLI (Google login)~~ | — | ❌ **اتوقف 18 يونيو 2026** → Antigravity CLI | — | مفتاح API مجاني: 250 طلب/يوم Flash فقط |

### 5.2 خطة النجاة من الحدود (Triple Fallback)

```text
Groq (سريع، 1k/يوم)
   ↓ لو خلص أو rate limit
NVIDIA NIM (40 RPM)
   ↓
Google AI Studio (جودة أعلى)
   ↓
OpenRouter :free (احتياطي أخير، 50/يوم)
   ↓
Ollama محلي (offline، بلا حدود)
```

كل ده بيتظبط أوتوماتيك بمفتاح واحد + `fallbacks` في **LiteLLM** ([قسم 7.5](#75-llm-gateway-واحد-لكل-المفاتيح-litellm)).

### 5.3 نماذج محلية — مجانية 100% وبلا حدود

| الأداة | ★ | الترخيص | ليه |
|--------|---|---------|------|
| [ollama/ollama](https://github.com/ollama/ollama) | 184.5k | MIT | أسهل طريقة تشغل موديل محلي |
| [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) | 132.2k | MIT | أسرع CPU/GPU inference |
| [vllm-project/vllm](https://github.com/vllm-project/vllm) | 95.3k | Apache-2.0 | سيرفر production عالي الـ throughput |
| [janhq/jan](https://github.com/janhq/jan) | 45.1k | Apache-2.0 | تطبيق desktop بديل ChatGPT offline |

```bash
curl -fsSL https://ollama.com/install.sh | sh
ollama pull qwen3:8b          # أو llama3.3 / gemma3 / deepseek-r1
ollama run qwen3:8b
```

### 5.4 واجهات شات مجانية

| الأداة | ★ | الترخيص | ملاحظة |
|--------|---|---------|--------|
| [open-webui/open-webui](https://github.com/open-webui/open-webui) | 156.6k | BSD-3 + **بند branding** | أفضل واجهة self-host، RAG مدمج |
| [LibreChat-AI/LibreChat](https://github.com/LibreChat-AI/LibreChat) | 46.2k | MIT | Agents + MCP + متعدد المزوّدين |
| [lobehub/lobehub](https://github.com/lobehub/lobehub) | 83.5k | Apache-2.0 (+EE) | واجهة agents جميلة، سوق plugins |

### 5.5 الأدوات المساعدة (RAG / تقييم / ميديا)

| المجال | الأدوات |
|--------|---------|
| **Vector DB** | [Qdrant](https://github.com/qdrant/qdrant) 35.2k (Apache-2.0) · [Chroma](https://github.com/chroma-core/chroma) 29.6k (Apache-2.0) · [Milvus](https://github.com/milvus-io/milvus) 46.5k (Apache-2.0) · [pgvector](https://github.com/pgvector/pgvector) 23.5k (PostgreSQL) |
| **قراءة الملفات** | [Docling](https://github.com/docling-project/docling) 69.5k (MIT) · [Unstructured](https://github.com/Unstructured-IO/unstructured) 15.6k · [Firecrawl](https://github.com/firecrawl/firecrawl) 194.7k (⚠️ AGPL) · [Crawlee](https://github.com/apify/crawlee) 26.2k |
| **تقييم ومراقبة** | [Langfuse](https://github.com/langfuse/langfuse) 36.3k · [Phoenix](https://github.com/Arize-ai/phoenix) 12.0k (⚠️ ELv2) · [DeepEval](https://github.com/confident-ai/deepeval) 19.1k · [promptfoo](https://github.com/promptfoo/promptfoo) 26.4k |
| **صور** | [ComfyUI](https://github.com/Comfy-Org/ComfyUI) 142.3k (GPL-3.0) |
| **صوت** | [whisper](https://github.com/openai/whisper) 111.1k (MIT) · [faster-whisper](https://github.com/SYSTRAN/faster-whisper) 26.1k (MIT) |
| **Internal tools** | [Appsmith](https://github.com/appsmithorg/appsmith) 41.1k (Apache-2.0) · [ToolJet](https://github.com/ToolJet/ToolJet) 41.1k (⚠️ AGPL) |

---
## 6. MCP: العصب اللي بيربط كل حاجة

**MCP (Model Context Protocol)** = بروتوكول واحد بيخلي أي agent يشوف أدوات أي خدمة (GitHub، Notion، Postgres، Slack، المتصفح...). من غير MCP كنت بتكتب تكامل لكل أداة × كل agent.

### 6.1 أهم مصادر MCP

| المصدر | ★ | إيه فيه |
|--------|---|---------|
| [modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers) | 91.5k | السيرفرات المرجعية (filesystem, git, fetch, memory...) |
| [github/github-mcp-server](https://github.com/github/github-mcp-server) | 33.9k | **الرسمي من GitHub** — repos, issues, PRs, Actions, code scanning |
| [punkpeye/awesome-mcp-servers](https://github.com/punkpeye/awesome-mcp-servers) | 96.8k | أكبر دليل مجتمعي (آلاف السيرفرات) |
| [modelcontextprotocol/registry](https://github.com/modelcontextprotocol/registry) | 7.4k | الـ registry الرسمي للبحث والتثبيت |
| [microsoft/mcp](https://github.com/microsoft/mcp) | 3.8k | كتالوج سيرفرات مايكروسوفت الرسمية |
| [microsoft/playwright-mcp](https://github.com/microsoft/playwright-mcp) | 38.6k | تحكم في المتصفح بـ MCP |

### 6.2 config جاهز (Claude Desktop / Cursor / VS Code / Rivet)

الملف في [`starter/mcp.json`](starter/mcp.json):

```json
{
  "mcpServers": {
    "github": {
      "command": "docker",
      "args": ["run", "-i", "--rm", "-e", "GITHUB_PERSONAL_ACCESS_TOKEN",
               "ghcr.io/github/github-mcp-server"],
      "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_PAT}" }
    },
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/home/you/projects"]
    },
    "playwright": {
      "command": "npx",
      "args": ["@playwright/mcp@latest"]
    }
  }
}
```

**في Rivet:** افتح المشروع → `Project Settings → MCP` → ضيف السيرفر → استخدم nodes: `MCP Discovery` → `MCP Tool Call`.

> ⚠️ **أمان:** أي MCP server = كود بيشتغل بصلاحياتك. ثبّت النسخ (`@x.y.z` مش `@latest`)، وادي كل سيرفر **أقل صلاحية ممكنة** (PAT للقراءة بس مثلًا).

---

## 7. طرق الربط: إزاي توصّل كل ده بيك وببعضه

### 7.1 الطرق الـ 8 الأساسية

| الطريقة | متى تستخدمها | مثال |
|---------|---------------|------|
| **MCP** | agent يشوف tools خدمة | GitHub MCP + Cline |
| **REST API + PAT** | سكربت بسيط | `curl` على GitHub API |
| **Webhooks** | رد فعل فوري على حدث | GitHub push → n8n |
| **OAuth App / GitHub App** | منتج بيخدم مستخدمين | "Sign in with GitHub" |
| **Cron / Schedule** | شغل دوري | Actions cron، n8n Schedule |
| **CLI** | أتمتة من التيرمنال | `gh`، `openclaw`، `ollama` |
| **Chat channel** | تتحكم من موبايلك | Telegram bot، WhatsApp Cloud API |
| **LLM Gateway** | مفتاح واحد لكل الموديلات | LiteLLM |

### 7.2 إزاي تربط الأدوات **بيا** (Arena Agent)

أنا بشتغل في sandbox مؤقت، ودي حدودي الحقيقية:

| ✅ أقدر أعملها | ❌ مش ممكن/مش مستدام |
|----------------|----------------------|
| `git` + `gh` على الريبو ده (الـ auth متظبط باسم `Namak7678`) | أشغّل cron 24/7 بعد ما الجلسة تقفل |
| أفتح PR / issue / release، أعدّل ملفات، أشغّل tests | أحتفظ بمفاتيحك أو أسرارك بعد نهاية الجلسة |
| أفتح سيرفر مؤقت بـ preview URL | أوصل لأي دومين خارج القائمة المسموحة (GitHub/npm/PyPI) |
| أحمّل أدوات connectors (GitHub / Notion / Slack) لو وصّلتهم من إعدادات Arena | أضيف مفتاح OpenAI بنفسي من غير ما تديهولي |
| أنزّل وأنفذ أدوات من npm/PyPI | أشتري اشتراك أو أفعّل حساب طالب |

**الخلاصة العملية:** أنا "الميدان" اللي بنجرب فيه ونكتب الكود — لكن **الشغل المستمر (24/7) لازم يتسضّف بره**: GitHub Actions أو n8n على VPS.
الطريقة الصح: خلي المفاتيح في **GitHub Actions Secrets** أو **n8n Credentials**، وأنا أكتب الـ workflow/الـ flow وأختبره بالـ `workflow_dispatch`.

```bash
# بعد ما تحط الـ workflow في .github/workflows/ أقدر أشغّله وأتابعه:
gh workflow run ai-agent-cron.yml -f topic="AI news"
gh run watch
gh pr create --title "docs: free AI stack" --body "..." --base main
```

**لو عايز توصلني بـ Notion أو Slack:** فعّل الـ connector من واجهة Arena، وبعدها أقدر أقرأ/أكتب فيه في نفس الجلسة.

### 7.3 ربط GitHub بـ n8n (webhook)

```text
GitHub repo → Settings → Webhooks → Add webhook
  Payload URL: https://YOUR-N8N-DOMAIN/webhook/github
  Content type: application/json
  Secret: (نفسه في n8n)
  Events: Push + Pull requests
```

في n8n: `Webhook` node → `IF` node → `HTTP Request` (على GitHub API) أو `AI Agent` node.

### 7.4 ربط Telegram (أرخص وأسرع قناة تحكم)

```bash
# 1) اعمل بوت من @BotFather وخد التوكن
# 2) جرب الإرسال
curl -s "https://api.telegram.org/bot$TG_TOKEN/sendMessage" \
  -d chat_id="$TG_CHAT_ID" \
  -d text="✅ الأتمتة اشتغلت"
```

تخلي n8n أو OpenClaw يرد على رسايلك، وتبعت أوامر من موبايلك.

### 7.5 LLM Gateway واحد لكل المفاتيح (LiteLLM)

المشكلة: كل أداة عايزة مفتاح مختلف وشكل مختلف. الحل: **LiteLLM Proxy** (MIT، self-host) بيدي واجهة OpenAI-compatible واحدة لكل المزوّدين + **fallbacks** تلقائية.

```yaml
# starter/litellm-config.yaml
model_list:
  - model_name: fast
    litellm_params:
      model: groq/openai/gpt-oss-120b
      api_key: os.environ/GROQ_API_KEY

  - model_name: smart
    litellm_params:
      model: gemini/gemini-3-flash
      api_key: os.environ/GEMINI_API_KEY

  - model_name: free-fallback
    litellm_params:
      model: openrouter/google/gemma-4-31b-it:free
      api_key: os.environ/OPENROUTER_API_KEY

  - model_name: local
    litellm_params:
      model: ollama/qwen3:8b
      api_base: http://ollama:11434

litellm_settings:
  num_retries: 2
  request_timeout: 120
  fallbacks:
    - fast: ["smart", "free-fallback", "local"]
    - smart: ["fast", "local"]
```

بعدها أي أداة (Cline، n8n، Open WebUI، سكربتك) بتتكلم مع `http://localhost:4000` بمفتاح واحد، وإنت بتغيّر المزوّدين من ملف واحد. **المفاتيح كلها في مكان واحد** بدل ما توزعها على 6 تطبيقات.

---
## 8. ربط كل حساباتك (Multi-Account Playbook)

### 8.1 القاعدة الأولى (اقراها قبل أي حاجة)

> **GitHub Terms of Service:** شخص واحد أو كيان واحد مسموح له بحساب شخصي مجاني **واحد**. الحسابات المتعددة لاستهلاك حصص Actions/Copilot المجانية = **إغلاق الحسابات**.
> البديل الشرعي والمجاني: **Organizations** (مجانية، عدد غير محدود) + **Repos منفصلة** + **Fine-grained PATs** لكل سياق.

| عايز تفصل | الحل الصح | الحل الغلط |
|-----------|-----------|-------------|
| شغل شخصي vs شركة | Organization مجانية (أو حساب مدفوع للشركة) | حساب شخصي تاني |
| مشاريع freelance مختلفة | Repos + Environments + Secrets لكل repo | PAT واحد لكل حاجة |
| بوت/أتمتة | **GitHub App** أو machine user مخصص | حسابك الشخصي |
| مفاتيح LLM مختلفة | LiteLLM virtual keys | حسابات متعددة عند نفس المزوّد |

### 8.2 تعدد حسابات GitHub على نفس الجهاز (لو عندك أكتر من حساب فعلًا)

```bash
# 1) سجّل كل حساب
gh auth login --hostname github.com --git-protocol https --web

# 2) شوف مين المسجل
gh auth status

# 3) بدّل بينهم
gh auth switch --user personal-user
gh auth switch --user work-user

# 4) لأمر واحد بس (من غير تبديل دائم)
GH_TOKEN=$(gh auth token --user work-user) gh repo list work-org

# 5) تفتيش صلاحيات المفتاح
gh auth status --show-token
```

**هوية git لكل مجلد** (`~/.gitconfig`):

```ini
[includeIf "gitdir:~/work/"]
  path = ~/.gitconfig-work
[includeIf "gitdir:~/personal/"]
  path = ~/.gitconfig-personal
```

```ini
# ~/.gitconfig-work
[user]
  name = Your Name (Work)
  email = you@company.com
[url "git@github-work:"]
  insteadOf = git@github.com:
```

**SSH keys منفصلة** (`~/.ssh/config`):

```sshconfig
Host github-personal
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_personal

Host github-work
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_work
```

```bash
git clone git@github-work:company/repo.git
```

### 8.3 المفاتيح (Tokens) — قواعد صارمة

| النوع | الاستخدام | العمر |
|-------|-----------|-------|
| **Fine-grained PAT** | repo واحد + صلاحيات محددة (Contents, PRs, Issues) | 90 يوم أو أقل |
| **Classic PAT** | آخر حل — صلاحيات واسعة | تجنبه |
| **GitHub App installation token** | أتمتة أورجانيزيشن | ساعة واحدة (بيتجدد تلقائي) |
| **`GITHUB_TOKEN` في Actions** | داخل الـ workflow | الجلسة فقط |

```bash
# خزّن المفتاح كـ secret (مش في الكود)
gh secret set GROQ_API_KEY --body "gsk_..."
gh secret set GH_PAT --body "github_pat_..."

# تأكد إن .env مش هيتعمله commit
echo ".env" >> .gitignore
```

### 8.4 حسابات الـ LLM — إدارة المفاتيح المتعددة

```bash
# ملف واحد لكل المفاتيح (مش في git)
cat > .env <<'ENV'
GROQ_API_KEY=gsk_...
GEMINI_API_KEY=AIza...
OPENROUTER_API_KEY=sk-or-v1-...
NVIDIA_API_KEY=nvapi-...
CLOUDFLARE_API_TOKEN=...
ENV
```

**افصل "المفاتيح" عن "المستخدمين"** بـ LiteLLM virtual keys: مفتاح لكل تطبيق (n8n، OpenClaw، Open WebUI) بحدود وبأي موديل مسموح — لو واحد اتسرب، تعطّله لوحده.

### 8.5 لوحة الربط النهائية

| الحساب | يتوصل بإيه | الأداة |
|--------|------------|--------|
| GitHub | PAT / GitHub App / `gh` | MCP، Actions، n8n |
| Google (Gmail/Sheets/Drive) | Apps Script + OAuth | n8n، OpenClaw |
| Notion | Integration token | MCP / connector |
| Slack | Bot token + Events API | OpenClaw، n8n |
| Telegram | Bot token | كل حاجة (أسهل قناة) |
| WhatsApp | WhatsApp Cloud API (فيه حد مجاني) أو QR عبر OpenClaw | OpenClaw |
| أي خدمة فيها REST | API key + HTTP node | n8n / LiteLLM |

---

## 9. استضافة مجانية تشغّل الـ agents 24/7

| الخيار | المواصفات المجانية | كارت؟ | الفخ |
|--------|--------------------|-------|------|
| **Oracle Cloud Always Free** | **2 OCPU ARM + 12GB RAM** + 200GB storage + ~10TB نقل | آه (تحقق) | اتخفضت من 4/24 في **15 يونيو 2026**؛ الأجهزة الخاملة ممكن تُسحب بعد 7 أيام |
| **Cloudflare Workers/Pages** | 100k request/يوم + Cron + 10k Neurons/يوم | لا | مفيش Docker — serverless بس |
| **GitHub Codespaces** | 120 core-hour/شهر | لا | للتطوير، **بينام** ومش للإنتاج |
| **Hugging Face Spaces** | Static Spaces مجانًا | لا | **Docker/Gradio بقت مدفوعة من يوليو 2026** |
| **Google Colab / Kaggle** | GPU مجاني بحدود | لا | الجلسة بتقطع — للتجارب فقط |
| **جهازك القديم / Raspberry Pi** | بلا حدود | لا | محتاج كهرباء وإنترنت ثابت |
| **Cloudflare Tunnel** | نفق مجاني بدون IP عام | لا | الحل الأمثل لجهازك |

> 🏆 **أفضل تركيبة مجانية للـ 24/7:** Oracle Always Free VM + Docker + `Cloudflare Tunnel` (بدل فتح بورتات) + LiteLLM + n8n.
> لو Oracle رفضت الكارت: Raspberry Pi أو لابتوب قديم + Cloudflare Tunnel = نفس النتيجة بصفر دولار.

```bash
# Cloudflare Tunnel (مجاني)
cloudflared tunnel login
cloudflared tunnel create my-agent
cloudflared tunnel route dns my-agent agent.example.com
cloudflared tunnel run --url http://localhost:5678 my-agent
```

---

## 10. 4 Blueprints جاهزة (انسخ وشغّل)

### 🅰️ مساعد شخصي على تيليجرام/واتساب (30 دقيقة)

```text
[Oracle VM / Raspberry Pi]
   └── Docker
        ├── litellm   (fallback: Groq → Gemini → OpenRouter → Ollama)
        └── openclaw  (gateway + WhatsApp/Telegram plugin)
```

```bash
curl -fsSL https://openclaw.ai/install.sh | bash
openclaw onboard --install-daemon
openclaw channels add --channel telegram --token "$TG_BOT_TOKEN"
# في ~/.openclaw/openclaw.json: خلي الـ baseURL = http://localhost:4000/v1
```

### 🅱️ أتمتة يومية بدون سيرفر (GitHub Actions)

الملف: [`starter/ai-agent-cron.yml`](starter/ai-agent-cron.yml) — انسخه لـ `.github/workflows/`

```yaml
name: Daily AI Digest
on:
  schedule: [{ cron: "0 6 * * *" }]     # 6 صباحًا UTC
  workflow_dispatch:
permissions:
  contents: read
  issues: write
concurrency:
  group: daily-digest
  cancel-in-progress: false
jobs:
  digest:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Generate
        env:
          GROQ_API_KEY: ${{ secrets.GROQ_API_KEY }}
        run: |
          curl -s https://api.groq.com/openai/v1/chat/completions \
            -H "Authorization: Bearer $GROQ_API_KEY" \
            -H "Content-Type: application/json" \
            -d '{"model":"openai/gpt-oss-120b","messages":[
                 {"role":"user","content":"اكتب ملخص تقني قصير لآخر أخبار AI"}]}' \
            | jq -r '.choices[0].message.content' > digest.md
      - name: Publish as issue
        env:
          GH_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        run: gh issue create --title "AI Digest $(date +%F)" --body-file digest.md
```

> ⚠️ **ملاحظة:** الـ cron في ريبو عام بيتقفل بعد **60 يوم** بدون commits. الحل: `workflow_dispatch` من الخارج (cron-job.org مجاني) أو commit دوري.

### 🅲 شات خاص لعيلتك/فريقك

```text
Open WebUI  ──► LiteLLM ──► Groq / Gemini / NVIDIA / OpenRouter / Ollama
```
```bash
docker compose up -d open-webui
# أول مستخدم يسجل = admin
```

### 🅳 agent يكتب كود ويفتح PR

```text
Cline / Continue (VS Code)  +  GitHub MCP  +  Actions CI  +  Copilot Free
```
- الموديل: `gpt-oss-120b` من Groq (مجاني وسريع) عبر LiteLLM.
- الـ MCP: `github` + `filesystem` + `playwright`.
- الـ CI: Actions على الريبو العام = مجاني.

### 🅴 RAG على مستنداتك

```text
Docling → chunks → pgvector/Qdrant → Rivet/Dify/Langflow → LiteLLM
```

---

## 11. الأمان والفخاخ القانونية

### 11.1 فخاخ التراخيص (اقرا قبل أي استخدام تجاري)

| الأداة | الترخيص | اللي ممنوع |
|--------|---------|-------------|
| **n8n** | Sustainable Use | تبيعه أو تستضيفه كخدمة للغير |
| **Dify** | Apache معدّل | multi-tenant SaaS |
| **Windmill / Firecrawl / ToolJet / Automatisch** | AGPL-3.0 | استخدام شبكي = لازم تنشر السورس |
| **Phoenix** | Elastic License 2.0 | تقديم الخدمة كمنتج |
| **Open WebUI** | BSD-3 + branding | تشيل البراندنج فوق 50 مستخدم |
| **ComfyUI** | GPL-3.0 | توزيع مغلق |
| **AutoGen** | MIT (code) | الريبو بيقول CC-BY للـ docs — مش للكود |
| **AutoGPT** | MIT + Polyform Shield | مجلد `autogpt_platform` ممنوع تبنيه كمنتج منافس |
| **Flowise** | — | **Archived** — متبنيش عليه جديد |

### 11.2 أمان الـ Agents

1. **Prompt injection حقيقي:** أي agent بيقرأ ويب/إيميلات/Issues ممكن يتخدع. خلي الأدوات الخطرة (shell، deploy، دفع) **ورا موافقة بشرية**.
2. **MCP = تنفيذ كود:** ثبّت النسخ، وراجع أي `npx -y` قبل تشغيله.
3. **Actions:** استخدم `permissions:` بحد أدنى، وثبّت الـ actions بـ SHA، ومتستخدمش `pull_request_target` مع كود من fork.
4. **الأسرار:** `.env` في `.gitignore`، ومفاتيح في Secrets — ومتشغّلش `echo $SECRET` في اللوج.
5. **بياناتك:** Free tiers كتير بتستخدم الـ prompts للتدريب (NVIDIA، Mistral، Gemini خارج EU). لو البيانات حساسة → **Ollama محلي**.
6. **GDPR (أنت في NL):** Google مابتدربش على بيانات EU/UK/EEA — بس ده مش مبرر لإرسال بيانات عملاء.

### 11.3 فخاخ المجاني

- **الحدود بتتغير من غير إعلان** (Oracle half-quota، GitHub Models retired، Gemini CLI free end).
- **يومي مش شهري** في معظم الحالات → agent شغال 24/7 هيخبط بسرعة.
- **Free tier ≠ SLA** — مفيش ضمان وقت تشغيل، خطط لـ fallback.
- **الحساب المجاني الواحد** — التحايل = حظر.

---
## 12. خطة 7 أيام

| اليوم | المهمة | الناتج |
|-------|--------|--------|
| **1** | اعمل حساب على Groq + Google AI Studio + OpenRouter، وخد 3 مفاتيح | 3 مزودين مجانيين |
| **2** | ثبّت `ollama` + `qwen3:8b` (أو موديل يناسب جهازك) | fallback offline |
| **3** | شغّل LiteLLM من `starter/docker-compose.yml` | مفتاح واحد لكل الأدوات |
| **4** | وصّل الـ agent: `OpenClaw` (شات) أو `Cline` (كود) | أول أتمتة حقيقية |
| **5** | ضيف MCP: `github` + `filesystem` | agent بيشتغل على الريبو |
| **6** | اعمل ريبو عام + `.github/workflows/ai-agent-cron.yml` | أتمتة مجانية 24/7 |
| **7** | انقل كل حاجة لـ Oracle VM/Raspberry Pi + Cloudflare Tunnel | صفر دولار شهريًا |

---

## 13. المصادر

**بيانات GitHub (مسحوبة بالـ API النهاردة 2026-10-24):** `gh api repos/<owner>/<repo>` لكل ريبو في الجداول.

**GitHub نفسه**
- خطط GitHub: <https://docs.github.com/get-started/learning-about-github/githubs-products>
- فواتير Actions: <https://docs.github.com/billing/managing-billing-for-github-actions/about-billing-for-github-actions>
- جدولة الـ workflows: <https://docs.github.com/en/actions/reference/workflows-and-actions/events-that-trigger-workflows>
- خطط Copilot: <https://docs.github.com/en/copilot/get-started/plans>

**الحدود المجانية (تحقق أكتوبر 2026)**
- Groq rate limits — 30 RPM / 1,000 RPD / 200K TPD لكل موديل
- OpenRouter free — 20 RPM / 50 RPD (1,000 بعد $10)
- Google AI Studio — حدود لكل موديل داخل AI Studio
- Cloudflare Workers AI — <https://developers.cloudflare.com/workers-ai/platform/pricing/> (10k Neurons/يوم)
- NVIDIA NIM — 40 RPM
- Oracle Always Free — 2 OCPU/12GB (تخفيض 15 يونيو 2026)

**تغييرات 2026 المهمة**
- GitHub Models اتقفل: 30 يوليو 2026
- Gemini CLI free (Google login) اتوقف: 18 يونيو 2026 → Antigravity CLI
- Mistral Free plan: اتغير 7 أكتوبر 2026
- Flowise: مؤرشف 13 أغسطس 2026
- Hugging Face Spaces: Docker/Gradio بقت مدفوعة من يوليو 2026

**أدلة ومراجع**
- فهرس MCP الرسمي: <https://github.com/modelcontextprotocol/servers>
- OpenClaw Docs: <https://docs.openclaw.ai/>
- LiteLLM Docs: <https://docs.litellm.ai/>

---

## ملاحظة أخيرة

الأرقام دي **لحظة زمنية**. قبل ما تبني على أي حد مجاني: افتح صفحة pricing الرسمية، وشوف الـ console بتاعك.
وأي أداة هنا **مش مجرد كلام** — الملفات في [`starter/`](starter/) جاهزة تشتغل، وأنا أقدر أشغّلها وأختبرها معاك في نفس الجلسة.
