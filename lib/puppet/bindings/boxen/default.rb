Puppet::Bindings.newbindings('puppet-boxen::default') do
  bind {
    name         'puppet-boxen'
    to           'function'
    in_multibind 'puppet::module_data'
  }
end
