
resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.name.id]
  subnet_id              = var.subnet_id
  availability_zone = var.availability_zone
  associate_public_ip_address = true


  tags = {
    Name = "server1"
  }
  user_data = <<-EOF
              #!/bin/bash
              # Update the system
              apt-get update -y
              apt-get upgrade -y

              # Install Apache HTTP Server
              apt-get install -y apache2

              # Enable Apache to start on boot
              systemctl enable apache2

              # Start Apache service
              systemctl start apache2

              # Create a simple index.html to verify the setup
              echo "<html><body><h1>Welcome to the WebServer-B</h1></body></html>" > /var/www/html/index.html
              EOF
}
resource "aws_security_group" "name" {
  name   = "allow http"
  vpc_id = var.vpc_id
  tags = {
    Name = "Allow HTTPS"
  }
  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}