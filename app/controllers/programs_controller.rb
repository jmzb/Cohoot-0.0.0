class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  # GET /programs
  # GET /programs.json
  def index
    @programs = Program.all
  end

  # GET /programs/1
  # GET /programs/1.json

  def show
    @program = Program.find(params[:id])
        #@locations = @program.organization.locations.load
        @users = @program.users.load
        @campaigns = @program.campaigns.load
        @organization = Organization.find_by(@program.organization_id)
  end

  # GET /programs/new
  def new
    @program = Program.new
      @user = current_user
      @organization = @user.staff.organization
  end

  # GET /programs/1/edit
  def edit
      @program = Program.find(params[:id])
      @user = current_user
      @organization = @user.staff.organization
  end

  # POST /programs
  # POST /programs.json
  def create
    @program = Program.new(program_params)

    respond_to do |format|
      if @program.save
        format.html { redirect_to @program, notice: 'Program was successfully created.' }
        format.json { render action: 'show', status: :created, location: @program }
      else
        format.html { render action: 'new' }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programs/1
  # PATCH/PUT /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to @program, notice: 'Program was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to programs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_params
      params.require(:program).permit(:prog_name, :prog_obj, 
        :organization_id, :ideal_candidate, :goal_condition, :next_step, 
            :hrs_mon_s, :hrs_mon_e, :hrs_tues_s, :hrs_tues_e, :hrs_wed_s, :hrs_wed_e, :hrs_thurs_s, :hrs_thurs_e,
            :hrs_fri_s, :hrs_fri_e, :hrs_sat_s, :hrs_sat_e, :hrs_sun_s, :hrs_sun_e,
            :candidate_requirements,  :prog_cost, :prog_hours, :prog_hours_per_units, :length_of_prog)
    end
end
  
  