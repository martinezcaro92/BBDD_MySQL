# 📦 Proyecto MySQL + Adminer en Docker

Este proyecto permite desplegar un entorno de **MySQL** junto con **Adminer** en contenedores Docker sobre un host **Windows**.  
El servicio se comporta como una instalación nativa, garantizando **persistencia de datos** gracias al uso de volúmenes.

---

## 🚀 Requisitos previos

- [Docker Desktop](https://www.docker.com/products/docker-desktop) instalado en Windows.  
- [Docker Compose](https://docs.docker.com/compose/) (ya viene integrado en Docker Desktop).  
- PowerShell o CMD para ejecutar comandos.

---

## 📂 Estructura del proyecto

```
proyecto-mysql/
│
├─ docker-compose.yml   # Definición de servicios (MySQL + Adminer)
└─ .env                 # Variables de entorno (contraseñas, puertos, etc.)
```

---

## ⚙️ Configuración

### 📄 `.env`

Archivo con las variables de entorno utilizadas por `docker-compose.yml`.  
Ejemplo de configuración:

```ini
# Configuración de MySQL
MYSQL_ROOT_PASSWORD=RootPass123!
MYSQL_DATABASE=mi_base_datos
MYSQL_USER=usuario_app
MYSQL_PASSWORD=UsuarioPass123!

# Puerto de exposición de MySQL
MYSQL_PORT=3306

# Puerto para Adminer
ADMINER_PORT=8080
```

### 📄 `docker-compose.yml`

Definición de servicios Docker:

```yaml
version: '3.8'

services:
  mysql:
    image: mysql:8.0
    container_name: mysql_server
    restart: always
    env_file: .env
    ports:
      - "${MYSQL_PORT}:3306"
    volumes:
      - mysql_data:/var/lib/mysql

  adminer:
    image: adminer
    container_name: adminer_ui
    restart: always
    ports:
      - "${ADMINER_PORT}:8080"
    depends_on:
      - mysql

volumes:
  mysql_data:
```

---

## ▶️ Despliegue

1. Abre **PowerShell** o **CMD** en la carpeta del proyecto (`proyecto-mysql`).  
2. Ejecuta el siguiente comando para iniciar los servicios:

   ```powershell
   docker-compose up -d
   ```

3. Verifica que los contenedores están en ejecución:

   ```powershell
   docker ps
   ```

---

## 🖥️ Acceso a la base de datos

### 1. Interfaz gráfica (Adminer)

- Abre el navegador en: [http://localhost:8080](http://localhost:8080)  
- Introduce las credenciales configuradas en el archivo `.env`:  
  - **Sistema:** MySQL  
  - **Servidor:** `mysql`  
  - **Usuario:** `usuario_app`  
  - **Contraseña:** `UsuarioPass123!`  
  - **Base de datos:** `mi_base_datos`

*(También puedes entrar como root usando `root` y `RootPass123!`)*

---

### 2. Línea de comandos (CLI)

Para acceder directamente a MySQL desde el contenedor:

```powershell
docker exec -it mysql_server mysql -u root -p
```

Introduce la contraseña (`RootPass123!`) cuando se solicite.  
Ejemplo de uso:

```sql
SHOW DATABASES;
USE mi_base_datos;
SHOW TABLES;
```

---

## 📦 Gestión de contenedores

- **Detener servicios**  
  ```powershell
  docker-compose down
  ```

- **Detener y eliminar datos persistentes** (⚠️ borra todo el contenido de la BBDD)  
  ```powershell
  docker-compose down -v
  ```

- **Revisar logs de MySQL**  
  ```powershell
  docker logs -f mysql_server
  ```

---

## 🔒 Seguridad

- Cambia las contraseñas por valores más seguros antes de desplegar en producción.  
- No expongas el puerto de MySQL (`3306`) directamente a internet sin un firewall o VPN.  
- Adminer debe protegerse tras un proxy inverso o autenticación adicional en entornos productivos.

---

## 📚 Referencias

- [Imagen oficial de MySQL en Docker Hub](https://hub.docker.com/_/mysql)  
- [Imagen oficial de Adminer en Docker Hub](https://hub.docker.com/_/adminer)  
- [Documentación oficial de Docker Compose](https://docs.docker.com/compose/)  

---

✅ Con este proyecto dispones de un entorno completo para **desarrollo y gestión de bases de datos MySQL** con **persistencia garantizada** en Windows.  
