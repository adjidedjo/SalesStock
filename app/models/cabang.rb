class Cabang < ActiveRecord::Base
  set_table_name "tbIdCabang"
  has_many :stock
  has_many :barang,  :through => :stock
  has_many :laporan_cabang
  has_many :monthly_target
  has_many :yearly_target

  def self.get_id
    find(2, 3, 4, 5, 7, 8, 9, 10, 11, 13, 18, 19, 20, 22)
  end

  def self.get_id_to_7
    find(2, 3, 4, 5, 7, 8, 9)
  end

	def self.get_id_to_22
    find(10, 11, 13, 19, 20, 22)
  end

end
