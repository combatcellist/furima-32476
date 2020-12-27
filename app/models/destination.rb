class Destination < ApplicationRecord


  belongs_to :order, optional: true

end
