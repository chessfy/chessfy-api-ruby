class PlayersController < ApplicationController
  before_action :authorized

  # GET /players
  def index
    @players = Player.all

    if params[:fideid]
      @players = Player.where(fideid: params[:fideid])
    else
      if params[:search]
        @players = Player.where( "MATCH( fideid, name ) AGAINST( ? IN NATURAL LANGUAGE MODE )", params[:search] )
      end

      if params[:country]
        @players = @players.where(country: params[:country])
      end

      if params[:orderby]
        @players = @players.order("#{params[:orderby]} DESC")
      end

      @players = @players.paginate(page: params[:page], per_page: 25)
    end 
    
    render json: @players
  end

  # GET /player/1
  def show
    @player = Player.find(params[:id])

    render json: @player
  end
  
end
