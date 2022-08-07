CS 456/656 Assignment 1: 
The goal of this assignment is to implement a Congestion-controlled Pipelined RDT protocol over UDP, which could be used to transfer a text file from one host to another across an unreliable network. When the sender needs to send packets to the receiver, it sends them to the network emulator instead of sending them directly to the receiver. The network emulator then forwards the received packets to the receiver. However, it may randomly discard or reorder the received packets. The same scenario happens when the receiver sends SACKs to the sender. 


How to run the program: Run nEmulator, receiver, and sender in this order.


For Emulator:

First, in your server machine, navigate to the "source" folder (CS656) of this project:
cd ./cs656
Then, in your terminal, enter:

chmod +x ./network_emulator.py
python network_emulator.py <arg1> <arg2> <arg3> <arg4> <arg5> <arg6> <arg7> <arg8> <arg9> 

To run nEmulator, supply following CLI arguments:
where:
<arg1> : <emulator's receiving UDP port number in the forward (sender) direction>, 
<arg2> : <receiver's network address>, 
<arg3> : <receiver's receiving UDP port number>, 
<arg4> : <emulator's receiving UDP port number in the backward (receiver) direction>, 
<arg5> : <sender's network address>, 
<arg6> : <sender's receiving UDP port number>, 
<arg7> : <maximum delay of the link in units of millisecond>, 
<arg8> : <packet discard probability>, 
<arg9> : <verbose-mode> (Boolean: Set to 1, the network emulator will output its internal processing, one per line, e.g. receiving Packet seqnum/SACK seqnum, discarding Packet seqnum /SACK seqnum, forwarding Packet seqnum /SACK seqnum). 


For Sender :

cd ./cs656
Then, in your terminal, enter:

chmod +x ./sender.py
python client.py <arg1> <arg2> <arg3> <arg4> <arg5>

where
<arg1> : <host address of the network emulator>,
<arg2> : <UDP port number used by the emulator to receive data from the sender>,
<arg3> : <UDP port number used by the sender to receive SACKs from the emulator>,
<arg4> : <timeout interval in units of millisecond>, and
<arg5> : <name of the file to be transferred> 


For Receiver:

cd ./cs656
then in yout terminal, enter:

chmod +x ./receiver.py
python receiver.py <arg1> <arg2> <arg3> <arg4>

where
<arg1> : <hostname for the network emulator>,
<arg2> : <UDP port number used by the link emulator to receive ACKs from the receiver>,
<arg3> : <UDP port number used by the receiver to receive data from the emulator>, and
<arg4> : <name of the file into which the received data is written>


Example run:
python ./network_emulator.py 45970 host2 50970 50971 host3 45971 1 0.0 1
python ./receiver.py host1 50971 50970 output.txt
python ./sender.py host1 45970 45971 0.5 input.txt



Machine program was tested on the below machines on the UWaterloo Undergraduate Linux Servers:
ubuntu2004-002.student.cs.uwaterloo.ca
ubuntu2004-004.student.cs.uwaterloo.ca
ubuntu2004-006.student.cs.uwaterloo.ca

Author
Vvek Chauhan, WATID 20955627