class BatchHealthDec < ApplicationRecord
  belongs_to :batch
  belongs_to :health_dec_question
  has_many_attached :health_dec_docs

  validate :docs_type

  STATUSES = ["For UND Review", "For MD Review"]


  private

  def docs_type
    return unless health_dec_docs.attached?

    health_dec_docs.each do |doc|
      if !doc.content_type.in?(%w(image/jpeg image/png image/jpg application/pdf application/vnd.openxmlformats-officedocument.wordprocessingml.document))
        errors.add(:health_dec_docs, "must be picture(jpeg, png or jpg) or document(pdf or docx)")
      end
    end
    
  end
  
end
