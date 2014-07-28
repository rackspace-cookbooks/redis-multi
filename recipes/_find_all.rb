# encoding: UTF-8
#
# Cookbook Name:: redis-multi
# Recipe:: _find_all
#
# Copyright 2014, Rackspace US, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
if Chef::Config[:solo]
  errmsg = 'This recipe uses search if all attribute is not set. \
    Chef Solo does not support search.'
  Chef::Application.fatal!(errmsg, 1)
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
