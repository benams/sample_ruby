require 'spec_helper'
describe "Static pages" do

    let(:site_name) { $site_name = 'Sample App' }

    subject { page }

    describe "Home page" do
      before { visit root_path }

      it { should have_content('Sample App') } 
      it { should have_selector('title') }
    end

    describe "Help Page" do
        before { visit help_path }

        it { should have_content('Help') }
        it { should have_selector('title', :text => full_title('Help')) }
    end

    describe "About Page" do
        before{ visit about_path }
        
        it { should have_content('About') }
        it { should have_selector('title', text: full_title('About')) }
    end

    describe "Contact Page" do
      before { visit contact_path }
      it { should have_content('Contact') }
      it { should have_selector('title', text: full_title('Contact')) }
    end
end
