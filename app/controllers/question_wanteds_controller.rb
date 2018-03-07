class QuestionWantedsController < ApplicationController
  before_action :set_question_wanted, only: [:show, :edit, :update, :destroy]

  # GET /question_wanteds
  # GET /question_wanteds.json
  def index
    @question_wanteds = QuestionWanted.all
  end

  # GET /question_wanteds/1
  # GET /question_wanteds/1.json
  def show
  end

  # GET /question_wanteds/new
  def new
    @question_wanted = QuestionWanted.new
  end

  # GET /question_wanteds/1/edit
  def edit
  end

  # POST /question_wanteds
  # POST /question_wanteds.json
  def create
    @question_wanted = QuestionWanted.new(question_wanted_params)

    respond_to do |format|
      if @question_wanted.save
        format.html { redirect_to @question_wanted, notice: 'Question wanted was successfully created.' }
        format.json { render :show, status: :created, location: @question_wanted }
      else
        format.html { render :new }
        format.json { render json: @question_wanted.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_wanteds/1
  # PATCH/PUT /question_wanteds/1.json
  def update
    respond_to do |format|
      if @question_wanted.update(question_wanted_params)
        format.html { redirect_to @question_wanted, notice: 'Question wanted was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_wanted }
      else
        format.html { render :edit }
        format.json { render json: @question_wanted.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_wanteds/1
  # DELETE /question_wanteds/1.json
  def destroy
    @question_wanted.destroy
    respond_to do |format|
      format.html { redirect_to question_wanteds_url, notice: 'Question wanted was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def small_catergory
    render partial: 'select_small_catergory', locals: {bigcatergory_id: params[:big_catergory_id]}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_wanted
      @question_wanted = QuestionWanted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_wanted_params
      params.require(:question_wanted).permit(:big_category, :small_category, :user_id, :title, :content, :state, :comment, :stock)
    end
end
