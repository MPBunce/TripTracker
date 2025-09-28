# app/models/document.rb
class Document < ApplicationRecord
  belongs_to :trip
  belongs_to :uploaded_by, class_name: "User"
  
  # Rails 8 has great Active Storage integration
  has_one_attached :file
  
  validates :name, presence: true
  validates :file, presence: true
  
  scope :recent, -> { order(created_at: :desc) }
  
  def file_size_human
    ActiveSupport::NumberHelper.number_to_human_size(file.blob.byte_size)
  end
end