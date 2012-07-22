require 'spec_helper'

describe ApplicationHelper do

  describe "full_title" do
    it "should include the page title" do
      full_title("ben").should =~ /ben/
    end 

    it "should include the base title" do
      full_title("ben").should =~ /Sample App/
    end 
  
    it "should not include a bar for th home page" do
      full_title("").should_not =~ /\|/
    end 
  end
end
