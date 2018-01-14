plan cog::app_deploy (
  $app_servers = 'foo.company.com,bar.company.com',
  $database = 'baz.company.com'
) {

  # trigger pluginsync on the agents first, just a shell script
  # pcp:// url uses the same communication as Puppet Jobs
  $app_servers.split(',').each |$a| {
    run_task('cog::pluginsync', "pcp://${a}")
  }

  run_task('cog::build', "pcp://${database}", version => '2.4')

  $app_servers.split(',').each |$b| {
    run_task('cog::deploy', "pcp://${b}", message => 'hello world', version => '2.4' )
  }

}
