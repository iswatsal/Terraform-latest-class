#CREATING MULTIPLE EC2 INSTANCES
resource "aws_instance" "myinstance1" {
  ami           = "${var.INSTANCE_AMI}"
  instance_type = "${var.INSTANCE_TYPE}"
  count         = 3

  tags = {
    Name = "boljibeatz-server-${count.index}"
  }
}