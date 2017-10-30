max_sequence_sum
================

`max_sequence_sum` is a library extension to Array that finds the sequence with the largest sum inside an array (subarray).
It has methods to return the sum, the subarray and its initial and final positions.

## Instructions

Run `bundle install` first.

## Installation

`require_relative "lib/max_sequence_sum"`

## Usage

* Array#max_slice_sum
```ruby
# returns sum of subarray with largest sum
[2, -4, 6, 8, -10, 100, -6, 5].max_slice_sum
 => 104
```

* Array#max_sum_slice
```ruby
# returns subarray with largest sum
[2, -4, 6, 8, -10, 100, -6, 5].max_sum_slice
 => [6, 8, -10, 100]
```

* Array#max_sum_slice_positions
```ruby
# returns positions of subarray with largest sum
[2, -4, 6, 8, -10, 100, -6, 5].max_sum_slice_positions
 => [2,5]
```

## Rationale

It's a dynamic programming solution, it's a linear O(n) approach.

Steps:

1. We assume first item to be the largest sum
2. We consider (current subarray + next item) as a candidate for the largest sum
3. If its sum is larger than what we had before, take it as current largest sum
4. If taking this candidate lessens our sum, stop considering next items for current largest sum (keep largest_so_far and reset current_largest to 0) until an item itself is better than what we have so far (checked again in step 3)
5. Repeat step 2 (until the end of the array)

Take `[ 10, -99, 5, 8, -1 ]` as an example array.

1. We assume first item to be the largest sum (10)
```ruby
[ __10__, -99, 5, 8, -1 ]
current_largest = 10
largest_so_far  = 10
```

2. We consider (current subarray + next item) as a candidate for the largest sum (-89)
```ruby
[ __10, -99__, 5, 8, -1 ]
current_largest = -89
largest_so_far  = 10
```

3. If its sum is larger than what we had before, take it as current largest sum (it isn't in this case, 10 is better than -89)
```ruby
[ __10, -99__, 5, 8, -1 ]
current_largest = -89
largest_so_far  = 10
```

4. If taking this candidate lessens our sum, stop considering next items for current largest sum until an item itself is better than what we have so far (keep largest_so_far and reset current_largest to 0)
```ruby
[ __10, -99__, 5, 8, -1 ]
current_largest = 0
largest_so_far  = 10
```

5. We consider (current subarray + next item) as a candidate for the largest sum (5)
```ruby
[ 10, -99, __5__, 8, -1 ]
current_largest = 5
largest_so_far  = 10
```

6. If its sum is larger than what we had before, take it as current largest sum (it isn't in this case, 10 is still better than 5)
```ruby
[ 10, -99, __5__, 8, -1 ]
current_largest = 5
largest_so_far  = 10
```

7. We consider (current subarray + next item) as a candidate for the largest sum (13)
```ruby
[ 10, -99, __5, 8__, -1 ]
current_largest = 13
largest_so_far  = 10
```

8. If its sum is larger than what we had before, take it as current largest sum (13 is indeed better than 10)
```ruby
[ 10, -99, __5, 8__, -1 ]
current_largest = 13
largest_so_far  = 13
```

9. We consider (current subarray + next item) as a candidate for the largest sum (12)
```ruby
[ 10, -99, __5, 8, -1__ ]
current_largest = 12
largest_so_far  = 10
```

10. If its sum is larger than what we had before, take it as current largest sum (12 is worse than 13)
```ruby
[ 10, -99, __5, 8, -1__ ]
current_largest = 12
largest_so_far  = 13
```

11. If taking this candidate lessens our sum, stop considering next items for current largest sum until an item itself is better than what we have so far (keep largest_so_far and reset current_largest to 0)
```ruby
[ 10, -99, __5, 8, -1__ ]
current_largest = 0
largest_so_far  = 13
```

12. We reached the end of the array. 13 is the largest sum!
