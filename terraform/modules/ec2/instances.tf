
resource "aws_instance" "web" {
  count         = "${var.instance_count}"
  ami           = "${var.ami_id}"
  key_name      = "${var.key1_name}"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = "${var.sg_id}"
    tags = {
      Name  = "project-${count.index + 1}"
    }
/*
provisioner "local-exec" {  
    working_dir = "/opt/terransijenk/ansible/"
    command     = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key Jenkins.pem -i '${self.public_ip},' installdocker.yml"
} */
} 
data  "template_file" "public_ip" {
    template = "${file("${path.module}/inventory.tpl")}"
    vars = {
        public_ip = "${join("\n", aws_instance.web.*.public_ip)}"
    }
}

resource "local_file" "public_ip_file" {
  content  = "${data.template_file.public_ip.rendered}"
  filename = "/opt/automation/ansible/invent"
} 

