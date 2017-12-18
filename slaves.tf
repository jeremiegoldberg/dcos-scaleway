module "dcos101" {
  server_name = "dcos101"
  source      = "slave"
  security    = "${scaleway_security_group.mesosphere.id}"
}

module "dcos102" {
  server_name = "dcos102"
  source      = "slave"
  security    = "${scaleway_security_group.mesosphere.id}"
}

module "dcos103" {
  server_name = "dcos103"
  source      = "slave"
  security    = "${scaleway_security_group.mesosphere.id}"
}

output "slaves_ip" {
  value = "${module.dcos101.internal_ip},${module.dcos102.internal_ip},${module.dcos103.internal_ip}"
}
