require 'rails/generators'

module RecordMe
  class InitializeGenerator < ::Rails::Generators::Base
    source_root File.expand_path('..', __FILE__)

    desc "This generator adds all RecordMe configuration files to your app"

    # copy config files
    def copy_initializer_file

      copy_file "../../config/initializer/record_me.rb", "config/initializers/record_me.rb"
      copy_file "../../config/record_me.yml", "config/record_me.yml"
    end
  end
end
