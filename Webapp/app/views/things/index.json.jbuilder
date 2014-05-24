json.array!(@things) do |thing|
  json.extract! thing, :id, :name, :watts, :time, :energy, :cost, :created_at, :updated_at
  json.time thing.time.round(3)
  json.energy thing.energy.round(3)
  json.cost thing.cost.round(3)
end
