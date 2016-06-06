# Amusement Park Line
# Front of the line is @line[n], back of the line is @line[0]

# Allowing for entry/exit behavior in middle of queue is expensive for
# arrays

class LinkedNodes

	attr_accessor :first, :last

	def initialize
		@first = nil
		@last = nil
	end

	def search(node)

		head = @first

		while head != data || nil
			head = head.next
		end

		return head

	end

	def exit(node)
		if search(node)
			oldNode = node
			node.next.prev = oldNode.prev
			node.prev.next = oldNode.next
		end
	end

	def enter

	end

	def dequeue
		@first = @first.next
		@first.prev = nil
	end

	def enqueue(node)
		if !@first
			@first = node
			@last = node
		else
			node.prev = @last
			@last.next = node
			@last = node
		end
	end

end

class Node

	attr_accessor :data, :next, :prev

	def initialize(data)
		@data = data
		@next = nil
		@prev = nil
	end

end


# Pixel Controller

class Pixel

	attr_accessor :red
	attr_accessor :blue
	attr_accessor :green
	attr_accessor :xpos
	attr_accessor :ypos

	def initialize
		self.red = 0
		self.blue = 0
		self.green = 0
		self.xpos = 0
		self.ypos = 0
	end

	def color(r, g, b)
		self.red = r
		self.green = g
		self.blue = b
	end

	def position(x, y)
		self.xpos = x
		self.ypos = y
	end

end

# Geo Location

class Person
	attr_accessor :geoloc

end