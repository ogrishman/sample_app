require 'rails_helper'

describe "Home Pages" do
	it "shoudl have content 'Sample App'" do
	    visit 'static_pages/home'
	    expect(page).to have_selector "h1", :text => "Sample App"
	end

	it "Should have the right title" do
		visit 'static_pages/home'
	    expect(page.title).to eq "Edde's Sample App | Home"
	end

end


describe "Help Pages" do
	it "shoudl have content 'Help'" do
	    visit 'static_pages/help'
	    expect(page).to have_selector "h1", :text => "Help"
	   
	end

	it "Should have the right title" do
		visit 'static_pages/help'
		expect(page.title).to eq "Edde's Sample App | Help"
	end
end


describe "About Pages" do
	it "shoudl have content 'About US'" do
	    visit 'static_pages/about'

	    expect(page).to have_selector "h1", :text => "About US"
	end

	it "Should have the right title" do
		visit 'static_pages/about'
		expect(page.title).to eq "Edde's Sample App | About US"
	end
end


describe "Contact" do
    it "should have h1 contact" do
        visit 'static_pages/contact'

        expect(page).to have_selector "h1", text: "Contact US"
    end
end