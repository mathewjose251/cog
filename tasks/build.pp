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

file { '/tmp/bar.txt':
  ensure => file,
  source => 'puppet:///modules/cog/bar.txt',
}


package {'ntp':
  ensure  => present,
  require => File['/tmp/foo.txt']
}
