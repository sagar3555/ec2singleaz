locals {
  security_group_name = "scg-${var.region_shortname[var.region]}-${var.application_name}-${var.environment_shortname[var.network_tags["Environment"]]}-${var.host_name}"
}

module "sg" {
  source = "git::https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/terraform-module-securitygroup.git?ref=v0.1.1"

  vpc_id                                = var.sg_vpc_id
  name                                  = local.security_group_name
  description                           = var.sg_description
  tags                                  = var.network_tags
  ingress_with_self                     = var.sg_ingress_with_self
  ingress_with_cidr_blocks              = var.sg_ingress_with_cidr_blocks
  ingress_with_source_security_group_id = var.sg_ingress_with_source_security_group_id
  ingress_prefix_list_ids               = var.sg_ingress_prefix_list_ids
  egress_with_self                      = var.sg_egress_with_self
  egress_with_cidr_blocks               = var.sg_egress_with_cidr_blocks
  egress_with_source_security_group_id  = var.sg_egress_with_source_security_group_id
  egress_prefix_list_ids                = var.sg_egress_prefix_list_ids
}

locals {
  instance_profile_name = "Ec2Role-${var.region_shortname[var.region]}-${var.application_name}-${var.environment_shortname[var.iam_tags["Environment"]]}-${var.host_name}"
}

module "instance_profile" {
  source = "git::https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/terraform-module-iamrole.git?ref=v0.2.3"

  name                        = local.instance_profile_name
  description                 = "EC2 instance profile for ec2-${var.region_shortname[var.region]}-${var.application_name}-${var.environment_shortname[var.iam_tags["Environment"]]}-${var.host_name}"
  create_instance_profile     = true
  tags                        = merge(var.iam_tags, { Name = local.instance_profile_name })
  assume_role_policy_document = data.aws_iam_policy_document.assume_role_policy.json
  iam_policies                = var.ec2_iam_policies
  managed_arn_policies        = concat(var.ec2_managed_arn_policies, [data.aws_iam_policy.policy.arn])
}

locals {
  instance_name = "ec2-${var.region_shortname[var.region]}-${var.application_name}-${var.environment_shortname[var.instance_tags["Environment"]]}-${var.host_name}"
}

module "ec2" {
  source = "git::https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/terraform-module-ec2.git?ref=v0.2.4"

  ami                         = var.ec2_ami
  name                        = local.instance_name
  ebs_optimized               = var.ec2_ebs_optimized
  disable_api_termination     = var.ec2_disable_api_termination
  instance_type               = var.ec2_instance_type
  key_name                    = var.ec2_key_name
  monitoring                  = var.ec2_monitoring
  vpc_security_group_ids      = concat([module.sg.id], var.ec2_vpc_security_group_ids)
  subnet_id                   = var.ec2_subnet_id
  associate_public_ip_address = var.ec2_associate_public_ip_address
  private_ip                  = var.ec2_private_ip
  source_dest_check           = var.ec2_source_dest_check
  user_data                   = var.ec2_user_data
  iam_instance_profile        = module.instance_profile.instance_profile_name
  tags                        = var.instance_tags
  volume_tags                 = var.volume_tags
  root_block_device           = var.ec2_root_block_device
  ebs_volumes                 = var.ec2_ebs_volumes
  ssm_document_name           = var.ec2_ssm_document_name
  ssm_parameters              = var.ec2_ssm_parameters
  record_name                 = var.ec2_record_name
  record_type                 = var.ec2_record_type
  zone_id                     = var.ec2_record_zone_id
  ttl                         = var.ec2_record_ttl
}
