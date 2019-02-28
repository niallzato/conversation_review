class ReviewController < ApplicationController

  def index
    @review = reviewing
  end

  def show
    @review = Review.find(params[:id])
  end

  def pull
    to_review = Conversation.where(reviewed: false).first
    to_review.reviewed = true
    to_review.save
    review = Review.create(conversation_id: to_review.id, reviewed: false, assigned: 76)
    review.save
    review
  end

  def save_review
    if review_valid?
      Review.save
      flash[:notice] = "Review submitted"
    else
      flash[:notice] = "Not valid"
    end
  end

  def review_valid?
    true
  end

  def assigned_review
    Review.where(assigned: 76, reviewed: false).first
  end

  def reviewing
    return assigned_review unless assigned_review.blank?
    pull
  end

  def submit
    scrubbed_params = validation(params["review"])
    review = Review.update(scrubbed_params["id"], reviewed: true, tone: scrubbed_params["tone"], quality: scrubbed_params["quality"], fip: scrubbed_params["fip"], notes: scrubbed_params["notes"])
    review.save
    redirect_to request.referrer
  end

  def validation(params)
    params
  end

  # def my_reviews
  #   @reviews = Review.joins(:conversation).where(reviewed: true, conversations: {admin_id: 2627767})
  # end
  #
  # def my_reviewed
  #   @reviews = Review.where(reviewed: true, assigned: 76)
  # end

end
