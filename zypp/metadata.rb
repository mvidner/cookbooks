maintainer        "Martin Vidner"
maintainer_email  "mvidner@suse.cz"
license           "Apache 2.0"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.0"
recipe            "yum", "Runs 'yum update' during compile phase"
recipe            "zypp::repository", "adds or removes repositories"

%w{ suse }.each do |os|
  supports os
end

