class AssignsController < ApplicationController
  def create
    team = find_team(params[:team_id])
    user = email_reliable?(assign_params)? User.find_by(email: assign_params) : nil
    if user
      team.invite_member(user)
      redirect_to member_team_url(team)
    else
      redirect_to member_team_url(team)
    end
  end

  def destroy
    assign = find_user(params[:id])
    assign.destroy
    redirect_to teams_url
  end

  private

  def find_team(*)
    Team.find(params[:team_id])
  end

  def email_reliable?(email)
    email.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def assign_params
    params[:post][:email]
  end

  def find_user(*)
    Assign.find_by(team_id: params[:id], user_id: current_user)
  end
end

