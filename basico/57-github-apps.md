# GitHub Apps

## Conceptos clave
- Apps con permisos granulares frente a tokens personales
- Instalacion por repositorio u organizacion
- Autenticacion con claves privadas y JWT

## Flujo basico de autenticacion
1. La app firma un JWT con su private key.
2. Intercambia el JWT por un installation token.
3. Usa el installation token para llamar la API.

## Ejemplo de permisos comunes
- `contents:read` para leer repositorios
- `issues:write` para crear y comentar issues
- `pull_requests:write` para revisar PRs

## Endpoints utiles
- `POST /app/installations/{installation_id}/access_tokens`
- `GET /installation/repositories`
- `GET /repos/{owner}/{repo}/issues`
- `POST /repos/{owner}/{repo}/issues`

## GitHub CLI util
- `gh api /app` - Ver info de la app (con JWT)
- `gh api /app/installations` - Listar instalaciones
- `gh api /installation/repositories` - Repos accesibles

## Practica
1. Crea una GitHub App en Developer settings.
2. Define permisos minimos para issues y PRs.
3. Instala la app en un repositorio de prueba.
4. Genera un installation token y llama la API.
5. Crea un issue usando el token.
