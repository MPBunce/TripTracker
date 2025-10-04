class UpdateActiveStorageAttachmentsForTrips < ActiveRecord::Migration[8.0]
  def up
    # Update record_type from 'Post' to 'Trip' in active_storage_attachments
    ActiveStorage::Attachment.where(record_type: 'Post').update_all(record_type: 'Trip')
  end
  
  def down
    ActiveStorage::Attachment.where(record_type: 'Trip').update_all(record_type: 'Post')
  end
end