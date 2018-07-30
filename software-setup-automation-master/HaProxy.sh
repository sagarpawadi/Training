#!/bin/bash

# We are using Tomcat 8 in the setup below are the instructions to setup tomcat

  function HaProxy(){
 add-apt-repository ppa:vbernat/haproxy-1.5
 apt-get update
 apt-get install haproxy
 service haproxy restart

}
 
 quit (){
 exit
 }
HaProxy 

haproxy --version # for version check
quit
