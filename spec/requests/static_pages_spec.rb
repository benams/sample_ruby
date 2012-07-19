require 'spec_helper'
describe "Static pages" do

    let(:site_name) { $site_name = 'Sample App' }

    describe "Home page" do
      it "should have the content 'Sample App'" do
        visit root_path
          page.should have_content('Sample App')
      end
      it "should have the right title" do
        visit root_path
        page.should have_selector('title') 
      end
    end

    describe "Help Page" do
      it "shold have the content 'Help'" do
        visit help_path
          page.should have_content('Help')
      end
      it "should have the right title" do
        visit help_path
        page.should have_selector('title', 
                                  :text => site_name + " | Help")
      end
    end

    describe "About Page" do
      it "should have the content 'About'" do
        visit about_page
          page.should have_content('About')
      end
      it "should have the right title" do
        visit about_page
        page.should have_selector('title', 
                                  :text => site_name + " | About")
      end
    end

    describe "Contact Page" do
      it "should have the content 'Contact'" do
        visit contact_page
          page.should have_content('Contact')
      end
      it "should have the right title" do
        visit contact_path
        page.should have_selector('title', 
                                  :text => "Sample App | Contact")
      end
    end
end
