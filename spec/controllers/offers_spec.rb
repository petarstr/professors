describe OffersController do
  let!(:professor) { Professor.find_by(email: 'test_prof@gmail.com') }
  let!(:city) { City.find_by(name: 'Beograd') }
  let!(:faculty) { Faculty.find_by(name: 'Fakulter Organizacionih Nauka') }
  let!(:course) { Course.find_by(title: 'Informacioni Sistemi i Tehnologije') }
  let!(:subject) { Subject.find_by(title: 'Matematika 1', course_id: course.id) }

  before(:each) do
    Offer.destroy_all
  end

  describe '#create', type: :request do
    let(:body) do
      {
        title: 'Offer Title',
        description: 'Best offer description you will ever find.',
        number_of_sessions: 6,
        user_place: false,
        professor_place: true,
        subjects: [subject.id],
        prices: [{
          student_count: 5,
          price: 1000
        }]
      }
    end
    it 'should create an offer' do
      post "/professors/#{professor.id}/offers", params: body.to_json, headers: professor.create_new_auth_token

      offer = Offer.find_by(professor_id: professor.id, title: 'Offer Title')
      subjects = offer.subjects
      prices = offer.prices

      expect(offer).not_to be nil

      expect(subjects.length).to be 1
      expect(subjects.first.id).to eq subject.id

      expect(prices.first.price).to eq 1000
      expect(prices.first.student_count).to eq 5
    end
  end

  describe '#show', type: :request do
    let!(:offer) do
      o = Offer.create!(
        professor_id: professor.id,
        title: 'Offer Title',
        description: 'Best offer description you will ever find.',
        number_of_sessions: 6,
        user_place: false,
        professor_place: true
      )
      o.subjects << subject
      Price.create!(offer_id: o.id, student_count: 4, price: 1200)
      o
    end
    it 'should get order details' do
      get "/professors/#{professor.id}/offers/#{offer.id}", params: {}, headers: professor.create_new_auth_token

      result = JSON.parse(response.body)
      expect(result['subjects'].length).to be > 0
      expect(result['prices'].length).to be > 0
    end
  end

  describe '#update', type: :request do
    let!(:offer) do
      o = Offer.create!(
        professor_id: professor.id,
        title: 'Offer Title',
        description: 'Best offer description you will ever find.',
        number_of_sessions: 6,
        user_place: false,
        professor_place: true
      )
      o.subjects << subject
      Price.create!(offer_id: o.id, student_count: 4, price: 1200)
      o
    end

    let(:new_subject) { Subject.find_or_create_by(title: 'Statistika', year: 1, course_id: course.id) }

    let(:update) do
      {
        id: offer.id,
        professor_id: professor.id,
        title: 'Better Title',
        description: 'Even better description.',
        number_of_sessions: 4,
        user_place: true,
        professor_place: false,
        subjects: [new_subject.id],
        prices: [{
          id: offer.prices.first.id,
          student_count: 12,
          price: 500
        }]
      }
    end
    it 'should update existing offer and associated objects' do
      put "/professors/#{professor.id}/offers/#{offer.id}", params: update.to_json, headers: professor.create_new_auth_token
      updated_offer = offer.reload

      expect(updated_offer.title).to eq update[:title]
      expect(updated_offer.description).to eq update[:description]
      expect(updated_offer.number_of_sessions).to eq update[:number_of_sessions]
      expect(updated_offer.user_place).to eq update[:user_place]
      expect(updated_offer.professor_place).to eq update[:professor_place]

      expect(updated_offer.subjects.length).to eq 1
      expect(updated_offer.subjects.first.id).to eq new_subject.id

      expect(updated_offer.prices.length).to eq 1
      expect(updated_offer.prices.first.student_count).to eq 12
      expect(updated_offer.prices.first.price).to eq 500
    end
  end
end
