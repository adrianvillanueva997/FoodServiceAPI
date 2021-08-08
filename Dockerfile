FROM python:3.9-alpine as base
FROM base as builder
WORKDIR /build
COPY requirements.txt .
RUN apk add --no-cache build-base && pip3 wheel -r requirements.txt

FROM base as prod
COPY --from=builder /build /wheels
RUN apk add make && pip install --no-cache-dir -U pip && \
    pip install --no-cache-dir \
    -r /wheels/requirements.txt \
    -f /wheels && \
    rm -rf /wheels
WORKDIR /app
COPY . .
EXPOSE 8000
RUN adduser -D appuser
USER appuser
CMD ["make", "prod"]
