
# GYRT LOADINGS
# [
#   ['Contingency', 0.1],
#   ['Override', 0.09],
#   ['Admin Cost', 0.15]
# ].each do |gl|
#   gload = GyrtLoading.find_or_initialize_by(name: gl[0])
#   gload.rate = gl[1]
#   puts "Loading (#{gload.name}) - DONE!" if gload.save!
# end

# GYRT RATE MULTIPLIER
# [
#   ["LIFE", 15, 300, 1.7],
#   ["LIFE", 301, 600, 1.2],
#   ["LIFE", 601, 1000, 1.0],
#   ["ADD", 15, 50, 40.0],
#   ["ADD", 51, 200, 25.0],
#   ["ADD", 201, 500, 15.0]
# ].each do |multiplier|
#   ben = Benefit.find_by(short_name: multiplier[0])

#   grm = GyrtRateMultiplier.find_or_initialize_by(benefit: ben, min_count: multiplier[1])
#   grm.max_count = multiplier[2]
#   grm.rate = multiplier[3]
#   puts "#{grm.benefit.name} : (#{grm.min_count} - #{grm.max_count}) - DONE!" if grm.save!
# end

# GYRT RATES
# spreadsheet = Roo::Spreadsheet.open("./db/uploads/gyrt rates.xlsx")
# (3..spreadsheet.last_row).each do |rate|
#   gr = GyrtRate.find_or_initialize_by(age: spreadsheet.cell(rate, "A"), benefit_id: Benefit.find_by(short_name: spreadsheet.cell(rate, "C")).id)
#   gr.rate = spreadsheet.cell(rate, "B")

#   puts "#{gr.age} - #{gr.benefit.name} - #{gr.rate} DONE!" if gr.save!
# end



# Employees

# spreadsheet = Roo::Spreadsheet.open('./db/uploads/EMPLOYEE-MASTERLIST.xlsx')
# (2..spreadsheet.last_row).each do |emp|
  
#   user_name = (spreadsheet.cell(emp, "C")[0] + spreadsheet.cell(emp, "D")[0] + spreadsheet.cell(emp, "B")).downcase.gsub(/\s+/, "")
#   email = "#{user_name}@1cisp.coop"

#   dept = Department.find_or_initialize_by(name: spreadsheet.cell(emp, "F"))
#   dept.description = ""
#   puts "#{dept.name} - saved" if dept.save!

#   employee = Employee.find_or_initialize_by(
#     last_name: spreadsheet.cell(emp, "B"),
#     first_name: spreadsheet.cell(emp, "C"),
#     middle_name: spreadsheet.cell(emp, "D")
#   )
#   employee.department_id = dept.id
#   employee.birthdate = ""
#   employee.designation = spreadsheet.cell(emp, "G")
#   employee.employee_number = spreadsheet.cell(emp, "A")
#   employee.mobile_number = ""
#   puts "#{employee.last_name} - DONE!" if employee.save!
  
#   user = User.find_or_initialize_by(email: email)
#   user.password = user_name
#   user.userable = employee
#   user.admin = spreadsheet.cell(emp, "H")
#   user.approved = true
#   puts "#{user.email} - DONE!" if user.save!
# end

# Plans

# spreadsheet = Roo::Spreadsheet.open('./db/uploads/plans.xlsx')
# (2..spreadsheet.last_row).each do |row|
#   pl = ProductLine.find_or_initialize_by(name: spreadsheet.cell(row, "A"))
#   pl.code = spreadsheet.cell(row, "B")
#   puts "#{pl.name} - DONE!" if pl.save!

#   pc = ProductCategory.find_or_initialize_by(name: spreadsheet.cell(row, "C"))
#   pc.product_line_id = pl.id
#   pc.code = spreadsheet.cell(row, "D")
#   puts "#{pc.name} - DONE!" if pc.save!

#   plan = Plan.find_or_initialize_by(name: spreadsheet.cell(row, "E"))
#   plan.short_name = spreadsheet.cell(row, "F")
#   plan.product_line_id = pl.id
#   plan.product_category_id = pc.id
#   puts "#{plan.name} - DONE!" if plan.save!
# end

# Insured Types
# [["Principal", "for Basic GYRT"],
# ["Dependent - Spouse", "for GYRT Family"],
# ["Dependent - Parent", "for GYRT Family"],
# ["Dependent - Children", "for GYRT Family"],
# ["Dependent - Sibling", "for GYRT Family"],
# ["Ranking - BOD", "Dependent"],
# ["Ranking - Senior Officers", "For GYRT Ranking"],
# ["Ranking - Junior Officers", "For GYRT Ranking"],
# ["Ranking - Rank and File", "For GYRT Ranking"]].each do |insured|
#   it = InsuredType.find_or_initialize_by(name: insured[0])
#   it.description = insured[1]
#   puts "#{it.name} - DONE!" if it.save!
# end

# Benefits

# [
#   ["Life", "LIFE"],
#   ["Accidental Death & Dismemberment", "ADD"],
#   ["Total Permanent Disability", "TPD"],
#   ["Accidental Medical Reimbursement", "AMR"],
#   ["Daily Hospital Income", "HIB"],
#   ["Burial", "BUR"],
#   ["Accidental Death", "AD"]
# ].each do |ben|
#   benefit = Benefit.find_or_initialize_by(name: ben[0])
#   benefit.description = ""
#   benefit.short_name = ben[1]
#   puts "#{benefit.name} - SAVED!" if benefit.save!
# end

# Proposals
# spreadsheet = Roo::Spreadsheet.open('./db/uploads/proposals.xlsx')
# (2..spreadsheet.last_row).each do |row|
#   plan = Plan.find_by(short_name: spreadsheet.cell(row, "A"))

#   coop = Cooperative.find_or_initialize_by(name: spreadsheet.cell(row, "B"))
#   coop.region = spreadsheet.cell(row, "C")
#   coop.province = spreadsheet.cell(row, "D")
#   puts "#{coop.name}" if coop.save!

#   pro = Proposal.find_or_initialize_by(cooperative_id: coop.id, plan_id: plan.id)
#   pro.proposal_no = spreadsheet.cell(row, "E")
#   pro.new_min_age = spreadsheet.cell(row, "F")
#   pro.new_max_age = spreadsheet.cell(row, "G")
#   pro.old_min_age = spreadsheet.cell(row, "H")
#   pro.old_max_age = spreadsheet.cell(row, "I")
#   pro.ave_age = spreadsheet.cell(row, "J")
#   pro.member_count = spreadsheet.cell(row,"K")
#   pro.total_premium = spreadsheet.cell(row,"L")
#   pro.coop_sf = spreadsheet.cell(row,"M")
#   pro.agent_sf = spreadsheet.cell(row,"N")
#   pro.actuarial_approval = true
#   pro.agent_approval = true
#   puts "#{pro.proposal_no} / (#{pro.coop_sf} - #{pro.agent_sf}) - SAVED!" if pro.save!
# end

# Proposal Insured Benefits
# spreadsheet = Roo::Spreadsheet.open('./db/uploads/proposal benefit.xlsx')
# (2..spreadsheet.last_row).each do |row|
#   proposal = Proposal.find_by(id: spreadsheet.cell(row, "A"))
#   insured = InsuredType.find_by(name: spreadsheet.cell(row, "D"))
#   benefit = Benefit.find_by(name: spreadsheet.cell(row, "E"))

#   pi = ProposalInsured.find_or_initialize_by(proposal: proposal, insured_type: insured)
  
#   pib = ProposalInsuredBenefit.find_or_initialize_by(proposal_insured: pi, benefit: benefit)
#   pib.cov_amount = spreadsheet.cell(row, "F")
#   pib.premium = spreadsheet.cell(row, "G")
#   puts "(#{pib.proposal_insured.insured_type.name}) - (#{pib.benefit.name}) - (#{pib.cov_amount}) -- SAVED!" if pib.save!

#   pi.update_total_premium

# end

# GYRT Anniversary Type

# ["Single", "Multiple", "12 Months"].each do |type|
#   anniv = AnnivType.find_or_initialize_by(name: type)
#   puts "#{anniv.name} - DONE!" if anniv.save!
# end

# Proposal Officers (COOP)

# spreadsheet = Roo::Spreadsheet.open('./db/uploads/proposals.xlsx')
# # puts spreadsheet.sheets
# (3..spreadsheet.sheet("OTHER DETAILS").last_row).each do |row|
#   coop = Cooperative.find_by(name: spreadsheet.sheet("OTHER DETAILS").cell(row, "B"))
#   proposal = Proposal.find_by(id: spreadsheet.sheet("OTHER DETAILS").cell(row, "A"))

#   officer = Officer.find_or_initialize_by(
#     last_name: spreadsheet.sheet("OTHER DETAILS").cell(row, "C"),
#     first_name: spreadsheet.sheet("OTHER DETAILS").cell(row, "D"),
#     middle_name: spreadsheet.sheet("OTHER DETAILS").cell(row, "E"),
#     suffix: spreadsheet.sheet("OTHER DETAILS").cell(row, "F"),
#     birth_day: spreadsheet.sheet("OTHER DETAILS").cell(row, "G"))
#   officer.designation = spreadsheet.sheet("OTHER DETAILS").cell(row, "H")
#   puts "#{officer.designation} #{officer.last_name} - DONE!" if officer.save!

#   po = ProposalOfficer.find_or_initialize_by(proposal: proposal, officer: officer)
#   puts "#{po.id} - DONE!" if po.save!
# end

# Policy Anniversary
# spreadsheet = Roo::Spreadsheet.open('./db/uploads/proposals.xlsx')

# (3..spreadsheet.sheet("POL ANNIV").last_row).each do |row|
#   proposal = Proposal.find_by(id: spreadsheet.sheet("POL ANNIV").cell(row, "A"))

#   anniv = AnnivType.find_by(name: spreadsheet.sheet("POL ANNIV").cell(row, "B"))

#   proposal_anniv = ProposalAnniv.find_or_initialize_by(proposal_id: proposal.id, anniv_type_id: anniv.id)
#   proposal_anniv.mon = spreadsheet.sheet("POL ANNIV").cell(row, "C")
#   proposal_anniv.day = spreadsheet.sheet("POL ANNIV").cell(row, "D")
#   puts "#{proposal_anniv.anniv_type.name} - #{proposal_anniv.proposal.proposal_no} DONE! " if proposal_anniv.save!
# end

# Contestability
# min_age, max_age, member_type, period, period_type
# proposal = Proposal.find_by(id: 1)

# [
#   [0, 0, "EXISTING", 0, "year"],
#   [18, 65, "NEW", 1, "year"]
# ].each do |c|
#   con = Contestability.find_or_initialize_by(min_age: c[0], max_age: c[1], member_type: c[2], period: c[3], period_type: c[4])
#   puts "#{con.member_type} - (#{con.min_age} to #{con.max_age}) SAVED!" if con.save!

#   pro_con = ProposalContestable.find_or_initialize_by(proposal: proposal, contestability: con)

#   puts "#{pro_con.proposal.proposal_no} - (#{pro_con.contestability.member_type} ) SAVED!" if pro_con.save!

# end

# MOA
# spreadsheet = Roo::Spreadsheet.open('./db/uploads/proposals.xlsx')
# (2..spreadsheet.sheet("MOAs").last_row).each do |row|
#   proposal = Proposal.find_by(id: spreadsheet.sheet("MOAs").cell(row, "A"))

#   moa = Moa.find_or_initialize_by(proposal: proposal)
#   moa.moa_no = spreadsheet.sheet("MOAs").cell(row, "B")
#   moa.notarized_date = spreadsheet.sheet("MOAs").cell(row, "C")
#   moa.moa_signed_date = spreadsheet.sheet("MOAs").cell(row, "D")
#   puts "MOA No. #{moa.moa_no} - SAVED!" if moa.save!
# end

# Batch

# group_remit = GroupRemit.create()
# ctr = 0
# spreadsheet = Roo::Spreadsheet.open('./db/uploads/gyrt import.xlsx')
# (2..spreadsheet.last_row).each do |row|
#   coop = Cooperative.find_by(name: spreadsheet.cell(row, "F"))
#   plan = Plan.find_by(short_name: spreadsheet.cell(row, "G"))
#   proposal = Proposal.find_by(cooperative: coop, plan: plan)
  
#   puts "ctr = #{ctr}"
  
#   moa = Moa.find_by(proposal: proposal) 
#   if ctr == 0
#     gr_name = "#{coop.id}-#{plan.short_name}-#{sprintf '%05d', ((GroupRemit.maximum(:id)) || 0 + 1).to_s}"
#   else
#     gr_name = GroupRemit.last.name
#   end
#   # group_remit = GroupRemit.create(name: gr_name, description: "", moa: moa)
#   group_remit = GroupRemit.find_or_initialize_by(name: gr_name, description: "", moa: moa)
#   ctr = ctr + 1

#   puts "---- #{group_remit} ----"

#   coop_member = Member.find_or_initialize_by(
#     last_name: spreadsheet.cell(row, "A"),
#     first_name: spreadsheet.cell(row, "B"),
#     middle_name: spreadsheet.cell(row, "C"),
#     suffix: spreadsheet.cell(row, "D"),
#     birthdate: spreadsheet.cell(row, "E"))
#   # if coop_member.new_record?
#   #   cm_status = "NEW"
#   # else
#   #   if coop_member.batches.count >= 1
#   #     cm_status = "RENEWAL"
#   #   else
#   #     cm_status = "TRANSFERRED"
#   #   end
#   # end
#   # coop_member.coop_branch = coop.coop_branches.first
#   coop_member.mobile_no = "-"
#   coop_member.email = "#{coop_member.last_name}.#{coop_member.first_name}@test.com"
#   puts "#{coop_member.last_name}, #{coop_member.first_name} - DONE!" if coop_member.save!

#   c_member = CoopMember.find_or_initialize_by(cooperative: coop, member_id: coop_member.id)
#   c_member.coop_branch_id = coop.coop_branches.first.id
#   if c_member.new_record?
#     cm_status = "NEW"
#   else
#     if c_member.batches.count >= 1
#       cm_status = "RENEWAL"
#     else
#       cm_status = "TRANSFERRED"
#     end
#   end
#   c_member.save!
  
  
#   #age
#   now = Time.now.utc.to_date
#   if spreadsheet.cell(row, "E").nil?
#     mem_age = 0
#   else
#     mem_age = now.year - coop_member.birthdate.year - ((now.month > coop_member.birthdate.month || (now.month == coop_member.birthdate.month && now.day >= coop_member.birthdate.day)) ? 0 : 1)
#   end

#   b_active = mem_age <= proposal.old_max_age && mem_age >= proposal.old_min_age ? true : false
#   effect = Date.today
#   expire = "#{proposal.proposal_anniv.mon} #{proposal.proposal_anniv.day}, #{Date.today.year}".to_date
#   terms = (expire.year * 12 + expire.month) - (effect.year * 12 + effect.month)
#   pro_insured = proposal.proposal_insureds.where(insured_type: 1).sum(:total_prem)
#   final_prem = (pro_insured / 12) * terms
#   coop_sf = (final_prem * proposal.coop_sf)
#   agent_sf = (final_prem * proposal.agent_sf)
#   puts coop_sf 
#   puts agent_sf 

#   Batch.create(coop_member: c_member,
#     group_remit: group_remit,
#     # effectivity_date: Date.today,
#     # expiry_date: "#{proposal.proposal_anniv.mon} #{proposal.proposal_anniv.day}, #{Date.today.year}".to_date,
#     effectivity_date: effect,
#     expiry_date: expire,
#     active: b_active,
#     premium: pro_insured,
#     coop_sf_amount: coop_sf,
#     agent_sf_amount: agent_sf
#   )

#   batch = Batch.find_or_initialize_by(coop_member: c_member, group_remit: group_remit,
#     effectivity_date: Date.today)
#   batch.expiry_date = "#{proposal.proposal_anniv.mon} #{proposal.proposal_anniv.day}, #{Date.today.year}".to_date
#   batch.active = b_active
#   batch.premium = final_prem
#   batch.coop_sf_amount = coop_sf
#   batch.agent_sf_amount = agent_sf
#   batch.status = cm_status
#   puts "#{batch.id} - #{batch.coop_member.member.last_name} : DONE!" if batch.save!

# end


# Agents

# spreadsheet = Roo::Spreadsheet.open('./db/uploads/SALES-TEAM.xlsx')
# (3..101).each do |row|
#   agent_group = AgentGroup.find_or_initialize_by(name: spreadsheet.cell(row, "A"))
#   agent_group.description = "Team #{agent_group.name}"
#   puts "#{agent_group.description} - Inserted" if agent_group.save!
  
#   agent_pos = AgentPosition.find_or_initialize_by(name: spreadsheet.cell(row, "E"))
#   agent_pos.active = true
#   puts "#{agent_pos.name} - Inserted" if agent_pos.save!

#   agent = Agent.find_or_initialize_by(
#     last_name: spreadsheet.cell(row, "B"),
#     first_name: spreadsheet.cell(row, "C"),
#     middle_name: spreadsheet.cell(row, "D"))
#   agent.birthdate = ""
#   agent.mobile_number = ""
#   agent.agent_group = agent_group
#   agent.agent_position = agent_pos
#   puts "#{agent.first_name} #{agent.last_name} - Done!" if agent.save!

#   user_name = "#{agent.last_name.gsub(/\s/,"")}.#{agent_group.name.gsub(/\s/,"").downcase}"
#   email = "#{user_name}@1cisp.coop"

#   user = User.find_or_initialize_by(email: email)
#   user.password = user_name
#   user.userable = agent
#   user.admin = spreadsheet.cell(row, "H")
#   user.approved = true
#   puts "#{user.email} - DONE!" if user.save!
# end

# Add Age to Batch

# batches = Batch.all

# batches.each do |batch|
#  mem = batch.coop_member.member
#  eff = batch.effectivity_date

#   if mem.birthdate.nil?
#     mem_age = 0
#   else
#     mem_age = eff.year - mem.birthdate.year - ((eff.month > mem.birthdate.month || (eff.month == mem.birthdate.month && eff.day >= mem.birthdate.day)) ? 0 : 1)
#   end

#   batch.update_attribute(
#     :age, mem_age
#   )
# end