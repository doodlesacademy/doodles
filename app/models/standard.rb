class Standard < ActiveRecord::Base
  include Sectionable
  belongs_to :project
  has_sections %w(Common\ Core National\ Core Art\ Elements Art\ Principles Cross\ Curricular)

  has_attached_file :document, 
    styles: {thumbnail: "60x60#"}
  validates_attachment_content_type :document, content_type: ["application/pdf"]

end
