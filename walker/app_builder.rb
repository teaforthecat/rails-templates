class AppBuilder < Rails::AppBuilder

  def initialize generator
    super generator
    path = File.expand_path( File.join( '..', File.dirname( __FILE__ )) )
    source_paths << path
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

  def leftovers
    root_controller 'landing'
    git_init    
  end


private

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
