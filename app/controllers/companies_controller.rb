class CompaniesController < ApplicationController
  before_action :set_company, except: [:index, :new, :create]
  skip_before_action :set_group

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    redirect_to companies_url
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def company_params
    params.require(:company).permit(:name, :address, :tel, :fax, :url)
  end
end
