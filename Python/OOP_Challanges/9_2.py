"""
Create three different instances from the class,
 and call describe_restaurant() for each instance.
"""


class Restaurant:
    def __init__(self, restaurant_name, cuisine_type):
        self.restaurant_name = restaurant_name
        self.cuisine_type = cuisine_type

    def describe_restaurant(self):
        print(f"\nMy restaurants name is {self.restaurant_name}.")
        print(f"The cuisine type of my restaurant is {self.cuisine_type}.")

    def open_restaurant(self):
        print("\nThe restaurant is open.")


restaurant_1 = Restaurant("Furkan's Place", "vegan turkish")
restaurant_2 = Restaurant("Leonies house", "vegan german")
restaurant_3 = Restaurant("Asia Wok", "asian food")

restaurant_1.describe_restaurant()
restaurant_2.describe_restaurant()
restaurant_3.describe_restaurant()
