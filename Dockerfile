# ------------------------------ SQL 2019 ---------------------------------------
# Imagen de Docker Hub
#docker run -e "ACCEPT_EULA=Y" -e "mysql_SA_PASSWORD=Jesus0413." -p 1465:1433 -d mcr.microsoft.com/mssql/server:2022-latest

FROM mcr.microsoft.com/mssql/server:2019-latest AS mysql

# Variables de entorno del contenedor
ENV MSSQL_SA_PASSWORD=Jesus0413. ACCEPT_EULA=Y MSSQL_PID=Developer 

# Puerto SQL
EXPOSE 1433
