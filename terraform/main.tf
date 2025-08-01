provider "aws" {
  region = "us-east-1" # Change if needed
}

resource "aws_security_group" "web_sg" {
  name        = "allow_http_ssh"
  description = "Allow SSH, HTTP, and Prometheus (9090) access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # SSH
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # HTTP
  }

  ingress {
    description = "Allow Prometheus UI"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Grafana UI"
    from_port   = 3000
    to_port     = 3000
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

resource "aws_instance" "ml_api_server" {
  ami           = "ami-053b0d53c279acc90" # Ubuntu 22.04 LTS (verify latest)
  instance_type = "t2.micro"
  key_name      = "health"
  security_groups = [aws_security_group.web_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io
              systemctl start docker
              docker pull manasvini26/diabetes-api:latest
              docker stop $(docker ps -q) || true
              docker rm $(docker ps -a -q) || true
              docker run -d -p 80:8080 manasvini26/diabetes-api:latest
              wget https://github.com/prometheus/prometheus/releases/download/v2.52.0/prometheus-2.52.0.linux-amd64.tar.gz
              tar -xvf prometheus-2.52.0.linux-amd64.tar.gz
            EOF

  tags = {
    Name = "DiabetesMLApp"
  }
}
