describe ProfessorsController do
  let!(:professor) { Professor.find_by(email: 'test_prof@gmail.com') }
  let!(:city) { City.find_by(name: 'Beograd') }
  let!(:faculty) { Faculty.find_by(name: 'Fakulter Organizacionih Nauka') }

  describe '#update', type: :request do
    let(:update) do
      {
        username: 'usr23',
        first_name: 'First Name',
        last_name: 'Last Name',
        mobile_phone: '062965789',
        phone: '011525449',
        city_id: city.id,
        faculty_id: faculty.id,
        facebook: 'facebook.com/prf',
        street_name: 'Milosa Obilica',
        street_number: '32',
        floor: '3',
        apartment_number: '15'
      }
    end
    it 'should update profile info' do
      put "/professors/#{professor.id}", params: update.to_json, headers: professor.create_new_auth_token
       expect(response.status).to be 204

       updated_prof = professor.reload
       expect(updated_prof.username).to eq update[:username]
       expect(updated_prof.city_id).to eq city.id
       expect(updated_prof.faculty_id).to eq faculty.id
       expect(updated_prof.phone).to eq update[:phone]
       expect(updated_prof.facebook).to eq update[:facebook]
       expect(updated_prof.street_name).to eq update[:street_name]
       expect(updated_prof.apartment_number).to eq update[:apartment_number]
       expect(updated_prof.first_name).to eq update[:first_name]
    end
  end

  describe '#edit', type: :request do
    it 'should get profile data' do
      get "/professors/#{professor.id}/edit", params: {}, headers: professor.create_new_auth_token
      result = JSON.parse(response.body)

      expect(result['username']).to eq professor.username
      expect(result['provider']).to be nil
      expect(result['uid']).to be nil
    end
  end
end
