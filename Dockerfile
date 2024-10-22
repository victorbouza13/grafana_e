# Utiliza la imagen base de Grafana Enterprise
FROM grafana/grafana-enterprise:latest

# Establecer variables de entorno para habilitar el embebido y la autenticación anónima
ENV GF_SECURITY_ALLOW_EMBEDDING=true
ENV GF_AUTH_ANONYMOUS_ENABLED=true

# Exponer el puerto que Grafana utilizará
EXPOSE 3000
