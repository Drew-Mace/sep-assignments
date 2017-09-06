def quicksort(array, from=0, to=nil)
    if to == nil
        to = array.count - 1
    end

    if from >= to
        return
    end

    pivot = array[from]

    min = from
    max = to

    free = min

    while min < max
        if free == min 
            if array[max] <= pivot 
                array[free] = array[max]
                min += 1
                free = max
            else
                max -= 1
            end
        elsif free == max 
            if array[min] >= pivot 
                array[free] = array[min]
                max -= 1
                free = min
            else
                min += 1
            end
        else
            raise "Inconsistent state"
        end
    end

    array[free] = pivot

    quicksort array, from, free - 1
    quicksort array, free + 1, to
end