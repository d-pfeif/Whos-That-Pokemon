class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
  end
  
  def home
  end

  # GET /rooms/1 or /rooms/1.json
  def show
  end
  
  def get
    room = Room.find_by(code: get_room_params[:room_code])
    if room.present?
      respond_to do |format|
        format.html { redirect_to room_url(room), notice: "Successfully entered room." }
        format.json { render json: { message: "Successfully entered room." }, status: 200 }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, alert: "Room is unavailable." }
        format.json { render json: { message: "Room is unavailable." }, status: :unprocessable_entity }
      end
    end
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to room_url(@room), notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to room_url(@room), notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.fetch(:room, {})
    end
   
    # Only allow a list of trusted parameters through.
    def get_room_params
      params.permit(:room_code)
    end
end
