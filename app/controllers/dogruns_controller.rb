class DogrunsController < ApplicationController
  before_action :set_dogrun, only: %i[ show edit update destroy ]

  # GET /dogruns or /dogruns.json
  def index
    @dogruns = Dogrun.all
  end

  # GET /dogruns/1 or /dogruns/1.json
  def show
  end

  # GET /dogruns/new
  def new
    @dogrun = Dogrun.new
  end

  # GET /dogruns/1/edit
  def edit
  end

  # POST /dogruns or /dogruns.json
  def create
    @dogrun = Dogrun.new(dogrun_params)

    respond_to do |format|
      if @dogrun.save
        format.html { redirect_to dogrun_url(@dogrun), notice: "Dogrun was successfully created." }
        format.json { render :show, status: :created, location: @dogrun }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dogrun.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogruns/1 or /dogruns/1.json
  def update
    respond_to do |format|
      if @dogrun.update(dogrun_params)
        format.html { redirect_to dogrun_url(@dogrun), notice: "Dogrun was successfully updated." }
        format.json { render :show, status: :ok, location: @dogrun }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dogrun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogruns/1 or /dogruns/1.json
  def destroy
    @dogrun.destroy

    respond_to do |format|
      format.html { redirect_to dogruns_url, notice: "Dogrun was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dogrun
      @dogrun = Dogrun.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dogrun_params
      params.require(:dogrun).permit(:dogrun_name, :image, :address, :pr, :user_id)
    end
end
