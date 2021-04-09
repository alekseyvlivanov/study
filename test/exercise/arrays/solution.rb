module Exercise
  module Arrays
    class << self
      def replace(array)
        max = 0
        array.each { |num| max = num if num > max }
        array.map! { |num| num.positive? ? max : num }
      end

      def search(array, query, left = 0, right = nil)
        right ||= array.length - 1
        return -1 if left > right

        middle = left + (right - left) / 2
        return middle if query == array[middle]

        if query < array[middle]
          right = middle - 1
        elsif query
          left = middle + 1
        end
        search(array, query, left, right)
      end
    end
  end
end
