provider "google" {

}

resource "google_folder" "global-control-plane" {
  display_name = var.control_plane_directory_display_name
  parent       = var.org_id
}
