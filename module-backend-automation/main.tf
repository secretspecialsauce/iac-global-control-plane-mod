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
    "roles/securitycenter.admin",              # https://source.cloud.google.com/cloud-professional-services/televisaunivision/+/main:4-shared-services/secret-management-project/dev/scc.tf;bpv=1;bpt=0
    "roles/resourcemanager.organizationAdmin", # https://source.cloud.google.com/cloud-professional-services/televisaunivision/+/main:4-shared-services/secret-management-project/dev/scc.tf;bpv=1;bpt=0
    "roles/resourcemanager.tagAdmin",
    "roles/resourcemanager.tagUser",
    "roles/resourcemanager.projectCreator"
  ]
}

// Create project for cloud build




