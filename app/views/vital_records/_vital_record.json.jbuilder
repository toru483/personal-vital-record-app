json.extract! vital_record, :id, :recorded_at, :weight, :blood_sugar, :systolic_pressure, :diastolic_pressure, :memo, :created_at, :updated_at
json.url vital_record_url(vital_record, format: :json)
