class ProfessorsService
  include Singleton

  def edit_profile(prof_id, body)
    prof = Professor.find(prof_id)
    if body['image']
      prof.image = body['image']
    else
      prof.username = body['username']
      prof.first_name = body['first_name']
      prof.last_name = body['last_name']
      prof.mobile_phone = body['mobile_phone']
      prof.phone = body['phone']
      prof.city_id = body['city_id']
      prof.faculty_id = body['faculty_id']
      prof.facebook = body['facebook']
      prof.street_name = body['street_name']
      # prof.street_number = body['street_number']
      # prof.floor = body['floor']
      # prof.apartment_number = body['apartment_number']
    end
    
    prof.save!
  end
end
