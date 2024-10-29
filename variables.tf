variable "pipeline_context" {
  description = "Context for the pipeline"
  type        = string
}

variable "pipeline_cpu" {
  description = "CPU allocation for the runtime environment"
  type        = string
  default     = 2500

  validation {
    condition     = can(regex("^\\d+$", var.pipeline_cpu))
    error_message = "pipeline_cpu must be a positive integer."
  }
}

variable "pipeline_location" {
  description = "Location of the pipeline repository"
  type        = string
}

variable "pipeline_memory" {
  description = "Memory allocation for the runtime environment (e.g., '512Mi', '2Gi')"
  type        = string
  default     = "512Mi"

  validation {
    condition     = can(regex("^\\d+(Mi|Gi)$", var.pipeline_memory))
    error_message = "pipeline_memory must be a positive integer followed by 'Mi' or 'Gi' (e.g., '512Mi', '2Gi')."
  }

  # Optional: Further validation to enforce specific ranges
  /*
  validation {
    condition = (
      can(regex("^\\d+(Mi|Gi)$", var.pipeline_memory)) &&
      (
        (substr(var.pipeline_memory, length(var.pipeline_memory) - 2, 2) == "Mi" && tonumber(substr(var.pipeline_memory, 0, length(var.pipeline_memory) - 2)) >= 128 && tonumber(substr(var.pipeline_memory, 0, length(var.pipeline_memory) - 2)) <= 16384) ||
        (substr(var.pipeline_memory, length(var.pipeline_memory) - 2, 2) == "Gi" && tonumber(substr(var.pipeline_memory, 0, length(var.pipeline_memory) - 2)) >= 1 && tonumber(substr(var.pipeline_memory, 0, length(var.pipeline_memory) - 2)) <= 16)
      )
    )
    error_message = "pipeline_memory must be between '128Mi' and '16384Mi' or between '1Gi' and '16Gi'."
  }
  */
}

variable "pipeline_name" {
  description = "Name of the Codefresh pipeline"
  type        = string
}

variable "pipeline_path" {
  description = "Path to the pipeline configuration in the repository"
  type        = string
}

variable "pipeline_repo" {
  description = "Repository containing the pipeline configuration"
  type        = string
}

variable "pipeline_revision" {
  description = "Revision of the pipeline configuration to use"
  type        = string
}

variable "pipeline_tags" {
  description = "Tags to associate with the pipeline"
  type        = list(string)
}

variable "pipeline_variables" {
  description = "Environment variables for the pipeline"
  type        = map(string)
  sensitive   = true
}

variable "runtime_environment_default" {
  description = "Default runtime environment name"
  type        = string
}
