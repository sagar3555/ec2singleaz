####################
# Common Variables #
####################
variable "instance_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}
variable "iam_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}
variable "network_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}
variable "volume_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}


variable "environment_shortname" {
  description = "A map of environment shortnames"
  type        = map(string)
}

variable "region" {
  description = "AWS Region used for naming conventions"
  type        = string
}

variable "region_shortname" {
  description = "Map of region shortnames"
  type        = map(string)
}

variable "application_name" {
  description = "Friendly name that will be used for resource name grouping (EC2, SG and IamRole)"
  type        = string
}

variable "host_name" {
  description = "Friendly name that will be used for resource name identification (EC2, SG and IamRole)"
  type        = string
}

#################
# Security group
#################
variable "sg_vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
}

variable "sg_description" {
  description = "Description of security group"
  type        = string
  default     = "Security Group managed by Terraform"
}

##########
# Ingress
##########
variable "sg_ingress_with_self" {
  description = "List of ingress rules to create where 'self' is defined"
  type        = list(map(string))
  default     = []
}

variable "sg_ingress_with_cidr_blocks" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "sg_ingress_with_source_security_group_id" {
  description = "List of ingress rules to create where 'source_security_group_id' is used"
  type        = list(map(string))
  default     = []
}

variable "sg_ingress_prefix_list_ids" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints) to use on all ingress rules"
  type        = list(string)
  default     = []
}

#########
# Egress
#########
variable "sg_egress_with_self" {
  description = "List of egress rules to create where 'self' is defined"
  type        = list(map(string))
  default     = []
}

variable "sg_egress_with_cidr_blocks" {
  description = "List of egress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "sg_egress_with_source_security_group_id" {
  description = "List of egress rules to create where 'source_security_group_id' is used"
  type        = list(map(string))
  default     = []
}

variable "sg_egress_prefix_list_ids" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints) to use on all egress rules"
  type        = list(string)
  default     = []
}

##################
## EC2 Instance ##
##################

variable "ec2_iam_policies" {
  description = "Optional list of objects to create policies"
  type = list(object({
    name   = string
    policy = string
  }))
  default = []
}

variable "ec2_managed_arn_policies" {
  description = "Optional list of managed ARNs to attach to the instance profile"
  type        = list(string)
  default     = []
}

variable "ec2_ami" {
  description = "The AMI to use for the instance."
  type        = string
}
variable "ec2_ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized. Note that if this is not set on an instance type that is optimized by default then this will show as disabled but if the instance type is optimized by default then there is no need to set this and there is no effect to disabling it. See the EBS Optimized section of the AWS User Guide for more information."
  type        = bool
  default     = true
}
variable "ec2_disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  type        = bool
  default     = false
}
variable "ec2_instance_type" {
  description = "The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance."
  type        = string
}
variable "ec2_key_name" {
  description = "The key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource."
  type        = string
}
variable "ec2_monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled. Defaults to false"
  type        = bool
  default     = false
}
variable "ec2_vpc_security_group_ids" {
  description = "A list of security group IDs to associate with."
  type        = list(string)
}
variable "ec2_subnet_id" {
  description = "The VPC Subnet ID to launch in."
  type        = string
}
variable "ec2_associate_public_ip_address" {
  description = "Associate a public ip address with an instance in a VPC. Boolean value."
  type        = bool
  default     = false
}
variable "ec2_private_ip" {
  description = "Private IP address to associate with the instance in a VPC."
  type        = string
}
variable "ec2_source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true."
  type        = bool
  default     = true
}
variable "ec2_user_data" {
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
  type        = string
}
variable "ec2_volume_tags" {
  description = "A mapping of tags to assign to the devices created by the instance at launch time."
  type        = map(string)
  default     = {}
}
variable "ec2_root_block_device" {
  description = "Customize details about the root block device of the instance. See Block Devices below for details."
  type = object({
    volume_type = string
    volume_size = number
    kms_key_id  = string
    encrypted   = bool
  })
}
variable "ec2_ebs_volumes" {
  description = "A list of objects used to create additional EBS volumes, supports the following attributes; size, type, encrypted, snapshot_id and kms_key_id"
  type = list(object({
    device_name = string
    size        = number
    type        = string
    encrypted   = bool
    snapshot_id = string
    kms_key_id  = string
  }))
  default = []
}
variable "ec2_ssm_document_name" {
  description = "If specified, the document name to associate to the EC2 instance"
  type        = string
  default     = ""
}
variable "ec2_ssm_parameters" {
  description = "Parameters to be used with SSM document association"
  type        = map(string)
  default     = {}
}
variable "ec2_record_name" {
  description = "The name of the record."
  type        = string
}
variable "ec2_record_type" {
  description = "The type of the dns record. Defaults to `A`"
  type        = string
  default     = "A"
}
variable "ec2_record_zone_id" {
  description = "The ID of the hosted zone to contain this record."
  type        = string
  default     = ""
}
variable "ec2_record_ttl" {
  description = "The Time to Live value in seconds for the name record. Defaults to 300"
  type        = number
  default     = 300
}

