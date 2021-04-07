locals {
  use_spot = var.spot_price == "" ? false : true
  cbd      = var.cbd ? true : false
}

