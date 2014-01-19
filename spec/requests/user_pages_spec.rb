require 'spec_helper'

describe "User Pages" do
	
	#subject {page};

	describe "User Homepage" do
		it "Should have title 'New User Signup'" do
			visit newuser_path;

			page.should	have_selector('title', text: full_title('New User Signup'));
		end
	end

end