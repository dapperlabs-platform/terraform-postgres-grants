variable "role" {
  description = "Name of the role to create"
  type        = string
}

variable "host" {
  description = "The instance that hosts the database"
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

variable "default_table_privileges" {
  description = "Default privileges to apply to all tables in the database"
  type        = list(string)
  default     = []
}

variable "table_privileges" {
  description = "Privileges to apply to specified tables (variable) in the database"
  type        = list(string)
  default     = []
}

variable "database_privileges" {
  description = "Privileges to apply to the database"
  type        = list(string)
  default     = ["CONNECT"]
}

variable "tables" {
  description = "Tables in the database"
  type        = list(string)
  default     = []
}

variable "users" {
  description = "Users who need access to the database and tables"
  type        = list(string)
}

variable "owner" {
  description = "Schema owner, for granting default privileges"
  type        = string
  default     = "postgres"
}

variable "owner_password" {
  description = "Schema owner password, used for granting privileges"
  type        = string
  default     = ""
  sensitive   = true
}
