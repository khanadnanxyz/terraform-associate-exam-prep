terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">= 2.2.3"
    }
  }
}

resource "local_file" "hello" {
    content = "Hello World"
    filename = "hello.txt"
}