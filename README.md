The Setup
First of all, you will need to install the twitter gem. This step is very simple:

gem install twitter


Now you will need to click on ‘Keys and Access Tokens’. This page will have the API keys you need to connect to the Twitter API, which was the purpose of this setup process.

The next step is to fill in this template with your details:

require 'twitter'
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "YOUR_CONSUMER_KEY"
  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end

Working with Tweets
Now you have access to the whole Twitter API via the client object. As an example, I would like to do the following: download the last 20 tweets from the @rubyinside account and save them into a YAML file for later analysis.

To fetch the timeline for any Twitter user you can use the user_timeline method.

Example:

tweets = client.user_timeline('rubyinside', count: 20)
This method will return an array of Tweet objects that you can interact with, but how can you do that?

Saving Your Tweets
So what do you do with all these tweets? For example, you could save them into a file for later analysis. An easy way to do this is to use the YAML format.

require 'yaml'
# ... rest of the code here ...
File.write('tweets.yml', YAML.dump(tweets))
