class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all.order(created_at: :desc)
    end
    
    def new
        @tweet = Tweet.new
    end

    def show
        @tweet = Tweet.find(params[:id])
    end
    
    def create
        @tweet = Tweet.new(tweet_params)
        if @tweet.save
            redirect_to root_path, notice: "投稿しました"
        else
            render :new
        end
    end

    def edit
        @tweet = Tweet.find(params[:id])
    end

    def update
        @tweet = Tweet.find(params[:id])
        if @tweet.update(tweet_params)
            redirect_to @tweet, notice: "更新しました"
        else
            render :edit
        end
    end

    def destroy
        @tweet = Tweet.find(params[:id])
        @tweet.destroy
        redirect_to root_path, notice: "削除しました"
    end
    
    private
    
    def tweet_params
        params.require(:tweet).permit(:content)
    end
end
