# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'meat-and-potatoes'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'meat-and-potatoes::default'

# Specify a custom source for a single cookbook:
cookbook 'meat-and-potatoes', path: '.'
cookbook 'apt', '~> 6.1.0'
cookbook 'cron', '~> 4.1.1'
cookbook 'docker', '~> 10.1.8'
cookbook 'logrotate', '~> 2.2.0'
cookbook 'swap', '~> 2.0.0'
cookbook 'firewall', '~> 2.6.1'
cookbook 'ssh_known_hosts', '~> 4.0.0'
