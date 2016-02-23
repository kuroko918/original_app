class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    @tags = ActsAsTaggableOn::Tag.most_used
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
  end

  def tweet_params
    params.require(:tweet).permit(:name, :genre_list, :label_list)
  end
end
