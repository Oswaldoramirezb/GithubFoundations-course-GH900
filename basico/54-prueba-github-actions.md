# Prueba de GitHub Actions

## Comandos y Conceptos de GitHub Actions

### Crear Workflow básico
```yaml
# .github/workflows/main.yml
name: CI
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run a script
        run: echo "Hello GitHub Actions"
```

### Workflows con múltiples jobs
```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - run: npm test
  build:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - run: npm run build
```

### Usar secretos
```yaml
steps:
  - name: Deploy
    env:
      API_KEY: ${{ secrets.API_KEY }}
    run: ./deploy.sh
```

### Comandos GitHub CLI para Actions
- `gh workflow list` - Listar workflows
- `gh workflow run [workflow]` - Ejecutar workflow manualmente
- `gh workflow view [workflow]` - Ver detalles del workflow
- `gh run list` - Listar ejecuciones
- `gh run view [run-id]` - Ver detalles de ejecución
- `gh run watch [run-id]` - Observar ejecución en tiempo real
- `gh run rerun [run-id]` - Re-ejecutar workflow

### Artifacts y Caching
```yaml
- uses: actions/upload-artifact@v3
  with:
    name: my-artifact
    path: dist/

- uses: actions/cache@v3
  with:
    path: ~/.npm
    key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}
```

## Práctica
1. Crea un workflow básico en .github/workflows/
2. Configura triggers para push y pull_request
3. Añade secrets en la configuración del repositorio
4. Usa artifacts para compartir datos entre jobs
5. Implementa caching para dependencias
