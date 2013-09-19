module GenSpec
  class Fixnum
    MAX = 1000000000000000000

    def self.generated_value
      result = (rand * MAX).to_i
      Time.now.to_i.even? ? result : result * -1
    end
  end
end
