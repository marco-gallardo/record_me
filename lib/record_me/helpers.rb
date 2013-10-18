module RecordMe
  module Helpers

    def record_me_location
      content_tag :div, id: 'recorder_location' do
      end
    end
    
    def record_me_start(klass)
      content_tag :div, id: 'recorder_start', class: klass do
      end
    end
    
    def record_me_stop(klass)
      content_tag :div, id: 'recorder_stop', class: klass do
      end
    end
    
    def record_script(audio_path = '', time_lapse = 30)
      javascript_tag do
        ("var recorderLocation = $('#recorder_location')[0];\n\
          var recorderStart = $('#recorder_start')[0];\n\
          var recorderStop = $('#recorder_stop')[0];\n\
          $.jRecorder(\n\
          {\n\
            host:\"#{audio_path}?filename=audio.wav\",\n\
            callback_started_recording: function(){callback_started(); },\n\
            callback_stopped_recording: function(){callback_stopped(); },\n\
            callback_activityLevel: function(level){callback_activityLevel(level); },\n\
            callback_activityTime: function(time){callback_activityTime(time);},\n\
            callback_finished_sending: function(time){ callback_finished_sending() },\n\
            swf_path : \"/assets/jRecorder.swf\",\n\
          }, $(recorderLocation));\n\

          $(recorderStart).click(function(){\n
            $.jRecorder.record(#{time_lapse});\n
          });\n

          $(recorderStop).click(function(){\n
            $.jRecorder.stop();\n
          });\n
        ").html_safe
      end
    end

  end
end
