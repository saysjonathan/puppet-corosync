# = Class: corosync::package
# This class manages corosync package
#
# == Parameters:
# $package:: Name(s) of the corosync package(s). Defaults differ according to distro (see corosync::defaults) [String, Array]
#
# == Sample Usage:
# The $package param can also be changed from the main corosync interface:
#   class { corosync:
#     bindnetaddr => '33.33.33.0',
#     mcastaddr   => '226.94.1.1',
#     authkey     => $authkey,
#     crm         => 'pacemaker',
#     package     => 'corosync-dev'
#   }

class corosync::package (
  $package
) {

  package { $package:
    ensure => installed
  }
}
