json.extract! post, :id, :descriptions, :keywords, :account_id, :created_at, :updated_at
json.url post_url(post, format: :json)
