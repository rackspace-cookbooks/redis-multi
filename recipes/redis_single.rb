#
# Cookbook Name:: redis-multi
# Recipe:: redis_single
#
# Copyright 2014, Rackspace, US Inc.
#
# All rights reserved - Do Not Redistribute
#

# include in any recipe meant to be called externally
include_recipe 'redis-multi'

bind_port = node['redis-multi']['bind_port']
node.set['redisio']['servers'] = []
node.set['redisio']['servers'] << { 'name' => "#{bind_port}-single",
                                    'port' => bind_port }

# this recipe is for a standalone redis, with all defaults
include_recipe 'redisio'
include_recipe 'redisio::enable'

tag('redis_single')
tag('redis')
