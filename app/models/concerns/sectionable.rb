require 'active_support/concern'

module Sectionable
  extend ActiveSupport::Concern

  included do
    has_many :sections, as: :sectionable, dependent: :destroy
    accepts_nested_attributes_for :sections

    after_initialize :generate_default_sections
    class_attribute :default_sections
  end

  module ClassMethods
    def has_sections(new_sections)
      self.default_sections = new_sections
    end
  end

  # def get_section(title:)
  #   self.sections.where(title: title)
  # end

  def section_contents
    self.sections.map(&:content)
  end

  private
  def generate_default_sections
    return unless self.class.default_sections.present?
    return if self.sections.present?
    content = generate_toc(self.class.default_sections)
    self.sections.new content: content
  end

  def generate_toc(hash, level: 1)
    level ||= 1
    content = ""
    header = ""
    level.times { header += "#" }
    hash.each do |k, v|
      content += "#{header} #{k.to_s.titleize}\n\n"
      if v.present? && (v.is_a? Hash or v.is_a? Array)
        content += generate_toc(v, level: level + 1)
      end
    end
    return content
  end

end
