class QuestionsController < ApplicationController
	def index
	  @questions = Question.all
	end

	def show
      @question = Question.find_by(params[:id])
      @questions_tags = QuestionsTag.where(question: @question)
      @tags = @questions_tags.map {|question_tag| Tag.find_by(id: question_tag.tag_id)}
	end

	def new
	  @question = Question.new
	end

	def create
      @question =  Question.create(question_params)
      @tag = Tag.find_by(name: tag_params)
      QuestionsTag.create(tag: @tag, question: @question)
      redirect_to questions_path
	end
    
    private

    def question_params
     params.require(:question).permit(:answer,:question)
    end

    def tag_params
     params.require(:question).permit(:tag)
    end

end
