#encoding:utf-8
class EntriesController < ApplicationController
  # skip_before_filter :user_access_denied
  before_filter :team_user, :only => [:destroy, :edit, :update]
  respond_to :html, :json
  # GET /entries
  # GET /entries.json
  def index
    if current_user.mentor_approved? 
      @entries = []
      # @prev_month_entries = []
      current_user.organization.teams.each do |team|
        # @entries += team.entries
        @entries += team.entries.find(:all, :conditions => ["status != ?",'approved'])
        # @prev_month_entries += team.entries.find(:all, :conditions => ["invoice_datetime between ? and ?", Time.now.prev_month.beginning_of_month, Time.now.prev_month.end_of_month])
      end
      
    elsif current_user.user_approved?
      @entries = current_user.team.entries
      @prev_month_entries = current_user.team.entries.find(:all, :conditions => ["invoice_datetime between ? and ?", Time.now.prev_month.beginning_of_month, Time.now.prev_month.end_of_month])

    elsif current_user.head_approved?
      @entries = []
    # @prev_month_entries = []
      current_user.head_organization.organizations.each do |organization|
        organization.teams.each do |team|
          @entries += team.entries
        # @prev_month_entries += team.entries.find(:all, :conditions => ["invoice_datetime between ? and ?", Time.now.prev_month.beginning_of_month, Time.now.prev_month.end_of_month])
        end
      end
    end
      
    
    # @prev_month_entries = current_user.team.entries.find(:all, :conditions => ["invoice_datetime between ? and ?", Time.now.prev_month.beginning_of_month, Time.now.prev_month.end_of_month])
    # prev_month.beginning_of_month
    @items = []
    Item.where(:category_id => 1).each do |item|
      @items << [item.id, "#{item.category.name} - #{item.name}"]
    end
    
    @pay_methods = []
    PayMethod.all.each do |method|
      @pay_methods << [method.id,"#{method.name}"]
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
      format.pdf do 
        # entry = validate_entries(@prev_month_entries)
        pdf = EntriesPdf.new(@prev_month_entries)
        send_data pdf.render, filename: "order_.pdf",
                              type: "application/pdf",
                              disposition: "inline"
        # unless( entry == nil)
          # flash[:success] = "#{entry.invoice_datetime.strftime("%Y-%m-%d %H:%M")}보고서 =>  승인 안됨 #{'목, 세목 선택' unless entry.item_id} #{'적요 입력 ' if entry.summary.blank?} #{entry.comment unless entry.comment.blank?}"
        # end
      end
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.find(params[:id])
    @pay_methods = []
    PayMethod.all.each do |method|
      @pay_methods << [method.id,"#{method.name}"]
    end
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
    if @entry.team.mentor?(current_user) or @entry.team.member?(current_user) or current_user.head_approved?
      if @entry.status == "rejected" and !@entry.comment.blank?
        @comment = @entry.comment
        duplicate_send_email = true
      end
        
      respond_to do |format|
        if @entry.update_attributes(params[:entry])
          if @entry.status == "rejected" and !@entry.comment.blank? and (duplicate_send_email == false or @comment != @entry.comment)
            UserMailer.send_email(
            @entry.team.leader_user,
            "활동비 신청(#{@entry.invoice_datetime.strftime("%Y-%m-%d %H:%M")}) 의 거절 사유",
            "거절 사유 : #{@entry.comment}",
            "수정된사항은 48시간 이내 확인됩니다. 문의사항은 답장으로 부탁드립니다.",
            "#{entry_url(@entry)}"
            ).deliver
          end
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
    elsif current_user.head_approved?
      ret = true
    else
      if current_user.team_id == @entry.team_id
        ret = true
      end
    end
    
    redirect_to entries_path unless ret
  end


  # def validate_entries(entries)
  #   ret = nil
  #   entries.each do |entry|
  #     unless entry.status == "approved"
  #       return ret = entry
  #     end
  #   end
  #   ret
  # end
end
