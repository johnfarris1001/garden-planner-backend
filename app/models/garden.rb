class Garden < ActiveRecord::Base
    has_many :plants, dependent: :destroy
    belongs_to :gardener

end