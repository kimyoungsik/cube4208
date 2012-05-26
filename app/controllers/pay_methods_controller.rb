class PayMethodsController < ApplicationController
  before_filter :head_approved
  # GET /pay_methods
  # GET /pay_methods.json
  def index
    @pay_methods = PayMethod.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pay_methods }
    end
  end

  # GET /pay_methods/1
  # GET /pay_methods/1.json
  def show
    @pay_method = PayMethod.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pay_method }
    end
  end

  # GET /pay_methods/new
  # GET /pay_methods/new.json
  def new
    @pay_method = PayMethod.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pay_method }
    end
  end

  # GET /pay_methods/1/edit
  def edit
    @pay_method = PayMethod.find(params[:id])
  end

  # POST /pay_methods
  # POST /pay_methods.json
  def create
    @pay_method = PayMethod.new(params[:pay_method])

    respond_to do |format|
      if @pay_method.save
        format.html { redirect_to @pay_method, notice: 'Payment method was successfully created.' }
        format.json { render json: @pay_method, status: :created, location: @pay_method }
      else
        format.html { render action: "new" }
        format.json { render json: @pay_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pay_methods/1
  # PUT /pay_methods/1.json
  def update
    @pay_method = PayMethod.find(params[:id])

    respond_to do |format|
      if @pay_method.update_attributes(params[:pay_method])
        format.html { redirect_to @pay_method, notice: 'Payment method was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pay_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_methods/1
  # DELETE /pay_methods/1.json
  def destroy
    @pay_method = PayMethod.find(params[:id])
    @pay_method.destroy

    respond_to do |format|
      format.html { redirect_to pay_methods_url }
      format.json { head :no_content }
    end
  end
  
  private
  def head_approved
    if !current_user.head_approved?
      redirect_to root_path
    end
  end
end
