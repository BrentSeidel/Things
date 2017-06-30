use <Basic/bbs_pins.scad>
//
// Model for a 20x4 LCD
// AdaFruit item #198
//
module bbs_20x4_lcd()
{
  difference()
  {
    union()
    {
      cube([98, 60, 2], center=false);
      translate(v=[0, 10, 0]) cube([98, 40, 11], center=false);
//      translate(v=[10, 3, -7]) cube([40, 1, 11], center=false);
      translate(v=[49, 3, ]) bbs_header(16);;
    }
    union()
    {
      translate([4, 4, -1]) cylinder(h=4, r=2);
      translate([4, 56, -1]) cylinder(h=4, r=2);
      translate([94, 4, -1]) cylinder(h=4, r=2);
      translate([94, 56, -1]) cylinder(h=4, r=2);
    }
  }
}

color("red") bbs_20x4_lcd();