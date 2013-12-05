require "record_me/controller.rb"
require "record_me/helpers.rb"
require "generators/install_generator.rb"
require "generators/initialize_generator.rb"

ActiveSupport.on_load(:action_controller) do
  include RecordMe::Controller
end

ActiveSupport.on_load(:action_view) do
  include RecordMe::Helpers
end

