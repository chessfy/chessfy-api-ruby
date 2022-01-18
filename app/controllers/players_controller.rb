class PlayersController < ApplicationController
  before_action :authorized

  # GET /players
  def index
    @players = Player.all

    render json: @players
  end
end
