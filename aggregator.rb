require 'rubygems'
require 'feed-normalizer'
# http://ruby.dzone.com/articles/ruby-rss-aggregator
#Define URL and Parse Feed
feed_url = [ 'http://www.okayplayer.com/feed','http://allhiphop.com/feed/']
rss = FeedNormalizer::FeedNormalizer.parse open(feed_url)

#Quit if  no articles
exit unless rss.entries.length > 0

#Read entries
rss.entries.each do |entry|
  title = entry.title
  body = entry.content
  authors = entry.authors.join(', ') rescue ''
  entry_url = entry.urls.first
  #add more things here
end

