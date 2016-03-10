require 'rails_helper'

RSpec.describe "Products", :type => :request do
  describe "GET /products.json" do
    before { @products = FactoryGirl.create_list(:product, 2) }

    it "get a list information" do
      #アクセス
      get products_path format: :json
      #ステータスコード確認
      expect(response.status).to eq 200
      #jsonの確認
      json = JSON.parse(response.body)
      expect(json.size).to     eq @products.count
      expect(json[0]["id"]).to eq @products[0].id
      expect(json[1]["id"]).to eq @products[1].id
    end
  end
end
