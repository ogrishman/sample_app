require 'rails_helper'

describe "Static Pages" do
	it "shoudl have content 'Sample App'" do
	   get 'static_pages/home'

	   expect(response.body).to include("Sample App")
	end
end