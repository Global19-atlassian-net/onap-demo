Update the tenant2public_router.env
- public_net_id - use `openstack network list`


Setup the ONAP private network and a router
```
openstack stack create --wait -t tenant2public_router.yaml -e tenant2public_router.env vRouter
```

Copy base_vcpe_vgmux.env.example to base_vcpe_vgmux.env

Run `./setup_network.sh`

Update base_vcpe_vgmux.env with the new network values for
- bng_gmux_private_net_id
- bng_gmux_private_subnet_id
- mux_gw_private_net_id
- mux_gw_private_subnet_id

based on the results from `setup_network.sh`

----

TODO: 
- create a heat template for bng and mux gw networks to replace setup_network.sh
