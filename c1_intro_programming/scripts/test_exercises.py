import exercises
import unittest

class RunExercises(unittest.TestCase):

    celsius_to_fahrenheit = ( (0, 32),
                              (50, 122),
                              (100, 212) )

    time_to_fall = ( (0, 0),
                     (10, 1.4285714285714286),
                     (20, 2.0203050891044216),
                     (40, 2.857142857142857),
                     (50, 3.1943828249996997) )

    tower_checks = ( ((1, 0, 0, 135, 0), True),
                     ((1, 0, 0, 136, 0), False),
                     ((2, 0, 0, 191, 0), True),
                     ((2, 0, 0, 192, 0), False),
                     ((2, 0, 25, 191, 25), True),
                     ((2, 0, 25, 192, 25), False),
                     ((2, 0, 0, 177, 73), True),
                     ((2, 0, 0, 178, 74), False) )

    def test_to_fahrenheit(self):
        for celsius, fahrenheit in self.celsius_to_fahrenheit:
            computed_fahrenheit = exercises.to_fahrenheit(celsius)
            self.assertEqual(computed_fahrenheit, fahrenheit)


    def test_to_celsius(self):
        for celsius, fahrenheit in self.celsius_to_fahrenheit:
            computed_celsius = exercises.to_celsius(fahrenheit)
            self.assertEqual(computed_celsius, celsius)


    def test_get_fall_time(self):
        for meters, seconds in self.time_to_fall:
            computed_seconds = exercises.get_fall_time(meters)
            self.assertEqual(computed_seconds, seconds)

    def test_isVulnerable(self):
        for params, output in self.tower_checks:
            computed = exercises.isVulnerable(params[0], params[1], params[2], params[3], params[4])
            self.assertEqual(computed, output)

if __name__ == '__main__':
    unittest.main()
