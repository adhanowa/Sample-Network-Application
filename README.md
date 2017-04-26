# Sample-Network-Application
Tool to monitor and alert on TCP/UDP send and receive queues/buffers

## KixEye Requirements

Produce a tool which can be run on a Ubuntu linux machine (14.x/16.x - your choice, but please specify!) which will monitor per-socket send and receive queues (buffers), both tcp and udp, and in both directions (both server (listener) and client sockets).

Provide user configurable thresholds (one for send, one for receive):
  - a destination url to which the results should be sent via http GET query string parameters
  - runs indefinitely until killed by the user (assume your tool will simply be sent a SIGKILL (9) at some point)

The tool, upon detection of a buffer which has exceeded the threshold for the appropriate direction, should make an HTTP request to the provided url, and append the following information within a query string:

  - the current unix timestamp since the epoch (with sub-second precision if possible)
  - the socket details (local ip/port combo and remote ip/port combo)
  - the buffer type (ie: SEND or RECV) & size, in bytes

Your implementation (a script, some kind of executable, etc - language/implementation style/etc is up to you) very brief documentation indicating:

  - how to install/prepare the tool for use, if at all
  - how to execute the tool
  - the query string param(s) that will be sent to the specified URL with the data for each result

## Installation

1. Download zip file or clone the git pacakge from https://github.com/adhanowa/Sample-Network-Application.git
2. Extract the package to a folder of your choosing
3. Open a terminal application and change directory to the extracted files
4. You will need to make the executable, with the following command:

    chmod u+x menu.sh

5. Launch the ./menu.sh file in a terminal prompt
6. Ensure to read the 'help' file for passing parameters

## Change Control

### rev.1.1

 - designed for local network monitoring of incoming/outgiong queues
 - The following requirements have been met:
  - runs on Ubuntu 14.x and 16.x (built and tested on Ubuntu 16.04.2) indefinitely until killed by the user
  - monitors both TCP/UDP, both Send / Receive queues
  - local and remote ip's and ports
  - ability to input user defined parameters for both 'send and receive'

   #### - Outstanding requirements:
    - a defined REST source/datastore to store query details
    - There is a URL, however there is currently no data (http://104.198.245.133/post-file)


