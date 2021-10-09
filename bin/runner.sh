#!/usr/bin/env bash

CONFS_POOL="StartupUe|nonUE"

if [[ ! "$1" =~ $CONFS_POOL ]]
then
    echo "Usage: $0 [ ${CONFS_POOL//|/ | } ]"
    exit 1
fi

ue_addr=${ue_addr:-"127.0.0.1"}
ue_port=${ue_port:-"10000"}
scheme=${scheme:-"http"}
auth_method=${auth_method:-"5G_AKA"}
n3iwf_address=${n3iwf_address:-"192.168.127.1"}
supi_or_suci=${supi_or_suci:-"2089300007487"}
k=${k:-"5122250214c33e723a5dd523fc145fc0"}
opc_type=${opc_type:-"OP"}
opc=${opc:-"c9e8763286b5b9ffbdf56e1297d0887b"}
ike_bind_addr=${ike_bind_addr:-"192.168.127.2"}

trigger_reg(){

    curl --insecure --location --request POST "$scheme://$ue_addr:$ue_port/registration/" \
    --header 'Content-Type: application/json' \
    --data-raw "{
             \"authenticationMethod\": \"$auth_method\",
             \"supiOrSuci\": \"$supi_or_suci\",
             \"K\": \"$k\",
             \"opcType\": \"$opc_type\",
             \"opc\": \"$opc\",
             \"plmnId\": \"\",
             \"servingNetworkName\": \"\",
             \"n3IWFIpAddress\": \"$n3iwf_address\",
             \"ikeBindAddress\": \"$ike_bind_addr\",
             \"SNssai\": {
             \"Sst\": 1,
             \"Sd\": \"010203\"
            }
      }"
}

trigger_runner_forwarder(){
   echo "Trigger Runner forwarders"
   ./bin/main --ipv4NetServer $NETSERVER --port 1700 &
}

trigger_simulator(){
   echo "Trigger Simulator"
   ./bin/simulator --dev $NUMDEV --packets $PACKET &
}

if [ "$1" == "StartupUe" ]; then
    sleep 2
    trigger_reg
    sleep 2
    trigger_runner_forwarder
    sleep 2
    trigger_simulator
fi

if [ "$1" == "nonUE" ]; then
    echo " Non UE Execute"
    sleep 5
    trigger_runner_forwarder
    sleep 3
    trigger_simulator
fi




