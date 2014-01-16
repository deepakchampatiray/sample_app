require 'spec_helper'

describe "StaticPages" do
  let(:base_title) {"Ruby On Rails Tutorial Sample App"}
  subject { page }

  describe "Home page" do
    before {visit root_path}

    it { should have_selector('h1', :text => 'Sample App') }
    it { should have_selector('title', :text => "#{base_title}") }
  end

  describe "Help Page" do
    before {visit help_path}
    it { should have_selector('h1', :text => 'Help') }
    it { should have_selector('title', :text => "#{base_title} | Help") }
  end

  describe "About Us Page" do
    before {visit about_path}
    it { should have_selector('h1', :text => 'About Us') }
    it { should have_selector('title', :text => "#{base_title} | About Us") }
  end

  describe "Contact Us Page" do
    before {visit contact_path}
    it { should have_selector('h1', :text => 'Contact Us') }
    it { should(have_selector('title', :text => "#{base_title} | Contact Us")); }
  end
end
