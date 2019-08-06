class TrackSaleService < BaseService

	def push_sale(sale_params)
		url =  "http://demo.maralytics.dfksoft.com/api/v1/track_sales"
		RestClient.post( url, sale_params)
	end
end