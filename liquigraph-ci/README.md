# Docker image for `liquigraph-ci`

See section [Highway to shell](https://www.liquigraph.org/4.x/index.html).

### Build arguments
- `LIQUIGRAPH_VERSION` (default: `4.0.2`)

### Configuration: environment variables
- `CHANGELOG` - path to migration file within the container.
- `NEO4J_JDBC_URL` - URL for connecting to the database. See [Supported JDBC urls](https://www.liquigraph.org/4.x/index.html#detailed_section).
- `NEO4J_USER`, `NEO4J_PASSWORD` - authorization credentials.
