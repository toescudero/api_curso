
  class RanksCoursesController < ApplicationController
    before_action :set_ranks_course, only: [:show, :update, :destroy]

    # GET /ranks_courses?course_id=*ronked*
    def index
      top_ten = {}
      rtop_pid = []
      rpoints = []
      ranks_course = RanksCourse.where(course_id: ranks_course_params[:course_id]).order(points: :desc)##.first(10)
      ranks_course.each do |r|
        rtop_pid << r.person_id 
        rpoints << r.points
      end
      top_people = Person.where(id: rtop_pid)
      top_people.each do | i |
        top_ten[i.first_names + " " + i.last_names] = rpoints.delete_at(0)
      end
      render json: top_ten
    end

    # GET /ranks_courses/1
    def show
      render json: @ranks_course
    end

    # POST /ranks_courses
    def create
      @ranks_course = RanksCourse.new(ranks_course_params)

      if @ranks_course.save
        render json: @ranks_course, status: :created, location: @ranks_course
      else
        render json: @ranks_course.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /ranks_courses/1
    def update
      if @ranks_course.update(ranks_course_params)
        render json: @ranks_course
      else
        render json: @ranks_course.errors, status: :unprocessable_entity
      end
    end

    # DELETE /ranks_courses/1
    def destroy
      @ranks_course.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_ranks_course
        @ranks_course = RanksCourse.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def ranks_course_params
        params.permit(:course_id)
      end
  end
