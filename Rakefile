require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('headercount', '0.1') do |p|
  p.description = "Check on the response status of your websites"
  p.url = "http://github.com/thisgeek/headercount"
  p.author = "Christopher Joslyn"
  p.email = "chris@lissomesoftware.com"
  p.ignore_pattern = []
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }