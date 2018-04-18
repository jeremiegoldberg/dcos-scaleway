module "dcos201" {
  server_name = "dcos201"
  source      = "public"
  security    = "${scaleway_security_group.mesosphere.id}"
  openbarsg    = "${scaleway_security_group.mesosphere-public.id}"
}

module "dcos202" {
  server_name = "dcos202"
  source      = "public"
  security    = "${scaleway_security_group.mesosphere.id}"
  openbarsg    = "${scaleway_security_group.mesosphere-public.id}"
}

module "dcos203" {
  server_name = "dcos203"
  source      = "public"
  security    = "${scaleway_security_group.mesosphere.id}"
  openbarsg    = "${scaleway_security_group.mesosphere-public.id}"
}

output "publics_ip" {
  value = "${module.dcos201.internal_ip},${module.dcos202.internal_ip},${module.dcos203.internal_ip}"
}
