class ApiController < ActionController::Base
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

	def vend
		p '*'*100
		p params
		p '*'*100
	end

	def vend_2
		domain_prefix = params['domain_prefix']
		data = JSON.parse(params['payload'])
		sale_date = data['created_at']
		sale_value = get_price(data['register_sale_products'])
		note = get_notes(data['register_sale_products'])
		sale_id = 'VEND-' + data['id']
		sale_params = {
			sale_id: sale_id,
			domain_prefix: domain_prefix,
			sale_date: sale_date,
			sale_value: sale_value,
			note: note
		}
		TrackSaleService.new.push_sale(sale_params)
	end

	def vend_3
		# p '*'*100
		# p params
		# p '*'*100
	end

	private

	def get_price(arr)
		arr.inject(0) {|sum, hash| sum + hash['price_total'].to_d}
	end

	def get_notes(arr)
		notes = []
		arr.each do |a|
			notes << a['note'] if  a['note']
		end
		notes.join(', ')
	end
end
