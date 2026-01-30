# Sistema de Evaluación de Proveedores

Aplicación web para evaluar proveedores con asignaciones específicas por evaluador.

## Instrucciones para Compartir y Configurar

Si has descargado este código desde GitHub para crear tu propia instancia, sigue estos pasos:

### 1. Configuración de la Base de Datos (Supabase)

Esta aplicación requiere una base de datos **Supabase** para funcionar y guardar los datos en la nube.

1.  Crea una cuenta gratuita en [Supabase.com](https://supabase.com).
2.  Crea un nuevo proyecto.
3.  Ve al **SQL Editor** (icono de hoja en la barra izquierda).
4.  Abre el archivo `database_setup.sql` incluido en este repositorio.
5.  Copia todo el contenido y pégalo en el editor SQL de Supabase.
6.  Haz clic en **Run** para crear las tablas necesarias.

### 2. Conexión con la Aplicación

Para que la aplicación se conecte a TU base de datos:

1.  En Supabase, ve a **Project Settings** > **API**.
2.  Copia la `Project URL` y la `anon public key`.
3.  En los archivos de este proyecto, abre `js/supabase-config.js`.
4.  Reemplaza los valores existentes con los tuyos:

```javascript
const SUPABASE_URL = 'TU_URL_DE_SUPABASE_AQUI';
const SUPABASE_ANON_KEY = 'TU_CLAVE_ANON_AQUI';
```

### 3. Ejecutar la Aplicación

Una vez configurado:
- Abre el archivo `index.html` en tu navegador.
- O súbelo a un hosting estático (Netlify, GitHub Pages, etc.) como se detalla más abajo.

## Despliegue en Servidor Propio (Corporativo)

Dado que la aplicación está compuesta por archivos estáticos (HTML, CSS, JS), puede desplegarse en cualquier servidor web estándar (IIS, Apache, Nginx, etc.).

## ⚠️ Requisito Técnico Crítico: Supabase

Esta aplicación **NO** puede conectarse directamente a una base de datos tradicional (como SQL Server, MySQL o PostgreSQL puro) porque utiliza la librería `supabase-js` en el frontend.

**Para desplegar en servidores propios, es OBLIGATORIO tener una instancia de Supabase corriendo.**

### Opción A: Supabase Cloud (Más fácil)
Usar la nube oficial de [Supabase.com](https://supabase.com) y configurar la aplicación para apuntar allá.

### Opción B: Supabase Self-Hosted (Para Servidores Propios)
Si el equipo de TI requiere que los datos estén en sus servidores, **deben desplegar Supabase usando Docker**.

1.  **Documentación Oficial**: [Supabase Self-Hosting with Docker](https://supabase.com/docs/guides/self-hosting/docker)
2.  Una vez levantado el contenedor de Supabase, obtendrán su propia `API URL` y `ANON KEY`.
3.  Esa URL y Key son las que se deben poner en `js/supabase-config.js`.

**NOTA PARA TI:** No basta con crear una base de datos PostgreSQL. Se necesita la capa de API (PostgREST, GoTrue, Realtime) que provee el stack completo de Supabase.

### Configuración de la Base de Datos
Una vez que tengan su instancia de Supabase (Cloud o Docker) funcionando:

1.  Conectarse a la base de datos (vía Dashboard o puerto expuesto de Postgres).
2.  Ejecutar el script `database_setup.sql` incluido en este repositorio.
3.  Copiar las credenciales (URL y Anon Key) en `js/supabase-config.js`.
- ✅ Cada evaluador solo ve sus proveedores asignados
- ✅ Filtrado automático de proveedores ya evaluados
- ✅ Descarga de evaluaciones en Excel
- ✅ Envío de correos a proveedores
- ✅ Sincronización en la nube con Supabase

## Notas Importantes
- Los datos se guardan en Supabase.
- Asegúrate de actualizar la contraseña del administrador desde la interfaz la primera vez.




