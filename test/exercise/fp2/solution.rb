module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&blk)
        return if empty?

        first, *rest = self
        blk.call(first)
        MyArray.new(rest).my_each(&blk)

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
      def my_reduce(acc = nil, &blk)
        return acc if empty?

        first, *rest = self
        acc = acc.nil? ? first : blk.call(acc, first)

        MyArray.new(rest).my_reduce(acc, &blk)
      end
    end
  end
end
