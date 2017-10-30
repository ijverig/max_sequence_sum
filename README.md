max_sequence_sum
================

max_sequence_sum is a library extension to Array that finds the sequence with the largest sum inside an array (subarray).
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

It's an exhaustive solution:

Take `[ 10, -99, 5, 8 ]` as an example array.

1. All subarrays are generated
```ruby
[ [10], [-99], [5], [8], [10, -99], [-99, 5], [5, 8], [10, -99, 5], [-99, 5, 8], [10, -99, 5, 8] ]
```

2. Then we compute the sum for the subarrays
```ruby
[ [10], [-99], [5], [8], [10, -99], [-99, 5], [5, 8], [10, -99, 5], [-99, 5, 8], [10, -99, 5, 8] ]
    |     |     |    |       |          |        |          |            |              |
    10   -99    5    8      -89        -94       13        -84          -86            -76
```

3. Next we select the one with the largest sum
```ruby
[ … [5, 8] … ]
       |
       13
```

3. Finally we return it, along with its position and sum
```ruby
subarray  = [5, 8]
positions = [2,4]
sum       = 13
```
