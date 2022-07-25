class SearchOpmtimizationsController < ApplicationController
  before_action :set_search_opmtimization, only: %i[ show edit update destroy ]

  # GET /search_opmtimizations or /search_opmtimizations.json
  def index
    @search_opmtimizations = SearchOpmtimization.all
  end

  # GET /search_opmtimizations/1 or /search_opmtimizations/1.json
  def show
  end

  # GET /search_opmtimizations/new
  def new
    @search_opmtimization = SearchOpmtimization.new
  end

  # GET /search_opmtimizations/1/edit
  def edit
  end

  # POST /search_opmtimizations or /search_opmtimizations.json
  def create
    @search_opmtimization = SearchOpmtimization.new(search_opmtimization_params)

    respond_to do |format|
      if @search_opmtimization.save
        format.html { redirect_to search_opmtimization_url(@search_opmtimization), notice: "Search opmtimization was successfully created." }
        format.json { render :show, status: :created, location: @search_opmtimization }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @search_opmtimization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_opmtimizations/1 or /search_opmtimizations/1.json
  def update
    respond_to do |format|
      if @search_opmtimization.update(search_opmtimization_params)
        format.html { redirect_to search_opmtimization_url(@search_opmtimization), notice: "Search opmtimization was successfully updated." }
        format.json { render :show, status: :ok, location: @search_opmtimization }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @search_opmtimization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_opmtimizations/1 or /search_opmtimizations/1.json
  def destroy
    @search_opmtimization.destroy

    respond_to do |format|
      format.html { redirect_to search_opmtimizations_url, notice: "Search opmtimization was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_opmtimization
      @search_opmtimization = SearchOpmtimization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def search_opmtimization_params
      params.require(:search_opmtimization).permit(:keyword, :city, :blog_id)
    end
end
