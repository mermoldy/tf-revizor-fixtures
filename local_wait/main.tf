resource "null_resource" "wait" {
  provisioner "local-exec" {
    command = "sleep 32"
  }
}
