#
# Cookbook:: user_mngt
# Recipe:: default

#load databag
users = data_bag('users')
ssh_host_keys = data_bag('ssh_host_keys') 

users.each do |login|
  item  = data_bag_item('users', login)

  #generate random password
  salt = OpenSSL::Random.random_bytes(10)

  #add user 
  user login do
    shell     item['shell']
    comment   item['comment']
    home      "/home/#{login}" 
    manage_home true
    password salt 
  end

  # create .ssh folder for each user
  directory "/home/#{login}/.ssh" do
    owner login 
    mode '0755'
    action :create
  end
  
  # add ssh key to user home folder
  ssh_host_keys.each do |key_item|
    key_entry = data_bag_item('ssh_host_keys', key_item)
    ssh_known_hosts_entry key_item do
      key key_entry['key']
      name key_entry['host']
      file_location "/home/#{login}/.ssh/ssh_known_hosts"
      owner login
    end
  end
end
