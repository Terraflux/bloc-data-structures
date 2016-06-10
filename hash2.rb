require "bit-twiddle"

class Pair

	attr_accessor :key, :value

	def initialize(key, value)
		@key: key
		@value: value
	end
end

class HashClass

	def initialize
		@internal_array = Array.new
		@internal_array.length = 5
	end

	def murmurHash(key, length, seed)
		
		c1 = 0xcc9e2d51
		c2 = 0x1b873593
		r1 = 15
		r2 = 13
		m = 5
		n = 0xe6546b64

		hash = seed
		bitKey = key.to_s(2)
		4ByteIsolator = 0xFFFFFFFF

		while bitKey > 4ByteIsolator
			k = bitKey & 4ByteIsolator

			k *= c1
			k.lrot32(r1).to_s(2).rjust(32, '0')
			k *= c2

			hash = hash XOR k
			hash.lrot32(r2).to_s(2).rjust(32, '0')
			hash = hash * m + n

			bitKey >> 32
		end

		remainder = bitKey.unpack('V*')

		remainder *= c1
		remainder.lrot32(r1).to_s(2).rjust(32, '0')
		remainder *= c2

		hash XOR length
		hash XOR (hash >> 16)
		hash *= 0x85ebca6b
		hash XOR (hash >> 13)
		hash *= 0xc2b2ae35
		hash XOR (hash >> 16)
	end

	def insert(key, value)
		index = murmurHash(key, @internal_array.length, key) % @internal_array.length
		if @internal_array[index]
			resize
			newIndex = murmurHash(key, @internal_array.length, key) % @internal_array.length
			@internal_array[newIndex] = new Pair(key, value)
		else
			@internal_array[index] = new Pair(key, value)
	end

	def retrieve(key)
		index = murmurHash(key, @internal_array.length, key) % @internal_array.length
		@internal_array[index]

	end



	def resize
		@internal_array.length *= 1.5

		store = Array.new
		# temporary array to prevent unneccesary collisions

		for i = 0; i < @internal_array.length; i++

			if @internal_array[i]
				newIndex = murmurHash(@internal_array[i][0], @internal_array.length, Time.now) % @internal_array.length
				if !store[newIndex]
					store[newIndex] = @internal_array[i]
				end


			end
		end

	end

end

class Integer
	def ror count
		(self >> count) | (self << (32 - count)) & 0xFFFFFFFF
	end
end