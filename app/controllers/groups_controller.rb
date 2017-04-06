class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @user=current_user
    @groups = Group.all
    @group = Group.new
  end

  # @user.all_following

  def show
  end

  def add_member
    @user=current_user
    @member = User.find_by email: params[:email]
    @group = Group.find params[:g_id]
    respond_to do |format|
    if @member!=nil and @group!=nil
      @member.follow(@group)
        format.json { render json: @member.to_json }
    else
        format.json { render json: (params[:email]).to_json }
    end
    end
  end

  def get_all_members
    require "json"
    @group = Group.find params[:g_id]
    @members=@group.followers
    @data={"members": @members}
    respond_to do |format|
    if @members!=nil and @group!=nil
        format.json { render json: @data.to_json }
    else
        format.json { render json: ('something wrong!').to_json }
    end
    end

  end
  # GET /groups/new
  def new
    @user=current_user
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @user=current_user
    @group = @user.groups.new({:name => params[:name], :user_id => params[:user_id]})
    respond_to do |format|
      if @group.save
        format.json { render json: Group.last.to_json }
      else
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :user_id)
    end
end
