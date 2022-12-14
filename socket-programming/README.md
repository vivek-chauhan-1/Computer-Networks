CS 456/656 Assignment 1: Introductory Socket Programming
The goal of this assignment is to gain experience with both UDP and TCP socket programming in a client-server environment. A client program (client.py) and a server program (server.py) are implemented here and communicate between themselves. The client will download a file from the server over the network using sockets. This assignment uses a two-stage communication process.First stage is negotiation using UDP sockets and second stage is Transaction using TCP sockets. 
The requests and responses in this assignment will mimic the File Transfer Protocol (FTP). FTP runs in one of two modes – Active mode or Passive mode, which dictate the negotiation and transaction stage procedures. The following are key distinctions between the two modes:
Active Mode: random port(r_port) is attached to the TCP socket running on the client and server registers r_port internally if req_code(a secret integer shared for authorization) is verified. Also, server initiates a TCP connection with client on the client's r_port and sends the content of file.
Passive Mode: Server creates TCP socket and replies with socket's port number (r_port) after req_code is verfified. Client initiates a TCP connection to the server on servers r_port shared witg client and sends file to client.

How to run the program
Start the server first. First, in your server machine, navigate to the "source" folder (CS656) of this project:

cd ./cs656
Then, in your terminal, enter:

chmod +x ./server.sh
./server.sh <REQ_CODE> 'FILE_TO_SEND'

where

<REQ_CODE> is the request code which is a secret integer code that is verified when negotiating using UDP sockets. We stdout the server port in the terminal: the SERVER_PORT is the <N_PORT> which is to be entered in the client.sh CLI arguments in the next step.
Once the server has started, start the client. In your client machine, navigate to the "source" (CS656) folder of this project. Then, in the terminal, enter:

cd ./cs656
then in yout terminal, enter:

chmod +x ./client.sh
./client.sh <SERVER_ADDRESS> <N_PORT> <MODE> <REQ_CODE> 'file_received.txt' 

where

<SERVER_ADDRESS> is the address/hostname of the server to contact;
<N_PORT> is the negotiation port with the server (using the earlier stdout from server);
<MODE> is the mode of FTP, it can be either 'A' or 'P'
<REQ_CODE> is the client request code for negotiation; and
'file_received.txt' is the name of file to be saved in the current directory received from sender.


Machine program was tested on the below machines on the UWaterloo Undergraduate Linux Servers:
ubuntu2004-002.student.cs.uwaterloo.ca
ubuntu2004-004.student.cs.uwaterloo.ca


Author
Vvek Chauhan, WATID 20955627