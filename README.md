# dcos-scaleway

> A seven-node DC/OS cluster on Scaleway, described in Terraform. Written in
> 2018, kept as a record of what orchestration looked like before Kubernetes
> won.

![Archived](https://img.shields.io/badge/status-archived%20%C2%B7%20not%20runnable-inactive)
![Terraform](https://img.shields.io/badge/Terraform-0.11%20era-7B42BC?logo=terraform&logoColor=white)
![Licence](https://img.shields.io/badge/licence-MIT-blue)

## This will not run, and cannot be made to

Three separate things it depends on no longer exist:

- **DC/OS** was discontinued. Mesosphere became D2iQ, D2iQ stopped supporting
  DC/OS in 2021, and the installer this code points at is gone.
- **The Scaleway Terraform provider v1** — the one that offered
  `scaleway_server` and `scaleway_security_group` — was replaced by a v2 with a
  different resource model. It is no longer served by the registry.
- **VC1S and VC1M** instance types were retired years ago.

There is no patch that brings this back. Porting it would mean writing a
different thing entirely, against a product that no longer ships. It stays here
as it was, because what it records is worth keeping.

## What it records

Seven machines, described in files, in 2018:

| Role | Count | Instance | Then |
|---|---|---|---|
| Masters | 3 | VC1S | €0.006/hour |
| Agents | 3 | VC1M | €0.012/hour |
| Bootstrap | 1 | VC1S | destroyed once the cluster was up |

The shape is the interesting part. Three masters for quorum, a separate
bootstrap node whose entire purpose was to be thrown away after the install, an
`ip_detect` shell script — `ip_script.sh` — because the scheduler could not work
out a node's own address, and a GUI installer into which you pasted **your SSH
private key** so it could reach the machines.

That last one is worth sitting with. In 2018 it was the documented procedure.

Everything DC/OS made you assemble by hand — the quorum, the agent registration,
the address detection, the throwaway installer — is now either a managed control
plane or three lines of YAML. The gap between this repository and a `kubeadm`
command is the whole story of what happened to orchestration between 2018 and
now.

## A note on the credentials in the history

The first commit contained a Scaleway `token` and `organization` in
`provider.tf`. The file was deleted in a later commit, but git keeps everything,
so both values are still readable in the history.

**They were revoked long ago.** They are left in place rather than rewritten
because rewriting the history of an archive to hide a mistake would be a strange
thing to do with a repository kept precisely as a record. The mistake is part of
the record: in 2018 I committed a cloud token, and that is what committing a
cloud token looks like six years later.

## Licence

MIT.
