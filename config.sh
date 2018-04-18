#!/bin/bash
echo agent_list:
for i in $(echo $2 | tr "," "\n")
do
	echo - $i
	echo Host $i >> ~/.ssh/config
#    	echo "    Hostname $i" >> ~/.ssh/config
    	echo "    StrictHostKeyChecking no" >> ~/.ssh/config
	echo >> ~/.ssh/config
done
echo bootstrap_url: file:///opt/dcos_install_tmp
echo cluster_name: scaleway-dcos
echo exhibitor_storage_backend: static
echo ip_detect_path: genconf/ip-detect
echo master_discovery: static
echo master_list:
for j in  $(echo $1 | tr "," "\n")
do
        echo - $j
        echo Host $j >> ~/.ssh/config
#        echo "   Hostname $j" >> ~/.ssh/config
        echo "   StrictHostKeyChecking no" >> ~/.ssh/config
        echo >> ~/.ssh/config

done
echo process_timeout: 10000
echo resolvers:
echo - 8.8.8.8
echo - 8.8.4.4
echo ssh_key_path: genconf/ssh_key
echo ssh_port: 22
echo ssh_user: root
echo public_agent_list:
for k in  $(echo $3 | tr "," "\n")
do
        echo - $k
        echo Host $k >> ~/.ssh/config
#        echo "   Hostname $j" >> ~/.ssh/config
        echo "   StrictHostKeyChecking no" >> ~/.ssh/config
        echo >> ~/.ssh/config

done

