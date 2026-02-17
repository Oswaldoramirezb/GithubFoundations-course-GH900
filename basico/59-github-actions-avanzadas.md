# GitHub Actions avanzadas

## Matrices
```yaml
name: CI
on: [push]
jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node: [18, 20]
        os: [ubuntu-latest, windows-latest]
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node }}
      - run: npm test
```

## Reusable workflows
```yaml
# .github/workflows/reusable.yml
name: reusable
on:
  workflow_call:
    inputs:
      node:
        required: true
        type: string
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - run: echo "Node ${{ inputs.node }}"
```

```yaml
# .github/workflows/caller.yml
name: caller
on: [push]
jobs:
  call:
    uses: ./.github/workflows/reusable.yml
    with:
      node: "20"
```

## Environments y aprobaciones
```yaml
jobs:
  deploy:
    environment:
      name: production
      url: https://example.com
    runs-on: ubuntu-latest
    steps:
      - run: ./deploy.sh
```

## Concurrency
```yaml
concurrency:
  group: deploy-${{ github.ref }}
  cancel-in-progress: true
```

## Practica
1. Crea una matriz para Node 18 y 20.
2. Separa un workflow reutilizable.
3. Agrega un environment con aprobacion manual.
4. Usa concurrency para evitar despliegues duplicados.
5. Ejecuta el workflow en un PR y en main.
