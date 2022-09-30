require 'questions_seed_worker'
# 30.times do
#   title = Faker::Hipster.sentence(word_count: 3)
#   body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
#   q = Question.create! title: title, body: body , user_id: 2
# end

# User.find_each do |u|
#   u.send(:set_gravatar_hash)
#   u.save
# end

# 30.times do
#   title = Faker::Hipster.word
#   Tag.create title: title
# end
def seeding_questions 
  30.times do
  title = Faker::Hipster.sentence(word_count: 3)
  body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
  Question.create! title: title, body: body , user_id: 2
  end
end

QuestionsSeedWorker.perform_async(seeding_questions)
    

     
   