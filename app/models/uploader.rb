class Uploader < ActiveRecord::Base
    belongs_to :user
    mount_uploader :attachment, AttachmentUploader   
    serialize :tags
    validates :title,:description,:attachment, presence: true # Validates only for blank in case  
  
    # before_validation :change_string_to_array, on: [:create]


    # def change_string_to_array
    #     if self.tags.present?
    #         tags = self.tags.split(',')
    #     end
    # end
end
