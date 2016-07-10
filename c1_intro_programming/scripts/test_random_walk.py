import random_walk
import math
import unittest

class RunExercises(unittest.TestCase):

    valid_directions = ( "east", "west", "north", "south" )

    direction_displacements = {
        'west': (-1, 0),
        'east': (1, 0),
        'north': (0, 1),
        'south': (0, -1)
         }

    vector_list_average_distances = ( ( ((0, 0), (0, 0)), 0 ),
                                      ( ((10, 0), (0, 10)), 10 ),
                                      ( ((5, 0), (15, 0)), 10 ) )

    take_walk_tests = ( 1, 2, 3, 4, 5 )

    take_all_walk_tests = ( (1, 1),
                            (2, 1),
                            (1, 2),
                            (2, 3) )

    # this test relies on randomness, could fail to test low probability options
    def test_get_random_direction_only_valid_dirs(self):
        for i in range(1000):
            direction = random_walk.get_random_direction()
            self.assertTrue(direction in self.valid_directions)


    # this test relies on randomness, could theoretically fail
    def test_get_random_direction_all_dirs(self):
        counts = {
                'north': 0,
                'south': 0,
                'east': 0,
                'west': 0
                }

        for i in range(1000):
            direction = random_walk.get_random_direction()
            counts[direction] += 1

        for key in counts:
            self.assertNotEqual(counts[key], 0)


    def test_get_direction_displacement(self):
        for dir_key  in self.direction_displacements:
            computed_disp = random_walk.get_direction_displacement(dir_key)
            expected_displacement = self.direction_displacements[dir_key]
            self.assertEqual(computed_disp, expected_displacement)


    def test_average_final_distance(self):
        for test_case in self.vector_list_average_distances:
            computed_avg = random_walk.average_final_distance(test_case[0])
            self.assertEqual(computed_avg, test_case[1])


    def get_vector_magnitude(self, coords):
        return math.sqrt(coords[0] * coords[0] + coords[1] * coords[1])


    def test_take_walk(self):
        for test_steps in self.take_walk_tests:
            latest_endpoint = random_walk.take_walk(test_steps)

            # make sure endpoint format is correct
            self.assertTrue(isinstance(latest_endpoint, list))
            self.assertEqual(len(latest_endpoint), 2)

            # can't have traveled a distance greater than number of steps
            magnitude = self.get_vector_magnitude(latest_endpoint)
            self.assertGreaterEqual(test_steps, magnitude)


    def test_take_all_walks(self):
        for test_case in self.take_all_walk_tests:
            steps = test_case[0]
            runs = test_case[1]
            endpoints = random_walk.take_all_walks(steps, runs)

            self.assertTrue(isinstance(endpoints, list))
            self.assertEqual(len(endpoints), runs)

            for endpoint in endpoints:
                # make sure endpoint format is correct
                self.assertTrue(isinstance(endpoint, list))
                self.assertEqual(len(endpoint), 2)

                # can't have traveled a distance greater than number of steps
                magnitude = self.get_vector_magnitude(endpoint)
                self.assertGreaterEqual(steps, magnitude)


if __name__ == '__main__':
    unittest.main()

