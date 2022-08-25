class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy member ]
  before_action :not_invited_user, only: %i[ show edit update destroy member ]
  before_action :ensure_current_user, only: %i[ show edit update destroy member ]
  
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.build(team_params)
    @team.owner = current_user
    if @team.save
      @team.invite_member(@team.owner)
      redirect_to team_url(@team)
    else
      redirect_to "teams_path"
    end
  end

  def show
    @teams = Team.all
    @room_id = params[:id]
    render 'index'
  end

  def edit
  end

  def update
    if @team.update(team_params)
      redirect_to member_team_url(@team)
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to "teams_path"
  end
    
  def member
    @members = @team.members
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end

  def not_invited_user
    members = member.ids
    redirect_to "teams_path" unless members.include?(current_user.id)
  end

  def ensure_current_user
    redirect_to posts_path and return unless @team.members.ids.include?(current_user.id)
  end
end
