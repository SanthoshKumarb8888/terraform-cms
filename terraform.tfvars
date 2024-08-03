ami_id                   = "ami-0ba9883b710b05ac6"
instance_type            = "t2.micro"
key_name                 = "demo"
source_script_path       = "scripts/install_scripts.sh"
private_key_path         = "demo.pem"
security_group_name      = "cms-sg"
security_group_description = "Creating security group for CMS applications."
cidr_blocks              = ["0.0.0.0/0"]
