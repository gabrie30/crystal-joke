require "http/client"
require "json"

response = HTTP::Client.get "https://www.reddit.com/r/Jokes/.json"
response.status_code
data = response.body

value = JSON.parse(data)

value["data"]["children"].each do |joke|
  if joke["data"]["title"].to_s.size < 120 && joke["data"]["selftext"].to_s.size < 120
    puts "+++++++++++++++++++++++++++++++++"
    puts joke["data"]["title"]
    puts joke["data"]["selftext"]
  end
end
