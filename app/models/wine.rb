class Wine < ActiveRecord::Base

  has_many :log_entries, dependent: :destroy

  VARIETALS = ["merlot", "chianti", "chardonnay",
    "cabernet sauvignon", "syrah", "lambrusco",
    "sauvignon blanc" , "pinot noir"]

  validates :varietal, :inclusion => { :in => Wine::VARIETALS },
    if: "varietal.present?"
  validates :name, :year, :country, presence:  true
  validates :year, numericality: { only_integer: true,
    greater_than_or_equal_to: 0 }
end
