class RecapsController < ApplicationController
  def index
    @recaps = Recap.all
  end
end
