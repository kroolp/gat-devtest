Fabricator(:target_group) do
  name 'Podhale'
  external_id { sequence(:code) { |i| "E#{i}" } }
  secret_code '6721dd1d-2182-481f-80c6-ebde7b445119'
  parent nil
  panel_provider
end

Fabricator(:target_group_with_parent, from: :target_group) do
  name 'Podhale'
  external_id 'PD'
  secret_code '6721dd1d-2182-481f-80c6-ebde7b445119'
  parent(fabricator: :target_group)
  panel_provider
end
