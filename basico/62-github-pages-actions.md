# GitHub Pages con Actions

## Conceptos clave
- Publicar sitios estaticos desde el repositorio
- Despliegue automatico con GitHub Actions
- Fuente: branch `gh-pages` o carpeta `docs/`

## Workflow basico (build + deploy)
```yaml
name: Deploy Pages
on:
  push:
    branches: ["main"]
permissions:
  contents: read
  pages: write
  id-token: write
concurrency:
  group: "pages"
  cancel-in-progress: true
jobs:
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/configure-pages@v5
      - uses: actions/upload-pages-artifact@v3
        with:
          path: "./docs"
      - id: deployment
        uses: actions/deploy-pages@v4
```

## Requisitos
- En Settings > Pages selecciona "GitHub Actions" como fuente
- Asegura que el contenido final quede en `docs/`

## Practica
1. Crea una pagina sencilla en `docs/index.html`.
2. Configura Pages con el workflow anterior.
3. Publica con un push a `main`.
4. Valida la URL publicada.
5. Cambia el contenido y verifica el nuevo despliegue.
