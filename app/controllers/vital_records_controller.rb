class VitalRecordsController < ApplicationController
  before_action :set_vital_record, only: %i[ show edit update destroy ]

  # GET /vital_records or /vital_records.json
  def index
    @vital_records = VitalRecord.all
  end

  # GET /vital_records/1 or /vital_records/1.json
  def show
  end

  # GET /vital_records/new
  def new
    @vital_record = VitalRecord.new
  end

  # GET /vital_records/1/edit
  def edit
  end

  # POST /vital_records or /vital_records.json
  def create
    @vital_record = VitalRecord.new(vital_record_params)

    respond_to do |format|
      if @vital_record.save
        format.html { redirect_to @vital_record, notice: "Vital record was successfully created." }
        format.json { render :show, status: :created, location: @vital_record }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @vital_record.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /vital_records/1 or /vital_records/1.json
  def update
    respond_to do |format|
      if @vital_record.update(vital_record_params)
        format.html { redirect_to @vital_record, notice: "Vital record was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @vital_record }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @vital_record.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /vital_records/1 or /vital_records/1.json
  def destroy
    @vital_record.destroy!

    respond_to do |format|
      format.html { redirect_to vital_records_path, notice: "Vital record was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vital_record
      @vital_record = VitalRecord.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def vital_record_params
      params.expect(vital_record: [ :recorded_at, :weight, :blood_sugar, :systolic_pressure, :diastolic_pressure, :memo ])
    end
end
