terraform {
  required_version = ">= 0.13"
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.19.0"
    }
  }
}
