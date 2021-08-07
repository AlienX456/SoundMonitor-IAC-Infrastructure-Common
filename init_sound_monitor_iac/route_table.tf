resource "aws_route_table" "route_table" {
    vpc_id     = aws_vpc.sound_monitor_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.soundMonitor-internetGateway.id
    }

    tags = {
        name = "SoundMonitorVPC-RouteTable"
    }
}


resource "aws_main_route_table_association" "route_association" {
    vpc_id         = aws_vpc.sound_monitor_vpc.id
    route_table_id = aws_route_table.route_table.id
}
