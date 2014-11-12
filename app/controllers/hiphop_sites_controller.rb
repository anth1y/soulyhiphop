class HiphopSitesController < ApplicationController
  skip_before_filter(:verify_authenticity_token)
  def create
   #Write entries from form to database
    HiphopSite.create hiphop_site_params
    redirect_to hiphop_sites_path
  end

  def new
    @hiphop_site = HiphopSite.new
  end

  def index
    @hiphop_sites = HiphopSite.all 
  end

  protected

  def hiphop_site_params
    params.require(:hiphop_site).permit(:url, :description, :image_url)
  end
end
