class LimitsController < ApplicationController
  # GET /limits
  # GET /limits.json
  def index
    @limits = Limit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @limits }
    end
  end

  # GET /limits/1
  # GET /limits/1.json
  def show
    @limit = Limit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @limit }
    end
  end

  # GET /limits/new
  # GET /limits/new.json
  def new
    @limit = Limit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @limit }
    end
  end

  # GET /limits/1/edit
  def edit
    @limit = Limit.find(params[:id])
  end

  # POST /limits
  # POST /limits.json
  def create
    @limit = Limit.new(params[:limit])

    respond_to do |format|
      if @limit.save
        format.html { redirect_to @limit, notice: 'Limit was successfully created.' }
        format.json { render json: @limit, status: :created, location: @limit }
      else
        format.html { render action: "new" }
        format.json { render json: @limit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /limits/1
  # PUT /limits/1.json
  def update
    @limit = Limit.find(params[:id])

    respond_to do |format|
      if @limit.update_attributes(params[:limit])
        format.html { redirect_to @limit, notice: 'Limit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @limit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /limits/1
  # DELETE /limits/1.json
  def destroy
    @limit = Limit.find(params[:id])
    @limit.destroy

    respond_to do |format|
      format.html { redirect_to limits_url }
      format.json { head :no_content }
    end
  end
end
