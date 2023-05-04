json.extract! process_coverage, :id, :group_remit_id, :plan_references, :agent_id, :effectivity, :expiry, :status, :approved_count, :approved_total_coverage, :approved_total_prem, :denied_count, :denied_total_coverage, :denied_total_prem, :created_at, :updated_at
json.url process_coverage_url(process_coverage, format: :json)
