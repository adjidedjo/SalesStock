class Artikel < ActiveRecord::Base
  set_table_name "tbBJKodeArtikel"
  has_many :artikel
  scope :artikel_name, lambda {|artikel| where(:KodeCollection => artikel)}
	scope :get_artikel_collection, lambda {|collection| where("KodeCollection like ?", %(#{collection}%)) unless collection.nil? }
  scope :get_name, lambda {|artikel| where(:KodeProduk => artikel)}


  def self.get_artikel_name(artikel_id)
    artikel_name(artikel_id).map{|artikel| artikel.Produk}.join(",")
  end

	def self.get_artikel_by_brand(brand, type)
		find(:all, :select => 'KodeCollection, KodeBrand, KodeProduk, Produk', :conditions => ['KodeBrand like ? and KodeProduk like ?', 
			%(#{brand}%), %(#{type}%)], :group => 'Produk')
	end

	def self.artikel_by_merk(brand)
		find(:all, :select => 'KodeCollection, KodeBrand, KodeProduk, Produk', :conditions => ['KodeBrand like ?', 
			%(#{brand}%)], :group => 'Produk')
	end
end
