class DrugMaster < ActiveRecord::Base
  validates :drug_name, presence: {message: "Provide drug name"}

  has_many :drug_prices, foreign_key: :drug_id
  has_many :medication_details, foreign_key: :drug_id
  accepts_nested_attributes_for :drug_prices, allow_destroy: true


  def self.to_csv(options = {}, page=nil, perpage=nil)
    column_names = %w{ drug_name drug_alias comment status created_at }

    if page and perpage

      page = page.to_i
      perpage= perpage.to_i

      off = perpage*(page - 1)

      CSV.generate(options) do |csv|
        csv << column_names
        limit(perpage).offset(off).each do |request|
          row = request.attributes.values_at(*column_names)
          row[3] = request.active_status ? 'Active' : 'Inactive'
          csv << row
        end
      end

    else
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |request|
          row = request.attributes.values_at(*column_names)
          row[3] = request.active_status ? 'Active' : 'Inactive'
          csv << row
        end
      end
    end

  end

end
