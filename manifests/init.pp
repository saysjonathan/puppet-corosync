# = Class: corosync
# This class manages corosync and it's configuration
# 
# == Parameters:
# See corosync subclasses for more info on each parameter. Required parameters include:
#
# $bindnetaddr:: Network address to bind to. May be IPv6 [String]
# $mcastaddr:: Multicast address used. May be IPv6 [String]
# $authkey:: Private key to authenticate nodes [String]
# $crm:: Resource manager running on corosync. Necessary for service restarts [String]
#
# == Sample Usage:
# This class is used to manage the whole of corosync through a single interface. Only the 'bindnetaddr', 'authkey', 'mcastaddr', and 'crm' parameters are required:
#
# class { 'corosync':
#   bindnetaddr => '33.33.33.0',
#   mcastaddr   => '226.94.1.1',
#   authkey     => $authkey,
#   crm         => 'pacemaker'
# }

class corosync (
  $service                           = $service,
  $package                           = $package,
  $amf                               = $amf,
  $authfile                          = $authfile,
  $authkey                           = $authkey,
  $bindnetaddr,
  $broadcast                         = $broadcast,
  $compatibility                     = $compatibility,
  $config                            = $config,
  $config_version                    = $config_version,
  $consensus                         = $consensus,
  $crm,
  $downcheck                         = $downcheck,
  $fail_recv_const                   = $fail_recv_const,
  $fileline                          = $fileline,
  $function_name                     = $function_name,
  $heartbeat_failures_allowed        = $heartbeat_failures_allowed,
  $hold                              = $hold,
  $join                              = $join,
  $logfile                           = $logfile,
  $logfile_priority                  = $logfile_priority,
  $logger_debug                      = $logger_debug,
  $logger_subsys                     = $logger_subsys,
  $logger_subsys_debug               = $logger_subsys_debug,
  $max_messages                      = $max_messages,
  $max_network_delay                 = $max_network_delay,
  $mcastaddr,
  $mcastport                         = $mcastport,
  $members                           = $members,
  $merge                             = $merge,
  $miss_count_const                  = $miss_count_const,
  $netmtu                            = $netmtu,
  $nodeid                            = $nodeid,
  $ringnumber                        = $ringnumber,
  $rrp_autorecovery_check_timeout    = $rrp_autorecovery_check_timeout,
  $rrp_mode                          = $rrp_mode,
  $rrp_problem_count_timeout         = $rrp_problem_count_timeout,
  $rrp_problem_count_threshold       = $rrp_problem_count_threshold,
  $rrp_problem_count_mcast_threshold = $rrp_problem_count_mcast_threshold,
  $rrp_token_expired_timeout         = $rrp_token_expired_timeout,
  $secauth                           = $secauth,
  $seqno_unchanged_const             = $seqno_unchanged_const,
  $service_version                   = $service_version,
  $service_use_mgmtd                 = $service_use_mgmtd,
  $service_use_logd                  = $service_use_logd,
  $syslog_facility                   = $syslog_facility,
  $syslog_priority                   = $syslog_priority,
  $threads                           = $threads,
  $timestamp                         = $timestamp,
  $to_stderr                         = $to_stderr,
  $to_logfile                        = $to_logfile,
  $to_syslog                         = $to_syslog,
  $token                             = $token,
  $token_retransmit                  = $token_retransmit,
  $ttl                               = $ttl,
  $transport                         = $transport,
  $window_size                       = $window_size
) inherits corosync::defaults {
  
  Corosync::Anchor["${module_name}::begin"] -> Class["${module_name}::package"] -> Class["${module_name}::config"] -> Class["${module_name}::service"] -> Corosync::Anchor["${module_name}::end"]
  
  corosync::anchor { "${module_name}::begin": }

  class { "${module_name}::package":
    package => $package
  }

  class { "${module_name}::config":
    authfile                          => $authfile,
    authkey                           => $authkey,
    config                            => $config,
    config_version                    => $config_version,
    amf                               => $amf,
    compatibility                     => $compatibility,
    nodeid                            => $nodeid,
    rrp_mode                          => $rrp_mode,
    netmtu                            => $netmtu,
    secauth                           => $secauth,
    threads                           => $threads,
    transport                         => $transport,
    token                             => $token,
    token_retransmit                  => $token_retransmit,
    hold                              => $hold,
    join                              => $join,
    consensus                         => $consensus,
    merge                             => $merge,
    downcheck                         => $downcheck,
    fail_recv_const                   => $fail_recv_const,
    seqno_unchanged_const             => $seqno_unchanged_const,
    heartbeat_failures_allowed        => $heartbeat_failures_allowed,
    max_network_delay                 => $max_network_delay,
    window_size                       => $window_size,
    max_messages                      => $max_messages,
    miss_count_const                  => $miss_count_const,
    rrp_problem_count_timeout         => $rrp_problem_count_timeout,
    rrp_problem_count_threshold       => $rrp_problem_count_threshold,
    rrp_problem_count_mcast_threshold => $rrp_problem_count_mcast_threshold,
    rrp_token_expired_timeout         => $rrp_token_expired_timeout,
    rrp_autorecovery_check_timeout    => $rrp_autorecovery_check_timeout,
    ringnumber                        => $ringnumber,
    bindnetaddr                       => $bindnetaddr,
    broadcast                         => $broadcast,
    mcastaddr                         => $mcastaddr,
    mcastport                         => $mcastport,
    ttl                               => $ttl,
    members                           => $members,
    timestamp                         => $timestamp,
    fileline                          => $fileline,
    function_name                     => $function_name,
    to_stderr                         => $to_stderr,
    to_logfile                        => $to_logfile,
    logfile                           => $logfile,
    logfile_priority                  => $logfile_priority,
    syslog_facility                   => $syslog_facility,
    syslog_priority                   => $syslog_priority,
    to_syslog                         => $to_syslog,
    logger_debug                      => $logger_debug,
    logger_subsys                     => $logger_subsys,
    logger_subsys_debug               => $logger_subsys_debug,
    service                           => $service,
    service_version                   => $service_version,
    service_use_mgmtd                 => $service_use_mgmtd,
    service_use_logd                  => $service_use_logd,
  }

  class { "${module_name}::service":
    service => $service,
    crm     => $crm
  }

  corosync::anchor { "${module_name}::end": }
} 
