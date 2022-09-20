 require 'rails_helper' 

 RSpec.describe 'Questions page' do 
  let(:user)  { create(:user) }
  let(:question) { build(:question) }

  context 'when page contain correct attributes' do 
   it 'displays correct content' do 
     visit('/questions')
     expect(page).to have_content("Search By Tags")
     expect(page).to have_content("Sign Up")
     expect(page).to have_css('.btn-primary')
     expect(page).to have_css('.nav-link')
     find(:xpath, "/html/body/header/div/nav/ul[3]/li[1]/a")
   end
  end

  context 'when user creates new questions' do 
  it 'creates question' do 
     visit('/session/new')
     expect(page).to have_content("Log In")
     fill_in 'Email',    with: user.email
     fill_in 'Password', with: user.password
     click_on 'Sign In!'
     visit('/en/questions')
     click_on 'New question'
     fill_in "Title", with: question.title
     fill_in "Body", with: question.body
     click_on "Submit question!"
     expect(current_path).to eql('/en/questions')
     expect(page).to have_content(question.title)
  end
 end
end  