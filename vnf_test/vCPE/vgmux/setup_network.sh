#!/bin/bash


openstack network  list -f value |grep ' oam_onap_'
if [ "$?" = 0 ] ; then
	echo "Existing oam_onap network already created. Not creating a new one"
else
	set -x
	openstack network create oam_onap_N3xT
	openstack subnet create oam_onap_N3xT --network oam_onap_N3xT --subnet-range 10.0.0.0/16
	set +x
fi

openstack network  list -f value |grep ' bng_gmux_private_net'
if [ "$?" = 0 ] ; then
	echo "Existing network already created. Not creating a new one"
else
	set -x
	openstack network create bng_gmux_private_net
	openstack subnet create bng_gmux_private-subnet --network bng_gmux_private_net --subnet-range 10.1.0.0/24
	set +x
fi

openstack network  list -f value |grep ' mux_gw_private_net'
if [ "$?" = 0 ] ; then
	echo "Existing network already created. Not creating a new one"
else
	set -x
	openstack network create mux_gw_private_net
	openstack subnet create mux_gw_private_subnet --network mux_gw_private_net --subnet-range 10.5.0.0/24
	set +x
fi
