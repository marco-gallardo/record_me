require File.expand_path( '../../../lib/authorization/configuration', __FILE__ )
#require 'yaml'

module RecordMe

  # the Authorization configuration file path
  @file = Rails.root.join( 'config', 'record_me.yml' )

  # Configuration defaults
  @config = {
              :top => '40%',
              :left => '40%',
              :time => 30
            }

  @valid_config_keys = @config.keys

  # Configure through hash
  def self.configure(opts = {})
    if @file
      # interpret it using YAML using the current environment to extract 
      # the configuration
      @config = YAML.load( ERB.new( file.read ).result )[ Rails.env ] 
    else
      # use default hash configuration
      opts.each {|k,v| @config[k.to_sym] = v if @valid_config_keys.include? k.to_sym}
    end 

    create_destination_directory
  end

  # creates directory where all records will be saved
  def create_destination_directory
    directory = File.join(Rails.root, RecordMe.configuration[:destination])
    Dir.mkdir(directory) unless File.directory?(directory)
  end

  def self.configuration
    @config
  end
end
