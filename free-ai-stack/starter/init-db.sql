-- تُنفَّذ تلقائيًا أول مرة فقط (docker-entrypoint-initdb.d)
-- القواعد بتت creating باسم POSTGRES_USER، فمفيش GRANT مطلوب
CREATE DATABASE litellm;
CREATE DATABASE n8n;
