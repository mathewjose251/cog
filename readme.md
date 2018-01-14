Running this:

Ensure that on your puppet master (or server running this) you have bolt installed:

/opt/puppetlabs/puppet/bin/gem install bolt

You also need to have PE client tools setup and working, if not using your puppet server, go see: https://puppet.com/docs/pe/2017.3/installing/installing_pe_client_tools.html

You need authentication to run these commands via client tools:

`puppet access login --lifetime 4h`

Will authorize commands for the next 4 hours.
