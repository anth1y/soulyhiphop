class MessengersController < ApplicationController
  before_filter :make_sure_we_have_entries

  def update
    #Read entries
    new_bars_count = rss_entries.select do | entry|
      bar = Bar.new
      bar.title = entry.title
      bar.body = entry.content
      bar.authors = entry.authors.join(', ') rescue ''
      bar.entry_url = entry.urls.first
      bar.description = entry.description
      bar.published_at = entry.date_published
      bar.save
    end.count
    flash.notice = "#{new_bars_count} bars created"
    redirect_to root_path

  end
  def rss_entries
    return @rss.entries unless @rss.nil?
    feed_url = HiphopSite.first.url
    #feed_url = 'http://www.okayplayer.com/feed'
    @rss = FeedNormalizer::FeedNormalizer.parse open(feed_url)
    @rss.entries
  end
  def make_sure_we_have_entries
    #Quit if  no articles
    redirect_to root_path if rss_entries.length.zero?
  end

end
