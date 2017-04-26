# Sample-Network-Application
Tool to monitor and alert on TCP/UDP send and receive queues/buffers

# KixEye Requirements

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
