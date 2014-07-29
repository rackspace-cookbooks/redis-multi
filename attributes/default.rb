# encoding: UTF-8

default['redis-multi']['master'] = nil
default['redis-multi']['slaves'] = %w()
default['redis-multi']['bind_port'] = 6379
default['redis-multi']['sentinel_port'] = 46_379
