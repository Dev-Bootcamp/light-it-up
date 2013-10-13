require 'spec_helper'
include UserHelper

describe "Edit slideshow page - Add slides" do

  before(:each) do
    sign_up
    create_slideshow
  end

  it "should let you add a new slide" do
    visit slideshow_path(Slideshow.find_by_name("fakeslideshow name"))
    click_link 'Add new slide'
  end

  it "should represent the correct slideshow" do
    visit slideshow_path(Slideshow.find_by_name("fakeslideshow name"))
    page.should have_content "fakeslideshow name"
    click_link 'Add new slide'
  end


end
