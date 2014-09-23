# encoding: UTF-8
name 'redis-multi'
maintainer 'Martin Smith'
maintainer_email 'martin.smith@rackspace.com'
license 'Apache 2.0'
description 'Redis replication wrapper cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.1'

supports 'ubuntu'
supports 'centos'
supports 'redhat'

depends 'apt'
depends 'chef-sugar'
depends 'redisio', '~> 2.1'
