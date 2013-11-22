class Tournament < ActiveRecord::Base
  extend Enumerize

  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true

  validates :status, presence: true
  validates :strategy, presence: true

  enumerize :status,
    in: [:new],
    default: :new,
    predicates: {prefix: true},
    scope: true

  enumerize :strategy,
    in: [:free_for_all],
    default: :free_for_all

  def can_be_deleted?
    self.status_new?
  end
end
