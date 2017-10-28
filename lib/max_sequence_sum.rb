class Array
    def max_slice_sum
        raise TypeError.new "Can't sum non-numeric values" unless self.all? {|e| e.is_a? Numeric}

        if self.empty?
            0
        elsif self.all? {|e| e.positive?}
            self.sum
        else
            # all subarrays
            subarys = []
            (1..self.length).each {|size| self.each_cons(size) {|subary| subarys << subary}}
            # subarray with greater sum
            subarys.max_by {|ary| ary.sum}.sum
        end
    end
end
