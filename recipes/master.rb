#
# Cookbook Name:: redis-multi
# Recipe:: redis_master
#
# Copyright 2014, Rackspace, US Inc.
#
# All rights reserved - Do Not Redistribute
#

# include in any recipe meant to be called externally
include_recipe 'redis-multi'

bind_port = node['redis-multi']['bind_port']
node.set['redisio']['servers'] = []
node.set['redisio']['servers'] << { 'name' => "#{bind_port}-master",
                                    'port' => bind_port }

include_recipe 'redisio'
include_recipe 'redisio::enable'

tag('redis_master')
tag('redis')
