require 'spec_helper'
include UserHelper

describe "Edit User Page" do

  before(:each) do
    sign_up
  end

  it "should show slideshows when you are logged in" do
    visit root_path
    page.should_not have_content "Log in"
  end

   it "should show slideshows when you are logged in" do
    sign_out
    visit root_path
    page.should have_content "Not a user?"
  end


end
