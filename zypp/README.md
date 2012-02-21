Description
===========

Configures zypp package management on SUSE-based systems. Configures various YUM components on Red Hat-like systems.  Includes LWRP for managing repositories.

Changes
=======

## v1.0.0:

* Initial version, based on the yum cookbook.

Requirements
============

openSUSE, for now, SLE only later.

Resources/Providers
===================

repository
----------

This LWRP provides an easy way to manage additional zypp repositories.

# Actions

- :add: creates a repository file and builds the repository listing
- :remove: removes the repository file

# Attribute Parameters

- repo_name: name attribute. The name of the channel to discover
- description. The description of the repository
- url: The URL providing the packages

- enabled: Default is `1`, set to `0` if the repository is disabled.
- type: Optional, alternate type of repository

# Example

``` ruby
# add the Zenoss repository
zypp_repository "zenoss" do
  name "Zenoss Stable repo"
  url "http://dev.zenoss.com/yum/stable/"
  key "RPM-GPG-KEY-zenoss"
  action :add
end
    
# remove Zenoss repo
zypp_repository "zenoss" do
  action :remove
end
```


License and Author
==================

Author:: Eric G. Wolfe
Author:: Matt Ray (<matt@opscode.com>)
Author:: Joshua Timberman (<joshua@opscode.com>)
Author:: Martin Vidner (<mvidner@suse.cz>)

Copyright:: 2010 Tippr Inc.
Copyright:: 2011 Eric G. Wolfe
Copyright:: 2011 Opscode, Inc.
Copyright:: 2012 Martin Vidner

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
