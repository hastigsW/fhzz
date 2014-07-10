class BunnersController < ApplicationController
  before_action :set_bunner, only: [:show, :edit, :update, :destroy]

  # GET /bunners
  # GET /bunners.json
  def index
    @bunners = Bunner.all
  end

  # GET /bunners/1
  # GET /bunners/1.json
  def show
  end

  # GET /bunners/new
  def new
    @bunner = Bunner.new
  end

  # GET /bunners/1/edit
  def edit
  end

  # POST /bunners
  # POST /bunners.json
  def create
    @bunner = Bunner.new(bunner_params)

    respond_to do |format|
      if @bunner.save
        format.html { redirect_to @bunner, notice: 'Bunner was successfully created.' }
        format.json { render :show, status: :created, location: @bunner }
      else
        format.html { render :new }
        format.json { render json: @bunner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bunners/1
  # PATCH/PUT /bunners/1.json
  def update
    respond_to do |format|
      if @bunner.update(bunner_params)
        format.html { redirect_to @bunner, notice: 'Bunner was successfully updated.' }
        format.json { render :show, status: :ok, location: @bunner }
      else
        format.html { render :edit }
        format.json { render json: @bunner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bunners/1
  # DELETE /bunners/1.json
  def destroy
    @bunner.destroy
    respond_to do |format|
      format.html { redirect_to bunners_url, notice: 'Bunner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bunner
      @bunner = Bunner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bunner_params
      return {} if params[:bunner].blank?
      params.require(:bunner).permit(:avatar)
    end
end
