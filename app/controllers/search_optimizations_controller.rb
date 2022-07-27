class SearchOptimizationsController < ApplicationController
  before_action :set_search_optimization, only: %i[ show edit update destroy ]

  # GET /search_optimizations or /search_optimizations.json
  def index
    @search_optimizations = SearchOptimization.all
  end

  # GET /search_optimizations/1 or /search_optimizations/1.json
  def show
  end

  # GET /search_optimizations/new
  def new
    @search_optimization = SearchOptimization.new
  end

  # GET /search_optimizations/1/edit
  def edit
  end

  # POST /search_optimizations or /search_optimizations.json
  def create
    @search_optimization = SearchOptimization.new(search_optimization_params)

    respond_to do |format|
      if @search_optimization.save
        format.html { redirect_to search_optimization_url(@search_optimization), notice: "Search optimization was successfully created." }
        format.json { render :show, status: :created, location: @search_optimization }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @search_optimization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_optimizations/1 or /search_optimizations/1.json
  def update
    respond_to do |format|
      if @search_optimization.update(search_optimization_params)
        format.html { redirect_to search_optimization_url(@search_optimization), notice: "Search optimization was successfully updated." }
        format.json { render :show, status: :ok, location: @search_optimization }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @search_optimization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_optimizations/1 or /search_optimizations/1.json
  def destroy
    @search_optimization.destroy

    respond_to do |format|
      format.html { redirect_to search_optimizations_url, notice: "Search optimization was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_optimization
      @search_optimization = SearchOptimization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def search_optimization_params
      params.require(:search_optimization).permit(:keyword, :city, :blog_id)
    end
end
