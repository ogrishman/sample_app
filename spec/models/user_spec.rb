require 'rails_helper'

RSpec.describe User, :type => :model do
	before {@u = User.new(name: "Edde", email: "YangShuai@gmail.com")}
	subject {@u}

	it {is_expected.to respond_to :name}
	it {is_expected.to respond_to :email}
	it {is_expected.to respond_to :password_digest}
	it {is_expected.to be_valid}

	describe "when name is not present" do
	    before {@u.name = " 	"}

	    it {is_expected.not_to be_valid}
	end

	describe "when email is not present" do
	    before {@u.email = "  		"}

	    it {is_expected.not_to be_valid}
	end

	describe "when name is too long" do
		before {@u.name = "a" * 51}

		it {is_expected.not_to be_valid}
	end

	describe "when email address is not valid" do
		it "should not be valid" do
		    addresses = %w[asdf@sdf,com user_at_fool.org example.user@foo.]
		    addresses.each do |e|
		    	@u.email = e
		    	is_expected.not_to be_valid
		    end
		end
	end

	describe "when email address is valid" do
		it "should be valid" do
		    addresses = %w[asdf@sdf.com user_at_fool@asdf.org USER_ABC@SDF.COM.CN example.user@foo.CO.JP]
		    addresses.each do |e|
		    	@u.email = e
		    	is_expected.to be_valid
		    end
		end
	end

	describe "when the email address is duplicate" do

		before do
			a = @u.dup
			a.email = @u.email.upcase
			a.save
		end

	    it "should be invalid when email address duplicates" do
	        is_expected.not_to be_valid
	    end
	end
end
