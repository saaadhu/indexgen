import sys

line = sys.stdin.readline()
numbers = [int(x) for x in line.split()]

numbers_count = len(numbers)

if numbers_count == 1:
    print (numbers[0])
    sys.exit(0)

ranges=[]
range_start = 0
for i,number in enumerate(numbers):
    if (i != len(numbers) - 1 and numbers[i+1] - numbers[i] == 1):
        continue
    if range_start == i:
        ranges.append(str(numbers[i]))
    else:
        ranges.append(str.format("{0}-{1}", numbers[range_start], numbers[i]))

    range_start = i + 1

print (str.join(", ", ranges))
