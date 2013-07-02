class Barcode < ActiveRecord::Base
  set_table_name "tb_cab_statusbarcode"
	
	scope :search_by_type, lambda {|type| where("KodeBrg like ?", %(#{type}%)) if type.present? }
	scope :search_by_article, lambda { |article| where("KodeBrg like ?", %(__#{article}%)) if article.present?}
	scope :brand, lambda {|brand| where("KodeBrg like ?", %(__#{brand}%)) if brand.present?}
	scope :fabric, lambda {|fabric| where("KodeBrg like ?", %(______#{fabric}%)) if fabric.present?}
	scope :size_length, lambda {|brand_size| where("KodeBrg like ?", %(_______________#{brand_size})) if brand_size.present?}
	scope :status, where("Status = ?", "N")
end
