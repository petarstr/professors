class OffersService
  include Singleton

  def create_offer(prof_id, opts)
    subjects = opts['subjects']
    subjects = [subjects] unless subjects.respond_to?(:collect)

    prices = opts['prices']
    prices = [prices] unless prices.is_a?(Array)

    Offer.transaction do
      offer = Offer.create!(
        professor_id: prof_id,
        title: opts['title'],
        description: opts['description'],
        number_of_sessions: opts['number_of_sessions'],
        user_place: opts['user_place'],
        professor_place: opts['professor_place']
      )

      subjects.each do |s|
        offer.subjects << Subject.find(s['subject_id'])
      end

      prices.each do |p|
        Price.create!(offer_id: offer.id, student_count: p['student_count'], price: p['price'])
      end
    end
  end

  def update_offer(prof_id, offer_id, opts)
    offer = Offer.find_by(professor_id: prof_id, id: offer_id)
    raise ActiveRecord::RecordNotFound unless offer

    if opts.key?('active')
      offer.update!(opts)
      return
    end

    subjects = opts['subjects']
    opts.delete('subjects')

    prices = opts['prices']
    opts.delete('prices')

    Offer.transaction do
      offer.update!(opts)

      offer.subjects.destroy_all
      subjects.each do |s|
        offer.subjects << Subject.find(s['id'])
      end

      offer.prices.destroy_all
      prices.each do |p|
        Price.create!(offer_id: offer.id, student_count: p['student_count'], price: p['price'])
      end
    end
  end
end
