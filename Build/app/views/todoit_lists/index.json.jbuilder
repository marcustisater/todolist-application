json.array!(@todoit_lists) do |todoit_list|
  json.extract! todoit_list, :id, :title, :description, :text
  json.url todoit_list_url(todoit_list, format: :json)
end
