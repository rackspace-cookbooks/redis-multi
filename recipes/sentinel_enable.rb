#
# Cookbook Name:: redis-multi
# Recipe:: default
#
# Copyright 2014, Rackspace, US Inc.
#
# All rights reserved - Do Not Redistribute
#

# provides a wrapper around redisio so a downstream cookbook can
# call only this one, and not redisio, and do everything it needs
include_recipe 'redisio::sentinel_enable'
