json.extract! member, :id, :last_name, :first_name, :middle_name, :suffix, :birthdate, :mobile_no, :email, :gender, :occupation, :created_at, :updated_at
json.url member_url(member, format: :json)
