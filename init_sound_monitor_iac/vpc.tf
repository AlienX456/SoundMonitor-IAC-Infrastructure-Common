resource "aws_vpc" "sound_monitor_vpc" {
    cidr_block           = "10.0.0.0/24"
    enable_dns_hostnames = true
    enable_dns_support   = true
    instance_tenancy     = "default"

    tags {
        Name = "SoundMonitorVPC"
    }
}
