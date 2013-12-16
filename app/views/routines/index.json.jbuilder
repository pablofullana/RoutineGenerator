json.array!(@routines) do |routine|
  json.extract! routine, :id, :ejercicio1, :ejercicio2, :ejercicio3
  json.url routine_url(routine, format: :json)
end
