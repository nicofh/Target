class TargetsController < ApplicationController
  def new
    @target = Target.new
  end

  def index
    @targets = Target.all.last(10)
  end

  def create
    @target = Target.create(target_params)
    if @target.save
      redirect_to targets_path
    else
      flash.now[:alert] = 'Target was not saved'
      render 'new'
    end
  end

  def target_params
    params.require(:target).permit(:topic, :title, :length, :latitude, :longitude)
  end
end
