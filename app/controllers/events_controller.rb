class EventsController < ApplicationController
  before_action :authenticate_player!
  before_action :set_event, only: [:join,:leave,:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index    
    set_index_variables
  end
  
  def subscribed
    set_index_variables
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @players = Player.subscribed_to(@event).order('points DESC')
  end

  # A player join this group
  def join
    current_player.events << @event
    flash[:success] = "Vous avez rejoint ce groupe !"
    redirect_to @event
  end
  
  def leave
    set_index_variables
    if @event.is_owner?(current_player)
      flash[:notice] = "Vous ne pouvez pas quitter un groupe que vous avez créé!"
      redirect_to action: "index"
    elsif current_player.events.include? @event
      current_player.events.delete(@event)
      flash[:notice] = "Vous avez quitté ce groupe !"
      redirect_to action: "index"
    else
      flash[:error] = "Vous n'êtes pas membre de ce groupe."
      redirect_to action: "index"
    end
  end
  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    debugger
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :start_date, :owner_player_id)
    end
    
    def set_index_variables
      @subscribed_events     = Event.is_member(current_player)
      @not_subscribed_events = Event.is_not_member(current_player)
      @owner_events          = Event.is_owner(current_player)
    end
  
end
