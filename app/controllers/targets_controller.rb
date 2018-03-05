class TargetsController < ApplicationController

  before_action :load_topics, only: [:new, :create]

  def new
    @target = Target.new
  end

  def index
    @targets = Target.all.last(10)
  end

  def create
    @target = Target.create(target_params)
    if @target.persisted?
      redirect_to targets_path
    else
      flash.now[:alert] = t(:target_fail)
      render :new
    end
  end

  def target_params
    params.require(:target).permit(:topic, :title, :length, :latitude, :longitude)
  end

  def load_topics
    @topics = Target::TOPICS
  end

end
