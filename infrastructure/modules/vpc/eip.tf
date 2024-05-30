resource "aws_eip" "elastic_ip" {
  tags = {
    Name = "${var.nat_gateway_name}-eip"
  }
}
