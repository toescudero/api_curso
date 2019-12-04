# frozen_string_literal: true

class SignupController < ApplicationController
  def signup_course
    # #future feature add the points of previuos challenges of the related course
    sign = RanksCourse.new do |s|
      s.person_id = sign_params[:person_id]
      s.course_id = sign_params[:course_id]
      s.teacher = sign_params[:teacher]
      s.points = 0
      s.status = true
    end
    sign.save
    person = Person.find(sign_params[:person_id])
    course = Course.find(sign_params[:course_id])
    person.course_ids << course
    course.person_ids << person
    person.save
    course.save
    render json: sign
  end

  def signup_challenge
    sign = RanksChallenge.new do |s|
      s.person_id = sign_params[:person_id]
      s.challenge_id = sign_params[:challenge_id]
      s.teacher = sign_params[:teacher]
      s.points = 0
      s.status = true
      s.expire_date = Time.now + Challenge.find(sign_params[:challenge_id]).time_limit * 3600
    end
    sign.save
    person = Person.find(sign_params[:person_id])
    challenge = Challenge.find(sign_params[:challenge_id])
    person.challenge_ids << challenge
    challenge.person_ids << person
    person.save
    challenge.save
    render json: sign
  end

  def update_course
    rcourse = RanksCourse.find_by(course_id: sign_params[:course_id], person_id: sign_params[person_id])
    return render json: {}, status: :not_found if rcourse.nil?

    render json { error = 'curso finalizado' } if rcourse.status == false
    rcourse.points += sign_params[:points]
    if rcourse.points > Course.find(rcourse.course_id).required_points
      rcourse.status = false
      rcourse.end_date = Time.now
    end
    rcourse.save
  end

  def update_challenge
    rchallange = RanksChallenge.find_by(challenge_id: sign_params[:challenge_id], person_id: sign_params[:person_id])
    return render json: {}, status: :not_found if rchallange.nil?

    render json { error = 'reto finalizado' } if rchallange.status == false
    if rchallange.expire_date < Time.now
      rchallange.status = false
      rchallange.end_date = Time.now
      rchallange.save
      render json: { finish_status: 'time out', points: rchallange.points }
    end
    rchallange.update points: sign_params[:points] + rchallange.points
    rcourse = RanksCourse.find_by(course_id: Challenge.find(sign_params[:challenge_id]).course_id, person_id: sign_params[:person_id])
    if rcourse.present?
      rcourse.points += rchallange.points
      if rcourse.points > Course.find(rcourse.course_id).required_points
        rcourse.status = false
        rcourse.end_date = Time.now
        rcourse.save
      end
    end
  end

  def dismiss_course
    rcourse = RanksCourse.find_by(course_id: sign_params[:course_id], person: sign_params[:person_id])
    return render json: {}, status: :not_found if rcourse.nil?

    if rcourse.status == false
      render json: { m => 'alredy done' }
    else
      rcourse.status = false
      person = Person.find(rcourse.person)
      course = Course.find(rcourse.challenge_id)
      person.course_ids.delete(rcourse.course_id)
      course.person_ids.delete(rcourse.person)
      person.save
      course.save
    end
  end

  def dismiss_challenge
    rchallange = RanksChallenge.find_by(challenge_id: sign_params[:challenge_id], person: sign_params[:person_id])
    return render json: {}, status: :not_found if rchallange.nil?

    if rchallange.status == false
      render json: { m => 'alredy done' }
    else
      rchallange.status = false
      person = Person.find(rchallange.person_id)
      course = Challenge.find(rchallange.challenge_id)
      person = Person.find(rchallange.person_id)
      challenge = Challenge.find(rchallange.challenge_id)
      person.challenge_ids.delete(rchallange.challenge_id)
      challenge.person_ids.delete(rchallange.person)
      person.save
      challenge.save
    end
  end

     private

  def sign_params
    params.permit(:person_id, :challenge_id, :course_id, :teacher, :points, :status)
  end
   end
