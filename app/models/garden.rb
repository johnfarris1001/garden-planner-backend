class Garden < ActiveRecord::Base
    has_many :plants
    belongs_to :gardener

end