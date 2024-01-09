#CREATING MULTIPLE EC2 INSTANCES
resource "aws_instance" "myinstance" {
  ami           = lookup(var.INSTANCE_AMI, var.AWS_REGION)
  instance_type = "${var.INSTANCE_TYPE}"
  #security_groups = var.Security_Group
  vpc_security_group_ids = var.Security_Group
  tags = {
    Name = "boljibeatz-server"
  }
}