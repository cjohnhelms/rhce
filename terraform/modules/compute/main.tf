resource "aws_instance" "control" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key
  private_ip = cidrhost(var.vpc_cidr, 10)
  security_groups = var.private_security_group
  subnet_id = var.private_subnet_id  
  tags = {
    Name = "control-rhce-ec2"
  }  
  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    tags = {
      Name = "control-rhce-ebs"
    }
  }
}

resource "aws_instance" "worker" {
  count = var.worker_count

  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key
  private_ip = cidrhost(var.vpc_cidr, 11 + count.index)
  security_groups = var.private_security_group
  subnet_id = var.private_subnet_id  
  tags = {
    Name = "worker-rhce-ec2"
  }  
  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    tags = {
      Name = "worker-rhce-ebs"
    }
  }
}

resource "aws_instance" "nat" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key
  private_ip = cidrhost(var.vpc_cidr, 250)
  security_groups = var.public_security_group
  subnet_id = var.public_subnet_id
  associate_public_ip_address = true
  source_dest_check = false
  user_data = file("scripts/nat_instance.sh")
  tags = {
    Name = "nat-rhce-ec2"
  }
  root_block_device {
    volume_size = 8
    volume_type = "gp3"
    tags = {
      Name = "jump-rhce-ebs"
    }
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.nat.id
  domain = "vpc"
}