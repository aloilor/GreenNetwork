Given('I am on header') do
    visit 'posts'
    # pending 
end

When('I follow {string}') do |string|
  click_link(string)
  
end