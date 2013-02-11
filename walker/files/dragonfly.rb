require 'dragonfly'
require 'dragonfly/rails/images'
require 'image_optim'

files = Dragonfly[:files]
images = Dragonfly[:images]
images.configure_with(:imagemagick)
images.cache_duration = 3600*24*365*3

unless `which exiftool`.empty?
  require 'rubygems'
  require 'mini_exiftool'
  images.analyser.add :exifdata do |temp_object|

    MiniExiftool.new( temp_object.path ).to_hash
  else
    {}
  end
end
end

images.configure_with(:rails) do |c|
  c.datastore = Dragonfly::DataStorage::S3DataStore.new
  c.datastore.configure do |c|
    c.bucket_name = ["<%= @app_name.downcase %>", Rails.env].join('.')
    c.access_key_id = ENV['AWS_ACCESS_KEY_ID']
    c.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    c.storage_headers =  { 'Cache-Control' => 'max-age=315576000'} # one year
  end
end

class Optimize
  def optimize(temp_object)
    io = ImageOptim.new(:pngout => false) #don't want to manage manual install
    optimized = io.optimize_image(temp_object.path)
    optimized.nil? ? temp_object : optimized
  end
end
images.processor.register(Optimize)

# Note Important! 
# must store expires header on store to enable browser and cloudfront caching
#   uid = job.store(headers: {'Expires' => 1.year.from_now.httpdate } )

# use image_accessor for images
# use file_accessor for files
    
