#!/bin/bash        


openstack network  list -f value |grep 'mux_gw_private_net'               
if [ "$?" = 0 ] ; then                 
        echo "Existing network already created. Not creating a new one"        
else               
        set -x     
        openstack network create mux_gw_private_net                        
        openstack subnet create mux_gw_private-subnet --network mux_gw_private_net --subnet-range 10.5.0.0/24 
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
