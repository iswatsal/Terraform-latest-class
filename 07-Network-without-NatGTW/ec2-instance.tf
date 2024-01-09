#CREATING INSTANCE KEYPAIR
resource "aws_key_pair" "my_key_pair" {
  key_name   = "salabiu_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

#CREATING MULTIPLE EC2 INSTANCES
resource "aws_instance" "myinstance" {
  ami           = lookup(var.INSTANCE_AMI, var.AWS_REGION)
  instance_type = "${var.INSTANCE_TYPE}"
  #security_groups = var.Security_Group
  vpc_security_group_ids = [aws_security_group.project-devops-SG.id]
  key_name = aws_key_pair.my_key_pair.key_name
  subnet_id = aws_subnet.project-devops-pubsub1.id
  tags = {
    Name = "boljibeatz-server-"
  }
}