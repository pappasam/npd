
import debugging
import unittest

class RunExercises(unittest.TestCase):

    gravity_tests = ( ( (debugging.EARTH['mass'], debugging.SUN_MASS, debugging.EARTH['orbital_radius']), 3.5422793159941665e+22), )

    earth_escape_velocity = 11185.79353278485

    valid_time_keys = [ 'seconds', 'minutes', 'years', 'days', 'hours' ]
    transit_time_to_saturn_seconds = 51268200
    transit_time_to_saturn_readble = {'seconds': 0, 'minutes': 10, 'years': 1, 'days': 228, 'hours': 9}

    orbital_radius_delta = 1196800000000.0
    saturn_trip_halway_time = 25634100

    def test_force_from_gravity(self):
        for test_case in self.gravity_tests:
            params = test_case[0]
            result = test_case[1]
            computed_result = debugging.force_from_gravity(params[0], params[1], params[2])
            self.assertEqual(computed_result, result)


    def test_escape_velocity(self):
        computed_escape_velocity = debugging.escape_velocity(
                debugging.EARTH['mass'], debugging.EARTH['radius'])
        self.assertEqual(computed_escape_velocity, self.earth_escape_velocity)


    def test_time_until_destination(self):
        computed_time = debugging.time_until_destination(
                debugging.TIME_STEP_DELTA, debugging.FALCON_9_MASS,
                debugging.EM_DRIVE_FORCE, (self.orbital_radius_delta / 2))
        self.assertEqual(computed_time, self.saturn_trip_halway_time)

    def test_get_readable_time(self):
        readable = debugging.get_readable_time(self.transit_time_to_saturn_seconds)
        self.assertEqual(self.transit_time_to_saturn_readble, readable)


    def test_get_transit_time(self):
        computed_transit_time = debugging.get_transit_time(debugging.SATURN_ORBITAL_RADIUS)
        self.assertEqual(computed_transit_time, self.transit_time_to_saturn_seconds)


if __name__ == '__main__':
    unittest.main()

