FROM zerok/hugo:latest-extended AS builder
RUN mkdir -p /src
COPY config.toml /src/
COPY archetypes/ /src/archetypes
COPY content/ /src/content
COPY layouts/ /src/layouts
COPY static/ /src/static
COPY themes/ /src/themes
RUN cd /src && hugo

FROM nginx:stable-alpine
COPY --from=builder /src/public/ /usr/share/nginx/html
