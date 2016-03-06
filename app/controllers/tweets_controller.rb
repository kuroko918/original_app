class TweetsController < ApplicationController
  def index
    @tweets = Tweet.where(genre: @genre)
    # @tags = ActsAsTaggableOn::Tag.most_used
  end

  def new
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id]).update(tweet_params)
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.user_id == current_user.id
      @tweet.destroy
    end
  end

  def search
    @tweets1 = Tweet.where('title LIKE(?)', "%#{params[:keyword]}%")
    @tweets2 = Tweet.where('text LIKE(?)', "%#{params[:keyword]}%")
    @tweets3 = Tweet.tagged_with("#{params[:keyword]}")
  end

  def eat
    @tweets = Tweet.where(genre: 'eat')
  end

  def event
    @tweets = Tweet.where(genre: 'event')
  end

  def trip
    @tweets = Tweet.where(genre: 'trip')
  end

  private
  def tweet_params
    params.require(:tweet).permit(:genre, :tag_list , :text ,:title , :movie).merge(user_id: current_user.id)
  end
end
