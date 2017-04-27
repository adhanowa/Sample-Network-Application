# Sample-Network-Application
Tool to monitor and alert on TCP/UDP send and receive queues/buffers

## Requirements

Produce a tool which can be run on a Ubuntu linux machine (14.x/16.x - your choice, but please specify!) which will monitor per-socket send and receive queues (buffers), both tcp and udp, and in both directions (both server (listener) and client sockets).

Provide user configurable thresholds (one for send, one for receive):
  - A destination url to which the results should be sent via http GET query string parameters
  - Runs indefinitely until killed by the user (assume your tool will simply be sent a SIGKILL (9) at some point)

The tool, upon detection of a buffer which has exceeded the threshold for the appropriate direction, should make an HTTP request to the provided url, and append the following information within a query string:

  - The current unix timestamp since the epoch (with sub-second precision if possible)
  - The socket details (local ip/port combo and remote ip/port combo)
  - The buffer type (ie: SEND or RECV) & size, in bytes

Your implementation (a script, some kind of executable, etc - language/implementation style/etc is up to you) very brief documentation indicating:

  - How to install/prepare the tool for use, if at all
  - How to execute the tool
  - The query string param(s) that will be sent to the specified URL with the data for each result

## Prerequisites
 - Run tool on Ubuntu 14.x / 16.x
 - Install package iproute2, if not alredy installed
 - Python v2.x

## Usage
 - This tool is more a 'proof of concept', many features require more of optimiztion
 - Critical alert data is posted via curl HTTP POST calls to a virtual python web framework
 - Critical alert data is retreivable via curl HTTP GET calls
 - These aformentioned features still require automation and scheduled frequency
 - Above processes are currently run manually

### Example
 - curl -X POST --data "@./udp_redirect_output.csv" localhost:8080/store.json
 - curl -X GET localhost:8080/store.json

## Installation

1. Download zip file or clone the git pacakge from https://github.com/adhanowa/Sample-Network-Application.git
2. Extract the package to a folder of your choosing
3. Open a terminal application and change directory to the extracted files
4. You will need to make the executable, with the following command:

    chmod u+x menu.sh

5. Launch the ./menu.sh file in a terminal prompt:

    ./menu.sh

6. Ensure to read the 'help' file for passing parameters

# Release Notes
 - The tool currently logs to file and the Ubuntu system log for all critical events
 - An HTTP web based service for storing critical event data will be avaiable shortly
 - Typically, I would like to store and retreive data via JSON key value pairs

## Suggestions / Unknowns
 - I would advice clients the following:
     - always avoid sending sensitive data over HTTP
     - there are ALOT of free and retail products avaiable that would exceed current requirements
       - save labour costs and avoid 'reinventing the wheel'
       - typically, this solution here would be better suited for a monitoring solution
         such Nagios or Zabbix, as 'service checks'
     - unknown/undefined scope of use (single user, multi user, etc.)
     - unknown target audience / details
         - is the tool being developed for a new hire, client or seasoned techies?
     - avoid exposing sensitive data to the internet by sending data clear text
        - at a very minimum, use HTTPS
        - log events to a centralized system that can ingest the logs, and make them searchable
        - for medium size and large size companies, I would advise deploying a centralized logging
          'gather/store/make searchable' type solution (logstash, Splunk, etc.)

## Change Control

### rev.1.2

 - Designed for local network monitoring of incoming/outgiong queues
  - The following requirements have been met:
    - Runs on Ubuntu 14.x and 16.x (built and tested on Ubuntu 16.04.2) indefinitely until killed by the user
    - Monitors both TCP/UDP, both Send / Receive queues
    - Local and remote ip's and ports
    - Ability to input user defined parameters for both 'send and receive'

#### - Outstanding Requirements
- A defined REST source/datastore to store critical events/alerts via HTTP
 - There are a few options here:
    - A python web based server (several classes available) that accepts / stores / retreives HTTP methods with text payloads
    - A web server with a database, preferrably a key/value pair type solution
    - Stream alerts/data to a cloud datastore
    - Use Google's 'BigQuery' service to create a able to store incoming data
    - Post critical event data to encrypted/private SLACK channel
    - post data using curl commands
    - MySQL or PostgreSQL would be a solid candidate for backend repository
    - there is a URL, however there is currently no data (http://104.198.245.133/post-file)



