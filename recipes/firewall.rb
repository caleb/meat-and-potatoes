#
# Cookbook:: meat-and-potatoes
# Recipe:: firewall
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

include_recipe 'firewall::default'

firewall 'default' do
  action :install
end

actions = [:log, :redirect, :masquerade, :reject, :deny, :allow]
protocols = [:tcp, :udp, :icmp, :none]

node['meat-and-potatoes']['firewall']['ports'].each do |p|
  action, protocol, port = if p.is_a? Array
                     spec = p.to_a

                     actions = spec.select { |i| actions.include?(i.to_sym) }
                     action = actions.first || :allow

                     protocols = spec.select { |i| protocols.include?(i.to_sym) }
                     protocol = protocols.first || :tcp

                     ports = spec.select { |i| i.is_a? Integer }
                     from, to = ports[0], ports[1]

                     if from.nil?
                       raise "#{spec} is not a valid port spec (either an int, or an array of form: [<command>, <protocol>, <from>, <to>]." + \
                             "Only the from port is absolutely required"
                     end

                     if to
                       [action.to_sym, protocol.to_sym, from..to]
                     else
                       [action.to_sym, protocol.to_sym, from]
                     end
                   else
                     [:allow, :tcp, p]
                   end

  firewall_rule "port-#{p}" do
    port port
    protocol protocol
    command :allow
  end
end
