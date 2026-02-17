# GitHub Projects (v2)

## Conceptos clave
- Tableros basados en items y campos personalizados
- Vistas: Board, Table y Roadmap
- Automatizaciones con workflows del proyecto

## Campos comunes
- Status, Priority, Iteration, Owner
- Campos de texto, numero, fecha y seleccion

## Workflows del proyecto
- Auto-asignar status al crear issue o PR
- Cambiar status al cerrar o mergear
- Reglas por repositorio

## GitHub CLI util
- `gh project list --owner OWNER` - Listar proyectos
- `gh project view PROJECT --owner OWNER` - Ver detalles
- `gh project item-list PROJECT --owner OWNER` - Items del proyecto
- `gh project item-add PROJECT --owner OWNER --url ISSUE_URL` - Agregar item

## API GraphQL basica
```graphql
query {
  organization(login: "OWNER") {
    projectV2(number: 1) {
      title
      items(first: 10) {
        nodes {
          id
          content {
            __typename
            ... on Issue { title url }
            ... on PullRequest { title url }
          }
        }
      }
    }
  }
}
```

## Practica
1. Crea un Project v2 en tu organizacion o usuario.
2. Agrega campos Status y Priority.
3. Crea vistas Board y Table.
4. Automatiza cambios de Status al cerrar issues.
5. Agrega items con `gh project item-add`.
