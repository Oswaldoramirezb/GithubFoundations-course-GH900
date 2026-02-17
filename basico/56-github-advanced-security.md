# GitHub Advanced Security

## Conceptos clave
- Code scanning con CodeQL
- Secret scanning para detectar credenciales
- Dependabot alerts para vulnerabilidades en dependencias

## Code scanning (CodeQL) - Workflow basico
```yaml
name: CodeQL
on:
  push:
    branches: ["main"]
  pull_request:
    branches: ["main"]
  schedule:
    - cron: "0 3 * * 1"

jobs:
  analyze:
    runs-on: ubuntu-latest
    permissions:
      actions: read
      contents: read
      security-events: write
    steps:
      - uses: actions/checkout@v4
      - uses: github/codeql-action/init@v3
        with:
          languages: javascript
      - uses: github/codeql-action/autobuild@v3
      - uses: github/codeql-action/analyze@v3
```

## Secret scanning
- Habilita en Settings > Security and analysis
- Permite bloquear commits con secretos usando push protection

## Dependabot alerts
- Configura alertas en Settings > Security and analysis
- Opcional: crea un archivo de configuracion para updates

## Dependabot updates
```yaml
# .github/dependabot.yml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
```

## GitHub CLI util
- `gh api /repos/OWNER/REPO/code-scanning/alerts` - Listar alertas
- `gh api /repos/OWNER/REPO/secret-scanning/alerts` - Alertas de secretos
- `gh api /repos/OWNER/REPO/dependabot/alerts` - Alertas de dependencias

## Practica
1. Activa GitHub Advanced Security en el repo.
2. Configura CodeQL para tu lenguaje principal.
3. Habilita secret scanning con push protection.
4. Agrega Dependabot updates y revisa PRs automaticas.
5. Revisa y cierra alertas con comentarios.
