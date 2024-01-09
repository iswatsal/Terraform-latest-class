#CREATING INSTANCE KEYPAIR
resource "aws_key_pair" "my_key_pair" {
  key_name   = "boljibeatz_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

#CREATING MULTIPLE EC2 INSTANCES
resource "aws_instance" "myinstance" {
  ami           = lookup(var.INSTANCE_AMI, var.AWS_REGION)
  instance_type = "${var.INSTANCE_TYPE}"
  #security_groups = var.Security_Group
  vpc_security_group_ids = var.Security_Group
  key_name = aws_key_pair.my_key_pair.key_name
  tags = {
    Name = "boljibeatz-server"
  }
}