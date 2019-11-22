variable "tags" {
  policy = "cloud.tags"
  conditions = {
    cloud = "gce"
  }
}

variable "region" {
  policy = "cloud.locations"
  }
