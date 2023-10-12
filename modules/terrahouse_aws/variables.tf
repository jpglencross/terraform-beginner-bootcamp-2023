variable "user_uuid" {
  description = "User UUID"
  type        = string

  validation {
    condition     = can(regex("^([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}$", var.user_uuid))
    error_message = "User UUID is not in the expected format (e.g., 123e4567-e89b-12d3-a456-426655440000)"
  }
}

variable "bucket_name" {
  description = "AWS S3 Bucket Name"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9-]+(.[a-z0-9-]+)*$", var.bucket_name))
    error_message = "Invalid S3 bucket name. It must consist of lowercase letters, numbers, hyphens, and no consecutive periods."
  }
}

variable "index_html_path" {
  description = "Path to the index.html file"
  type        = string

  # validation {
  #   condition     = fileexists(var.index_html_path)
  #   error_message = "The specified path to the index.html file does not exist or is not a valid file."
  # }
}


variable "error_html_path" {
  description = "Path to the error.html file"
  type        = string

  # validation {
  #   condition     = fileexists(var.error_html_path)
  #   error_message = "The specified path to the error.html file does not exist or is not a valid file."
  # }
}
