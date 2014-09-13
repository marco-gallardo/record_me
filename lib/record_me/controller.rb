module RecordMe
  module Controller
    def record_me_save(filename = params[:filename])
      audio           = request.raw_post
      file_with_path = RecordMe.configuration["destination"] + "/" + filename

      return save_file(file_with_path, audio)
    end 

    private

    def save_file(file_with_path, audio)
      File.open(file_with_path, 'w+b'){|file| file.puts audio}

      File.exist?(file_with_path) ? true : false  
    end

  end
end

