name 'build_cookbook'
maintainer 'The Authors'
maintainer_email 'caleb@land.fm'
license 'mit'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'delivery-truck'
