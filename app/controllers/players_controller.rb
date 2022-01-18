class PlayersController < ApplicationController
  before_action :authorized

  # GET /players
  def index
    @players = Player.paginate(page: params[:page], per_page: 7)

    render json: @players
  end
end
