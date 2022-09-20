require 'rails_helper' 

RSpec.describe 'Log in' do 
  let(:user)     { create(:user) }
  let(:admin)    { create(:user, role: "admin")}
  let(:question) { build(:question) }
 context "when user has basic role" do
   it 'has correct behavior' do 
    visit('/session/new')
    expect(page).to have_content("Log In")
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign In!'
    expect(current_path).to eql('/ua')
    expect(page).to have_content("Welcome back, ogbuda12!")
    end
  end

  context "when user has admin role" do
    it 'has correct behavior' do 
     visit('/session/new')
     expect(page).to have_content("Log In")
     fill_in 'Email',    with: admin.email
     fill_in 'Password', with: admin.password
     click_on 'Sign In!'
     expect(current_path).to eql('/ua')
     click_on 'Users'
     expect(page).to have_content("Download Zipped")
     end
   end

  context "when user is able to log out" do
    it "log in and log out correctly" do 
      visit('/session/new')
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Sign In!'
      click_on 'ogbuda12'
      click_on 'Log Out'
      expect(current_path).to eql('/ua')
      expect(page).to have_content("See you later!")
      binding.pry
    end
  end

end
