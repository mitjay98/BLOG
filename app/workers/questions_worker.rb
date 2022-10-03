class QuestionsWorker
 include Sidekiq::Worker
    def perform
        QuestionSeedingService.call
    end   
end