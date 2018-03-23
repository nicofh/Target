class TargetsController < ApplicationController
  helper_method :topics
  before_action :authenticate_user!

  def new
    @target = Target.new
  end

  def index
    @all_targets = Target.all
    @targets = @all_targets.last(10)
    respond_to do |format|
      format.html
      format.json { render json: @all_targets }
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
end
