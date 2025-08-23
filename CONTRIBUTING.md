# Contributing to ERCOT Vector Store RAG

Thanks for your interest in contributing! This project hosts a Langflow flow export and related docs.

## Getting started

- **Fork** the repo and create a branch from `main` (e.g., `feature/my-change`).
- **Python 3.10+** and **Git** required.

### Local setup

```bash
git clone https://github.com/srinikhil9/ERCOT-Vector-Store-RAG.git
cd "ERCOT Vector Store RAG"
python -m venv .venv
.\.venv\Scripts\Activate
pip install -r requirements.txt
```

Alternatively, install Langflow directly:
```bash
pip install langflow
langflow run
```

Then import `ERCOT Vector Store RAG.json` via the Langflow UI.

### Configuration

- Review `env_example.sh` for example environment variables and set your own locally.
- Do not commit secrets. Use a local `.env` or shell environment vars.

## Making changes

- Keep changes focused and small. Include docs updates when relevant.
- For docs-only updates, use a `docs/` prefix in branch names.

### Commit style

- Prefer Conventional Commits (e.g., `feat: ...`, `fix: ...`, `docs: ...`).

## Pull requests

- Ensure CI (if present) is green.
- Include a brief description, screenshots if UI-related, and steps to test.
- Reference issues with `Fixes #<id>` when applicable.

## Issues

- Use clear titles and steps to reproduce when filing bugs.
- Tag issues appropriately (bug, enhancement, docs).

## License

By contributing, you agree that your contributions will be licensed under the MIT License (see `LICENSE`).

---

Repo: https://github.com/srinikhil9/ERCOT-Vector-Store-RAG
