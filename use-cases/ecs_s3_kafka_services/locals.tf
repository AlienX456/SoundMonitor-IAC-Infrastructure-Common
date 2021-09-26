locals {
  topic-index-mapping-json = [for i in jsondecode(file("topic-index-mapping.json")) : i if i.process-type == var.process-type][0]
  names = {
    service = "${var.repository_name}-service"
    family  = var.repository_name
  }
}
