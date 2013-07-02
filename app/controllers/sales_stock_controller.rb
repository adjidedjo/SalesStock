class SalesStockController < ApplicationController

	def results
		@sales_stock = Barcode.select("Distinct(KodeBrg), Status, idCabang").brand(params[:merk_id]).search_by_type(params[:type_id]).search_by_article(params[:article_id]).fabric(params[:fabric_id]).size_length(params[:size_id]).status
	end

  def search
		redirect_to sales_stock_results_path(:merk_id => params[:merk_id], :type_id => params[:type_id], :article_id => params[:article_id], 
			:fabric_id => params[:fabric_id], :size_id => params[:size_id]) if params[:merk_id].present? && params[:type_id].present? && 
			params[:article_id].present?
		@branch = Cabang.get_id
		@brand = Merk.all
		@type = Product.all
		@article = Artikel.all
		@fabric = Kain.all
  end

	def update_sales_stock_type
		@type = Merk.where(:IdMerk => params[:merk_id]).first.product.map{|a| [a.Namaroduk, a.KodeProduk]}.insert(0, "")
	end

	def update_sales_stock_kain
		@fabric = Kain.order("NamaKain ASC").get_kain_name(params[:artikel_id]).map{|a| [a.NamaKain, a.KodeKain]}.insert(0, "")
	end

	def update_sales_stock_article
		@article = Artikel.order("Produk ASC").get_name(params[:type_id]).map{|a| [a.Produk, a.KodeCollection]}.insert(0, "")
	end
end
