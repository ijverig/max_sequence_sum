class Array
    def raise_error_if_non_numeric
        raise TypeError, "can't sum non-numeric values" unless all? {|e| e.is_a? Numeric}
    end

    # Returns largest sum and subarray initial and final positions
    def max_sequence_sum_attribs
        raise_error_if_non_numeric

        # initially assume first item to be the largest sum
        max_sum_so_far = max_sum_right_now = first
        initial = i = 0
        final = 1

        # start from second item, we already assumed the first one to be the largest sum
        self[1..length].each_with_index do |e, f|
            # considers (current subarray + next item) as a candidate for the largest sum
            max_sum_right_now += e
            # if its sum is larger than what we had before, take it as current largest sum
            if max_sum_so_far < max_sum_right_now
                max_sum_so_far = max_sum_right_now
                initial = i
                final = f+2
            # if taking this candidate lessens our sum, stop considering next items for current
            # largest sum until an item itself is better than what we have so far (case above)
            elsif max_sum_right_now < 0
                max_sum_right_now = 0
                i = f+2
            end
        end

        [max_sum_so_far, initial, final]
    end

    # Returns subarray largest sum or 0 if array is empty
    def max_slice_sum
        return 0 if empty?

        sum, *_ = max_sequence_sum_attribs
        sum
    end

    # Returns largest sum subarray or [] if array is empty
    def max_sum_slice
        return nil if empty?

        _, initial, final = max_sequence_sum_attribs
        self[initial...final]
    end

    # Returns largest sum subarray initial and final positions or [nil,nil] if array is empty
    def max_sum_slice_positions
        return [nil,nil] if empty?

        _, initial, final = max_sequence_sum_attribs
        [initial, final]
    end
end
