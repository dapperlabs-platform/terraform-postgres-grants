variable "role" {
  description = "Name of the role to create"
  type        = string
}

variable "database" {
  description = "Database this applies to"
  type        = string
}

variable "schema" {
  description = "Table schema"
  type        = string
  default     = "public"
}

variable "table_privileges" {
  description = "Privileges to apply to tables in the database"
  type        = list(string)
}

variable "database_privileges" {
  description = "Privileges to apply to the database"
  type        = list(string)
  default     = ["CONNECT"]
}

variable "tables" {
  description = "Tables in the database"
  type        = list(string)
}

variable "users" {
  description = "Users who need access to the database and tables"
  type        = list(string)
}
