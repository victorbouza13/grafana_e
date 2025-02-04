# Utiliza la imagen base de Grafana Enterprise
FROM grafana/grafana-enterprise:latest

# Crear un nuevo directorio para los datos de Grafana (fuera de las carpetas del sistema operativo)
RUN mkdir -p /grafana_data

# Cambiar los permisos para el nuevo directorio (sin permisos especiales)
RUN chmod -R 777 /grafana_data

# Establecer variables de entorno para cambiar la ruta de datos y plugins
ENV GF_PATHS_DATA=/grafana_data/data
ENV GF_PATHS_PLUGINS=/grafana_data/plugins

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
