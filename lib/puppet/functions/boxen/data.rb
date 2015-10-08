Puppet::Functions.create_function(:'boxen::data') do
  def data
    home = closure_scope.lookupvar('::boxen_home')
    {
      'boxen::config::home'                   => home,
      'boxen::config::bindir'                 => "#{home}/bin",
      'boxen::config::cachedir'               => "#{home}/cache",
      'boxen::config::configdir'              => "#{home}/config",
      'boxen::config::datadir'                => "#{home}/data",
      'boxen::config::envdir'                 => "#{home}/env.d",
      'boxen::config::logdir'                 => "#{home}/log",
      'boxen::config::socketdir'              => "#{home}/data/project-sockets",
      'boxen::config::homebrewdir'            => closure_scope.lookupvar('::homebrew_root'),
      'boxen::config::repodir'                => closure_scope.lookupvar('::boxen_repodir'),
      'boxen::config::reponame'               => closure_scope.lookupvar('::boxen_reponame'),
      'boxen::config::srcdir'                 => closure_scope.lookupvar('::boxen_srcdir'),
      'boxen::config::login'                  => closure_scope.lookupvar('::github_login'),
      'boxen::config::repo_url_template'      => closure_scope.lookupvar('::boxen_repo_url_template'),
      'boxen::config::download_url_base'      => closure_scope.lookupvar('::boxen_download_url_base'),
      'boxen::config::hiera_merge_hierarchy'  => false
    }
  end
end
