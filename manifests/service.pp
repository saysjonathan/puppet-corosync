# = Class: corosync::service
# This class manages the corosync service
#
# == Parameters:
# $service:: Name of the corosync service. Defaults to 'corosync' (See corosync::defaults) [String]
# $crm:: Name of the resource manager running on top of corosync [String]
#
# == Sample Usage:
# If your service name is not 'corosync', simply override the default value for
# the $service parameter:
#   class { corosync::service:
#     bindnetaddr => '33.33.33.0',
#     mcastaddr   => '226.94.1.1',
#     authkey     => $authkey,
#     service => 'corosyncd',
#     crm     => 'pacemaker'
#   }
#
# The $service and $crm parameters can also be changed from the main corosync interface:
#   class { corosync:
#     bindnetaddr => '33.33.33.0',
#     mcastaddr   => '226.94.1.1',
#     authkey     => $authkey,
#     crm         => 'pacemaker',
#     service     => 'corosyncd'
#   }

class corosync::service (
  $service,
  $crm
) {

  if $::corosync_status == 'running' {
    service { $service:
      ensure     => running,
      enable     => true,
      hasstatus  => true,
      hasrestart => true,
      restart    => "service ${crm} stop && service corosync restart && service ${crm} start"
    }
  } else {
    service { $service:
      ensure     => running,
      enable     => true,
      hasstatus  => true,
      hasrestart => true
    }
  }
}
