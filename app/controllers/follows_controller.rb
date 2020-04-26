class FollowsController < ApplicationController
  before_action :set_follow, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /follows
  # GET /follows.json
  def index
    @follows = Follow.all
  end

  # GET /follows/1
  # GET /follows/1.json
  def show
  end

  # GET /follows/new
  def new
    @follow = Follow.new
  end

  # GET /follows/1/edit
  def edit
  end

  # POST /follows
  # POST /follows.json
  def create
    @follow = Follow.new(follow_params)

    respond_to do |format|
      if @follow.save
        format.html { redirect_to @follow, notice: 'Follow was successfully created.' }
        format.json { render :show, status: :created, location: @follow }
      else
        format.html { render :new }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  def follow_user
    if current_user.present?
      @follow = Follow.create!(followable_id: params[:followable_id],followable_type: params[:followable_type],user_id: params[:user_id])
      message = 'You have followed the user.'
    else
      message = 'Please Login first.'
    end
     redirect_to "/questions/#{params[:question_id]}", notice: message   
    # format.json { head :no_content }
  end

  def follow_topic
    if current_user.present?
      @follow = Follow.create!(followable_id: params[:followable_id],followable_type: params[:followable_type],user_id: params[:user_id])  
      message = 'You have followed the topic.'
    else
      message = 'Please Login first.'
    end
     redirect_to "/questions/#{params[:question_id]}", notice: message   
    # format.json { head :no_content }
  end

  def unfollow_user
  if current_user.present?
      #@follow = Follow.create!(followable_id: params[:followable_id],followable_type: params[:followable_type],user_id: params[:user_id])  
      @follow = Follow.where(followable_id: params[:followable_id],followable_type: params[:followable_type],user_id: params[:user_id]).destroy_all
      message = 'You have unfollowed the user.'
    else
      message = 'Please Login first.'
    end
     redirect_to "/questions/#{params[:question_id]}", notice: message   
    # format.json { head :no_content }
  end 

  def unfollow_topic
  if current_user.present?
      #@follow = Follow.create!(followable_id: params[:followable_id],followable_type: params[:followable_type],user_id: params[:user_id])  
      @follow = Follow.where(followable_id: params[:followable_id],followable_type: params[:followable_type],user_id: params[:user_id]).destroy_all
      message = 'You have unfollowed the topic.'
    else
      message = 'Please Login first.'
    end
     redirect_to "/questions/#{params[:question_id]}", notice: message   
    # format.json { head :no_content }
  end 

  # PATCH/PUT /follows/1
  # PATCH/PUT /follows/1.json
  def update
    respond_to do |format|
      if @follow.update(follow_params)
        format.html { redirect_to @follow, notice: 'Follow was successfully updated.' }
        format.json { render :show, status: :ok, location: @follow }
      else
        format.html { render :edit }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1
  # DELETE /follows/1.json
  def destroy
    @follow.destroy
    respond_to do |format|
      format.html { redirect_to follows_url, notice: 'Follow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def follow_params
      params.require(:follow).permit(:followable_id, :followable_type, :user_id)
    end
end
