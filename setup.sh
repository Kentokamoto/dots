#!/bin/bash
echo "Setting up SSH Key"
echo "Using RSA 4096"
ssh-keygen -t rsa -b 4096 -C "$USER@$HOSTNAME"
