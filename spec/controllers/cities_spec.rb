describe CitiesController do
  let!(:user) { User.find_by(uid: 'test_user@gmail.com') }
  let!(:city) { City.find_by(name: 'Beograd') }

  describe '#index', type: :request do
    it 'should get all cities' do
      get '/cities'
      result = JSON.parse(response.body)
      expect(result.length).to be > 0
    end
  end

  describe '#faculties', type: :request do
    belgrade_faculty = Faculty.find_by(name: 'Fakulter Organizacionih Nauka')
    
    it 'should get all faculties in a city' do
      get "/cities/#{city.id}/faculties"
      result = JSON.parse(response.body)
      expect(result.length).to be 1
      expect(result.first['id']).to eq belgrade_faculty.id
    end
  end
end
