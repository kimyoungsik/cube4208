class EntriesController < ApplicationController
  # skip_before_filter :user_access_denied
  before_filter :team_user, :only => [:destroy, :edit, :update]
  respond_to :html, :json
  # GET /entries
  # GET /entries.json
  def index
    if current_user.mentor_approved?
      @entries = []
      @prev_month_entries = []
      current_user.organization.teams.each do |team|
        @entries += team.entries
        @prev_month_entries += team.entries.find(:all, :conditions => ["invoice_datetime between ? and ?", Time.now.prev_month.beginning_of_month, Time.now.prev_month.end_of_month])
        
      end
      
    elsif current_user.user_approved?
      @entries = current_user.team.entries
      @prev_month_entries = current_user.team.entries.find(:all, :conditions => ["invoice_datetime between ? and ?", Time.now.prev_month.beginning_of_month, Time.now.prev_month.end_of_month])

    elsif current_user.head_approved?
      @entries = []
      @prev_month_entries = []
      current_user.head_organization.organizations.each do |organization|
        organization.teams.each do |team|
          @entries += team.entries
          @prev_month_entries += team.entries.find(:all, :conditions => ["invoice_datetime between ? and ?", Time.now.prev_month.beginning_of_month, Time.now.prev_month.end_of_month])
        end
      end
      
    end
    # @prev_month_entries = current_user.team.entries.find(:all, :conditions => ["invoice_datetime between ? and ?", Time.now.prev_month.beginning_of_month, Time.now.prev_month.end_of_month])
    # prev_month.beginning_of_month
    @items = []
    Item.where(:category_id => 1).each do |item|
      @items << [item.id, "#{item.category.name} - #{item.name}"]
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
      format.pdf do 
        pdf = EntriesPdf.new(@prev_month_entries)
        send_data pdf.render, filename: "order_.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.json
  def new
    @entry = current_user.entries.build(:team_id => current_user.team_id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        format.html { render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update
    @entry = Entry.find(params[:id])

    if @entry.team.mentor?(current_user) or @entry.team.member?(current_user)
      # @entry.update_attributes(params[:entry])
      # respond_with @entry
    
      respond_to do |format|
        if @entry.update_attributes(params[:entry])
          format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @entry.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to entries_path
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :no_content }
    end
  end
  
  
  private 
  #same team user or mentor
  def team_user
    @entry = Entry.find(params[:id])
    ret = false
    if current_user.mentor_approved?
      if current_user.organization_id == @entry.team.organization_id
        ret = true
      end
    else
      if current_user.team_id == @entry.team_id
        ret = true
      end
    end
    redirect_to entries_path unless ret
  end

end
