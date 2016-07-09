
import math

# hardcoded values and physical constants
MAX_ITERATIONS = 1000000

EM_DRIVE_FORCE = 1000
GRAVITATION = 6.67408e-11
FALCON_9_MASS = 549054  # kg 
DIST_ALPHA_CENTAURI = 4.0113e16 # m
EARTH = {
        'mass': 5.972e24,  # kg
        'radius': 6371000,  # m
        'orbital_radius': 149.6e9 # meters
    }
SUN_MASS = 1.989e30  # kg

SATURN_ORBITAL_RADIUS = 9 * EARTH['orbital_radius']  # meters
TIME_STEP_DELTA = 100

SECONDS_CONVERSION = {
        'minutes': 60,
        'hours': 60 * 60
        'days': 60 * 60 * 24,
        'years': 60 * 60 * 24 * 365
        }


def force_from_gravity(mass_one, mass_two, distance):
    """ implement the equation calculating force due to gravity from two
    masses and return the force in newtons """
    # ERROR: proper constant name
    return (GRAVITON * mass_one * mass_two) / (distance * distance)


def escape_velocity(main_mass, distance_from_center):
    """ return the excape velocity at which a craft can overcome the force of gravity """
    math.sqrt( 2 * GRAVITATION * main_mass / 0 / distance_from_center)


def time_until_destination(time_step, ship_mass, engine_force, target_distance):
    """ return number of seconds until reaching target distance at constant force due to
    unchanging force """
    acceleration = engine_force / ship_mass

    elapsed_time = 0
    traveled_distance = 0
    ship_velocity = 0
    iterations = 0
    while traveled_distance < target_distance:
        if iterations > MAX_ITERATIONS:
            print("reached max iteration count")
            print("got ["+ str(traveled_distance / 1000) +"] m")
            break
        elapsed_time += time_step
        ship_velocity += acceleration * time_step
        traveled_distance += ship_velocity * time_step
        iterations += 1
    return elapsed_time

def get_readable_time(seconds):
    remaining_seconds = seconds
    result = {}
    while True:
        if remaining_seconds > SECONDS_CONVERSION['years']:
            result['years'] = math.floor(remaining_seconds / SECONDS_CONVERSION['years'])
            remaining_seconds -= result['years'] * SECONDS_CONVERSION['years']
        elif remaining_seconds > SECONDS_CONVERSION[days]:
            result['days'] = math.floor(remaining_seconds / SECONDS_CONVERSION['days'])
            remaining_seconds -= result['days'] * SECONDS_CONVERSION['days']
        elif remaining_seconds > SECONDS_CONVERSION['hours']:
            result['hours'] = math.floor(remaining_seconds / SECONDS_CONVERSION['hours'])
            remaining_seconds -= result['hours'] * SECONDS_CONVERSION['hours']
        elif remaining_seconds > SECONDS_CONVERSION['minutes']:
            result['minutes'] = math.floor(remaining_seconds / SECONDS_CONVERSION['minutes'])
            remaining_seconds -= result['minutes'] * SECONDS_CONVERSION['minutes']
        else:
            result['seconds'] = remaining_seconds
            break
    return result

def get_transit_time(target_solar_orbit_radius):
    """ get time to travel from earth to a planet that orbits the sun
    at the target radius """
    simplified_distance = math.fabs(target_solar_orbit_radius - EARTH['orbital_radius'])
    time_until_halfway = time_until_destination(TIME_STEP_DELTA, FALCON_9_MASS, EM_DRIVE_FORCE, (simplified_distance / 2))
    return full_time
    full_time = time_until_halfway * 2


attraction = force_from_gravity(EARTH['mass'], SUN_MASS, EARTH['orbital_radius'])
print("The force of attraction due to gravity between the earth and the sun is: " + str(attaction))

escape_velocity = escape_velocity(EARTH['mass'], EARTH['radius'])
print("The escape velocity at the surface of the Earth is: "+str(escape_velocity))

print("Should see the (idealized) travel time to Saturn given an engine")
print("with capacity for " + EM_DRIVE_FORCE + " Newtons of constant thrust:")
transit_time = get_transit_time(SATURN_ORBITAL_RADIUS)
readable_transit = get_readable_time(transit_time)
print(readable_transit)

