require 'rails_helper'

describe MessengersController do
  describe "#create" do
    it "should redirect" do
      expect(post :create).to redirect_to(root_path)
    end

    it "should display a message about the number of created bars" do
      post :create
      expect(flash[:notice]).to match(/10 bars created/)
    end

    context "when there are duplicate bars" do
      it "should not blow up" do
        Bar.create!(
          title: "old bar",
          body: "foo",
          authors: "foo",
          entry_url: "http://example.com",
          description: "foo",
          published_at: Date.today
        )
        allow(controller).to receive(:rss_entries) {
          [OpenStruct.new(
              title: "old bar",
              content: "foo",
              authors:["foo"],
              urls: ["http://example.com"],
              description: "foo",
              date_published: Date.civil(2015,01,01))]
        }
        expect { post :create }.to_not raise_error
      end
    end
  end
end
