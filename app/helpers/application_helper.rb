module ApplicationHelper
  def all_teams_belongs_to
    all_teams = current_user.teams.select(:id, :name)
    all_teams
  end
end
