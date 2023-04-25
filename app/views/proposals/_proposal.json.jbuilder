json.extract! proposal, :id, :plan_id, :cooperative_id, :proposal_no, :new_min_age, :new_max_age, :old_min_age, :old_max_age, :ave_age, :member_count, :total_premium, :coop_sf, :agent_sf, :actuarial_approval, :agent_approval, :created_at, :updated_at
json.url proposal_url(proposal, format: :json)
