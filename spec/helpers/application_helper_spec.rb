require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do

	describe '#custom_bootstrap_flash' do

		it 'when return notice' do
			html = "<script>toastr.success('Sucesso!');</script>"
			flash[:notice] = 'Sucesso!'
			html_helper = helper.custom_bootstrap_flash
			expect(html_helper).to eq html
		end

		it 'when return alert' do
			html = "<script>toastr.error('Erro!');</script>"
			flash[:error] = 'Erro!'
			html_helper = helper.custom_bootstrap_flash
			expect(html_helper).to eq html
		end
	end
end
