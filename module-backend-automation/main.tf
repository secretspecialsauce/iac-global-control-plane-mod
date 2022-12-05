terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}


locals {
  project_prefix   = var.project_prefix == "" ? "" : "${var.project_prefix}-"
  gcb-tf-iam-roles = [
    "roles/accesscontextmanager.policyAdmin",
    "roles/billing.user",
    "roles/billing.projectManager",
    "roles/compute.networkAdmin",
    "roles/compute.xpnAdmin",
    "roles/iam.securityAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/logging.configWriter",
    "roles/orgpolicy.policyAdmin",
    "roles/resourcemanager.projectCreator",
    "roles/resourcemanager.projectDeleter",
    "roles/resourcemanager.folderAdmin",
    "roles/securitycenter.notificationConfigEditor",
    "roles/resourcemanager.organizationViewer",
    "roles/resourcemanager.projectIamAdmin",
    "roles/cloudasset.viewer",
    "roles/securitycenter.admin",
    "roles/resourcemanager.organizationAdmin",
    "roles/resourcemanager.tagAdmin",
    "roles/resourcemanager.tagUser",
    "roles/resourcemanager.projectCreator",
    "roles/logging.logWriter",
    "roles/serviceusage.serviceUsageAdmin"
  ]
}

// Create project for cloud build




