module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        0.upto(length - 1) do |idx|
          yield(self[idx])
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        arr = MyArray.new
        my_each { |el| arr << yield(el) }
        arr
      end

      # Написать свою функцию my_compact
      def my_compact
        arr = MyArray.new
        my_each { |el| arr << el unless el.nil? }
        arr
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        if acc.nil?
          acc = self[0]
          start = 1
        else
          start = 0
        end
        start.upto(length - 1) do |idx|
          acc = yield(acc, self[idx])
        end
        acc
      end
    end
  end
end
