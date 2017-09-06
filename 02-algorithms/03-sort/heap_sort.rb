class HeapSort
  attr_accessor :ary

  def initialize(ary)
    @ary = ary
    @size = ary.size
  end

  def sort
    heapify
    partitions
  end

  private

  def heapify
    1.upto(@size - 1).each do |idx|
      if ary[idx] > ary[find_parent_idx_from_idx(idx)]
        recursive_swap_bottom_up(idx)
      end
    end
  end

  def recursive_swap_bottom_up(idx)
    return if idx == 0

    parent_idx = find_parent_idx_from_idx(idx)
    if idx > 0 && ary[idx] > ary[parent_idx]
      swap(idx, parent_idx)
      recursive_swap_bottom_up(parent_idx)
    else
      return
    end
  end

  def swap(idx1, idx2)
    temp = ary[idx1]
    ary[idx1] = ary[idx2]
    ary[idx2] = temp
  end

  def find_parent_idx_from_idx(idx)
    if idx < 2
      return 0
    end

    if idx % 2 == 0
      ((idx - 1.0) / 2).floor
    else
      ((idx - 2.0) / 2).ceil
    end
  end

  def partitions
    partition_div_idx = @size - 1
    idx = 0
    while(partition_div_idx > idx)
      swap(idx, partition_div_idx)

      recursive_swap_top_down(idx, partition_div_idx)

      partition_div_idx -= 1
    end
  end

  def recursive_swap_top_down(idx, end_idx)
    return if idx == end_idx - 1

    left_child_idx = 2 * idx + 1
    if left_child_idx < end_idx && ary[idx] < ary[left_child_idx]
      swap(idx, left_child_idx)
      recursive_swap_top_down(left_child_idx, end_idx)
    end

    right_child_idx = 2 * idx + 2
    if right_child_idx < end_idx && ary[idx] < ary[right_child_idx]
      swap(idx, right_child_idx)
      recursive_swap_top_down(right_child_idx, end_idx)
    end

    return
  end
end