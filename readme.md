Running this:

Ensure that on your puppet master (or server running this) you have bolt installed:

/opt/puppetlabs/puppet/bin/gem install bolt

You also need to have PE client tools setup and working, if not using your puppet server, go see: https://puppet.com/docs/pe/2017.3/installing/installing_pe_client_tools.html

You need authentication to run these commands via client tools:

`puppet access login --lifetime 4h`

Will authorize commands for the next 4 hours.

You will need to specify the nodes (and defined as parameters in app_deploy.pp) at the commandline, along with the module path, like so:

`/opt/puppetlabs/puppet/bin/bolt plan run cog::app_deploy app_servers='i-0e82ed3b36f04c99a' database='i-0185ff24df8443e80' --modulepath /etc/puppetlabs/code/environments/production/modules/ --debug`


Output would be as follows:

```
2018-01-14T01:06:53.874412  NOTICE executor: Starting task /etc/puppetlabs/code/environments/production/modules/cog/tasks/pluginsync.sh on ["pcp://i-0e82ed3b36f04c99a"]
2018-01-14T01:06:53.874480  DEBUG executor: Arguments: {} Input method: both
2018-01-14T01:06:53.874599  DEBUG executor: Started with 1 thread(s)
2018-01-14T01:06:53.874821  DEBUG executor: Running task run '/etc/puppetlabs/code/environments/production/modules/cog/tasks/pluginsync.sh' on pcp://i-0e82ed3b36f04c99a
2018-01-14T01:06:56.538593  DEBUG executor: Result on pcp://i-0e82ed3b36f04c99a: {"_output":"No plugins downloaded.\n"}
2018-01-14T01:06:56.538809  NOTICE executor: Ran task '/etc/puppetlabs/code/environments/production/modules/cog/tasks/pluginsync.sh' on 1 node with 0 failures
2018-01-14T01:06:56.540207  NOTICE executor: Starting task /etc/puppetlabs/code/environments/production/modules/cog/tasks/build.pp on ["pcp://i-0185ff24df8443e80"]
2018-01-14T01:06:56.540247  DEBUG executor: Arguments: {"version"=>"2.4"} Input method: both
2018-01-14T01:06:56.540347  DEBUG executor: Started with 1 thread(s)
2018-01-14T01:06:56.540497  DEBUG executor: Running task run '/etc/puppetlabs/code/environments/production/modules/cog/tasks/build.pp' on pcp://i-0185ff24df8443e80
2018-01-14T01:06:59.047231  DEBUG executor: Result on pcp://i-0185ff24df8443e80: {"_output":"\u001b[mNotice: Compiled catalog for ip-172-31-18-231.us-west-2.compute.internal in environment production in 0.03 seconds\u001b[0m\n\u001b[mNotice: Applied catalog in 0.06 seconds\u001b[0m\n"}
2018-01-14T01:06:59.047437  NOTICE executor: Ran task '/etc/puppetlabs/code/environments/production/modules/cog/tasks/build.pp' on 1 node with 0 failures
2018-01-14T01:06:59.049191  NOTICE executor: Starting task /etc/puppetlabs/code/environments/production/modules/cog/tasks/deploy.pp on ["pcp://i-0e82ed3b36f04c99a"]
2018-01-14T01:06:59.049232  DEBUG executor: Arguments: {"message"=>"hello world", "version"=>"2.4"} Input method: both
2018-01-14T01:06:59.049338  DEBUG executor: Started with 1 thread(s)
2018-01-14T01:06:59.049491  DEBUG executor: Running task run '/etc/puppetlabs/code/environments/production/modules/cog/tasks/deploy.pp' on pcp://i-0e82ed3b36f04c99a
2018-01-14T01:07:01.637818  DEBUG executor: Result on pcp://i-0e82ed3b36f04c99a: {"_output":"\u001b[mNotice: Compiled catalog for ip-172-31-31-162.us-west-2.compute.internal in environment production in 0.03 seconds\u001b[0m\n\u001b[mNotice: Applied catalog in 0.09 seconds\u001b[0m\n"}
2018-01-14T01:07:01.637995  NOTICE executor: Ran task '/etc/puppetlabs/code/environments/production/modules/cog/tasks/deploy.pp' on 1 node with 0 failures
[
  "i-0e82ed3b36f04c99a"
]
```
