locals {
  machine_type = {
    dev   = "t2d-standard-1"
    stage = "t2d-standard-1"
    prod  = "n1-standard-1"
  }
  gke_num_nodes = {
    dev   = "1"
    stage = "1"
    prod  = "2"
  } 

}