#
# Cookbook Name:: data_collector_test
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
Chef::Config[:ssl_verify_mode] = :verify_none
Chef::Config[:verify_api_cert] = false

include_recipe 'opsworks-bootstrap::_sudo'

ENV["ARTIFACTORY_USERNAME"] = "jkeiser@chef.io"
ENV["ARTIFACTORY_PASSWORD"] = ""

opsworks_bootstrap_all_in_one "all in one" do
  accept_license true
  chef_server_channel :unstable
  #chef-server-core-12.7.0+20160627195358-1.el7.x86_64.rpm.metadata.json
  chef_server_version "12.7.0+20160627195358"
end
