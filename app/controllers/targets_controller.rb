class TargetsController < ApplicationController
  helper_method :topics, :target
  before_action :authenticate_user!

  def new
    @target = Target.new
  end

  def index
    @all_targets = Target.all
    @targets = @all_targets.last(10)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @target = current_user.targets.create(target_params)
    if @target.persisted?
      redirect_to targets_path
    else
      create_fail(t(:target_fail))
    end
  end

  def edit
    respond_to do |format|
      format.html
    end
  end

  def destroy
    target.destroy!
    redirect_to new_target_path
  end

  private

  def create_fail(message)
    flash.now[:alert] = message
    render :new
  end

  def target_params
    params.require(:target).permit(:topic, :title, :length, :latitude, :longitude, :user_id)
  end

  def topics
    @topics ||= Target::TOPICS
  end

  def target
    @target ||= current_user.targets.find(params[:id])
  end
end
