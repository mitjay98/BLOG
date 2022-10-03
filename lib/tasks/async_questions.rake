require '../BLOG/app/workers/questions_worker'
namespace :questions do
    task :seed_by_sidekiq do
        QuestionsWorker.perform_async
    end
end