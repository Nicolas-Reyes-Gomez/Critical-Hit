# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :product
  belongs_to :user
end
