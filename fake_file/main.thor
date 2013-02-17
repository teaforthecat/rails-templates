# module: fake_file
template 'files/fake_file.js.coffee', 'lib/assets/javascripts/fake_file.js.coffee'
template 'files/fake_file.css.scss', 'lib/assets/stylesheets/fake_file.css.scss'
template 'files/fake_file_input.rb',  'app/inputs/fake_file_input.rb'
append_file 'app/assets/javascripts/application.js',  "//= require fake_file\n"
append_file 'app/assets/javascripts/application.js',  "/*= require fake_file */\n"
