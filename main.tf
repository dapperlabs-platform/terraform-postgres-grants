resource "postgresql_role" "the_role" {
  name = var.role
}

resource "postgresql_grant" "database_grant" {
  database    = var.database
  role        = postgresql_role.the_role.name
  object_type = "database"
  privileges  = var.database_privileges
}

resource "postgresql_grant" "table_grant" {
  database    = var.database
  role        = postgresql_role.the_role.name
  schema      = var.schema
  object_type = "table"
  objects     = var.tables
  privileges  = var.table_privileges
}

resource "postgresql_grant_role" "user_role_grant_role" {
  for_each   = toset(var.users)
  role       = each.key
  grant_role = postgresql_role.the_role.name
}
