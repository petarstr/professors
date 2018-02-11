class OffersService
  include Singleton

  def create_offer(prof_id, opts)
    offer = Offer.create!(
      professor_id: prof_id,
      title: opts['title'],
      description: opts['description'],
      number_of_sessions: opts['number_of_sessions'],
      user_place: opts['user_place'],
      professor_place: opts['professor_place']
    )

    subjects = opts['subjects']
    subjects = [subjects] unless subjects.respond_to?(:collect)

    subjects.each do |s|
      offer.subjects << Subject.find(s)
    end

    prices = opts['prices']
    prices = [prices] unless prices.is_a?(Array)

    prices.each do |p|
      Price.create!(offer_id: offer.id, student_count: p['student_count'], price: p['price'])
    end
  end

  def update_offer(prof_id, offer_id, opts)
    offer = Offer.find_by(professor_id: prof_id, id: offer_id)
    raise ActiveRecord::RecordNotFound unless offer

    subjects = opts['subjects']
    opts.delete('subjects')

    prices = opts['prices']
    opts.delete('prices')

    offer.update!(opts)

    subjects.each do |s|
      offer.subjects.destroy_all
      offer.subjects << Subject.find(s)
    end

    prices.each do |p|
      price = Price.find(p['id'])
      price.student_count = p['student_count']
      price.price = p['price']
      price.save!
    end
  end
end
