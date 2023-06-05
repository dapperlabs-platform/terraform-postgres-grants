data "postgresql_tables" "tables" {
  count = length(var.tables) == 0
  schemas = [
    var.schema,
  ]
  database    = var.database
  table_types = "BASE TABLE"
}

resource "postgresql_role" "the_role" {
  count = var.role != null ? 1 : 0
  name  = var.role
}

resource "postgresql_grant" "database_grant" {
  database    = var.database
  role        = postgresql_role.the_role.name
  object_type = "database"
  privileges  = var.database_privileges
}

# Grant to provided tables
resource "postgresql_grant" "table_grant" {
  count       = length(var.tables) > 0
  database    = var.database
  role        = postgresql_role.the_role.name
  schema      = var.schema
  object_type = "table"
  objects     = var.tables
  privileges  = var.table_privileges
}

# Grant to all tables in the database
resource "postgresql_grant" "all_table_grant" {
  count       = length(var.tables) == 0
  database    = var.database
  role        = postgresql_role.the_role.name
  schema      = var.schema
  object_type = "table"
  objects     = data.postgresql_tables.tables.*.table_name
  privileges  = var.table_privileges
}

resource "postgresql_grant_role" "user_role_grant_role" {
  for_each   = var.role != null ? toset(var.users) : []
  role       = each.key
  grant_role = postgresql_role.the_role[0].name
}
