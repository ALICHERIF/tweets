require 'rubygems'
require 'twitter'
require 'yaml'


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "consumer key"
  config.consumer_secret     = "consumer secret"
  config.access_token        = "access token"
  config.access_token_secret = "access token secret"
end

tweets = client.user_timeline('EnsSupAlgerie', count: 200)
#puts "#{tweets}"
# it will show you all id 
tweets.each { |tweet| puts tweet.full_text }

File.write('tweets.txt', YAML.dump(tweets))
