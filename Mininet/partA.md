#Part-A

Explanation for "Add-Flow" commands in the file ovs_connect_h0h1.sh is:

The first command creates a flow entry (i.e. `add-flow`) such that the switch s0 listen for any IP traffic coming in at ingress port 1, and the source has ip address `10.0.1.2`, then we modify the source MAC address to its own MAC address on interface 2 and the destination MAC address to switch s1's MAC address on interface 2 and forward the packet onto output link 2 (i.e. `s0-eth2`). This command will allow `s0` to forward a packet from `h0` destined to `h1` to `s1`.

The other three commands can also be explained similarly. 

- The second command allows `s0` to forward a packet from `h1` sent via `s1` to `h0`. 
- The third command  allows `s1` to forward a packet from `h0` sent via `s0` to `h1`.
- The fourth command allows `s1` to forward a packet from `h1` destined to `h0` to `s0`.
