#
# Cookbook:: meat-and-potatoes
# Recipe:: default
#
# The MIT License (MIT)
#
# Copyright:: 2017, Caleb Land
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

include_recipe 'apt::default'

apt_repository 'bullseye-backports' do
  uri        'http://deb.debian.org/debian/'
  distribution 'bullseye-backports'
  components ['main']
end

include_recipe 'meat-and-potatoes::firewall'
include_recipe 'meat-and-potatoes::sshguard'
include_recipe 'meat-and-potatoes::ssh_known_hosts'
include_recipe 'meat-and-potatoes::swap'
include_recipe 'meat-and-potatoes::apt-transport-https'
include_recipe 'meat-and-potatoes::logrotate'
