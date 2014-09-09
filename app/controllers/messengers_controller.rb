class MessengersController < ApplicationController
  before_filter :make_sure_we_have_entries
  
  def create
    #Read entries
    rss_entries.each do |entry|
      bar = Bar.new
      bar.title = entry.title
      bar.body = entry.content
      bar.authors = entry.authors.join(', ') rescue ''
      bar.entry_url = entry.urls.first
      bar.description = entry.description
      bar.published_at = entry.date_published
      bar.save
    end
    redirect_to root_path

  end
  def rss_entries
    return @rss.entries unless @rss.nil?
    feed_url = 'http://www.okayplayer.com/feed'
    @rss = FeedNormalizer::FeedNormalizer.parse open(feed_url)
    @rss.entries
  end
  def make_sure_we_have_entries
    #Quit if  no articles
    redirect_to root_path if rss_entries.length.zero?
    flash.notice = "bars created" 
  end

end
