#
# Cookbook Name:: redis-multi
# Recipe:: redis_slave
#
# Copyright 2014, Rackspace, US Inc.
#
# All rights reserved - Do Not Redistribute
#

# include in any recipe meant to be called externally
include_recipe 'redis-multi::_base'

# find master so we can configure slaves
include_recipe 'redis-multi::_find_master'
master_ip = node['redis-multi']['redis_master']

# configure master w/ slaveof, based on found master
bind_port = node['redis-multi']['bind_port']

# if downstream doesn't supply, do a nice default
if node.deep_fetch('redisio', 'servers').nil?
  master_data = { 'name' => "#{bind_port}-slave",
                  'port' => bind_port,
                  'slaveof' => { 'address' => master_ip,
                                 'port' => bind_port
                               }
                }

  node.set['redisio']['servers'] = []
  node.set['redisio']['servers'] << master_data
end

tag('redis_slave')
tag('redis')
