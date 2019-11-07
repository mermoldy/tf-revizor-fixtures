variable "tags" {
  policy = "cloud.tags"
  conditions = {
    cloud = "Google Compute Engine"
  }
}
