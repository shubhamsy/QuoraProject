json.extract! follow, :id, :followable_id, :followable_type, :user_id, :created_at, :updated_at
json.url follow_url(follow, format: :json)
