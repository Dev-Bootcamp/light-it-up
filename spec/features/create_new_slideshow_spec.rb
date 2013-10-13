require 'spec_helper'
include UserHelper

describe "Create new slideshow page" do

  before(:each) do
    sign_up
  end

  it "should let you create a new slideshow" do
    visit new_slideshow_path
    fill_in 'Name', with: 'fakeslideshow name'
    click_button 'Create'

  end

  it "should let you create a new slideshow and share it" do
    visit new_slideshow_path
    fill_in 'Name', with: 'fakeslideshow name'
    check 'Shared'
    click_button 'Create'
  end


end

