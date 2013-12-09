class Tournament < ActiveRecord::Base
  extend Enumerize

  validates :name, presence: true
  validates :status, presence: true
  validates :strategy, presence: true

  resourcify

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
