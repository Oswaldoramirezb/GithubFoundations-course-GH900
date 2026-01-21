# Integración continua (CI) con GitHub Actions

Permite automatizar pruebas, builds y despliegues.

## Ejemplo de workflow:

.github/workflows/ci.yml

```
name: CI
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Instalar dependencias
        run: npm install
      - name: Ejecutar pruebas
        run: npm test
```

# Beneficios
- Detecta errores antes de hacer merge
- Automatiza tareas repetitivas
