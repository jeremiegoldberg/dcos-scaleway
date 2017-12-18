module "dcos001" {
  server_name = "dcos001"
  source      = "master"
  security    = "${scaleway_security_group.mesosphere.id}"
}

module "dcos002" {
  server_name = "dcos002"
  source      = "master"
  security    = "${scaleway_security_group.mesosphere.id}"
}

module "dcos003" {
  server_name = "dcos003"
  source      = "master"
  security    = "${scaleway_security_group.mesosphere.id}"
}

output "masters_ip" {
  value = "${module.dcos001.internal_ip},${module.dcos002.internal_ip},${module.dcos003.internal_ip}"
}
