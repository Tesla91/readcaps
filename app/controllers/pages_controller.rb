class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @top_users = User.all.sort_by { |user| user.avg_received_ratings}.reverse
  end
end
