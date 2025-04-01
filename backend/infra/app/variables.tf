variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

variable "gke_num_nodes" {
  description = "number of gke nodes"
  default = 1
}

variable "gke_machine_type" {
  description = "gke machine type"
  default = "n2-standard-2"
}
