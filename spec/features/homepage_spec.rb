require 'spec_helper'
include UserHelper

describe "Edit User Page" do

  before(:each) do
    sign_up
  end

  it "shouldnt give you the option to log in while logged in" do
    visit root_path
    page.should_not have_content "Log in"
  end

   it "should give you option to sign up if not logged in" do
    sign_out
    visit root_path
    page.should have_content "Not a user?"
  end


end
