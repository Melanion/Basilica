class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.where(:item_id => params[:item_id], :meta => params[:meta]).first

    if @item
      if (params[:quantity].to_i < 0) && @item.quantity >= @item.package
        if current_user && (current_user.balance < @item.value)
           redirect_to items_url, notice: "You can't afford any #{@item.name}."
        elsif current_user
          @item.update_attributes(:quantity => (@item.quantity + params[:quantity].to_i))
          user = User.find_by_name(current_user.name)
          user.update_attributes(:balance => (user.balance - @item.value))
          redirect_to items_url, notice: "You bought #{@item.name} x #{@item.package} for #{@item.value} credits."
        else
          @item.update_attributes(:quantity => (@item.quantity + params[:quantity].to_i))
          redirect_to items_url, notice: "Quantity of #{@item.name} decreased."
        end
      else
        @item.update_attributes(:quantity => (@item.quantity + params[:quantity].to_i))
        redirect_to items_url, notice: "Quantity of #{@item.name} increased."
      end
    else
      redirect_to items_url
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
end
