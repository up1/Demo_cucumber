# encoding: UTF-8

Given(/^I am on product page$/) do
  visit 'http://www.tarad.com/product/5726812'
end

When(/^I want to buy product with$/) do
  steps( %Q(
    Then I add product to cart and pay
      And I buy product with guest
      And I want to pay via Counter Service channel
      And I fill in shipping address
      And I confirm to buy
  ) )
end

Then(/^I add product to cart and pay$/) do
  find_by_id('f_buy').click() 
  find_by_id('btn-payment').click()
end

Then(/^I buy product with guest$/) do
  find(:xpath, "//button[@class='btn btn-large btn-danger']").click()
end

Then(/^I want to pay via Counter Service channel$/) do
  find(:xpath, "//a[@href='#counter-service-detail']").click()
  sleep(2);
  find(:xpath, "//input[@id='next-btn']").click()
end

Then(/^I fill in shipping address$/) do
  fill_in 'send_firstname', :with => 'สมหมายน้อย'
  fill_in 'send_lastname', :with => 'ดวงดี'
  fill_in 'send_address', :with => '123/456 บ้านนาควาย'
  select( 'กรุงเทพมหานคร', :from => 'send_province' )
  select( 'คลองเตย', :from => 'send_city' )
  fill_in 'send_district', :with => 'บ้านนาควาย'
  fill_in 'send_email', :with => 'sommay@xxx.com'
  fill_in 'send_mobile', :with => '0811111111'
  find_by_id('next-btn').click()
end

Then(/^I confirm to buy$/) do
  find_by_id('next-btn').click()
end

Then(/^I should see finish page with success message$/) do
  page.should have_content( 'การสั่งซื้อเสร็จสมบูรณ์' )
end
