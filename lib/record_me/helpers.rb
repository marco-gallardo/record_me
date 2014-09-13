module RecordMe
  module Helpers
    
    def flash_warning_message(html_element)
      javascript_tag do
       (" 
          $(function() {\n\
            var flash_supported = (typeof navigator.plugins != \"undefined\" && typeof navigator.plugins[\"Shockwave Flash\"] == \"object\");\n\
            if(!flash_supported){\n\
              var append_message = \".#{html_element || '.flash_warning_message'}\";\n\
              $(append_message).append(\"Please install <a href='https://get.adobe.com/flashplayer/' target='_blank'>Adobe Flash Player</a> to use RecordMe.\");\n\
            }\n\
          })\n\
        ").html_safe
      end
    end
    
    def record_me_js(options = {})
      javascript_tag do
        ("\n\
          $(function(){\n\
            $('body').prepend('<div id=record_me_location></div>');\n\
            var recorderLocation = $('#record_me_location')[0];\n\
            var recorderStart = $('.record_me_start')[0];\n\
            var recorderStop = $('.record_me_stop')[0];\n\
            var recorderSendData = $('.record_me_save')[0];\n\
            var recorderReproduce = $('.record_me_reproduce')[0];\n\
            $.jRecorder(\n\
            {\n\
              rec_top: \"#{options[:top] || RecordMe.configuration['top']}\",\n\
              rec_left: \"#{options[:left] || RecordMe.configuration['left']}\",\n\
              host: \"#{options[:save_path] || ''}?filename=#{options[:name] || RecordMe.configuration['name']}\",\n\
              callback_started_recording: function(){callback_started(); },\n\
              callback_stopped_recording: function(){callback_stopped(); },\n\
              callback_activityLevel: function(level){callback_activityLevel(level); },\n\
              callback_activityTime: function(time){callback_activityTime(time);},\n\
              callback_finished_sending: function(time){ callback_finished_sending() },\n\
              swf_path : \"/assets/jRecorder.swf\",\n\
            }, $(recorderLocation));\n\

            $(recorderStart).click(function(){\n\
              $.jRecorder.record(#{options[:time] || 30});\n\
            });\n\

            $(recorderStop).click(function(){\n\
              $.jRecorder.stop();\n\
            });\n\

            $(recorderReproduce).click(function(){\n\
              //jRecorder doesn't have an option to reproduce the clip, by stopping it we can accomplish that\n\
              $.jRecorder.stop();\n\
            });\n\

            $(recorderSendData).click(function(){\n\
              $.jRecorder.sendData();
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
          })\n\

        ").html_safe
      end
    end

  end
end
