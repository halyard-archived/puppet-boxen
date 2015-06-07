Puppet::Bindings.newbindings('boxen::default') do
  bind {
    name         'boxen'
    to           'function'
    in_multibind 'puppet::module_data'
  }
end
