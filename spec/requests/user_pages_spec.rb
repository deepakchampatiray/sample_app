require 'spec_helper'

describe "User Pages" do
	
	#subject {page};

	describe "User Signup Page" do
		before {visit newuser_path};
		let(:submit) {"Create my account"}

		it "Should have title 'New User Signup'" do
			page.should	have_selector('title', text: full_title('New User Signup'));
		end

		it "should not allow blank page submission" do
			expect {page.click_button submit}.not_to change(User, :count);
		end

		it "should allow valid user data to be submitted" do
			fill_in "Name", 					with: "Deepak Champatiray";
			fill_in "Email",					with: "d.champatiray@yahoo.com";
			fill_in "Password",					with: "password";
			fill_in "Confirmation", 			with: "password";
			expect {click_button submit}.to change(User, :count).by(1);
		end
	end

	describe "profile page" do
		let(:user) {FactoryGirl.create(:user)}
		before do
		  visit user_path(user)
		end
		it "should have user's name as title" do
			page.should have_selector('title', text: user.name);
		end

		it "should have user's name as h1" do
			page.should have_selector('h1', text: user.name);
		end
	end

end