############################
## Security Group Outputs ##
############################
output "sg_id" {
  description = "The ID of the security group"
  value       = module.sg.id
}

output "sg_vpc_id" {
  description = "The VPC ID"
  value       = module.sg.vpc_id
}

output "sg_owner_id" {
  description = "The owner ID"
  value       = module.sg.owner_id
}

output "sg_name" {
  description = "The name of the security group"
  value       = module.sg.name
}

output "sg_description" {
  description = "The description of the security group"
  value       = module.sg.description
}

######################
## Iam Role Outputs ##
######################

output "iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = module.instance_profile.arn
}
output "iam_role_create_date" {
  description = "The creation date of the IAM role."
  value       = module.instance_profile.create_date
}
output "iam_role_description" {
  description = "The description of the role."
  value       = module.instance_profile.description
}
output "iam_role_id" {
  description = "The name of the role."
  value       = module.instance_profile.id
}
output "iam_role_name" {
  description = "The name of the role."
  value       = module.instance_profile.name
}
output "iam_role_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = module.instance_profile.unique_id
}
output "instance_profile_id" {
  description = "The instance profile's ID."
  value       = module.instance_profile.instance_profile_id
}
output "instance_profile_arn" {
  description = "The ARN assigned by AWS to the instance profile."
  value       = module.instance_profile.instance_profile_arn
}
output "instance_profile_create_date" {
  description = "The creation timestamp of the instance profile."
  value       = module.instance_profile.instance_profile_create_date
}
output "instance_profile_name" {
  description = "The instance profile's name."
  value       = module.instance_profile.instance_profile_name
}
output "instance_profile_unique_id" {
  description = "The unique ID assigned by AWS."
  value       = module.instance_profile.instance_profile_unique_id
}

#################
## EC2 Outputs ##
#################
output "ec2_id" {
  description = "The instance ID."
  value       = module.ec2.id
}
output "ec2_arn" {
  description = "The ARN of the instance."
  value       = module.ec2.arn
}
output "ec2_availability_zone" {
  description = "The availability zone of the instance."
  value       = module.ec2.availability_zone
}
output "ec2_placement_group" {
  description = "The placement group of the instance."
  value       = module.ec2.placement_group
}
output "ec2_key_name" {
  description = "The key name of the instance"
  value       = module.ec2.key_name
}
output "ec2_public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2.public_dns
}
output "ec2_public_ip" {
  description = "The public IP address assigned to the instance, if applicable."
  value       = module.ec2.public_ip
}
output "ec2_primary_network_interface_id" {
  description = "The ID of the instance's primary network interface."
  value       = module.ec2.primary_network_interface_id
}
output "ec2_private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2.private_dns
}
output "ec2_private_ip" {
  description = "The private IP address assigned to the instance"
  value       = module.ec2.private_ip
}
output "ec2_security_groups" {
  description = "The associated security groups."
  value       = module.ec2.security_groups
}
output "ec2_vpc_security_group_ids" {
  description = "The associated security groups in non-default VPC"
  value       = module.ec2.vpc_security_group_ids
}
output "ec2_subnet_id" {
  description = "The VPC subnet ID."
  value       = module.ec2.subnet_id
}
output "ec2_name" {
  description = "The name of the record."
  value       = module.ec2.name
}
output "ec2_fqdn" {
  description = "FQDN built using the zone domain and name."
  value       = module.ec2.fqdn
}
