Update the router env with `appropriate` parameters

Setup the ONAP private network and a router
```
openstack stack create --wait -t tenant2public_router.yaml -e tenant2public_router.env vRouter
```

copy base_vcpe_vgmux.env.example to base_vcpe_vgmux.env
Run setup_network.sh
update base_vcpe_vgmux.env with the new network values

TODO: create a heat template for bng and mux gw networks
