class Offer < ApplicationRecord
  belongs_to :seller
  belongs_to :spec
  has_one :org, through: :seller
  mount_uploaders :docs, DocumentUploader

  before_create :set_status_pending

  # Specs has three possible statuses: accepted, pending, rejected
  scope :accepted, -> { where(status: 'accepted') }
  scope :pending, -> { where(status: 'pending') }
  scope :rejected, -> { where(status: 'rejected') }


  def set_status_pending
    self.status = :pending
  end

  def status_to_s
    case self.status
    when 'pending' then 'Väntande'
    when 'accepted' then 'Accepterad'
    when 'rejected' then 'Avslagen'
    end
  end

  def accepted?
    status == 'accepted'
  end

  def pending?
    status == 'pending'
  end

  def rejected?
    status == 'rejected'
  end
end
