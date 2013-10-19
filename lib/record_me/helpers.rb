module RecordMe
  module Helpers
    
    def record_script(options = {})
      javascript_tag do
        ("\n\
          $('body').prepend('<div id=record_me_location></div>');\n\
          var recorderLocation = $('#record_me_location')[0];\n\
          var recorderStart = $('.record_me_play')[0];\n\
          var recorderStop = $('.record_me_stop')[0];\n\
          var recorderReproduce = $('.record_me_reproduce')[0];\n\
          $.jRecorder(\n\
          {\n\
            rec_top: \"#{options[:rec_top] || '40%'}\",\n\
            rec_left: \"#{options[:rec_left] || '40%'}\",\n\
            host:\"#{options[:receive_audio_path] || ''}?filename=audio.wav\",\n\
            callback_started_recording: function(){callback_started(); },\n\
            callback_stopped_recording: function(){callback_stopped(); },\n\
            callback_activityLevel: function(level){callback_activityLevel(level); },\n\
            callback_activityTime: function(time){callback_activityTime(time);},\n\
            callback_finished_sending: function(time){ callback_finished_sending() },\n\
            swf_path : \"/assets/jRecorder.swf\",\n\
          }, $(recorderLocation));\n\

          $(recorderStart).click(function(){\n\
            $.jRecorder.record(#{options[:time_lapse] || 30});\n\
          });\n\

          $(recorderStop).click(function(){\n\
            $.jRecorder.stop();\n\
          });\n\

          $(recorderReproduce).click(function(){\n\
            //jRecorder doesn't have an option to reproduce the clip, by stopping it we can accomplish that\n\
            $.jRecorder.stop();\n\
          });\n\

          function callback_activityTime(time)\n\
          {\n\
            var time = parseInt(time);\n\
            var minutes = Math.floor(time/60);\n\
            var seconds = time % 60;\n\
            timer(time, minutes, seconds);\n\
          };\n\

          function timer(time, minutes, seconds){\n\
            seconds = ((time % 60) < 10) ? ('0' + seconds.toString()) : seconds.toString();\n\
            $('.record_me_timer').html(minutes.toString() + ':' + seconds.toString());\n\
          };\n\

        ").html_safe
      end
    end

  end
end
