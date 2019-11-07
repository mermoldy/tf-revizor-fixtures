variable "lable" {
  policy = "cloud.tags"
  conditions = {
    cloud = "Google Compute Engine"
  }
}
