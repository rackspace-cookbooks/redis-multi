redis-multi
===========

Chef wrapper cookbook to create master, slaves, and sentinel redis server
setups. This wrapper should work on all Debian and RHEL platform family OS's.

Utilization
------------

Cookbook works as a wrapper around the community redisio cookbook to allow for
the creation of master/slave and sentinel systems.

The cookbook utilizes three recipes depending on the server's role.

`default.rb` : calls upstream rediosio::default

`enable.rb` : calls upstream redisio::enable

`master.rb` : sets up a redis server and init script with master in name

`slave.rb` : sets up a slave redis server pointing to the master node
definded within attributes.

Search will look for the node in the same environment with the tag
`redis_master` and set slaveof replication to that node. If you do not want to
use search, create the master node first before bootstrapping, and set the
attribute `['redis-multi']['master']` with the correct IP.

`slave.rb` : sets up a slave redis server pointing to the master node
definded within attributes.

Search will be used in the same fashion as the `redis_slave.rb` recipe above (
  they share the `_find_master.rb` functionality.)

Note that `find_all.rb` is included here as a recipe. This is done in case a
wrapper cookbook wants to find all redis nodes for iptables or some other
purpose.

Attributes
-----------

`default['redis-multi']['master'] = nil` Used to identify a master IP address.
This value will be populated after first run using search and a `redis_master`
tag.

`default['redis-multi']['slaves'] = %w()` Used to hold a list of slave IP
addresses that is populated through search and a `redis_slave` tag.

** Note that the two settings below only apply if you don't define your own
`node[redisio]` instances of redis (if you call the recipe without doing that,
these ports will be used as the defaults for new instances)

`default['redis-multi']['bind_port'] = 6379` Used for the port for masters,
slaves, and sentinels. Right now, this must be the same everywhere. To override
ports, and make them different on different nodes, you will have to use upstream
directly.

`default['redis-multi']['sentinel_port'] = 46379` Used to specify an alternate
default port for sentinel instances.

License & Authors
-----------------
- Author:: Martin Smith (<martin.smith@rackspace.com>)

This cookbook was structured and heavily borrowed inspiration from [mysql-multi](https://github.com/rackspace-cookbooks/mysql-multi).

```text

Copyright:: 2014 Rackspace US, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
