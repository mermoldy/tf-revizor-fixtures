variable "run_id" {
  default = "sdsdsd"
}

resource "random_integer" "timeout" {
  min = 30
  max = 180

  keepers = {
    run_id = var.run_id
  }
}

resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = "sleep ${random_integer.timeout.result}"
  }
}
