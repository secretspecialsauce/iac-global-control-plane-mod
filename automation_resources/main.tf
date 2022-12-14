terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}


locals {
  project_prefix = var.project_prefix == "" ? "" : "${var.project_prefix}-"
  gcb-tf-iam-roles = [
    "roles/accesscontextmanager.policyAdmin",
    "roles/billing.projectManager",
    "roles/billing.user",
    "roles/cloudasset.viewer",
    "roles/compute.networkAdmin",
    "roles/compute.xpnAdmin",
    "roles/iam.securityAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/logging.configWriter",
    "roles/logging.logWriter",
    "roles/orgpolicy.policyAdmin",
    "roles/resourcemanager.folderAdmin",
    "roles/resourcemanager.organizationAdmin",
    "roles/resourcemanager.organizationViewer",
    "roles/resourcemanager.projectCreator",
    "roles/resourcemanager.projectCreator",
    "roles/resourcemanager.projectDeleter",
    "roles/resourcemanager.projectIamAdmin",
    "roles/resourcemanager.tagAdmin",
    "roles/resourcemanager.tagUser",
    "roles/securitycenter.admin",
    "roles/securitycenter.notificationConfigEditor",
    "roles/serviceusage.serviceUsageAdmin",
    "roles/storage.admin"
  ]
}

// Create project for cloud build




