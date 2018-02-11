describe UsersController do
  let!(:city) { City.find_by(name: 'Beograd') }
  let!(:faculty) { Faculty.find_by(name: 'Fakulter Organizacionih Nauka') }
  let!(:course) { Course.find_by(title: 'Informacioni Sistemi i Tehnologije', faculty_id: faculty.id) }

  describe '#edit', type: :request do
    let!(:user) do
      User.create!(
        uid: 'new_test_user@gmail.com',
        password: 'newtestpassword',
        email: 'new_test_user@gmail.com',
        username: 'new_test_user_123',
        first_name: 'New',
        last_name: 'Test',
        mobile_phone: '062099844',
        course_id: course.id
      )
    end
    it 'should get user details and related objects' do
      get "/users/#{user.id}/edit", params: {}, headers: user.create_new_auth_token
      result = JSON.parse(response.body)
      
      expect(result['course']['id']).to eq course.id
    end
  end
end
