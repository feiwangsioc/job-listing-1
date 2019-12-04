class ProfilesController < ApplicationController
  
  before_action :authenticate_user!
  
  def new
    @user = User.find(params[:user_id])
    @profile = Profile.new
    
  end 
  
  def create
  
    @user = User.find(params[:user_id])
    @profile = Profile.new(profile_params)
    @profile.user = @user
    
    if @profile.save
      flash[:notice] = "Your profile is ready"
      redirect_to user_profile_path(@profile)
    else 
      render :new
    end 
  
  end
  
  def show
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
  end 
  
  def edit
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
  end
  
  def update
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to user_profile_path(@profile)
    end 
    
  end 
  
  private 
  def profile_params
    params.require(:resume).permit(:name, :email, :experience)
  end 
  
  
end
