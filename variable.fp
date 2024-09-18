variable "my_name" {
  type = string
  default = "flowpipe"
  tags = {
    folder = "misc"
  }
}

variable "string_var" {
  type = string
  default = "flowpipe_string"
  tags = {
    folder = "misc"
  }
}

variable "mandatory_tag_keys" {
  type        = list(string)
  description = "A list of mandatory tag keys to check for (case sensitive)."
  default     = ["Environment", "Owner"]
}


variable "var_number" {
  type        = number
  default = 42
  tags = {
    folder = "deprecated"
  }
}

variable "var_map" {
    type = map(string)
    default = {
        key1 = "value1"
        key2 = "value2"
    }
}

variable "var_map_number" {
    type = map(number)
    default = {
        key1 = 1
        key2 = 2
    }
    tags = {
      folder = "deprecated"
    }
}
 