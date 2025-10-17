STDOUT.sync = STDERR.sync = true unless Rake.application.options.always_multitask

def setup_option(conf)
  conf.cc.compile_options.sub!(%r{/Zi }, "") unless ENV['CFLAGS']
  conf.cxx.compile_options.sub!(%r{/Zi }, "") unless ENV['CFLAGS'] || ENV['CXXFLAGS']
  conf.linker.flags << "/DEBUG:NONE" unless ENV['LDFLAGS']
end

MRuby::Build.new do |conf|
  conf.toolchain :visualcpp

  conf.gem :github => 'buty4649/mruby-yyjson', :branch => 'main'

  # include all core GEMs
  conf.gembox 'full-core'
  conf.compilers.each do |c|
    c.defines += %w(MRB_UTF8_STRING)
  end
  setup_option(conf)
end
