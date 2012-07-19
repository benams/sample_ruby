require 'spec_helper'
describe "Static pages" do

    let(:site_name) { $site_name = 'Sample App' }

    describe "Home page" do
      it "should have the content 'Sample App'" do
        visit '/static_pages/home'
          page.should have_content('Sample App')
      end
      it "should have the right title" do
        visit '/static_pages/home'
        page.should have_selector('title') 
      end
    end

    describe "Help Page" do
      it "shold have the content 'Help'" do
        visit '/static_pages/help'
          page.should have_content('Help')
      end
      it "should have the right title" do
        visit '/static_pages/help'
        page.should have_selector('title', 
                                  :text => site_name + " | Help")
      end
    end

    describe "About Page" do
      it "should have the content 'About'" do
        visit '/static_pages/about'
          page.should have_content('About')
      end
      it "should have the right title" do
        visit '/static_pages/about'
        page.should have_selector('title', 
                                  :text => site_name + " | About")
      end
    end

    describe "Contact Page" do
      it "should have the content 'Contact'" do
        visit '/static_pages/contact'
          page.should have_content('Contact')
      end
      it "should have the right title" do
        visit '/static_pages/contact'
        page.should have_selector('title', 
                                  :text => "Sample App | Contact")
      end
    end
end
