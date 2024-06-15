class RegistrationEntry < ApplicationRecord
  belongs_to :registration

  enum food_selection: {
    carnivores: 0,
    vegeratian: 1,
    vegan: 2
  }
end
