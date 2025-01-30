provider "aws" {
  region = "eu-west-2"  # Change to your desired AWS region
}

resource "aws_instance" "flask_app_instance" {
  ami           = "ami-091f18e98bc129c4e"  # Use a proper AMI for your region
  instance_type = "t2.micro"               # You can change the instance type

  key_name = "fargate"               # Ensure you've created an EC2 Key Pair

  tags = {
    Name = "FlaskAppInstance"
  }
}

output "instance_ip" {
  value = aws_instance.flask_app_instance.public_ip
}
