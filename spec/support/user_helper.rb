module UserHelper

  def sign_up
    @user = User.create(:email => "ex@fake.com", :password => "password", :password_confirmation => "password")
    visit root_path
    #save_and_open_page
    fill_in 'email', with: 'ex@fake.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
  end

  def edit_user
    @user = User.find_by_email("ex@fake.com")
    visit edit_user_path(@user)
    fill_in 'email', with: 'editemail@fake.com'
    click_button 'Save User'
  end

  def sign_out
    @user = User.find_by_email("ex@fake.com")
    visit edit_user_path(@user)
    click_link 'Log out'
  end

  def create_slideshow
    visit new_slideshow_path
    fill_in 'Name', with: 'fakeslideshow name'
    click_button 'Create'
  end

end


# to use launchy put
# save_and_open_page
# into a route you want to inspect see above for example
