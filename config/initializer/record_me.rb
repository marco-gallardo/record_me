module RecordMe

  # the Authorization configuration file path
  @file = Dir.pwd + '/config/record_me.yml' 

  # Configuration defaults
  @config = {
              "top" => '40%',
              "left" => '40%',
              "time" => 30,
              "name" => 'record.wav',
              "destination" => 'public/records'
            }

  @valid_config_keys = @config.keys

  # Configure
  def self.configure
    if @file
      # interpret it using YAML using the current environment to extract the configuration
      @config = YAML.load( ERB.new( @file.read ).result )[ Rails.env ] 
    end 

    # creates directory where all records will be saved
    directory = Dir.pwd + "/#{@config['destination']}"
    Dir.mkdir(directory) unless File.directory?(directory)
  end

  def self.configuration
    @config
  end
end

RecordMe.configure
