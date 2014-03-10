#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "ntp" do
  action :install
end

service "ntpd" do
  supports :status=>true,:restart=>true,:reload=>true
  action [:enable,:start]
end
