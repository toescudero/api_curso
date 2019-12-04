# frozen_string_literal: true

require 'test_helper'

class RanksCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ranks_course = ranks_courses(:one)
  end

  test 'should get index' do
    get ranks_courses_url, as: :json
    assert_response :success
  end

  test 'should create ranks_course' do
    assert_difference('RanksCourse.count') do
      post ranks_courses_url, params: { ranks_course: { course_id: @ranks_course.course_id, end_date: @ranks_course.end_date, expire_date: @ranks_course.expire_date, person_id: @ranks_course.person_id, points: @ranks_course.points, status: @ranks_course.status, teacher: @ranks_course.teacher } }, as: :json
    end

    assert_response 201
  end

  test 'should show ranks_course' do
    get ranks_course_url(@ranks_course), as: :json
    assert_response :success
  end

  test 'should update ranks_course' do
    patch ranks_course_url(@ranks_course), params: { ranks_course: { course_id: @ranks_course.course_id, end_date: @ranks_course.end_date, expire_date: @ranks_course.expire_date, person_id: @ranks_course.person_id, points: @ranks_course.points, status: @ranks_course.status, teacher: @ranks_course.teacher } }, as: :json
    assert_response 200
  end

  test 'should destroy ranks_course' do
    assert_difference('RanksCourse.count', -1) do
      delete ranks_course_url(@ranks_course), as: :json
    end

    assert_response 204
  end
end
