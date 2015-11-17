import sys

lines = sys.stdin.readlines()

start_page = 0

for line in lines:
    f, page_count = line.split()
    print (str.format("{0}:{1}", f, str(start_page)))
    start_page = start_page + int(page_count)

