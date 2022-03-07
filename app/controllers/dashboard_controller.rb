class DashboardController < ApplicationController
  def index
    @recaps = current_user.recaps
    @favorites = current_user.favorites
  end
end
