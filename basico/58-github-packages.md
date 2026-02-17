# GitHub Packages

## Conceptos clave
- Registro de paquetes para npm, Maven, NuGet, Docker, RubyGems
- Permisos por repositorio o por organizacion
- Autenticacion con token y scopes

## npm: publicar y consumir
```bash
# Autenticacion
npm login --registry=https://npm.pkg.github.com

# Publicar
npm publish --registry=https://npm.pkg.github.com
```

## Docker: publicar imagen
```bash
docker login ghcr.io -u USERNAME

docker build -t ghcr.io/OWNER/imagen:1.0.0 .
docker push ghcr.io/OWNER/imagen:1.0.0
```

## Configuracion npm (package.json)
```json
{
  "name": "@OWNER/mi-paquete",
  "publishConfig": {
    "registry": "https://npm.pkg.github.com"
  }
}
```

## Permisos y seguridad
- Usa tokens con scopes minimos
- En GitHub Actions, usa `GITHUB_TOKEN` cuando sea posible
- Revisa visibilidad de paquetes (publico/privado)

## Practica
1. Crea un paquete npm con `@OWNER`.
2. Configura el registry en `publishConfig`.
3. Publica el paquete en GitHub Packages.
4. Publica una imagen Docker en GHCR.
5. Consume el paquete desde otro proyecto.
