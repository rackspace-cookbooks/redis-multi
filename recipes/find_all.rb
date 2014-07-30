#
# Cookbook Name:: redis-multi
# Recipe:: find_all
#
# Copyright 2014, Rackspace, US Inc.
#
# All rights reserved - Do Not Redistribute
#

# include in any recipe meant to be called externally
include_recipe 'redis-multi::_base'

if Chef::Config[:solo]
  errmsg = 'This recipe uses search if all attribute is not set. \
    Chef Solo does not support search.'
  Chef::Application.warn(errmsg)
else # don't reuse old attribute 'all', freshen it
  all_ips = []
  found_nodes = search('node', 'tags:redis'\
                  " AND chef_environment:#{node.chef_environment}")

  if !found_nodes.nil?
    found_nodes.each do |n|
      all_ips << best_ip_for(n)
    end
    node.set['redis-multi']['all'] = all_ips
  else
    errmsg = 'Did not find Redis nodes to use, but none were set'
    Chef::Application.warn(errmsg)
    # don't fail hard
  end
end
