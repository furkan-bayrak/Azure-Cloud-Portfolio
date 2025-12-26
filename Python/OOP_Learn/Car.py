"""
class Car: #Class

    def __init__(self, make, model, year): #def... = methode  #(self, ...): =parameter
        self.make = make   #attributes  =    #parameter
        self.model = model
        self.year = year

    def get_descriptive_name(self):
        long_name = f"{self.make} {self.model} {self.year}"
        return long_name.title()

my_new_car = Car("audi", "a4", "2024") #instance
print(my_new_car.get_descriptive_name())
"""


class Car:  # Class
    def __init__(self, make, model, year):  # def... = methode  #(self, ...): =parameter
        self.make = make  # attributes  =    #parameter
        self.model = model
        self.year = year
        self.odometer_reading = 0

    def get_descriptive_name(self):
        long_name = f"{self.make} {self.model} {self.year}"
        return long_name.title()

    def read_odometer(self):
        print(f"This car has {self.odometer_reading} miles on it.")


my_new_car = Car("audi", "a4", "2024")  # instance
print(my_new_car.get_descriptive_name())
my_new_car.read_odometer()
