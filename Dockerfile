# Utiliza la imagen base de Grafana Enterprise
FROM grafana/grafana-enterprise:latest

# Establecer variables de entorno para habilitar el embebido, CORS y la autenticación anónima
ENV GF_SECURITY_ALLOW_EMBEDDING=true
ENV GF_AUTH_ANONYMOUS_ENABLED=true
ENV GF_CORS_ALLOW_ORIGIN=*
ENV GF_SECURITY_X_FRAME_OPTIONS=allow-from *
ENV GF_SERVER_HTTP_ADDR=0.0.0.0

# Utilizar la variable de puerto proporcionada por Railway
ENV GF_SERVER_HTTP_PORT=$PORT

# Exponer el puerto que Grafana utilizará (Railway manejará el puerto dinámicamente)
EXPOSE 3000
