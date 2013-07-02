class PpbDetail < ActiveRecord::Base
  set_table_name "tbCabPPBDetail"

	scope :exception_ppb, where("NoPPB not like ? and NoPPB not like ?", 'PPBV%', 'PPBD%')
	scope :items_code, lambda{|items_code| where("KodeBrg = ?", items_code) if items_code.present? }
	scope :status_so, where("Status = ?", 'a')
end
