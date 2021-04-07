resource "aws_launch_configuration" "main" {
  count         = local.use_spot ? 0 : 1
  name_prefix   = "${var.name}-"
  image_id      = var.ami_image_id
  instance_type = var.ami_instance_type
  spot_price    = var.spot_price

  iam_instance_profile = var.ami_iam_profile_id

  # key_name = "${var.key_name}"
  security_groups = flatten(var.security_group_ids)

  associate_public_ip_address = var.associate_public_ip

  # user_data = "${var.user_data}"
  user_data_base64 = var.user_data_base64
}

resource "aws_launch_configuration" "main_spot" {
  count         = local.use_spot ? 1 : 0
  name_prefix   = "${var.name}-"
  image_id      = var.ami_image_id
  instance_type = var.ami_instance_type
  spot_price    = var.spot_price

  iam_instance_profile = var.ami_iam_profile_id

  # key_name = "${var.key_name}"
  security_groups = flatten(var.security_group_ids)

  associate_public_ip_address = var.associate_public_ip

  # user_data = "${var.user_data}"
  user_data_base64 = var.user_data_base64
}

resource "aws_autoscaling_group" "main" {
  count    = local.use_spot ? 0 : 1
  name     = aws_launch_configuration.main[0].name
  min_size = var.asg_min_size
  max_size = var.asg_max_size

  launch_configuration = aws_launch_configuration.main[0].name

  vpc_zone_identifier = flatten(var.subnet_ids)

  target_group_arns = flatten(var.load_balancer_arns)

  health_check_grace_period = var.health_check_grace_period
  desired_capacity          = var.desired_capacity
  force_delete              = var.force_delete

  tags = var.tags
}

resource "aws_autoscaling_group" "main_spot" {
  count    = local.use_spot ? 1 : 0
  name     = aws_launch_configuration.main_spot[0].name
  min_size = var.asg_min_size
  max_size = var.asg_max_size

  launch_configuration = aws_launch_configuration.main_spot[0].name

  vpc_zone_identifier = flatten(var.subnet_ids)

  target_group_arns = flatten(var.load_balancer_arns)

  health_check_grace_period = var.health_check_grace_period
  desired_capacity          = var.desired_capacity
  force_delete              = var.force_delete

  tags = var.tags
}

