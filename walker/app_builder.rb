# be sure to use the --skip-bundle cli option since it is called below 
# within rvm
class AppBuilder < Rails::AppBuilder
  
  def initialize generator
    super generator
    path = File.expand_path( File.join( '..', File.dirname( __FILE__ )) )
    source_paths << path
  end

  def app
    super 
    inside 'app/assets/stylesheets' do
      copy_file 'application.css', 'application.css.scss'
      remove_file 'application.css'
    end
  end
  
  def readme
    create_file "README.md", "TODO"
  end
  
  def gemfile
    copy_file 'files/Gemfile', 'Gemfile'
  end

  def config
    super
    template 'files/dragonfly.rb', 'config/initializers/dragonfly.rb'      
  end

  
  def run_bundle    
  end

  def leftovers
    root_controller 'landing'
    git_init
    fake_file
    bootstrap
    generate :scaffold, "users"
    route "resources :users"
    layout
    rvmrc
  end



private

  def layout
    remove_file 'app/views/layouts/application.html.erb'
    template 'files/application.html.haml', 'app/views/layouts/application.html.haml'
  end

  def rvmrc
    template 'files/.rvmrc', '.rvmrc'
    `cd . && bundle`
  end

  def bootstrap
    append_file 'app/assets/javascripts/application.js',  "//= require twitter/bootstrap\n"
    append_file 'app/assets/stylesheets/application.css.scss', "/*= require twitter/bootstrap */\n"
    append_file 'app/assets/stylesheets/application.css.scss', "/*= require twitter/bootstrap/_responsive */\n"
  end

  def fake_file
    template 'files/fake_file.js.coffee', 'lib/assets/javascripts/fake_file.js.coffee'
    template 'files/fake_file_input.rb',  'app/inputs/fake_file_input.rb'
  end

  def root_controller name
    generate :controller, "#{name} index"
    route "root to: '#{name}\#index'"
    remove_file "public/index.html"    
  end

  def git_init    
    git :init
    append_file ".gitignore", "config/database.yml"
    run "cp config/database.yml config/example_database.yml"
    git add: ".", commit: "-m 'initial commit'"
  end
end
