require 'gen_spec'

def adder(x, y)
  puts "x: #{x}, y: #{y}"
  (x + y) # <- Output is a Fixnum
end

gen_spec :adder, "Fixnum inputs always return a Fixnum" do
  inputs { "Fixnum, Fixnum" }
  validator { result.is_a?(Fixnum) }
end

#=> true

def adder(x, y)
  puts "x: #{x}, y: #{y}"
  (x + y).to_f # <- Output is a Float
end

gen_spec :adder, "Fixnum inputs always return a Fixnum" do
  inputs { "Fixnum, Fixnum" }
  validator { result.is_a?(Fixnum) }
end

#=> false
