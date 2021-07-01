# ================== LOGIN - SIGNUP ==================
Given('I am a registered user') do
    @user = User.create!(:username => 'test', :email => 'test@test.com', :password => 'test', :password_confirmation => 'test')
end

Given ('I am on the home page') do
    visit root_path
end


Given ('I am not authenticated') do
    visit new_user_session_path
end

When('I login') do
    fill_in "user_email", with: @user.email
	fill_in "user_password", with: @user.password
end

When('I sign up') do
    @user = User.create!(:username => 'test', :email => 'test@test.com', :password => 'test', :password_confirmation => 'test')
    # fill_in "user_username", with: @user.username
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    
end

When('I press button {string}') do |string|
    click_on(string)
end

Then('I should be on {string} page') do |page|
    current_path = URI.parse(current_url).path
    current_path == page
end

Then('I should see {string}') do |string|
    expect(page).to have_content(string)
end


# ================== ADD POST ==================

Given('I add a new post') do
    visit new_post_path
end

Given('I am authenticated') do
    visit new_user_session_path
    fill_in "user_email", with: @user.email
	fill_in "user_password", with: @user.password
    click_on('Log in')
end

When('I fill in Form title with {string}, {string}, {string}, {string}') do |title, description, position, tag |
    fill_in "post_title", with: title
    fill_in "post_description", with: description
    fill_in "post_position", with: position
    choose(tag)
    
end
  
