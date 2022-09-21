#!/bin/sh


if [ "$DEBUG" = "true" ];
then
   if [ -z ${UPF}  ];
   then 	   
      tcpdump -i eth0 -w /metrics/${My5GC_MODULE}.pcap & 
   else	 
      tcpdump -i eth0 -w /metrics/${UPF}.pcap &
   fi  
fi

