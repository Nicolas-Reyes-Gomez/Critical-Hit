# frozen_string_literal: true
module Api
  module V1
    class ProductsController < ApplicationController

      #GET /products
      def index
        @products = Product.all
        render json: @products
      end
      # GET /products/1
      def show
        @product = Product.find(params[:id])
        @ratings = Rating.where(product_id: params[:id])
        render json: { product: @product, ratings: @ratings, status: 'ok', message: 'success' }
      end

      #POST /products
      def create
          @product = Product.new(product_params)
          if !@product.save
              render json: @product.errors, status: :unprocessable_entity
          end
      end

      private

      def product_params
          params.require(:product).permit(
            :name,
            :price,
            :description,
            :sku,
            :status,
            :barcode,
            :rating_count,
            :rating_value,
            :stock,
            :brand,
            :height,
            :width,
            :large,
            :weight,
            :recommended_age,
            :number_of_player,
            :offer_id)
      end
    end
  end
end
