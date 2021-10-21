#!/bin/sh


if [ "$DEBUG" = "true" ];
then
   if [ -z ${UPF}  ];
   then 	   
      tcpdump -i any -w /metrics/${My5GC_MODULE}.pcap & 
   else	 
      tcpdump -i any -w /metrics/${UPF}.pcap &
   fi  
fi

