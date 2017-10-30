class Array
    def raise_error_if_non_numeric
        raise TypeError, "can't sum non-numeric values" unless all? {|e| e.is_a? Numeric}
    end

    def sum
        raise_error_if_non_numeric

        inject(0, :+)
    end

    # Returns largest sum subarray and its initial and final positions
    def max_sequence_sum_attribs
        # generates all subarrays with its positions = [subarray, initial position, end position]
        subarys = []
        (1..length).each {|size| each_cons(size).with_index {|subary, i| subarys << [subary, i, i+size]}}
        # selects largest sum subarray and its initial and final positions
        max_subary, *positions = subarys.max_by {|subary, _, _| subary.sum}
        [max_subary, *positions]
    end

    # Returns subarray largest sum or 0 if array is empty
    def max_slice_sum
        subary, *_ = max_sequence_sum_attribs
        subary&.sum || 0
    end

    # Returns largest sum subarray or [] if array is empty
    def max_sum_slice
        subary, *_ = max_sequence_sum_attribs
        subary || []
    end

    # Returns largest sum subarray initial and final positions or [nil,nil] if array is empty
    def max_sum_slice_positions
        _, initial, final = max_sequence_sum_attribs
        [initial, final]
    end
end
