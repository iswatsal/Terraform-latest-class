variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {}

variable "INSTANCE_AMI" {
    type = map
    default = {
        us-east-1 = "ami-00b8917ae86a424c9"
        us-east-2 = "ami-011ab7c70f5b5170a"
        us-west-2 = "ami-0de43e61758b7158c"
    }
}

variable "INSTANCE_TYPE" {}

variable "Security_Group" {
  type = list
  default = ["sg-03bcc17333f681192"]
}



