class Tourdetail < ApplicationRecord
  belong_to :tour
  belong_to :user
end
