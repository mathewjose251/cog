#!/opt/puppetlabs/bin/puppet apply

# puppet tasks sets params as environment variables
# this lets us read those env vars as puppet values
# this will be cleaned up in future versions
function task_parameter($name) { inline_template("<%= ENV['PT_${name}'] %>") }

$file_contents = task_parameter('version')

file { '/tmp/foo.txt':
  ensure   => present,
  content  => "${file_contents}",
}

# for the below to work, you need to add
# [user]
# certname = $certname
# in the targets puppet.conf file
# also note the hardcoded servername, which could be a parameter
#file { '/tmp/bar.txt':
#  ensure => file,
#  source => 'puppet://$puppetservername/modules/cog/bar.txt',
#}

package {'ntp':
  ensure  => present,
  require => File['/tmp/foo.txt']
}
