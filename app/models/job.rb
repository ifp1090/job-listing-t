class Job < ApplicationRecord
  validates :title, presence: { message: "请填写概念名称" }
  validates :description, presence: { message: "请填写概念描述" }
  validates :company_name, presence: { message: "请填写践行标准" }
  validates :category_name, presence: { message: "请选择践行城市" }
  validates :wage_upper_bound, presence: { message: "请填写最低践行时长" }
  validates :wage_lower_bound, presence: { message: "请填写最高践行时长" }
  validates :wage_lower_bound, numericality: { greater_than: 0, message: "最小践行天数必须＞0" }
  validates :wage_lower_bound, numericality: { less_than: :wage_upper_bound, message: "践行时段下限不能高于践行时段上限" }
  validates :contact_email, presence: { message: "请填写联系邮箱" }

# 最大薪资必须大于最小薪资

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  scope :publish, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC') }

  has_many :resumes
  belongs_to :category
  belongs_to :user

  has_many :job_relationships
  has_many :members, through: :job_relationships, source: :user
end
