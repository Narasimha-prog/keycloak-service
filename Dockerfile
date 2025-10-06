# ---------- BUILD STAGE ----------
FROM quay.io/keycloak/keycloak:25.0.2 as builder

WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build

# ---------- RUNTIME STAGE ----------
FROM quay.io/keycloak/keycloak:25.0.2

WORKDIR /opt/keycloak

# Set admin credentials (better: configure in Render dashboard)
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Render sets $PORT automatically → we pass it to Keycloak
ENV PORT=8080

# Start Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--http-port=${PORT}", "--hostname-strict=false", "--hostname-strict-https=false"]
