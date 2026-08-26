resource "local_file" "hello" { 
  filename = "hello.txt"
  content = "My first Terraform resource!"
  file_permission = "0744"
}
