module Ebuberable
  def tester(&block)
    yield self+"dsf"
  end

	def selects(&block)
		arr = []
		self.each do |item|
			if yield (item)
				arr << item
			end
		end		
		arr
	end

	def reject(&block)
		arr = []
		self.each do |item|
			unless yield (item)
				arr << item
			end
		end		
		arr
	end

	def all?(&block)
		result = true
		self.each do |item|
			unless yield (item)
				result = false
			end
		end
		result
	end

	def any?(&block)
		result = false
		self.each do |item|
			if yield (item)
				result = true
			end
		end
		result
	end

	def find(&block)
		result = nil
		self.each do |item|
			if yield (item)
				result = item
				break
			end
		end
	end

#wrong work
	def map(&block)
		arr = []
		self.each do |item| 
			a = yield (item)
			arr << a  
		end
		arr		
	end

	def partition(&block)

	end

	def sort(&block)

	end

	def reduce(&block)

	end

	def grep(&block)
		
	end
end
