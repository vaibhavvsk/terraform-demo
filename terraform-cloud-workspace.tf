terraform {
  backend "remote" {
    organization = "myterraform-org"

    workspaces {
      name = "myterrraform-workspace"
    }
  }
}