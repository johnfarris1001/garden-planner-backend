puts "🌱 Seeding spices..."

# Seed your database here
10.times do
    gardener = Gardener.create(
        name: Faker::Name.name
    )
    rand(1..2).times do
        garden = Garden.create(
            name: Faker::Books::Dune.planet,
            gardener_id: gardener.id,
        indoor_outdoor: 'indoor',
            sunlight: 'low',
            rain: 'none'
        )
        rand(0..5).times do
            Plant.create(
                name: Faker::Food.vegetables,
                variety: 'vegetable',
                garden_id: garden.id
            )
        end
    end
end

puts "✅ Done seeding!"
