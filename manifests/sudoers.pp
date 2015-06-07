# Private: Ensure we can run Boxen and launchctl without sudo prompt

class boxen::sudoers {
  $boxen_commands = [
    '/bin/mkdir -p /tmp/puppet',
    "/bin/mkdir -p ${::boxen_home}",
    "/usr/sbin/chown ${::boxen_user}:staff ${::boxen_home}",
    "${boxen::config::repodir}/bin/puppet",
    '/bin/rm -f /tmp/boxen.log',
    '/bin/launchctl load',
    '/bin/launchctl unload'
  ]

  file { '/etc/sudoers.d':
    ensure => 'directory',
  } ->
  #file_line { 'include for sudoers.d':
  #  path => '/etc/sudoers',
  #  line => '#includedir /etc/sudoers.d',
  #} ->
  sudoers::allowed_command{ 'boxen':
    command          => join($boxen_commands, ','),
    user             => $::boxen_user,
    require_password => false,
    comment          => 'Allows boxen user to manipulate boxen and puppet',
    require_exist    => false
  }
}
