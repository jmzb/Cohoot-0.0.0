json.array!(@programs) do |program|
  json.extract! program, :id, :prog_name, :prog_obj
  json.url program_url(program, format: :json)
end
