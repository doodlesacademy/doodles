class InstructionGroup < ActiveRecord::Base
  belongs_to :lesson
  has_many :instructions
end
