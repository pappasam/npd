# Flatland - Classes and Shapes

## Introduction

"Flatland", an 1884 novel written by Edwin Abbott, describes a world in which 2-dimensional figures bump up against problems within, and above, their dimensional confines. In this assignment, you will take on the role of a mild-mannered shape and attempt to navigate the perils of a two-dimensional world.

## Shapes

All shapes in our simplified version of Flatland contain shapes with sides of equal length. For example, if one side of a triangle is 2 meters long, then the other two sides are also two meters long.

* Equilateral Triangle
  * Sides: 3
  * Area: 0.5 * base * height
      * alternatively: ((3^0.5) / 4) * side * side
  * Role: aggressive and prone to violence
* Square
  * Sides: 4
  * Area: side * side
  * Role: complacent and bureaucratic
* Circle
  * Sides: 1 (or infinite, take your pick)
  * Area: pi * radius * radius
  * Role: Wise and noble

## Minimum requirements for full credit

* Implement a class for each shape defining the following
  * Attributes
    * shape_type
      * string value in ['square', 'circle', 'triangle']
    * edge_length
      * in meters
    * name
      * To keep track of any plot
    * allies
      * a list of allied shape objects
    * enemies
      * a list of enemy objects
  * Methods
    * area(self)
    * perimeter(self)
    * update_edge_length(self, change)
    * add_ally(self, shape_object)
    * add_enemy(self, shape_object)
* In a function called minimum_main()
  * Create two objects from each class
  * Make triangles and circles allies
  * Make squares enemies of triangles and circles
  * Print each object's name, its shape type, its friends, and its enemies

## Challenge requirements

If you are able to complete the minimum requirements, there is a lot more you can do.
