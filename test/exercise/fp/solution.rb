module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        mapped_array = array.map { |film| [film['rating_kinopoisk'], film['country'].to_s.split(',').length] }
        counted_data = mapped_array.reduce({ rating: 0, films: 0 }) do |counted, (rating, countries)|
          if countries > 1 && rating.to_f.positive?
            { rating: counted[:rating] + rating.to_f, films: counted[:films] + 1 }
          else
            counted
          end
        end
        counted_data[:rating] / counted_data[:films]
      end

      def chars_count(films, threshold)
        letter = 'и'
        mapped_array = films.map { |film| [film['name'].count(letter), film['rating_kinopoisk'].to_f] }
        mapped_array.reduce(0) do |total, (count, rating)|
          rating >= threshold ? total + count : total
        end
      end
    end
  end
end
