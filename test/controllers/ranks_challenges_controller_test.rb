require 'test_helper'

class RanksChallengesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ranks_challenge = ranks_challenges(:one)
  end

  test "should get index" do
    get ranks_challenges_url, as: :json
    assert_response :success
  end

  test "should create ranks_challenge" do
    assert_difference('RanksChallenge.count') do
      post ranks_challenges_url, params: { ranks_challenge: { challenge_id: @ranks_challenge.challenge_id, end_date: @ranks_challenge.end_date, expire_date: @ranks_challenge.expire_date, person_id: @ranks_challenge.person_id, points: @ranks_challenge.points, status: @ranks_challenge.status, teacher: @ranks_challenge.teacher } }, as: :json
    end

    assert_response 201
  end

  test "should show ranks_challenge" do
    get ranks_challenge_url(@ranks_challenge), as: :json
    assert_response :success
  end

  test "should update ranks_challenge" do
    patch ranks_challenge_url(@ranks_challenge), params: { ranks_challenge: { challenge_id: @ranks_challenge.challenge_id, end_date: @ranks_challenge.end_date, expire_date: @ranks_challenge.expire_date, person_id: @ranks_challenge.person_id, points: @ranks_challenge.points, status: @ranks_challenge.status, teacher: @ranks_challenge.teacher } }, as: :json
    assert_response 200
  end

  test "should destroy ranks_challenge" do
    assert_difference('RanksChallenge.count', -1) do
      delete ranks_challenge_url(@ranks_challenge), as: :json
    end

    assert_response 204
  end
end
