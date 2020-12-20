class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
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

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
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

  # DELETE /groups/1
  # DELETE /groups/1.json
  # def destroy
  #   @group.destroy
  #   respond_to do |format|
  #     format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

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