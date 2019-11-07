variable "lable" {
  policy = "cloud.tags"
  conditions = {
    cloud = "gce"
  }
}
