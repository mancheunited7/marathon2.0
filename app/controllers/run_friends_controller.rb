class RunFriendsController < ApplicationController
  before_action :set_run_friend, only: [:show, :edit, :update, :destroy]

  # GET /run_friends
  # GET /run_friends.json
  def index
    @run_friends = RunFriend.all
  end

  # GET /run_friends/1
  # GET /run_friends/1.json
  def show
  end

  # GET /run_friends/new
  def new
    @run_friend = RunFriend.new
  end

  # GET /run_friends/1/edit
  def edit
  end

  # POST /run_friends
  # POST /run_friends.json
  def create
    @run_friend = RunFriend.new(run_friend_params)

    respond_to do |format|
      if @run_friend.save
        format.html { redirect_to @run_friend, notice: 'Run friend was successfully created.' }
        format.json { render :show, status: :created, location: @run_friend }
      else
        format.html { render :new }
        format.json { render json: @run_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /run_friends/1
  # PATCH/PUT /run_friends/1.json
  def update
    respond_to do |format|
      if @run_friend.update(run_friend_params)
        format.html { redirect_to @run_friend, notice: 'Run friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @run_friend }
      else
        format.html { render :edit }
        format.json { render json: @run_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /run_friends/1
  # DELETE /run_friends/1.json
  def destroy
    @run_friend.destroy
    respond_to do |format|
      format.html { redirect_to run_friends_url, notice: 'Run friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run_friend
      @run_friend = RunFriend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def run_friend_params
      params.fetch(:run_friend, {})
    end
end
