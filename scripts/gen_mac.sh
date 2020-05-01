#!/bin/bash
curl --netrc-file ~/.ansible/jss_creds  --request GET https://jss.urmc.rochester.edu:8443/JSSResource/computerreports/id/81 -H "Accept: application/xml" > ~/Box/Boomi/JSS/macs.xml
