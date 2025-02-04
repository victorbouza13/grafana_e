# Utiliza la imagen base de Grafana Enterprise
FROM grafana/grafana-enterprise:latest

# Cambiar los permisos de los directorios para dar acceso de lectura, escritura y ejecución a todos los usuarios
RUN chmod -R 777 /var/lib/grafana /etc/grafana /var/log/grafana /var/lib/grafana/plugins

# Establecer variables de entorno para habilitar el embebido, CORS, autenticación anónima y ajustar la configuración de seguridad
ENV GF_SECURITY_ALLOW_EMBEDDING=true
ENV GF_AUTH_ANONYMOUS_ENABLED=true
ENV GF_CORS_ALLOW_ORIGIN=*
ENV GF_CORS_ALLOW_CREDENTIALS=true
ENV GF_CORS_ALLOW_HEADERS="Accept, Content-Type, Authorization"
ENV GF_SECURITY_X_FRAME_OPTIONS="allow-all"
ENV GF_SECURITY_CONTENT_SECURITY_POLICY="frame-ancestors 'self' *;"
ENV GF_SERVER_HTTP_ADDR=0.0.0.0

# Utilizar la variable de puerto proporcionada por Railway
ENV GF_SERVER_HTTP_PORT=$PORT

# Exponer el puerto que Grafana utilizará (Railway manejará el puerto dinámicamente)
EXPOSE 3000
