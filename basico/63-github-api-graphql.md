# GitHub API GraphQL

## Conceptos clave
- GraphQL permite pedir solo los campos necesarios
- Un endpoint: https://api.github.com/graphql
- Autenticacion con token (PAT o GITHUB_TOKEN)

## Ejemplo de consulta basica
```graphql
query {
  viewer {
    login
    repositories(first: 5) {
      nodes {
        name
        url
        stargazerCount
      }
    }
  }
}
```

## Variables en GraphQL
```graphql
query($owner: String!, $name: String!) {
  repository(owner: $owner, name: $name) {
    issues(last: 5, states: OPEN) {
      nodes { title url }
    }
  }
}
```

## Llamar con GitHub CLI
```bash
gh api graphql -f query='query { viewer { login } }'
```

## Buenas practicas
- Usa paginacion con `first` y `after`
- Pide solo campos necesarios
- Maneja limites de rate y errores

## Practica
1. Crea un token con permisos minimos.
2. Consulta tus repos con `viewer`.
3. Lista issues abiertos del repo.
4. Agrega paginacion en la consulta.
5. Usa `gh api graphql` y guarda la respuesta.
