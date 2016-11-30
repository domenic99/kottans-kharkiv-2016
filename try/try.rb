module TryModule
  def try(*a, &block)
      if a.first == nil && block_given?
        yield self
      elsif a.empty? && !block_given?
        raise ArgumentError.new("No method name given")
      else
        public_send(*a,&block) if a.first != nil && self.respond_to?(a.first.to_sym)
      end
   end
end