# ------------------------------ SQL 2019 ---------------------------------------
# Imagen de Docker Hub
FROM mcr.microsoft.com/mssql/server:2019-CU18-ubuntu-20.04 AS mysql

# Variables de entorno del contenedor
ENV MSSQL_SA_PASSWORD=Jesus0413. ACCEPT_EULA=Y MSSQL_PID=Developer 

# Puerto SQL
EXPOSE 1433
