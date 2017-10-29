class Array
    def raise_error_if_non_numeric
        raise TypeError, "can't sum non-numeric values" unless all? {|e| e.is_a? Numeric}
    end

    def sum
        raise_error_if_non_numeric

        inject(0, :+)
    end

    def max_slice_sum
        raise_error_if_non_numeric

        # generates all subarrays
        subarys = []
        (1..length).each {|size| each_cons(size) {|subary| subarys << subary}}
        # returns subarray largest sum or 0 if array is empty
        subarys.max_by {|ary| ary.sum}&.sum || 0
    end

    def max_sum_slice
        raise_error_if_non_numeric

        # generates all subarrays
        subarys = []
        (1..length).each {|size| each_cons(size) {|subary| subarys << subary}}
        # returns subarray largest sum or 0 if array is empty
        subarys.max_by {|ary| ary.sum} || []
    end

    def max_sum_slice_positions
        raise_error_if_non_numeric

        # generates all subarrays with its positions = [subarray, initial position, end position]
        subarys = []
        (1..length).each {|size| each_cons(size).with_index {|subary, i| subarys << [subary.sum, i, i+size]}}
        # returns [initial,end] positions of largest sum subarray or [nil,nil] if array is empty
        subarys.max&.values_at(1,2) || [nil,nil]
    end
end
