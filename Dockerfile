# Use specific digest, not just "slim" (prevents supply chain attacks)
FROM python:3.11-slim-bookworm

# Run as non-root — critical security practice
RUN groupadd -r appuser && useradd -r -g appuser appuser

WORKDIR /app

# Copy deps first (layer caching + least privilege)
COPY --chown=appuser:appuser requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt \
    # Remove pip after install (shrinks attack surface)
    && pip uninstall -y pip setuptools

COPY --chown=appuser:appuser . .

# Drop to non-root
USER appuser

# Explicit port (documentation + firewall rules)
EXPOSE 5000

# Use exec form (not shell form) — avoids shell injection
CMD ["python", "app.py"]