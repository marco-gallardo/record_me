require 'rails/generators'

module RecordMe
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path('../assets', __FILE__)

    desc "This generator adds all RecordMe required files to your assets"

    # all public methods in here will be run in order
    def copy_assets
      copy_file "../../assets/javascripts/jRecorder.js", "app/assets/javascripts/jRecorder.js"
      copy_file "../../assets/swfs/jRecorder.swf", "app/assets/swfs/jRecorder.swf"
    end
  end
end
