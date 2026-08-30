# ci-cd-test-django

A sample Django web application packaged for CI/CD — containerised with Docker (Gunicorn behind
Nginx) and built/tested through a Jenkins pipeline. Useful as a reference for wiring a Python web
app into a Docker-based Jenkins workflow.

## Stack

- **App**: Django (Python 3.9)
- **Serving**: Gunicorn + Nginx inside a single container (port 8020)
- **CI/CD**: `Jenkinsfile` — build image → run container for test → deploy stage
- **Container**: `Dockerfile` collects static files, runs migrations, and starts the server via
  `start-server.sh`

## Pipeline (Jenkinsfile)

```
Build Docker Image  →  Test (run container)  →  Deploy  →  Outputs
```

## Run locally with Docker

```bash
docker build -t my-django-app .
docker run -d --name django-app -p 8000:8020 my-django-app
# open http://localhost:8000
```

## Run with the Jenkins pipeline

Point a Jenkins job at this repo with Docker available on the agent. The pipeline builds an image
tagged with the build ID, starts a container to validate it, and runs the deploy/outputs stages.

## Configuration

This app reads its secret key and debug flag from the environment (with safe local fallbacks):

```bash
export DJANGO_SECRET_KEY='your-own-secret'
export DJANGO_DEBUG='False'
```

## Security notes

- `DJANGO_SECRET_KEY` and `DJANGO_DEBUG` are environment-driven — do not hardcode a real secret key
  or run with `DEBUG=True` in production.
- `db.sqlite3`, `__pycache__/`, and `.env` are gitignored and should not be committed.

## License

MIT


---

<div align="center">

### Built by

**Durrell Gemuh** - Founder @ NextGen Playground | DevOps & Cloud Infrastructure Engineer | AWS Community Builder

[![Portfolio](https://img.shields.io/badge/Portfolio-durrellgemuh.com-000?style=flat-square&logo=vercel)](https://durrellgemuh.com)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-durrello-0A66C2?style=flat-square&logo=linkedin)](https://www.linkedin.com/in/durrello/)
[![Dev.to](https://img.shields.io/badge/Dev.to-durrello-0A0A0A?style=flat-square&logo=devdotto)](https://dev.to/durrello)
[![X](https://img.shields.io/badge/X-@durrelloo-000?style=flat-square&logo=x)](https://x.com/durrelloo)
[![GitHub](https://img.shields.io/badge/GitHub-durrello-181717?style=flat-square&logo=github)](https://github.com/durrello)
[![Email](https://img.shields.io/badge/Email-durrell.gemuh.a@gmail.com-EA4335?style=flat-square&logo=gmail)](mailto:durrell.gemuh.a@gmail.com)

---

⭐ **Star this repo** if you found it useful - it helps others discover it!

</div>
