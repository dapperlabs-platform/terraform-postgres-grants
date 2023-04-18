## Example

```tf
module "postgres_waterhose-admin" {
  source           = "github.com/dapperlabs-platform/terraform-postgres-grants?ref={ref}"
  database         = "the-database"
  role             = "the-database-role"
  tables           = ["tables", "go", "here"]
  table_privileges = ["SELECT", "INSERT", "UPDATE", "DELETE"]
  users            = ["example@dapperlabs.com"]
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_postgresql"></a> [postgresql](#requirement\_postgresql) | 1.19.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_postgresql"></a> [postgresql](#provider\_postgresql) | 1.19.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [postgresql_grant.database_grant](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.19.0/docs/resources/grant) | resource |
| [postgresql_grant.table_grant](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.19.0/docs/resources/grant) | resource |
| [postgresql_grant_role.user_role_grant_role](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.19.0/docs/resources/grant_role) | resource |
| [postgresql_role.the_role](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.19.0/docs/resources/role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database"></a> [database](#input\_database) | Database this applies to | `string` | n/a | yes |
| <a name="input_database_privileges"></a> [database\_privileges](#input\_database\_privileges) | Privileges to apply to the database | `list(string)` | <pre>[<br>  "CONNECT"<br>]</pre> | no |
| <a name="input_role"></a> [role](#input\_role) | Name of the role to create | `string` | n/a | yes |
| <a name="input_schema"></a> [schema](#input\_schema) | Table schema | `string` | `"public"` | no |
| <a name="input_table_privileges"></a> [table\_privileges](#input\_table\_privileges) | Privileges to apply to tables in the database | `list(string)` | n/a | yes |
| <a name="input_tables"></a> [tables](#input\_tables) | Tables in the database | `list(string)` | n/a | yes |
| <a name="input_users"></a> [users](#input\_users) | Users who need access to the database and tables | `list(string)` | n/a | yes |

## Outputs

No outputs.
