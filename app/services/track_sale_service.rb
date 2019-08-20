class TrackSaleService < BaseService

	def push_sale(sale_params)
		urls =  ["http://demo.maralytics.dfksoft.com/api/v1/track_sales", "http://staging.maralytics.dfksoft.com/api/v1/track_sales"]
		urls.each do |url|
			RestClient.post( url, sale_params)
		end
	end
end