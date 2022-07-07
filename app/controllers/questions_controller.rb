class QuestionsController < ApplicationController 
    def index 
        @questions = Question.all
        @lola = params[:lola]
    end
end