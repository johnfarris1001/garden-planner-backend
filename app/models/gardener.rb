class Gardener < ActiveRecord::Base
    has_many :gardens, dependent: :destroy
    has_many :plants, through: :gardens



end