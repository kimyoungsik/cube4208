class WeekreportsController < ApplicationController
  # GET /weekreports
  # GET /weekreports.json
  def index
    @weekreports = Weekreport.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weekreports }
    end
  end

  # GET /weekreports/1
  # GET /weekreports/1.json
  def show
    @weekreport = Weekreport.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weekreport }
      format.pdf do 
        pdf = WeekreportsPdf.new(@weekreport,current_user)
        send_data pdf.render, filename: "order_.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
      
    end
  end

  # GET /weekreports/new
  # GET /weekreports/new.json
  def new
    @weekreport = current_user.weekreports.build(:team_id => current_user.team_id)
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weekreport }
    end
  end

  # GET /weekreports/1/edit
  def edit
    @weekreport = Weekreport.find(params[:id])
  end

  # POST /weekreports
  # POST /weekreports.json
  def create
    @weekreport = Weekreport.new(params[:weekreport])

    respond_to do |format|
      if @weekreport.save
        format.html { redirect_to @weekreport, notice: 'Weekreport was successfully created.' }
        format.json { render json: @weekreport, status: :created, location: @weekreport }
      else
        format.html { render action: "new" }
        format.json { render json: @weekreport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /weekreports/1
  # PUT /weekreports/1.json
  def update
    @weekreport = Weekreport.find(params[:id])

    respond_to do |format|
      if @weekreport.update_attributes(params[:weekreport])
        format.html { redirect_to @weekreport, notice: 'Weekreport was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @weekreport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weekreports/1
  # DELETE /weekreports/1.json
  def destroy
    @weekreport = Weekreport.find(params[:id])
    @weekreport.destroy

    respond_to do |format|
      format.html { redirect_to weekreports_url }
      format.json { head :no_content }
    end
  end
end
