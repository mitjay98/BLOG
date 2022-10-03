class GenerateRandomQuestionsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    5.times do
      title = Faker::Hipster.sentence(word_count: 3)
      body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
      Question.create! title: title, body: body , user_id: 2
    end
  end
end