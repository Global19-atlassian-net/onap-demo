#!/bin/bash        


openstack network  list -f value |grep ' brgemu_bng_private_net'               
if [ "$?" = 0 ] ; then                 
        echo "Existing network already created. Not creating a new one"        
else               
        set -x     
        openstack network create brgemu_bng_private_net                        
        openstack subnet create brgemu_bng_private-subnet --network brgemu_bng_private_net --subnet-range 10.3.0.0/24 
        set +x     
fi                 

openstack network  list -f value |grep ' cpe_signal_net'                       
if [ "$?" = 0 ] ; then                                                         
        echo "Existing network already created. Not creating a new one"                           
else                                                                           
        set -x                                                                 
        openstack network create cpe_signal_net                                
        openstack subnet create cpe_signal-subnet --network cpe_signal_net --subnet-range 10.4.0.0/24                 
        set +x     
fi                 
