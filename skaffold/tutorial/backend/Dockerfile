FROM python:3.10.10-slim-bullseye as python
ENV PYTHONUNBUFFERED=true
WORKDIR /app


FROM python as poetry
ENV POETRY_HOME=/opt/poetry
ENV POETRY_VIRTUALENVS_IN_PROJECT=true
ENV PATH="$POETRY_HOME/bin:$PATH"
RUN python -c 'from urllib.request import urlopen; print(urlopen("https://install.python-poetry.org").read().decode())' | python -
COPY poetry.lock .
COPY pyproject.toml .
RUN poetry install --no-interaction --no-ansi -vvv --without dev
COPY . .
RUN poetry install --no-interaction --no-ansi -vvv --only-root


FROM python as runtime
ENV PATH="/app/.venv/bin:$PATH"
COPY --from=poetry /app .
EXPOSE 8000
ENTRYPOINT [ "/app/entrypoint.sh" ]
CMD ["transposer-backend"]
