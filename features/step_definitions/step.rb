Given(/^I am on google search page$/) do
  visit 'http://www.google.com'
end

When(/^I want to search "(.*?)"$/) do | search_word |
  fill_in 'gbqfq', with: search_word
  find_by_id('gbqfb').click() 
end

Then(/^I should see "(.*?)"$/) do | expected_result |
  page.should have_content( expected_result )
end
