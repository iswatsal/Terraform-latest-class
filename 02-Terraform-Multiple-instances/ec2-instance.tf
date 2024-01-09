#CREATING MULTIPLE EC2 INSTANCES
resource "aws_instance" "myinstance1" {
  ami           = "ami-00b8917ae86a424c9"
  instance_type = "t2.micro"
  count         = 3

  tags = {
    Name = "boljibeatz-server1-${count.index}"
  }
}