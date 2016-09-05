# frozen_string_literal: true
class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    # こうするとquestionに関連付けられているデータまで一片に取得するので、
    # データベースへのアクセス回数を減らせる。
    @questions = Question.includes(:user).all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    # 一回でやった方が高速そうだったので、before_action(set_question)をせずにここでまとめました。
    @question = Question.includes(answers: :user).find(params[:id])
  end

  # GET /questions/new
  def new
    @question = Question.new
    #
    #	@question.user_id = prame[:user_id]
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(
      title:       question_params[:title],
      address:     question_params[:address],
      user:        current_user,
      content:     question_params[:content]
    )

    respond_to do |format|
      create_respond_format(format)
    end
  end

  def create_respond_format(format)
    if @question.save
      format.html { redirect_to @question, notice: 'Question was successfully created.' }
      format.json { render :show, status: :created, location: @question }
    else
      format.html { render :new }
      format.json { render json: @question.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:title, :content, :address)
  end
end
