class Category < ApplicationRecord
  has_many :items
  has_many :sub_categories, dependent: :destroy


  validates :name,
            presence: true,
            length: { maximum: 20 },
            uniqueness: { case_sensitive: false }

  def to_param
    path_name
  end

  def find_by!(arg, *args)
    where(arg, *args).take!
  rescue ::RangeError
    raise RecordNotFound.new("Couldn't find #{@klass.name} with an out of range value",
                             @klass.name)
  end
end
