require "record_me/version.rb"
require "record_me/rec.rb"
require "record_me/helpers.rb"
require "generators/install_generator.rb"

ActiveSupport.on_load(:action_controller) do
  include RecordMe::Rec
end

ActiveSupport.on_load(:action_view) do
  include RecordMe::Helpers
end
