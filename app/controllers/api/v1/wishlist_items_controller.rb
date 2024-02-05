module Api
  module V1
    class WishlistItemsController < ApplicationController

      before_action :get_user
      before_action :set_wishlist_item, only: [:update, :destroy]

      def index
        render json: @user.wishlist_items
      end

      def create
        wishlist_item = @user.wishlist_items.build(wishlist_item_params)

        if wishlist_item.save
          render json: wishlist_item, status: :created
        else
          render json: wishlist_item.errors, status: :unprocessable_entity
        end
      end

      def update
        if @wishlist_item.update(wishlist_item_params)
          render json: wishlist_item, status: :no_content
        else
          render json: wishlist_item.errors, status: :unprocessable_entity
        end
      end

      def destroy
        User.find(params[:id]).destroy!

        head :no_content
      end

      private

      def wishlist_item_params
        params.require(:wishlist_item).permit(:user_id, :name, :description)
      end

      def get_user
        @user = User.find(params[:user_id])
      end

      def set_wishlist_item
        @wishlist_item = @user.wishlist_items.find(params[:id])
      end
    end
  end
end
