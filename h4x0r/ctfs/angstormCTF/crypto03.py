text = """
The horse was a small falcon runner.
The horse was a huge goat pitcher.
The pig is a quick falcon singer.
The goat was a quick sheep speaker.
The sheep is the big goat pitcher.
The sheep was a slow sheep hitter.
The horse is a tiny goat dancer.
A cow is the huge bluejay dancer.
The falcon is the fast sheep pitcher.
The pig was a speedy falcon pitcher.
The pig was the speedy goat singer.
The goat was a huge sheep hitter.
The horse was the speedy sheep runner.
The cow was a speedy bluejay singer.
A sheep is a small falcon catcher.
The cow was the fast cow singer.
The goat was a sluggish sheep catcher.
The goat is the slow robin catcher.
"""

d = {}
for x in text.split():
    try:
        d[x] += 1
    except:
        d[x] = 1

print(d)
