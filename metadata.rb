name 'meat-and-potatoes'
maintainer 'Caleb Land'
maintainer_email 'caleb@land.fm'
license 'MIT'
description 'A basic collection of useful recipes used on almost every server'
long_description 'This is a basic collection of useful recipes used on almost every server'
version '1.0.3'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/meat-and-potatoes/issues'

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/meat-and-potatoes'

depends 'apt', '~> 6.1.0'
depends 'cron', '~> 4.1.1'
depends 'swap', '~> 2.0.0'
depends 'firewall', '~> 2.6.1'
depends 'ssh_known_hosts', '~> 4.0.0'
depends 'chef-apt-docker', '~> 2.0.4'
depends 'docker', '~> 4.9.3'
depends 'logrotate', '~> 2.2.0'
