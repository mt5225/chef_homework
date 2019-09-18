# Overview

Create a handful of user accounts in linux with SSH keys and randomly generated passwords, they don't have to be valid keys just something to show in the example.


# Repository 

- cookbook name  ``user_mngt``
- apply ``chef-client --local-mode --runlist 'recipe[user_mngt]'``
- inspect data bag data ``knife search users "*:*"``  ``knife search ssh_host_keys "*:*"``
- ``depends`` ``none``


# Folders

- `cookbooks/` - Cookbooks 
- `data_bags/` - Store user and ssh key data



# TODO

- Encryp all data_bag data

