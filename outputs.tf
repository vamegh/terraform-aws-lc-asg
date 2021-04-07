output "asg_id" {
  description = "The autoscaling group id"
  value = join(
    "",
    coalescelist(
      aws_autoscaling_group.main.*.id,
      aws_autoscaling_group.main_spot.*.id,
    ),
  )
}

output "asg_name" {
  description = "The autoscaling group name"
  value = join(
    "",
    coalescelist(
      aws_autoscaling_group.main.*.name,
      aws_autoscaling_group.main_spot.*.id,
    ),
  )
}

output "asg_arn" {
  description = "The ARN for this AutoScaling Group"
  value = join(
    "",
    coalescelist(
      aws_autoscaling_group.main.*.arn,
      aws_autoscaling_group.main_spot.*.arn,
    ),
  )
}

output "asg_min_size" {
  description = "The minimum size of the autoscale group"
  value = join(
    "",
    coalescelist(
      aws_autoscaling_group.main.*.min_size,
      aws_autoscaling_group.main_spot.*.min_size,
    ),
  )
}

output "asg_max_size" {
  description = "The maximum size of the autoscale group"
  value = join(
    "",
    coalescelist(
      aws_autoscaling_group.main.*.max_size,
      aws_autoscaling_group.main_spot.*.max_size,
    ),
  )
}

output "asg_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  value = join(
    "",
    coalescelist(
      aws_autoscaling_group.main.*.desired_capacity,
      aws_autoscaling_group.main_spot.*.desired_capacity,
    ),
  )
}

output "asg_default_cooldown" {
  description = "Time between a scaling activity and the succeeding scaling activity"
  value = join(
    "",
    coalescelist(
      aws_autoscaling_group.main.*.default_cooldown,
      aws_autoscaling_group.main_spot.*.default_cooldown,
    ),
  )
}

output "asg_health_check_grace_period" {
  description = "Time after instance comes into service before checking health"
  value = join(
    "",
    coalescelist(
      aws_autoscaling_group.main.*.health_check_grace_period,
      aws_autoscaling_group.main_spot.*.health_check_grace_period,
    ),
  )
}

output "asg_health_check_type" {
  description = "`EC2` or `ELB`. Controls how health checking is done"
  value = join(
    "",
    coalescelist(
      aws_autoscaling_group.main.*.health_check_type,
      aws_autoscaling_group.main_spot.*.health_check_type,
    ),
  )
}

