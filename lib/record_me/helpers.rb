module RecordMe
  module Helpers

    def record_tag
      content_tag :div, class: 'location_recorder' do
      end
    end
    
    def record_script(audio_path = '')
      javascript_tag do
        ("var locationRecorder = $('#location_recorder')[0];\n\
        $.jRecorder(\n\
          {\n\
            host:\"#{audio_path}?filename=audio.wav\",\n\
            callback_started_recording: function(){callback_started(); },\n\
            callback_stopped_recording: function(){callback_stopped(); },\n\
            callback_activityLevel: function(level){callback_activityLevel(level); },\n\
            callback_activityTime: function(time){callback_activityTime(time);},\n\
            callback_finished_sending: function(time){ callback_finished_sending() },\n\
            swf_path : \"/assets/jRecorder.swf\",\n\
          }, $(locationRecorder));\n\
        ").html_safe
      end
    end

  end
end
