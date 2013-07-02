class SalesOrderDetail < ActiveRecord::Base
  set_table_name "tbCabSODetail"

	scope :exception_so, where("NoSO not like ? and NoSO not like ?", 'SOV%', 'SOD%')
	scope :items_code, lambda{|items_code| where("KodeBrg = ?", items_code) if items_code.present? }
	scope :status_so, where("StatusSO = ?", 'a')
end
