class Node

	attr_accessor :data, :next

	def initialize(data)
		@data = data
		@next = nil
	end
end

class LinkedList

	def initialize
		@first = nil
	end

	def add_to_tail(data)
		head = @first
		while head.next
			head = head.next
		end
		head.next = Node(data)
	end

	def remove_tail
		head = @first
		while head.next
			head = head.next
		end
		head = nil
	end

	def print
		head = @first
		while head
			puts head.data
			head = head.next
		end
	end

	def delete(node)
		head = @first
		while head != node
			head = head.next
		end
		head = nil
	end

	def add_to_front(node)
		@first = node
	end

	def remove_front
		temp = @first
		@first = @first.next
		temp
	end


end