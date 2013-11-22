class Tournament < ActiveRecord::Base
  extend Enumerize

  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true

  validates :state, presence: true

  enumerize :state,
    in: [:new],
    default: :new,
    predicates: {prefix: true},
    scope: true

  def can_be_deleted?
    self.state_new?
  end
end
