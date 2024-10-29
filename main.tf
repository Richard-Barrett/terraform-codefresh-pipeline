terraform {
  required_version = ">= 1.5.7"
  required_providers {
    codefresh = {
      source  = "codefresh-io/codefresh"
      version = "0.11.0"
    }
  }
}

resource "codefresh_pipeline" "tf-datalake-buckets-terraform" {
  name = var.pipeline_name

  spec {    
    spec_template {
      repo     = var.pipeline_repo
      path     = var.pipeline_path
      revision = var.pipeline_revision
      context  = var.pipeline_context
      location = var.pipeline_location
    }

    runtime_environment {
      name   = var.runtime_environment_default
      cpu    = var.pipeline_cpu
      memory = var.pipeline_memory
    }

    variables = var.pipeline_variables
  }

  tags = var.pipeline_tags
}