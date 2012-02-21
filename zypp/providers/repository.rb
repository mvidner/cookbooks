#
# Cookbook Name:: zypp
# Provider:: repository
#
# Copyright 2010, Tippr Inc.
# Copyright 2011, Opscode, Inc..
# Copyright 2012, Martin Vidner
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# note that deletion does not remove GPG keys, either from the repo or
# /etc/pki/rpm-gpg; this is a design decision.

action :add do
  repo_filename = "/etc/zypp/repos.d/#{new_resource.repo_name}.repo"
  unless ::File.exists?(repo_filename)
    Chef::Log.info "Adding #{new_resource.repo_name} repository to #{repo_filename}"
    #get the metadata
    execute "zypper refresh" do
      action :nothing
    end
    #write out the file
    template repo_filename do
      cookbook "zypp"
      source "repo.erb"
      mode "0644"
      variables({
                  :repo_name => new_resource.repo_name,
                  :description => new_resource.description,
                  :url => new_resource.url,
                  :type => new_resource.type,
                  :enabled => new_resource.enabled,
                  :autorefresh=> new_resource.autorefresh,
                  :keeppackages => new_resource.keeppackages
                })
      notifies :run, resources(:execute => "zypper refresh"), :immediately
    end
  end
end

action :remove do
  repo_filename = "/etc/zypp/repos.d/#{new_resource.repo_name}.repo"
  if ::File.exists?(repo_filename)
    Chef::Log.info "Removing #{new_resource.repo_name} repository from /etc/zypp/repos.d/"
    file repo_filename do
      action :delete
    end
    new_resource.updated_by_last_action(true)
  end
end
