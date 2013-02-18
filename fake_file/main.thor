# module: fake_file
class FakeFile < Thor
  include Thor::Actions

  desc "installs fake_file", "two args?"
  def install
    prefix = "https://raw.github.com/teaforthecat/rails-templates/master/fake_file/"
    get File.join(prefix,'files/fake_file.js.coffee'), 'lib/assets/javascripts/fake_file.js.coffee'
    get File.join(prefix,'files/fake_file.css.scss' ), 'lib/assets/stylesheets/fake_file.css.scss'
    get File.join(prefix,'files/fake_file_input.rb' ),  'app/inputs/fake_file_input.rb'
    append_file 'app/assets/javascripts/application.js',  "//= require fake_file\n"
    append_file 'app/assets/javascripts/application.js',  "/*= require fake_file */\n"    
  end

end
