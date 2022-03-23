class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about]

  def home
    @top_users = User.all.sort_by(&:avg_received_ratings).reverse
  end

  def about; end
end
