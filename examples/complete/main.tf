terraform {
  required_version = ">= 1.5.7"
  required_providers {
    codefresh = {
      source  = "codefresh-io/codefresh"
      version = "0.11.0"
    }
  }
}

provider "codefresh" {}

module "codefresh_pipeline" {
  source = "../../"

  pipeline_name               = "my-codefresh-pipeline"
  pipeline_repo               = "https://github.com/your-repo.git"
  pipeline_path               = "path/to/pipeline"
  pipeline_revision           = "main"
  pipeline_context            = "production"
  pipeline_location           = "us-west-2"
  pipeline_cpu                = "2"
  pipeline_memory             = "4Gi"
  runtime_environment_default = "default-env"

  pipeline_tags = [
    "prodsys-data",
    "ci-cd",
  ]

  pipeline_variables = {
    ENV_VAR1 = "value1"
    ENV_VAR2 = "value2"
  }
}
