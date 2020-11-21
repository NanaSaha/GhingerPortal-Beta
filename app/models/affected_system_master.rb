class AffectedSystemMaster < ActiveRecord::Base
  validates :title, presence: {message: "Please enter a human part"}
end
