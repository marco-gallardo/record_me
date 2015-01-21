# RecordMe

record_me gem is a very simple gem that allows you to record user's audio input by using a simple javascript interface and an already built flash object. If you have questions about why I opted using flash and other info, you might want to take a look to my post [What? Rails can't hear you? Use Flash!](http://www.tangosource.com/blog/What-rails-cant-hear-you-use-flash/)

## Installation

Add this line to your application's Gemfile:

    gem 'record_me'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install record_me

Run generators:

    $ rails generate record_me:install
    $ rails generate record_me:initialize

## Usage

## Configuration file

Specify default settings:

* __top__: sets top absolute position of flash object window. Default is 40%.
* __left__: sets left absolute position of flash object window. Default is 40%.
* __time__: sets recording limit of seconds; maximum available are 180 seconds (3 minutes). Default is 30 seconds.
* __name__: sets name of the record. Default is record.wav.
* __destination__: the folder where all your records will be placed. Default is public/records.

__top__, __left__, __time__, and __name__ can be overridden in your views as you will see next.

### In your view

Add next CSS class selectors to your HTML elements:

* __.record\_me\_timer__: attaches a counter in seconds to the element
* __.record\_me\_start__: when element with this selector is clicked, it triggers recording action
* __.record\_me\_stop__: when element with this selector is clicked, recording stops
* __.record\_me\_reproduce__: when element with this selector is clicked, recorded audio is reproduced
* __.record\_me\_save__: when element with this selector is clicked, recorded audio is sent to server

Then add next function to your view (since it will embed js code in your view you may want to add it at the bottom of your view/layout):

__record\_me\_js({save\_path: some\_path})__

where __save\_path__ is the path of the action where the recorded audio will be sent once element with .record\_me\_save class is clicked.

Also, you can pass *time, name, top, and left* values to override config/record_me.yml settings.

Example of how the code would look:

`<%= link_to 'Save', '#', :class => 'record_me_save'%>`  
`<div class='record_me_timer'></div>`  
`<div class='record_me_start'>Start</div>`  
`<div class='record_me_stop'>Stop</div>`  
`<div class='record_me_reproduce'>Reproduce</div>`  
`<%= record_me_js({save_path: audios_save_path, time: 3, name:'my_record.wav'}) %>`

### In your controller

Go to the action defined for __save\_path__ and add just add __record\_me\_save__. 'true' will be returned if file was successfully created.

### Flash warning message

Additionally you can display a message asking to install Flash if it is not installed, just call .flash\_warning\_message method and pass it the class of the html element you want to display the message:

`<div class='flash_warning'></div>`
`<%= flash_warning_message('flash_warning') %>`

That's it! 

## Wish list

* Add tests
* Ensure Rails 4.x compatibility

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
