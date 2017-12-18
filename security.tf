resource "scaleway_security_group" "mesosphere" {
  name        = "mesosphere"
  description = "traffic around mesosphere cluster"
}

resource "scaleway_security_group_rule" "outbound_all" {
  security_group = "${scaleway_security_group.mesosphere.id}"

  action    = "accept"
  direction = "outbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
}

resource "scaleway_security_group_rule" "inbound_tabmo" {
  security_group = "${scaleway_security_group.mesosphere.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "193.239.192.18"
  protocol  = "TCP"
}

resource "scaleway_security_group_rule" "inbound_maison" {
  security_group = "${scaleway_security_group.mesosphere.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "82.224.139.25"
  protocol  = "TCP"
}

resource "scaleway_security_group_rule" "inbound_VPN" {
  security_group = "${scaleway_security_group.mesosphere.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "10.1.160.221"
  protocol  = "TCP"
}
