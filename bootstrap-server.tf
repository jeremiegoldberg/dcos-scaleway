resource "scaleway_server" "bootstrap" {
  name                = "dcos-bootstrap-server"
  image               = "a9635f95-2b89-4362-b67c-dcd6ce859e78"
  type                = "VC1S"
  dynamic_ip_required = true
  security_group      = "${scaleway_security_group.mesosphere.id}"

  provisioner "remote-exec" {
    inline     = [
        "mkdir /tmp/genconf"
	]
  }

  provisioner "file" {
    source      = "ip_script.sh"
    destination = "/tmp/genconf/ip-detect"
  }

  provisioner "file" {
    source      = "config.sh"
    destination = "/tmp/config.sh"
  }

  provisioner "file" {
    source      = "~/.ssh/id_rsa"
    destination = "/tmp/genconf/ssh_key"
  }

  provisioner "remote-exec" {
    inline     = [
	"service docker start",
	"curl https://get.docker.com | sh",
	"[ ! -f /tmp/dcos_generate_config.sh ] && wget -O /tmp/dcos_generate_config.sh https://downloads.dcos.io/dcos/stable/dcos_generate_config.sh",
	"bash /tmp/config.sh ${module.dcos001.internal_ip},${module.dcos002.internal_ip},${module.dcos003.internal_ip} ${module.dcos101.internal_ip},${module.dcos102.internal_ip},${module.dcos103.internal_ip},${module.dcos104.internal_ip},${module.dcos105.internal_ip} ${module.dcos201.internal_ip},${module.dcos202.internal_ip},${module.dcos203.internal_ip} > /tmp/genconf/config.yaml",
	"chmod 600 /tmp/genconf/ssh_key",
	"cd /tmp/ && bash dcos_generate_config.sh --install-prereqs && bash dcos_generate_config.sh --preflight && bash dcos_generate_config.sh --deploy"
	]
  }


}

resource "scaleway_security_group_rule" "bootstrap-security-rule" {
  security_group = "${scaleway_security_group.mesosphere.id}"
  action    = "accept"
  direction = "inbound"
  ip_range  = "${scaleway_server.bootstrap.private_ip}"
  protocol  = "TCP"
}
