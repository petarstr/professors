describe SubjectsController do
  let!(:user) { User.find_by(uid: 'test_user@gmail.com') }
  let!(:city) { City.find_by(name: 'Beograd') }

  describe '#index', type: :request do
    belgrade_faculty = Faculty.find_by(name: 'Fakulter Organizacionih Nauka')
    isit_course = Course.find_by(title: 'Informacioni Sistemi i Tehnologije', faculty_id: belgrade_faculty.id)
    subject = Subject.find_by(title: 'Matematika 1', course_id: isit_course.id)

    it 'should get all faculties in a city' do
      get "/faculties/#{belgrade_faculty.id}/courses"
      result = JSON.parse(response.body)
      expect(result.length).to be 1
      expect(result.first['id']).to eq subject.id
    end
  end
end
