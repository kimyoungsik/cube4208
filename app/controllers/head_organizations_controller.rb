class HeadOrganizationsController < ApplicationController
  # GET /head_organizations
  # GET /head_organizations.json
  def index
    @head_organizations = HeadOrganization.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @head_organizations }
    end
  end

  # GET /head_organizations/1
  # GET /head_organizations/1.json
  def show
    @head_organization = HeadOrganization.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @head_organization }
    end
  end

  # GET /head_organizations/new
  # GET /head_organizations/new.json
  def new
    @head_organization = HeadOrganization.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @head_organization }
    end
  end

  # GET /head_organizations/1/edit
  def edit
    @head_organization = HeadOrganization.find(params[:id])
  end

  # POST /head_organizations
  # POST /head_organizations.json
  def create
    @head_organization = HeadOrganization.new(params[:head_organization])

    respond_to do |format|
      if @head_organization.save
        format.html { redirect_to @head_organization, notice: 'Head organization was successfully created.' }
        format.json { render json: @head_organization, status: :created, location: @head_organization }
      else
        format.html { render action: "new" }
        format.json { render json: @head_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /head_organizations/1
  # PUT /head_organizations/1.json
  def update
    @head_organization = HeadOrganization.find(params[:id])

    respond_to do |format|
      if @head_organization.update_attributes(params[:head_organization])
        format.html { redirect_to @head_organization, notice: 'Head organization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @head_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /head_organizations/1
  # DELETE /head_organizations/1.json
  def destroy
    @head_organization = HeadOrganization.find(params[:id])
    @head_organization.destroy

    respond_to do |format|
      format.html { redirect_to head_organizations_url }
      format.json { head :no_content }
    end
  end
end
