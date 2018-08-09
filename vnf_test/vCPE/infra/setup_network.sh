#!/bin/bash        


openstack network  list -f value |grep ' cpe_signal_net'                       
if [ "$?" = 0 ] ; then                                                         
        echo "Existing network already created. Not creating a new one"                           
else                                                                           
        set -x                                                                 
        openstack network create cpe_signal_net                                
        openstack subnet create cpe_signal-subnet --network cpe_signal_net --subnet-range 10.4.0.0/24                 
        set +x     
fi                 

openstack network  list -f value |grep ' cpe_public_net'                       
if [ "$?" = 0 ] ; then                                                         
        echo "Existing network already created. Not creating a new one"                           
else                                                                           
        set -x                                                                 
        openstack network create cpe_public_net                                
        openstack subnet create cpe_public-subnet --network cpe_public_net --subnet-range 10.2.0.0/24                 
        set +x     
fi                 

openstack network  list -f value |grep ' oam_onap_'
if [ "$?" = 0 ] ; then
	echo "Existing oam_onap network already created. Not creating a new one"
else
	set -x
	openstack network create oam_onap_N3xT
	openstack subnet create oam_onap_N3xT --network oam_onap_N3xT --subnet-range 10.0.0.0/16
	set +x
fi

