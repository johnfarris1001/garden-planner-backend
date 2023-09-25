class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here

  get "/gardeners" do
    gardeners = Gardener.all
    gardeners.to_json(include: {
      gardens: { include: [:plants, :gardener] }
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
    gardener.to_json(include: {
      gardens: { include: [:plants, :gardener] }
    })
  end

  post '/gardens' do
    garden = Garden.create(
      name: params[:name],
      indoor_outdoor: params[:location],
      sunlight: params[:sunlight],
      rain: params[:rain],
      gardener_id: params[:gardenerId]
    )
    garden.to_json
  end

  get "/gardens/:id" do
    gardens = Garden.find(params[:id])
    gardens.to_json(include: [:plants, :gardener])
  end

  patch '/gardens/:id' do
    garden = Garden.find(params[:id])
    garden.update(
      name: params[:name],
      indoor_outdoor: params[:location],
      sunlight: params[:sunlight],
      rain: params[:rain]
    )
    garden.to_json
  end

  delete '/gardens/:id' do
    garden = Garden.find(params[:id])
    garden.destroy
    garden.to_json
  end

  delete '/plants/:id' do
    plant = Plant.find(params[:id])
    plant.destroy
    plant.to_json
  end

  patch '/plants/:id' do
    plant = Plant.find(params[:id])
    plant.update(
      name: params[:name],
      variety: params[:variety]
    )
    plant.to_json
  end

  post '/plants' do
    plant = Plant.create(
      name: params[:name],
      variety: params[:variety],
      garden_id: params[:gardenId]
    )
    plant.to_json
  end

end
