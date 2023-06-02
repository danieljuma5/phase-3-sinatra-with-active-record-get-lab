class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end
  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
      bakery.to_json(include: :baked_goods)
  end
  get '/baked_goods/by_price' do
    baked = BakedGood.all.order(price: :desc)
    baked.to_json
  end
  get '/baked_goods/most_expensive' do
    most_expensive = BakedGood.all.order(price: :desc).limit(1).first
    most_expensive.to_json
  end
end
