terraform {
  required_version = "1.3.7"

  cloud {
    organization = "ystkfujii"    
    
    workspaces {
      name = "elasticip"
    }
  }

  required_providers {
    nifcloud = {
      source  = "nifcloud/nifcloud"
      version = "1.7.0"
    }
  }
}