variable "region" {
  default = "ap-southeast-1"
}
variable "access_key" {
  default = "your access key"
}
variable "secret_key" {
  default = "your secret key"
} 
# list of instance types
variable "instance_type" {
  type        = list(string) 
  default = ["t2.micro", "t2.medium", "t2.small"] 
}
# list of Amis of ubuntu machine 
variable "amis" {
  type    = map
  default = {
    us-east-1  = "ami-0778521d914d23bc1"
    us-west-1  = "ami-09b2a1e33ce552e68"
    us-east-2  = "ami-0ab0629dba5ae551d"
    us-west-2  = "ami-095413544ce52437d"
    ap-southeast-1 = "ami-05c8486d62efc5d07"
    }  
}
 
variable "public_key_aws4" {
 default = "ssh-rsa AAAB3NzaC1yc2EAAAADAQABAAABgQDAXvG3dpt4R66bZCmI8RfK76WRiMWBUCuerDgSlOYpfJbRb3LOSwEfKbn8Q/25oT0de9n61ufUHPGraBvtNVWywrnbtxQ4TFPxYgZvEbZT9U8wEHFgeaB6nvfFtnXq/jZ2PDXyrAFD7JsrFzY1EVIrygEGxZAnBuv53yUTcwAO4fH6ltW29xgvFc7L6OCVxvZUjHrHKJVYvoR5cppoQ0JltFBbOFZcu1P6gIrFDGZ0wYY8laariC9Sva6pY2fXqMzpcDROjh766iA8xDMCfGsOoLR1+0F1qg48T/uIr5TUppVVZx0nYmvZm3EhHFZMx4XXwXdSr2KFPfL/Ut+Oly4c3WeUzXNv7JpjlmEdLQ4VMUvBQOEPjnF8/ljCa7OF1Esju4zdvxOW+YmkUxWheRgEyzPWr0+GVMt4VDkxK1tSnAJWA7z0Ghl0GN2HTuf3xRpmmhBseY5NIsnWPnF5K8ApvhQmBtPUna3/PBvkQwDhWvJxp9OXEdguIT7k6Co0jd0= root@ip-192-128-0-4"  
}
