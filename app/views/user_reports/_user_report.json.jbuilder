json.extract! user_report, :id, :reason, :reporter, :user_id, :created_at, :updated_at
json.url user_report_url(user_report, format: :json)
