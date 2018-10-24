class ChallengersController < ApplicationController
  before_action :set_challenger, only: [:show, :edit, :update, :destroy]

  # GET /challengers
  # GET /challengers.json
  def index
    @challengers = Challenger.all
  end

  # GET /challengers/1
  # GET /challengers/1.json
  def show
  end

  # GET /challengers/new
  def new
    @challenger = Challenger.new
  end

  # GET /challengers/1/edit
  def edit
  end

  # POST /challengers
  # POST /challengers.json
  def create
    # byebug
    @challenger = Challenger.new(challenger_params)
    @challenger.save

    # @challenger.game_id = current_user.id
    # @challanger.name= User.find(game.challengers[0].user_id).name

    respond_to do |format|
      if @challenger.save
        format.html { redirect_to @challenger, notice: 'Challenger was successfully created.' }
        format.json { render :show, status: :created, location: @challenger }
      else
        format.html { render :new }
        format.json { render json: @challenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challengers/1
  # PATCH/PUT /challengers/1.json
  def update
    respond_to do |format|
      if @challenger.update(challenger_params)
        format.html { redirect_to @challenger, notice: 'Challenger was successfully updated.' }
        format.json { render :show, status: :ok, location: @challenger }
      else
        format.html { render :edit }
        format.json { render json: @challenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challengers/1
  # DELETE /challengers/1.json
  def destroy
    @challenger.destroy
    respond_to do |format|
      format.html { redirect_to challengers_url, notice: 'Challenger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenger
      @challenger = Challenger.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenger_params
      params.require(:challenger).permit(:user_id, :game_id)
    end
end
