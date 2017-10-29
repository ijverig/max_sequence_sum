class Array
    def sum
        inject(0, :+)
    end

    def max_slice_sum
        raise TypeError, "can't sum non-numeric values" unless all? {|e| e.is_a? Numeric}

        # generates all subarrays
        subarys = []
        (1..length).each {|size| each_cons(size) {|subary| subarys << subary}}
        # returns subarray largest sum or 0 if array is empty
        subarys.max_by {|ary| ary.sum}&.sum || 0
    end
end
