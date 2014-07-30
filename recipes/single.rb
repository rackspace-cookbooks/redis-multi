#
# Cookbook Name:: redis-multi
# Recipe:: redis_single
#
# Copyright 2014, Rackspace, US Inc.
#
# All rights reserved - Do Not Redistribute
#

# include in any recipe meant to be called externally
include_recipe 'redis-multi::_base'

# if downstream doesn't supply, do a nice default
if node.deep_fetch('redisio', 'servers').nil?
  bind_port = node['redis-multi']['bind_port']
  node.set['redisio']['servers'] = []
  node.set['redisio']['servers'] << { 'name' => "#{bind_port}-single",
                                      'port' => bind_port }
end

tag('redis_single')
tag('redis')
