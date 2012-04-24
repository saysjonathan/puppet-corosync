# = Class corosync::defaults
# This class provides default values for all corosync classes.
#
# == Parameters
# Most parameters can be overridden from the main corosync interface

class corosync::defaults {
  
  # OS specific corosync defaults
  case $operatingsystem {
    Debian,Ubuntu: {
      $package = 'pacemaker'
    }
    CentOS,RedHat,CloudLinux: {
      $package = 'corosync'
    }
    default: {
      err( "${module_name} has not yet been implemented on $operatingsystem" )
    }
  }

  # corosync::config defaults
  $amf                               = 'disabled'
  $authfile                          = '/etc/corosync/authkey'
  $authkey                           = false
  $broadcast                         = 'no'
  $compatibility                     = 'whitetank'
  $config                            = '/etc/corosync/corosync.conf'
  $config_version                    = 2 # This is the only valid version
  $consensus                         = 1200
  $downcheck                         = 1000
  $fail_recv_const                   = 2500
  $fileline                          = 'off'
  $function_name                     = 'off'
  $heartbeat_failures_allowed        = 0
  $hold                              = 100
  $join                              = 50
  $logfile                           = '/var/log/corosync.log'
  $logfile_priority                  = 'info'
  $logger_debug                      = 'off'
  $logger_subsys                     = false
  $logger_subsys_debug               = false
  $max_messages                      = 17
  $max_network_delay                 = 50
  $mcastaddr                         = '127.0.0.1'
  $mcastport                         = '4000'
  $members                           = false
  $merge                             = 200
  $miss_count_const                  = 5
  $netmtu                            = 1500
  $nodeid                            = false
  $ringnumber                        = 0
  $rrp_autorecovery_check_timeout    = 1000
  $rrp_mode                          = 'none'
  $rrp_problem_count_timeout         = 2000
  $rrp_problem_count_threshold       = 10
  $rrp_problem_count_mcast_threshold = 100
  $rrp_token_expired_timeout         = 47
  $secauth                           = 'on'
  $seqno_unchanged_const             = 30
  $service_version                   = 2
  $service_use_mgmtd                 = 'yes'
  $service_use_logd                  = 'yes'
  $syslog_facility                   = 'daemon'
  $syslog_priority                   = 'info'
  $threads                           = 0
  $timestamp                         = 'off'
  $to_stderr                         = 'no'
  $to_logfile                        = 'yes'
  $to_syslog                         = 'yes'
  $token                             = 1000
  $token_retransmit                  = 238
  $ttl                               = 1
  $transport                         = 'udp'
  $window_size                       = 50

  # corosync::service defaults
  $service                           = 'corosync'
  $crm                               = 'pacemaker'
}
