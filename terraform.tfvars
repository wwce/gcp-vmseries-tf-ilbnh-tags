#project_id                = ""
#prefix                    = "panw"
#public_key_path           = "~/.ssh/gcp-demo.pub"
#fw_image_name             = "vmseries-flex-bundle1-1010"
authcodes                 = ""
mgmt_sources              = ["0.0.0.0/0"]
regions                   = ["us-east4", "us-west2"]
cidrs_mgmt                = ["10.0.0.0/28", "10.0.0.16/28"]
cidrs_untrust             = ["10.0.1.0/28", "10.0.1.16/28"]
cidrs_trust               = ["10.0.2.0/28", "10.0.2.16/28"]

fw_machine_type           = "n1-standard-4"
fw_region0_bootstrap_path = "bootstrap_files/vmseries_region0/"
fw_region1_bootstrap_path = "bootstrap_files/vmseries_region1/"

vm_image                  = "https://www.googleapis.com/compute/v1/projects/panw-gcp-team-testing/global/images/ubuntu-2004-lts-apache"
vm_type                   = "f1-micro"
vm_user                   = "demouser"
