import time

# For-Schleife
start_time_for = time.time()
summe_for = 0
for i in range(1, 100000001):
    summe_for += i
end_time_for = time.time()
print(f"For-Schleife Ergebnis: {summe_for}")
print(f"For-Schleife Laufzeit: {end_time_for - start_time_for} Sekunden")

# While-Schleife
start_time_while = time.time()
summe_while = 0
i = 1
while i <= 100_000_000:
    summe_while += i
    i += 1
end_time_while = time.time()
print(f"While-Schleife Ergebnis: {summe_while}")
print(f"While-Schleife Laufzeit: {end_time_while - start_time_while} Sekunden