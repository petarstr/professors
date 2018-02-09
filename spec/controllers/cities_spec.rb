describe CitiesController do
  let!(:user) { User.find_by(uid: 'test_user@gmail.com') }

  describe '#index', type: :request do
    it 'should login' do
      get '/cities', params: {}, headers: user.create_new_auth_token
      result = JSON.parse(response.body)
      expect(result.length).to be > 0
    end
  end
end
