class User < ActiveRecord::Base
  enum role: [:visitor, :editor, :staff, :admin]
  enum status: [:active, :archived]

  has_one :profile
  accepts_nested_attributes_for :profile, allow_destroy: true

  default_scope { where(status: User.statuses[:active]) }

  after_initialize :set_role

  has_many :favorites
  has_many :favorite_projects, through: :favorites, source: :project_set

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def hidden_email
    tokens = self.email.split /\@/
    name = tokens[0]
    domain = tokens[1]
    "#{name[0,3]}...#{name[-3,3]}@#{domain}"
  end

  private
  def set_role
    self.role ||= 'visitor'
  end

end
