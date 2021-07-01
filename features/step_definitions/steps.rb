# ================== LOGIN - SIGNUP ==================
Given('I am a registered user') do
    @user = User.create!(:username => 'test', :email => 'test@test.com', :password => 'test', :password_confirmation => 'test')
end

Given ('I am on the home page') do
    visit root_path
end


# Given ('I am not authenticated') do
#     visit destroy_user_session_path
# end

Given('I fill my credentials to Login') do 
    fill_in "user_email", with: @user.email
	fill_in "user_password", with: @user.password
end

Given('I fill my credentials to SignUp') do
    fill_in "user_username", with: 'test'
    fill_in "user_email", with: 'test@test'
    fill_in "user_password", with: 'test'
    fill_in "user_password_confirmation", with: 'test'
    
end

When('I press button {string} in navbar') do |string|
    within('.navbar') do
        click_on(string)
    end
end

When('I press button {string}') do |string|
    click_on(string)
end

Then('I should be on {string} page') do |page|
    current_path = URI.parse(current_url).path
    current_path == page
end


Given('I should see {string}') do |string|
    page.should have_content(string)
    #expect(page).to have_content(string)
end


# ================== POST ==================


Given('I am authenticated') do
    visit new_user_session_path
    fill_in "user_email", with: @user.email
	fill_in "user_password", with: @user.password
    click_on('Log in')
end

When('I fill in title with {string}, {string}, {string}, {string}') do |title, description, position, tag |
    fill_in "post_title", with: title
    fill_in "post_description", with: description
    fill_in "post_position", with: position
    choose(tag)
    
end
  
When('I press icon in navbar to add new post') do
    within('.navbar') do
        find('#new').click
    end
end

When('I press a title of one my Post') do 
    @post = Post.create!(:title => 'test', :description => 'testtest', :user_id => @user.id)
    visit  '/posts/' + @post.id.to_s
   
end

# Then('I should be on the show post page') do
#     URI.parse(current_url).path == ('/posts/:' + @post.id.to_s )
# end


