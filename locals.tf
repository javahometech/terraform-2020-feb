locals {
  az_names = data.aws_availability_zones.available.names
  az_count = length(local.az_names)
}