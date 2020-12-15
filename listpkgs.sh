#!/bin/sh
apt-get -qq update; apt-cache policy $@
