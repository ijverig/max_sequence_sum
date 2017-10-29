class Array
    def max_slice_sum
        raise TypeError, "can't sum non-numeric values" unless all? {|e| e.is_a? Numeric}

        return 0 if empty?

        # generates all subarrays
        subarys = []
        (1..length).each {|size| each_cons(size) {|subary| subarys << subary}}
        # returns subarray with largest sum
        subarys.max_by {|ary| ary.sum}.sum
    end
end
