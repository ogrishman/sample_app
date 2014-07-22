require 'rails_helper'

RSpec.describe User, :type => :model do
	before do
		@u = User.new(name: "Edde", email: "YangShuai@gmail.com", password: "fuck you")

	end

	subject {@u}

	it {is_expected.to respond_to :name}
	it {is_expected.to respond_to :email}
	it {is_expected.to respond_to :password_digest}
	it {is_expected.to be_valid}
	it {is_expected.to respond_to :password}
	it {is_expected.to respond_to :password_confirmation}

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

	describe "contact page" do
		it "should have correct title" do
			visit "/contact"

			expect(page.title).to eq "Edde's Sample App | Contact"
		end
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

		it {is_expected.not_to be_valid}
	end

	describe "when password is empty" do
	    before {@u = User.new name: "YangShuai", email: "yangshuai@gmail.com",
	                          password: "", password_confirmation: ""}

        it {is_expected.not_to be_valid}
	end

	describe "when password is too short" do
	    before {@u = User.new name: "YangShuai", email: "yangshuai@gmail.com",
	                          password: "abcd", password_confirmation: "abcd"}

        it {is_expected.not_to be_valid}
	end

	describe "when password is too long" do
	    before {@u = User.new name: "YangShuai", email: "yangshuai@gmail.com",
	                          password: "abcdffffff", password_confirmation: "abcdffffff"}

        it {is_expected.not_to be_valid}
	end

	describe "when password is not match" do
	    before {@u = User.new name: "YangShuai", email: "yangshuai@gmail.com",
	                          password: "abcde", password_confirmation: "abcdef"}

        it {is_expected.not_to be_valid}
	end

	context "authenticate method's return value" do
		before do
			@u = User.new name: "YangShuai", email: "yangshuai@gmail.com",
	                          password: "abcdef", password_confirmation: "abcdef"
	        @u.save
	    end

	    it "return true when password is correct" do
	        u = User.find_by(email: "yangshuai@gmail.com")
	        expect(u.authenticate("abcdef")).to be u
	    end


	end

end
