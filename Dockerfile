FROM quay.io/keycloak/keycloak:25.0.2

WORKDIR /opt/keycloak

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV PORT=8080

# Run in dev mode (no HTTPS, in-memory DB)
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-port=${PORT}"]
