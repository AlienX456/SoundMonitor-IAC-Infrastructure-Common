resource "aws_appautoscaling_target" "ecs_target" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "service/${data.aws_ecs_cluster.inferencer.name}/${aws_ecs_service.main.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "cpu" {
  name = "autoscale-cpu"
  policy_type = "TargetTrackingScaling"
  resource_id = aws_appautoscaling_target.ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_target.scalable_dimension
  service_namespace = aws_appautoscaling_target.ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value = 60
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }
}