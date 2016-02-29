require 'active_support/concern'
require 'byebug'

module Sectionable 
  extend ActiveSupport::Concern

  included do
    has_many :sections, as: :sectionable, dependent: :destroy
    accepts_nested_attributes_for :sections

    after_create :generate_default_sections
    class_attribute :default_sections
  end

  module ClassMethods
    def has_sections(sections)
      self.default_sections = sections
    end
  end

  def get_section(title:)
    self.sections.where(title: title)
  end

  def section_contents
    self.sections.map(&:content)
  end
  
  private
  def generate_default_sections 
    return unless self.class.default_sections.present?
    self.class.default_sections.each_with_index do |name, i|
      self.sections.create title: name, content: "## #{name}", order: i
    end
  end

end
