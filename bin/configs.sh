#!/usr/bin/env bash

CONFS_POOL="StartupUe|N3iwfipsec|NetCoreSubscribers|nonUE"
if [[ ! "$1" =~ $CONFS_POOL ]]
then
    echo "Usage: $0 [ ${CONFS_POOL//|/ | } ]"
    exit 1
fi

trigger_ue(){

    ./bin/ipsec_ue_config --ue localhost --n3iwf n3iwf
    ./bin/ue &
}

trigger_reg(){
	curl --insecure --location --request POST 'http://localhost:10000/registration/' \
	--header 'Content-Type: application/json' \
	--data-raw '{
    		"authenticationMethod": "5G_AKA",
    		"supiOrSuci": "2089300007487",
    		"K": "5122250214c33e723a5dd523fc145fc0",
    		"opcType": "OP",
    		"opc": "c9e8763286b5b9ffbdf56e1297d0887b",
    		"plmnId": "",
    		"servingNetworkName": "",
    		"n3IWFIpAddress": "192.168.127.1",
    		"SNssai": {
        		"Sst": 1,
        		"Sd": "010203"
    			}
		}'

}

trigger_runner_forwarder(){
   echo "Trigger Runner forwarders"
   ./bin/main --ipv4 $2 --port 1700
}

trigger_simulator(){
   echo "Trigger Simulator"
   ./bin/simulator
}

trigger_n3iwf_ipsec(){

   ### N3iwf IPSec tunnel configuration
   ip a add 192.168.127.1/24  dev eth0
   ip link add name ipsec0 type vti local 192.168.127.1 remote 0.0.0.0 key 5
   ip a add 10.0.0.1/24 dev ipsec0
   ip l set dev ipsec0 up
   ip ro del default
}


if [ "$1" == "StartupUe" ]; then
    trigger_ue
    sleep 1
    trigger_reg
    trigger_runner_forwarder
    trigger_simulator
fi

if [  "$1" == "N3iwfipsec" ]; then
	trigger_n3iwf_ipsec
fi

if [ "$1" == "NetCoreSubscribers" ]; then
	trigger_core_subs
fi

if [ "$1" == "nonUE" ]; then
    echo " Non UE Execute"
    trigger_runner_forwarder
    sleep 1
    trigger_simulator
fi
