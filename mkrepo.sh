#!/bin/sh

[ -d repo ] && mv repo repo.`date +%Y-%m-%d-%H:%M:%S`

pkgrepo create repo
pkgrepo set -s repo publisher/prefix=s10.everycity.co.uk
