module RecordMe
  module Rec
    def record(filename = params[:filename])
      audio = request.raw_post
      File.open(filename, 'w+b'){|file| file.puts audio}
    end 
  end
end

