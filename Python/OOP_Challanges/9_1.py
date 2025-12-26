class Restaurant:
    def __init__(self, restaurant_name, cuisine_type):
        self.restaurant_name = restaurant_name
        self.cuisine_type = cuisine_type

    def describe_restaurant(self):
        print(f"\nMy restaurants name is {self.restaurant_name}.")
        print(f"The cuisine type of my restaurant is {self.cuisine_type}.")

    def open_restaurant(self):
        print("\nThe restaurant is open.")


restaurant = Restaurant("Furkan's Place", "vegan turkish")
print(f"\nThe name of my restaurant is {restaurant.restaurant_name}.")
print(f"The type of food you get ist {restaurant.cuisine_type}.")

restaurant.describe_restaurant()
restaurant.open_restaurant()
