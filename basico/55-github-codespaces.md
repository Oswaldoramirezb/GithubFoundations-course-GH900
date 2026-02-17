# GitHub Codespaces

## Conceptos clave
- Entorno de desarrollo en la nube para repositorios GitHub
- Dev containers y configuracion con `devcontainer.json`
- Prebuilds para acelerar el inicio del workspace

## Ejemplo de `devcontainer.json`
```json
{
  "name": "Node Dev",
  "image": "mcr.microsoft.com/devcontainers/javascript-node:20",
  "features": {
    "ghcr.io/devcontainers/features/git:1": {}
  },
  "postCreateCommand": "npm install",
  "customizations": {
    "vscode": {
      "extensions": ["dbaeumer.vscode-eslint"]
    }
  }
}
```

## Comandos GitHub CLI utiles
- `gh codespace list` - Listar codespaces
- `gh codespace create -r OWNER/REPO` - Crear codespace
- `gh codespace ssh -c NAME` - Abrir SSH
- `gh codespace stop -c NAME` - Detener
- `gh codespace delete -c NAME` - Eliminar

## Practica
1. Crea un `devcontainer.json` en tu repositorio.
2. Agrega extensiones recomendadas y un comando `postCreateCommand`.
3. Habilita prebuilds en la configuracion de Codespaces.
4. Crea un codespace con GitHub CLI.
5. Prueba el flujo de detener y eliminar.
