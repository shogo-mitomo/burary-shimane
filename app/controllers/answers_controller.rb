# frozen_string_literal: true
class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    @answer.question_id = @question.id
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @spot = Spot.new(
      name: answer_params[:spot_name],
      address: answer_params[:address]
    )

    @answer = @spot.answers.build(
      address:     answer_params[:address],
      user:        current_user,
      question_id: answer_params[:question_id],
      image:       answer_params[:image],
      spot_detail: answer_params[:spot_detail]
    )

    respond_to do |format|
      create_respond_format(format)
    end
  end

  def create_respond_format(format)
    if @spot.save
      format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
      format.json { render :show, status: :created, location: @answer }
    else
      format.html { render :new }
      format.json { render json: @answer.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :spot_detail, :image, :address, :spot_name, :spot_id)
  end
end
