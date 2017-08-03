class ReviewsController < ApplicationController

  def create

    @review = Review.new(
     description: params[:review][:description],
     rating: params[:review][:rating],
     user_id:current_user.id,
     product_id: params[:product_id])

     @review.save

    if @review.save
      puts "I SAVED!"
      redirect_to "/products/#{params[:product_id]}"

    else
      puts "DID NOT SAVE"
      redirect_to "/products/#{params[:product_id]}"
    end
  end

  private

end
