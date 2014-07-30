redis-multi Cookbook CHANGELOG
==============================
This file is used to list changes made in each version of the redis-multi
cookbook.

v1.0.0 (2014-07-30)
-------------------
- Breaking change: this cookbook no longer calls the redisio::enable or
redisio::default recipes directly, but provides wrappers like
redis-multi::enable and redis-multi::default instead. You must now call them
separately. This allows downstream users to set `node['redisio']` directly
after taking advantage of redis-multi.`

v0.1.0 (2014-07-29)
-------------------
- Remove redis_ from recipe names (cleaner to see, e.g. redis-multi::foo)
- Fix some rubocop and foodcritic complaints
- _find_all.rb becomes public, renamed to find_all.rb
- Added default attribute for sentinel port number
- Ensure chef-solo usage doesn't fatal out

v0.0.1 (2014-07-28)
-------------------
- Initial import.
