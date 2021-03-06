class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all.order("created_at DESC")
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @jobs = Job.where("title || job_type || region || category ILIKE ?", "%#{@name}%")
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @company = @job.companies.find_by(params[:job_id])
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @job.companies.build
  end

  # GET /jobs/1/edit
  def edit
    #@job.companies.build
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :category, :job_type, :headquarters, :region, :apply_link, :description,
      companies_attributes: [:name, :statement, :company_logo, :url, :email, :company_description])
    end
end
