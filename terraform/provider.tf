# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token     = "y0_AgAAAABhE9hMAATuwQAAAADucdt5POXQFfUNRf-oMfb9Fx-HkNoZJDY"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
  zone      = var.a-zone
}
