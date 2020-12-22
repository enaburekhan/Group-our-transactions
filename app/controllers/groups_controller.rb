class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user

  def index
    @groups = Group.all
  end

  
  def show
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    @group.icon = params[:icon]

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.' 
    elsif @group.errors[:icon].present?
      redirect_to new_group_url, notice: @group.errors[:icon].first  
    else
      redirect_to new_group_url, notice: @group.errors[:name].first
    end
   
  end

  def update
    @group.icon = params[:icon]
    if @group.update(group_params)
      redirect_to groups_path, notice: 'Group was successfully updated.'
    elsif @group.errors[:icon].present?
      redirect_to edit_group_url, notice: @group.errors[:icon].first
    else
      redirect_to edit_group_url, notice: @group.errors[:name].first
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name, :icon, :user_id)
    end
end
