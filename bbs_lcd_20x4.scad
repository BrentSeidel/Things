use <bbs_pins.scad>
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
      translate([0, 10, 0]) cube([98, 40, 11]);
      translate([49, 3, ]) bbs_header(16);;
    }
    union()
    {
      translate([3, 3, -1]) cylinder(h=4, r=2);
      translate([3, 57, -1]) cylinder(h=4, r=2);
      translate([95, 3, -1]) cylinder(h=4, r=2);
      translate([95, 57, -1]) cylinder(h=4, r=2);
    }
  }
}

module bbs_20x4_lcd_cutouts(height, facets)
{
    union()
    {
      translate([0, 10, 0]) cube([98, 40, height]);
      translate([3, 3, 0]) cylinder(h=height, r=2, $fn=facets);
      translate([3, 57, 0]) cylinder(h=height, r=2, $fn=facets);
      translate([95, 3, 0]) cylinder(h=height, r=2, $fn=facets);
      translate([95, 57, 0]) cylinder(h=height, r=2, $fn=facets);
    }
}

bbs_20x4_lcd();
translate([0, 0, -2]) color("red") bbs_20x4_lcd_cutouts(2, 20);