# Private: Ensure we can run Boxen and launchctl without sudo prompt

class boxen::sudoers {
  $boxen_commands = [
    '/bin/mkdir -p /tmp/puppet',
    "/bin/mkdir -p ${::boxen_home}",
    "/usr/sbin/chown ${::boxen_user}\\:staff ${::boxen_home}",
    "${boxen::config::repodir}/bin/puppet",
    '/bin/rm -f /tmp/boxen.log'
  ]

  $launchctl_commands = [
    '/bin/launchctl load',
    '/bin/launchctl unload'
  ]

  sudoers::allowed_command{ 'boxen_repo':
    command          => join($boxen_commands, ','),
    user             => $::boxen_user,
    require_password => false,
    comment          => 'Allows boxen user to manipulate boxen and puppet',
    require_exist    => false
  }

  sudoers::allowed_command{ 'boxen_launchct':
    command          => join($launchctl_commands, ','),
    user             => $::boxen_user,
    require_password => false,
    comment          => 'Allow boxen user to control services',
    require_exist    => false
  }
}
