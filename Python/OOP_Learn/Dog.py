"""
class Dog:

    def __init__(self, name, age):
        self.name = name
        self.age = age

    def sit(self):
        print(f"{self.name} is now sitting.")

    def roll_over(self):
        print(f"{self.name} rolled over.")

my_dog  = Dog("Bob", 5)
print(f"My dogs name is {my_dog.name}.")
print(f"My dogs age is {my_dog.age}.")

my_dog.sit()
my_dog.roll_over()
"""


## Multiple Instances = Mehrere abrufe der Methoden mit verschieden Daten
# Klasse
class Dog:
    def __init__(self, name, age):
        # Attribute
        self.name = name
        self.age = age

    # Methode
    def sit(self):
        print(f"{self.name} is now sitting.")

    # Methode
    def roll_over(self):
        print(f"{self.name} rolled over.")


# Instanzierung
my_dog = Dog("Bob", 5)
your_dog = Dog("Wallace", 2)

print(f"\nMy dogs name is {my_dog.name}.")
print(f"My dogs age is {my_dog.age}.")
my_dog.sit()
my_dog.roll_over()

print(f"\nMy dogs name is {your_dog.name}.")
print(f"My dogs age is {your_dog.age}.")
your_dog.sit()
your_dog.roll_over()
