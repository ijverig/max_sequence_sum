class Array
    def max_slice_sum
        raise TypeError.new "can't sum non-numeric values" unless self.all? {|e| e.is_a? Numeric}

        return 0 if self.empty?

        # generates all subarrays
        subarys = []
        (1..self.length).each {|size| self.each_cons(size) {|subary| subarys << subary}}
        # returns subarray with largest sum
        subarys.max_by {|ary| ary.sum}.sum
    end
end
