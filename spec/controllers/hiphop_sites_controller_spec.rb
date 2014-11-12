require 'rails_helper'

RSpec.describe HiphopSitesController, :type => :controller do

  describe "POST #create" do
    subject { post :create, hiphop_site:{ url: "http://google.com" } }
    it "should make a hip hop site" do
      expect { subject }.to change(HiphopSite, :count).by(1)
    end
  end
end
