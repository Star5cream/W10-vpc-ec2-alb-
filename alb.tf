resource "aws_lb_target_group" "Target1" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vp1.id

  health_check {
    enabled             = true
    interval            = 100
    healthy_threshold   = 3
    matcher             = 200
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 6
    unhealthy_threshold = 3
  }
}

resource "aws_lb_target_group_attachment" "ATG1" {
  target_group_arn = aws_lb_target_group.Target1.arn
  target_id        = aws_instance.Josuke.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "ATG2" {
  target_group_arn = aws_lb_target_group.Target1.arn
  target_id        = aws_instance.Jotaro.id
  port             = 80
}

resource "aws_lb_listener" "Lt1" {
  load_balancer_arn = aws_lb.lb1.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Target1.arn
  }
}

resource "aws_lb" "lb1" {
  name                       = "alb-project"
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.sg-demo.id]
  subnets                    = [aws_subnet.public1.id, aws_subnet.public2.id]
  enable_deletion_protection = false
}
