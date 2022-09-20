require 'rails_helper' 

RSpec.describe 'Process of registration' do 
     let(:user)  { build(:user) }
  it 'register a user' do 
    visit('/users/new')
    expect(page).to have_content("Registration") do 
    fill_in  'Email',                 with: user.email
    fill_in  'Name',                  with: user.name
    fill_in  'Password',              with: user.password
    fill_in  'Password confirmation', with: user.password_confirmation
    click_on 'Register!'
    expect(current_path).to eql('/ua')
    expect(page).to have_content("Welcome to the app")
   end
 end
end  