class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "You're on the home page!" }.to_json
  end

  get "/gardeners" do
    gardeners = Gardener.all
    gardeners.to_json(include: {
      gardens: { only: [:name, :id] }
    })
  end

  get "/gardeners/:id" do
    gardener = Gardener.find(params[:id])
    gardener.to_json(include: {
      gardens: {include: [:plants, :gardener]}
    })
  end

  delete '/gardeners/:id' do
    gardener = Gardener.find(params[:id])
    gardener.destroy
    gardener.to_json
  end

  patch '/gardeners/:id' do
    gardener = Gardener.find(params[:id])
    gardener.update(
      name: params[:name]
    )
    gardener.to_json
  end

  post '/gardeners' do
    gardener = Gardener.create(
      name: params[:name]
    )
    gardener.to_json
  end

  get "/gardens" do
    gardens = Garden.all
    gardens.to_json(include: [:gardener, :plants])
  end

  get "/gardens/:id" do
    gardens = Garden.find(params[:id])
    gardens.to_json(include: [:plants, :gardener])
  end

  get "/plants" do
    plants = Plant.all
    plants.to_json
  end

end
