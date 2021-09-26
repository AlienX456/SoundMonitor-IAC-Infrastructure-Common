locals {
  topic-index-mapping-audio  = [for i in jsondecode(file("../../map/topic-index-mapping.json")) : i if i.process-type == "audio"][0]
  topic-index-mapping-images = [for i in jsondecode(file("../../map/topic-index-mapping.json")) : i if i.process-type == "images"][0]
}
