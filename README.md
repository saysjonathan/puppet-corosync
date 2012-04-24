# puppet-corosync

## Description
This module provides a base class for managing corosync.

## Usage
### Manifests
Note: While any subclasses can be called independently, the main class is the preferred entry point.
      When calling subclasses, no defaults will be populated and you must provide values for all class parameters.

Corosync (probably) will never be used alone, so you must specify the CRM (cluster resource manager) you will be using with your newly created ring:

    class { 'corosync':
      bindnetaddr => '33.33.33.0',
      mcastaddr   => '226.94.1.1',
      authkey     => $authkey,
      crm         => 'pacemaker'
    }

Values for subclass parameters can be passed in through the main class. For example, to change the mcastport:
  
    class { 'corosync':
      bindnetaddr => '33.33.33.0',
      mcastaddr   => '226.94.1.1',
      mcastport   => 5647,
      authkey     => $authkey,
      crm         => 'pacemaker'
    }

If you wish to use an alternative corosync package, simply set to the value of the $pacakge parameter to your preferred package name:
  
    class { 'corosync';
      bindnetaddr => '33.33.33.0',
      mcastaddr   => '226.94.1.1',
      authkey     => $authkey,
      crm         => 'pacemaker',
      package     => 'corosync-dev'
    }

See each subclasse for a list of accepted parameters and the data type(s) expected.

### Facts
This module includes a single Facter fact, 'corosync\_status'. This fact is used to work around the fact that refresh events can trigger restarts, even if the service was just started (http://projects.puppetlabs.com/issues/7165). When using the Corosync MCP (master control process), Corosync must be restarted independently of any applications which may be using it's service. This fact ensures that the first restart doesn't fail, while still setting the restart command for future runs.
