#!/usr/bin/python3

import sys
from collections import defaultdict

query_count = defaultdict(int)
query_time = defaultdict(int)

for line in sys.stdin:
    vs = line.strip().split("\t")
    deltatime = int(vs[1])
    query = vs[2]
    query_count[query] += 1
    query_time[query] += deltatime

print("\n* Query by Count")
for k in sorted(query_count, key=lambda x:query_count[x], reverse=True):
    print("%8d %s" % (query_count[k], k))

print("\n* Query by Total time")
for k in sorted(query_count, key=lambda x:query_time[x], reverse=True):
    print("%12d x %-8d %s" % (query_time[k], query_count[k], k))

print("\n* Query by Avg time")
for k in sorted(query_count, key=lambda x:query_time[x]/query_count[x], reverse=True):
    print("%12.2f %12d x %-8d %s" % (query_time[k]/query_count[k], query_time[k], query_count[k], k))
