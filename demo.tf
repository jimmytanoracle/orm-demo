variable "compartment_ocid" {
    default = "ocid1.compartment.oc1..aaaaaaaay5tebzj3elulro22cbsyrp4kf72xkjn7cgjrtjtzu6dy67ukkn5q"
}
variable "region" {
    default = "ap-singapore-1"
}
variable "bucket_namespace" {
    default = "axes1i32toic"
}
variable "bucket_name" {
    default = "github"
}

provider "oci" {
    region = var.region
}

resource "oci_objectstorage_bucket" "create_bucket" {
    # required
    compartment_id = var.compartment_ocid
    name = var.bucket_name
    namespace = var.bucket_namespace

    # optional
    access_type = "NoPublicAccess" # <---- updated from "ObjectRead"
}

output "new_bucket" {
    value = oci_objectstorage_bucket.create_bucket
}