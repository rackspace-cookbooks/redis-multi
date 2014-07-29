redis-multi Cookbook CHANGELOG
==============================
This file is used to list changes made in each version of the redis-multi
cookbook.

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
