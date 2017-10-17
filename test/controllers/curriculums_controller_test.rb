require 'test_helper'

class CurriculumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @curriculum = curriculums(:one)
  end

  test "should get index" do
    get curriculums_url
    assert_response :success
  end

  test "should get new" do
    get new_curriculum_url
    assert_response :success
  end

  test "should create curriculum" do
    assert_difference('Curriculum.count') do
      post curriculums_url, params: { curriculum: { apellido_1: @curriculum.apellido_1, apellido_2: @curriculum.apellido_2, cargo1: @curriculum.cargo1, cargo2: @curriculum.cargo2, cargo3: @curriculum.cargo3, category_id: @curriculum.category_id, datos_i: @curriculum.datos_i, direccion: @curriculum.direccion, email: @curriculum.email, fecha_nac: @curriculum.fecha_nac, name: @curriculum.name, phone: @curriculum.phone, user_id: @curriculum.user_id } }
    end

    assert_redirected_to curriculum_url(Curriculum.last)
  end

  test "should show curriculum" do
    get curriculum_url(@curriculum)
    assert_response :success
  end

  test "should get edit" do
    get edit_curriculum_url(@curriculum)
    assert_response :success
  end

  test "should update curriculum" do
    patch curriculum_url(@curriculum), params: { curriculum: { apellido_1: @curriculum.apellido_1, apellido_2: @curriculum.apellido_2, cargo1: @curriculum.cargo1, cargo2: @curriculum.cargo2, cargo3: @curriculum.cargo3, category_id: @curriculum.category_id, datos_i: @curriculum.datos_i, direccion: @curriculum.direccion, email: @curriculum.email, fecha_nac: @curriculum.fecha_nac, name: @curriculum.name, phone: @curriculum.phone, user_id: @curriculum.user_id } }
    assert_redirected_to curriculum_url(@curriculum)
  end

  test "should destroy curriculum" do
    assert_difference('Curriculum.count', -1) do
      delete curriculum_url(@curriculum)
    end

    assert_redirected_to curriculums_url
  end
end
