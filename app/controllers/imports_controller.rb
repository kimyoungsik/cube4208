class ImportsController < ApplicationController
  # GET /imports
  # GET /imports.json
  def index
    @imports = Import.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @imports }
    end
  end

  # GET /imports/1
  # GET /imports/1.json
  def show
    @import = Import.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @import }
    end
  end

  # GET /imports/new
  # GET /imports/new.json
  def new
    @import = Import.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @import }
    end
  end

  # GET /imports/1/edit
  def edit
    @import = Import.find(params[:id])
  end

  # POST /imports
  # POST /imports.json
  def create
    @import = Import.new(params[:import])

    respond_to do |format|
      if @import.save        
        book = Spreadsheet.open Rails.public_path + @import.spreadsheet.url(:original, false)
        sheet1 = book.worksheet 0
        
        success = 0
        failure = 0

        sheet1.each do |row|
          amount = row[4]

          if amount != nil and amount.to_i > 0
            payment_method = row[3]
            vendor = row[6]
            branch = row[8]

            date = row[1]
            parsedate = date.to_s.split('-')
            year = parsedate[0]
            month = parsedate[1]
            date = parsedate[2]

            time = row[2]
            parsetime = time.to_s.split(':')
            hour = parsetime[0]
            min = parsetime[1]
            sec = parsetime[2]

            # find out better solution for time zone setting
            invoice_datetime = Time.new(year.to_i, month.to_i, date.to_i,hour.to_i,min.to_i,sec.to_i)
            invoice_datetime = invoice_datetime + 9.hours

            @entry = Entry.new(:user_id => @import.user_id, :team_id => @import.team_id, :import_id => @import, :amount => amount, 
                          :vendor => vendor, :invoice_datetime => invoice_datetime,
                          :payment_method => payment_method, :branch => branch)
            if @entry.save
              success += 1
            else
              failure += 1
            end
          end
        end
        format.html { redirect_to entries_path, notice: "Successfully imported #{success} entries (#{failure} failures)" }
        format.json { render json: @import, status: :created, location: @import }
      else
        format.html { render action: "new" }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /imports/1
  # PUT /imports/1.json
  def update
    @import = Import.find(params[:id])

    respond_to do |format|
      if @import.update_attributes(params[:import])
        format.html { redirect_to @import, notice: 'Import was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imports/1
  # DELETE /imports/1.json
  def destroy
    @import = Import.find(params[:id])
    @import.destroy

    respond_to do |format|
      format.html { redirect_to imports_url }
      format.json { head :no_content }
    end
  end
end
