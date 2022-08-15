class AssignsController < ApplicationController
  before_action :authenticate_user!

  def create
    team = find_team(params[:team_id])
    user = email_reliable?(assign_params)
    if user
      team.invite_member(user)
      redirect_to team_url(team), notice: 'アサインに成功しました'
    else
      redirect_to team_url(team), notice: 'アサインに失敗しました'
    end
  end

  private

  def assign_params
    params[:email]
  end

  def email_reliable?(address)
    address.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def find_team(*)
    Team.find(params[:team_id])
  end
end
