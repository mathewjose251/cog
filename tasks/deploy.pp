#!/opt/puppetlabs/bin/puppet apply

# puppet tasks sets params as environment variables
# this lets us read those env vars as puppet values
# this will be cleaned up in future versions
function task_parameter($name) { inline_template("<%= ENV['PT_${name}'] %>") }

$file_message = task_parameter('message')
$file_version = task_parameter('version')

file { "/tmp/foo-${file_version}.txt":
  ensure   => present,
  content  => "${file_message}",
}

package {'ntp':
  ensure  => present,
  require => File["/tmp/foo-${file_version}.txt"],
}

service {'ntpd':
  ensure  => running,
  enable  => true,
  require => Package['ntp'],
}
