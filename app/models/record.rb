# frozen_string_literal: true

class Record < ApplicationRecord
  belongs_to :user # delete this model

  validates :title, :year, presence: true
end
