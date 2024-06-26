class ScreensController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_screen, only: %i[ edit update destroy ]


  def user_index
    @screens = current_user.screens
  end

  # GET /screens or /screens.json
  def index
    # @screens = current_user.screens
    @screens = Screen.all
  end

  # GET /screens/1 or /screens/1.json
  def show
    @screen = set_screen
  end

  # GET /screens/new
  def new
    @screen = current_user.screens.build
  end

  # GET /screens/1/edit
  def edit
  end

  # POST /screens or /screens.json
  def create
    @screen = current_user.screens.build(screen_params)

    respond_to do |format|
      if @screen.save
        format.html { redirect_to screen_url(@screen), notice: "Screen was successfully created." }
        format.json { render :show, status: :created, location: @screen }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @screen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /screens/1 or /screens/1.json
  def update
    respond_to do |format|
      if @screen.update(screen_params)
        format.html { redirect_to screen_url(@screen), notice: "Screen was successfully updated." }
        format.json { render :show, status: :ok, location: @screen }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @screen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /screens/1 or /screens/1.json
  def destroy
    @screen.destroy!

    respond_to do |format|
      format.html { redirect_to screens_url, notice: "Screen was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screen
      @screen = Screen.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def screen_params
      params.require(:screen).permit(:title, :image_url)
    end
end
