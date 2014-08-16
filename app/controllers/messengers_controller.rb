class MessengersController < ApplicationController
  before_filter :make_sure_we_have_entries
  
  def create
    #Read entries
    @rss.entries.each do |entry|
      bar = Bar.new
      bar.title = entry.title
      bar.body = entry.content
      bar.authors = entry.authors.join(', ') rescue ''
      bar.entry_url = entry.urls.first
      bar.description = entry.description
      bar.published_at = entry.date_published
      bar.save!
    end
    redirect_to root_path

  end

  def make_sure_we_have_entries
    feed_url = 'http://www.okayplayer.com/feed'
    @rss = FeedNormalizer::FeedNormalizer.parse open(feed_url)

    #Quit if  no articles
    redirect_to root_path if @rss.entries.length.zero?
  end


end
