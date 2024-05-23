locals {
  default_privilege_users = {
    for user in var.users : user => user
    if length(var.default_table_privileges) > 0
  }
}

resource "postgresql_role" "the_role" {
  name = var.role
}

resource "postgresql_grant" "database_grant" {
  database    = var.database
  role        = postgresql_role.the_role.name
  object_type = "database"
  privileges  = var.database_privileges
}

resource "postgresql_default_privileges" "default_table_grant" {
  for_each    = local.default_privilege_users
  database    = var.database
  role        = postgresql_role.the_role.name
  owner       = var.owner
  object_type = "table"
  privileges  = var.default_table_privileges
}

resource "postgresql_grant" "table_grant" {
  count       = length(var.tables)
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
