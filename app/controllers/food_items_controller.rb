class FoodItemsController < ApplicationController 
  helper_method :sort_column, :sort_direction, :sort_section 
  before_action :set_food_item, only: [:show, :edit, :update, :destroy]
  
  # GET /food_items
  # GET /food_items.json
  def index
    @food_items = FoodItem.where(nil)
    @food_items = @food_items.section(sort_section) unless sort_section == ""
    @food_items = @food_items.order(sort_column + ' ' + sort_direction)
    # @food_items = @food_items.azorder if params["az"].present?
    # # @food_items = @food_items.low2highprice
    # @food_items = @food_items.high2low if params["h2l"].present?
  end

  # GET /food_items/1
  # GET /food_items/1.json
  def show
  end

  # GET /food_items/new
  def new
    @food_item = FoodItem.new
  end

  # GET /food_items/1/edit
  def edit
  end

  # POST /food_items
  # POST /food_items.json
  def create
    @food_item = FoodItem.new(food_item_params)

    respond_to do |format|
      if @food_item.save
        format.html { redirect_to @food_item, notice: 'Food item was successfully created.' }
        format.json { render :show, status: :created, location: @food_item }
      else
        format.html { render :new }
        format.json { render json: @food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_items/1
  # PATCH/PUT /food_items/1.json
  def update
    respond_to do |format|
      if @food_item.update(food_item_params)
        format.html { redirect_to @food_item, notice: 'Food item was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_item }
      else
        format.html { render :edit }
        format.json { render json: @food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_items/1
  # DELETE /food_items/1.json
  def destroy
    @food_item.destroy
    respond_to do |format|
      format.html { redirect_to food_items_url, notice: 'Food item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_item
      @food_item = FoodItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_item_params
      params.require(:food_item).permit(:name, :description, :price, :section, :imgurl)
    end
    
    # to sanitize the params input for sorting logic
    def sort_column
      FoodItem.column_names.include?(params[:sort]) ? params[:sort] : 'name' 
    end

    def sort_direction
      %w[desc asc].include?(params[:direction]) ? params[:direction] : "asc"      
    end

    def sort_section
      %w[Breakfast Lunch Dinner Drinks].include?(params[:section]) ? params[:section] : ""      
    end
end
