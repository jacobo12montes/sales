class SalesController < ApplicationController
  before_action :set_sale, only: %i[show edit update destroy]

  # GET /sales or /sales.json
  def index
    @sales = current_user.sales.ordered_by_most_recent.includes(:groups)
    @groups = Group.all
    # @total = @sales.total
    def image 
      Sale.groups.first.icon
    end 
  end

  def external
    @sales = current_user.sales.externals.ordered_by_most_recent
    @total = @sales.total
    def image 
      Sale.groups.first.icon
    end  
  end

  # GET /sales/1 or /sales/1.json
  def show; end

  # GET /sales/new
  def new
    @sale = Sale.new
    @groups = Group.select_options
  end

  # GET /sales/1/edit
  def edit
    @groups = Group.select_options
  end

  # POST /sales or /sales.json
  def create
    @groups = Group.select_options
    @sale = current_user.sales.new(sale_params)

    respond_to do |format|
      if @sale.save
        @group = params[:sale][:group]
        if @group != 0
          @relation = Groupsale.new(group_id: @group, sale_id: @sale.id)
          @relation.save
        end

        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1 or /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1 or /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sale
    @sale = Sale.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sale_params
    params.require(:sale).permit(:title, :description, :amount, :date, :picture, :group_id)
  end
end
