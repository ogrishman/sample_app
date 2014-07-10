require 'rails_helper'

describe "Home Pages" do

	before	{visit home_path}
	it "shoudl have content 'Sample App'" do
	    expect(page).to have_selector "h1", :text => "Sample App"
	end

	it "Should have the right title" do
	    expect(page.title).to eq "Edde's Sample App | Home"
	end

end


describe "Help Pages" do
	before {visit help_path}
	it "shoudl have content 'Help'" do
	    expect(page).to have_selector "h1", :text => "Help"
	   
	end

	it "Should have the right title" do
		expect(page.title).to eq "Edde's Sample App | Help"
	end
end


describe "About Pages" do

	before {visit about_path}
	it "shoudl have content 'About US'" do
	    expect(page).to have_selector "h1", :text => "About US"
	end

	it "Should have the right title" do
		expect(page.title).to eq "Edde's Sample App | About US"
	end
end


describe "Contact" do
	before {visit contact_path}
    it "should have h1 contact" do
        expect(page).to have_selector "h1", text: "Contact US"
    end
end