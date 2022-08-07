#!/usr/bin/env bash

# Sets bridge s0 to use OpenFlow 1.3
ovs-vsctl set bridge s0 protocols=OpenFlow13 

# Sets bridge s1 to use OpenFlow 1.3
ovs-vsctl set bridge s1 protocols=OpenFlow13 

ovs-vsctl set bridge s2 protocols=OpenFlow13

# Print the protocols that each switch supports
for switch in s0 s1 s2;
do
    protos=$(ovs-vsctl get bridge $switch protocols)
    echo "Switch $switch supports $protos"
done



#[s0] alice -> s0 -> {bob, carol}														#s0-eth2					#r1-eth0
ovs-ofctl -O OpenFlow13 add-flow s0 in_port=1,ip,nw_src=10.1.1.17,actions=mod_dl_src:0A:00:0A:01:00:02,mod_dl_dst:0A:00:0B:01:00:03,output=2
#[s0] src -> s0 -> alice
ovs-ofctl -O OpenFlow13 add-flow s0 in_port=2,ip,nw_dst=10.1.1.17,actions=mod_dl_src:0A:00:00:01:00:01,mod_dl_dst:aa:aa:aa:aa:aa:aa,output=1


#[s1] src -> s1 -> bob 
ovs-ofctl -O OpenFlow13 add-flow s1 in_port=*,ip,nw_dst=10.4.4.48,actions=mod_dl_src:0A:00:01:01:00:01,mod_dl_dst:b0:b0:b0:b0:b0:b0,output=1
#[s1] src -> s1 -> carol
ovs-ofctl -O OpenFlow13 add-flow s1 in_port=*,ip,nw_dst=10.6.6.69,actions=mod_dl_src:0A:00:0E:01:00:03,mod_dl_dst:0A:00:02:01:00:01,output=3
#[s1] src -> s1 -> alice
ovs-ofctl -O OpenFlow13 add-flow s1 in_port=*,ip,nw_dst=10.1.1.17,actions=mod_dl_src:0A:00:0A:FE:00:02,mod_dl_dst:0A:00:0C:01:00:03,output=2


#[s2] src -> s2 -> carol
ovs-ofctl -O OpenFlow13 add-flow s2 in_port=*,ip,nw_dst=10.6.6.69,actions=mod_dl_src:0A:00:0C:FE:00:04,mod_dl_dst:cc:cc:cc:cc:cc:cc,output=1
#[s2] src -> s2 -> bob 
ovs-ofctl -O OpenFlow13 add-flow s2 in_port=*,ip,nw_dst=10.4.4.48,actions=mod_dl_src:0A:00:0D:01:00:03,mod_dl_dst:0A:00:0B:FE:00:02,output=2

for switch in s0 s1 s2;
do
    echo "Flows installed in $switch:"
    ovs-ofctl -O OpenFlow13 dump-flows $switch
    echo ""
done