module RecordMe
  module Rec
    def record_me_save(filename = params[:filename])
      audio = request.raw_post
      File.open(filename, 'w+b'){|file| file.puts audio}
      File.exist?(filename) ? true : false  
    end 
  end
end

