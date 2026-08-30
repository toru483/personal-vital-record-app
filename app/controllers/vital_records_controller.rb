class VitalRecordsController < ApplicationController
  before_action :set_vital_record, only: %i[ show edit update destroy ]

  # GET /vital_records or /vital_records.json
  # GET /vital_records or /vital_records.json
  def index
    @vital_records = VitalRecord.all.order(recorded_at: :desc)

    # 💡 過去10日間のデータを取得して平均値を計算するロジックを追加
    recent_records = VitalRecord.where(recorded_at: 10.days.ago.beginning_of_day..Time.current.end_of_day)

    @avg_weight = recent_records.average(:weight)&.round(1) # 小数点第1位まで
    @avg_blood_sugar = recent_records.average(:blood_sugar)&.round(0) # 整数
    @avg_systolic = recent_records.average(:systolic_pressure)&.round(0)
    @avg_diastolic = recent_records.average(:diastolic_pressure)&.round(0)
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

    if @vital_record.save
      # 💡 登録が成功したら、画面遷移先の「詳細画面」ではなく「トップ画面（一覧）」へ直接戻す
      redirect_to vital_records_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vital_records/1 or /vital_records/1.json
  def update
    @vital_record = VitalRecord.find(params[:id])

    if @vital_record.update(vital_record_params)
      # 💡 編集成功時、トップ画面へ戻しつつ「更新が成功したよ」という合図（flash）を送る
      redirect_to vital_records_path, flash: { quick_update: true }
    else
      render :edit, status: :unprocessable_entity
    end
  end



  # DELETE /vital_records/1 or /vital_records/1.json
  def destroy
    @vital_record = VitalRecord.find(params[:id])
    @vital_record.destroy

    # 💡 削除が成功したら、メッセージを伴わずにトップ画面（一覧）へ直接戻す
    redirect_to vital_records_path
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
