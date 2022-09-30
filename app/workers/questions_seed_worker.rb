class QuestionsSeedWorker
 include Sidekiq::Worker 
    def perform(seeding)
        p 'your questions are seeding'
    end   
end