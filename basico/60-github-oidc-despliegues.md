# GitHub OIDC para despliegues

## Conceptos clave
- Autenticacion sin secretos largos usando OIDC
- Tokens de corta duracion emitidos por GitHub Actions
- Configuracion de trust en el proveedor cloud

## Flujo general
1. Configura un trust policy en el proveedor cloud.
2. Define el audience y repos permitidos.
3. Usa acciones oficiales para obtener credenciales.

## Ejemplo con AWS (resumen)
```yaml
name: Deploy
on: [push]
permissions:
  id-token: write
  contents: read
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: arn:aws:iam::123456789012:role/GitHubOIDC
          aws-region: us-east-1
      - run: aws s3 ls
```

## Buenas practicas
- Limita el trust policy por repo y branch
- Usa `environment` para aprobaciones
- Revisa auditoria en el proveedor cloud

## Practica
1. Crea un rol OIDC en tu proveedor cloud.
2. Configura el workflow con `id-token: write`.
3. Restringe a la rama main.
4. Ejecuta un deploy de prueba.
5. Revoca permisos y valida el acceso.
