#!/bin/bash

## nginx
service nginx start

# log all services
service --status-all

/bin/bash