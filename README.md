Find the sequence with the greater sum inside an array (subarray).

Run `bundle install` first.

Usage:

* Array#max_slice_sum
```ruby
# returns sum of subarray with largest sum
[2, -4, 6, 8, -10, 100, -6, 5].max_slice_sum
#=> 104
```

* Array#max_sum_slice
```ruby
# returns subarray with largest sum
[2, -4, 6, 8, -10, 100, -6, 5].max_sum_slice
#=> [6, 8, -10, 100]
```

* Array#max_sum_slice_positions
```ruby
# returns positions of subarray with largest sum
[2, -4, 6, 8, -10, 100, -6, 5].max_sum_slice_positions
#=> [2,5]
```
