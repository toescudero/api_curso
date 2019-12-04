# frozen_string_literal: true

class RanksChallengesController < ApplicationController
  before_action :set_ranks_challenge, only: %i[show update destroy]

  # GET /ranks_challenges?challenge_id=*challenge*
  def index
    top_ten = {}
    rtop_pid = []
    rpoints = []
    ranks_challenge = RanksChallenge.where(challenge_id: ranks_challenge_params[:challenge_id]).order(points: :desc) # #.first(10)
    ranks_challenge.each do |r|
      rtop_pid << r.person_id
      rpoints << r.points
    end
    top_people = Person.where(id: rtop_pid)
    top_people.each do |i|
      top_ten[i.first_names + ' ' + i.last_names] = rpoints.delete_at(0)
    end
    render json: top_ten
  end

  # GET /ranks_challenges/1
  def show
    render json: @ranks_challenge
  end

  # POST /ranks_challenges
  def create
    @ranks_challenge = RanksChallenge.new(ranks_challenge_params)

    if @ranks_challenge.save
      render json: @ranks_challenge, status: :created, location: @ranks_challenge
    else
      render json: @ranks_challenge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ranks_challenges/1
  def update
    if @ranks_challenge.update(ranks_challenge_params)
      render json: @ranks_challenge
    else
      render json: @ranks_challenge.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ranks_challenges/1
  def destroy
    @ranks_challenge.destroy
  end

    private

  # Use callbacks to share common setup or constraints between actions.
  def set_ranks_challenge
    @ranks_challenge = RanksChallenge.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def ranks_challenge_params
    params.permit(:challenge_id)
  end
  end
