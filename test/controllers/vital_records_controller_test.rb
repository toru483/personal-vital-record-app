require "test_helper"

class VitalRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vital_record = vital_records(:one)
  end

  test "should get index" do
    get vital_records_url
    assert_response :success
  end

  test "should get new" do
    get new_vital_record_url
    assert_response :success
  end

  test "should create vital_record" do
    assert_difference("VitalRecord.count") do
      post vital_records_url, params: { vital_record: { blood_sugar: @vital_record.blood_sugar, diastolic_pressure: @vital_record.diastolic_pressure, memo: @vital_record.memo, recorded_at: @vital_record.recorded_at, systolic_pressure: @vital_record.systolic_pressure, weight: @vital_record.weight } }
    end

    assert_redirected_to vital_record_url(VitalRecord.last)
  end

  test "should show vital_record" do
    get vital_record_url(@vital_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_vital_record_url(@vital_record)
    assert_response :success
  end

  test "should update vital_record" do
    patch vital_record_url(@vital_record), params: { vital_record: { blood_sugar: @vital_record.blood_sugar, diastolic_pressure: @vital_record.diastolic_pressure, memo: @vital_record.memo, recorded_at: @vital_record.recorded_at, systolic_pressure: @vital_record.systolic_pressure, weight: @vital_record.weight } }
    assert_redirected_to vital_record_url(@vital_record)
  end

  test "should destroy vital_record" do
    assert_difference("VitalRecord.count", -1) do
      delete vital_record_url(@vital_record)
    end

    assert_redirected_to vital_records_url
  end
end
