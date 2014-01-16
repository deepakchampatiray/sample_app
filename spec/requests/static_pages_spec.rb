require 'spec_helper'

describe "StaticPages" do
  subject { page }

  page_vals = {
    home:   {heading:   'Sample App', page_title: ''},
    help:   {heading:   'Help', page_title: 'Help'},
    about:  {heading:  'About Us', page_title: 'About Us'},
    contact: {heading: 'Contact Us', page_title: 'Contact Us'}
    };

  shared_examples_for "all static pages" do
    it {should have_selector 'h1', text: page_type[:heading]}
    it {should have_selector 'title', text: full_title(page_type[:page_title])}
  end

  describe "Home page" do
    before {visit root_path}
    let(:page_type) { page_vals[:home] }

    it_should_behave_like "all static pages";
  end

  describe "Help Page" do
    before {visit help_path}
    let(:page_type) { page_vals[:help] }

    it_should_behave_like "all static pages"
  end

  describe "About Us Page" do
    before {visit about_path}
    let(:page_type) { page_vals[:about] }

    it_should_behave_like "all static pages"
  end

  describe "Contact Us Page" do
    before {visit contact_path}
    let(:page_type) { page_vals[:contact] }

    it_should_behave_like "all static pages"
  end
end
