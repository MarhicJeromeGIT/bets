class PlayersController < ApplicationController
  before_action :authenticate_player!
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all #Player.for_event(@current_player.event)
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @bets = @player.bets.joins(:match).order('matches.date ASC')
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
    #Make sure only the logged-in user can edit himself.
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    # TODO create and redirect to a page for that
    @player.name  = "Jéjé"
    

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    if @player != current_player
      respond_to do |format|
        format.html { redirect_to @player, notice: 'Vous ne pouvez pas modifier un autre utilisateur.' }
        return
      end
    end
    
    if Time.now > "2016-06-10 15:38:46 +0200"
      respond_to do |format|
        format.html { redirect_to @player, notice: 'Trop tard pour modifier les pronos.' }
        return
      end
    end
    
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy_disabled
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player    
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(
        :name,
        :points,
        :bets_attributes => [:result, :id])
    end
end
