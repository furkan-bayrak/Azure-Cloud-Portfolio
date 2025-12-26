""" """


class User:
    def __init__(self, first_name, last_name, age, gender, country):
        self.first_name = first_name
        self.last_name = last_name
        self.age = age
        self.gender = gender
        self.country = country

    def describe_user(self):
        print(f"""\nWe have collected following Data of the Users:
               {self.first_name}, {self.last_name}, {self.age}, {self.country}.""")

    def greet_user(self):
        print(f"Hello {self.first_name}!")


user1 = User("Furkan", "Bayrak", 31, "male", "Turkiye")
user2 = User("Leonie", "Wintzer", 27, "female", "Austria")
user3 = User("Julian", "Brinkmann", 32, "male", "Germany")

user1.describe_user()
user1.greet_user()

user2.describe_user()
user2.greet_user()

user3.describe_user()
user3.greet_user()
