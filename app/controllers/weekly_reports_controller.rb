class WeeklyReportsController < ApplicationController
  # GET /weekly_reports
  # GET /weekly_reports.json
  def index
    @weekly_reports = WeeklyReport.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weekly_reports }
    end
  end

  # GET /weekly_reports/1
  # GET /weekly_reports/1.json
  def show
    @weekly_report = WeeklyReport.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weekly_report }
      format.pdf do 
        pdf = WeeklyReportsPdf.new(@weekly_report,current_user)
        send_data pdf.render, filename: "order_.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
      
    end
  end

  # GET /weekly_reports/new
  # GET /weekly_reports/new.json
  def new
    @weekly_report = current_user.weekly_reports.build(:team_id => current_user.team_id)
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weekly_report }
    end
  end

  # GET /weekly_reports/1/edit
  def edit
    @weekly_report = WeeklyReport.find(params[:id])
  end

  # POST /weekly_reports
  # POST /weekly_reports.json
  def create
    @weekly_report = WeeklyReport.new(params[:weekly_report])

    respond_to do |format|
      if @weekly_report.save
        format.html { redirect_to @weekly_report, notice: 'WeeklyReport was successfully created.' }
        format.json { render json: @weekly_report, status: :created, location: @weekly_report }
      else
        format.html { render action: "new" }
        format.json { render json: @weekly_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /weekly_reports/1
  # PUT /weekly_reports/1.json
  def update
    @weekly_report = WeeklyReport.find(params[:id])

    respond_to do |format|
      if @weekly_report.update_attributes(params[:weekly_report])
        format.html { redirect_to @weekly_report, notice: 'WeeklyReport was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @weekly_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weekly_reports/1
  # DELETE /weekly_reports/1.json
  def destroy
    @weekly_report = WeeklyReport.find(params[:id])
    @weekly_report.destroy

    respond_to do |format|
      format.html { redirect_to weekly_reports_url }
      format.json { head :no_content }
    end
  end
end
