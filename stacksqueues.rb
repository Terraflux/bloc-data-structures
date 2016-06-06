class MyStack

	def initialize
		@store = Array.new
	end

	def push(element)
		@store[@store.length] = element
	end

	def pop
		@store[@store.length - 1] = nil
	end

	def empty?
		if @store = nil
			true
		else
			false
		end
	end

end

class MyQueue

	def initialize
		@store = Array.new
	end

	def enqueue(element)
		@store[@store.length] = element
	end

	def dequeue
		for i in @store
			@store[i] = @store[i + 1]
		end
		@store[@store.length - 1] = nil
	end

	def empty?
		if @store = nil
			true
		else
			false
		end
	end

end