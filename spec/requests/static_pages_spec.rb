require 'spec_helper'

describe "StaticPages" do
  let(:base_title) {"Ruby On Rails Tutorial Sample App"}

  describe "Home page" do
    it "should have the h1 'Sample App'" do
      visit root_path
      page.should have_selector('h1', :text => 'Sample App')
    end

    it 'should have a title ending with "Home"' do
      visit root_path
      page.should have_selector('title', :text => "#{base_title}")
    end
  end

  describe "Help Page" do
    it "should have the h1 'Help'" do
      visit help_path
      page.should have_selector('h1', :text => 'Help')
    end

    it 'should have a title ending with "Help"' do
      visit help_path
      page.should have_selector('title', :text => "#{base_title} | Help")
    end
  end

  describe "About Us Page" do
    it "should have the h1 'About'" do
      visit about_path
      page.should have_selector('h1', :text => 'About Us')
    end

    it 'should have a title ending with "About Us"' do
      visit about_path
      page.should have_selector('title', :text => "#{base_title} | About Us")
    end
  end

  describe "Contact Us Page" do
    it "should have a h1 with 'Contact Us'" do 
      visit contact_path
      page.should have_selector('h1', :text => 'Contact Us')
    end  

    it "should have a title with text ending with 'Contact Us'" do
      ## See how brackets can be used as well.
      visit (contact_path);
      page.should(have_selector('title', :text => "#{base_title} | Contact Us"));
    end
  end
end
