#encoding:utf-8
class TeamsController < ApplicationController
  before_filter :user_access_denied, :only => [:destroy, :new]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])
    @member = []
    @team.users.each do |user|
      @member << [user.id, "#{user.korean_full_name}"]
    end
    @prev_entries = @team.entries.find(:all, :conditions => ["invoice_datetime between ? and ?", Time.now.prev_month.beginning_of_month, Time.now.prev_month.end_of_month])
    @entries = @team.entries
    @pay_methods = []
      PayMethod.all.each do |method|
        @pay_methods << [method.id,"#{method.name}"]
    end
      
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
      format.pdf do 
        # entry = validate_entries(@entries)
      
        pdf = EntriesPdf.new(@prev_entries)
        send_data pdf.render, filename: "order_.pdf",
                              type: "application/pdf",
                              disposition: "inline"
        # unless( entry == nil)
        #   
        #   flash[:success] = "#{entry.invoice_datetime.strftime("%Y-%m-%d %H:%M")}보고서 =>  #{'목, 세목 선택' unless entry.item_id} #{'적요 입력 ' if entry.summary.blank?}"
        # end
      end
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
   
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end
  
  private 
  
  
  
   def user_access_denied
     if user_signed_in? and current_user.user_approved?
       redirect_to root_path
     end
   end
  
  # def validate_entries(entries)
  #   ret = nil
  #   entries.each do |entry|
  #     if entry.status == "pending"
  #       return ret = entry
  #     end
  #   end
  #   ret
  # end
  
end
