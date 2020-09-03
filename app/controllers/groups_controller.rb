class GroupsController < ApplicationController
  def show
    set_group
  end

  def index
    @groups = Group.includes(:chats, :challenges)
  end

  def new
    @group = Group.new(params[:id])
  end

  def create
    @group = Group.new(params[:id])
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def completed
    @group = Group.find(params[:id])
    @group.update_attribute(:completed, 'true')
    flash[:notice] = "Yey"
    # redirect_to
  end

  private

  def set_group
    @group = Group.find(params[:id])

  def group_params
    params.require(:group).permit(:completed, :difficulty, :impact, :duration, :exeptions, :points)
  end
end
end
