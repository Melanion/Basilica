class UsersController < ApplicationController
  
  # GET /users
  # GET /users.json
  def index
    #@users = User.order_by(:name.desc)
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  # GET /users/Wes
  # GET /users/Wes.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.find_by_name(params[:user][:name])
    if @user && @user.authenticate("initial")
      @user.update_attributes(password: params[:user][:password], 
                              password_confirmation: params[:user][:password_confirmation])
      respond_to do |format|
        if @user.save
          format.html { redirect_to "/log_in", notice: "User #{@user.name} 
          was successfully created." }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url, notice: "User accounts must be created in-game first"
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.where(name: params[:name]).first

    respond_to do |format|
      if @user.update_attributes(balance: params[:balance])
        format.html { redirect_to users_url, notice: "User #{@user.name} 
        was successfully updated. Balance: #{@user.balance}" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def get_user_balance
    if params[:name] =~ /^\D/
      @user = User.find_by_name(params[:name])
      if @user == nil
        @user = User.new(name: params[:name], balance: 5000,
                         password: "initial", password_confirmation: "initial")
      end
    else
      @user = User.find(params[:name])
    end

    respond_to do |format|
      if @user.save
        format.html # show.html.erb
        format.json { render json: "#{@user.balance}" }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
