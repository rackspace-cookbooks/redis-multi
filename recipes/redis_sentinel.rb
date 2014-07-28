#
# Cookbook Name:: redis-multi
# Recipe:: redis_sentinel
#
# Copyright 2014, Rackspace, US Inc.
#
# All rights reserved - Do Not Redistribute
#

# include in any recipe meant to be called externally
include_recipe 'redis-multi'

# find master so we can configure sentinel
include_recipe 'redis-multi::_find_master'
master_ip = node['redis-multi']['redis_master']
bind_port = node['redis-multi']['bind_port']

# configure master w/ slaveof, based on found master
node.set['redisio']['sentinels'] = []
node.set['redisio']['sentinels'] << { 'name' => "#{bind_port}-sentinel",
                                      'sentinel_port' => bind_port,
                                      'master_ip' => master_ip,
                                      'master_port' => bind_port }

include_recipe 'redisio::sentinel'
include_recipe 'redisio::sentinel_enable'

tag('redis_sentinel')
tag('redis')
