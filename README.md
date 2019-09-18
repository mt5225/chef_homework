# Overview

- cookbook name  ``user_mngt``
- apply ``chef-client --local-mode --runlist 'recipe[user_mngt]'``
- inspect data bag data ``knife search users "*:*"``  ``knife search ssh_host_keys "*:*"``
- ``depends`` ``none`` 



# Repository Directories

- `cookbooks/` - Cookbooks 
- `data_bags/` - Store user and ssh key data



# TODO

- Encryp all data_bag data
- ``unit test`` with chefspec

