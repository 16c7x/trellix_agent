# Class: trellix_agent
#
# Install and configure the Trellix agent on Linux
#
# === Parameters
#
# @param agent_install_script
#   String
#   Installation script being run.
#
# @param agent_install_options
#   String
#   Installation options for script being run.
#   Default -i to install
#
# @param agent_service_name
#   String
#   Name of the Agent Service
#
class mcafee_epo_agent (
  String  $agent_install_script   = 'puppet:///modules/trellix_agent/install.sh',
  String  $agent_install_options  = '-i',
  String  $agent_service_name     = 'ma',
) {
  file { '/tmp/install.sh':
    ensure => 'file',
    source => $agent_install_script,
    mode   => '0700',
    owner  => 'root',
    group  => 'root',
  }

  exec { 'Install':
    command => "/tmp/install.sh ${agent_install_options}",
    creates => '/opt/McAfee/agent/license.txt',
    user    => root,
  }

  service { $agent_service_name:
    ensure => running,
    enable => true,
  }
}
