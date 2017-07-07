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
      translate([4, 4, -1]) cylinder(h=4, r=2);
      translate([4, 56, -1]) cylinder(h=4, r=2);
      translate([94, 4, -1]) cylinder(h=4, r=2);
      translate([94, 56, -1]) cylinder(h=4, r=2);
    }
  }
}

module bbs_20x4_lcd_cutouts(height, facets)
{
    union()
    {
      translate([0, 10, 0]) cube([98, 40, height]);
      translate([4, 4, 0]) cylinder(h=height, r=2, $fn=facets);
      translate([4, 56, 0]) cylinder(h=height, r=2, $fn=facets);
      translate([94, 4, 0]) cylinder(h=height, r=2, $fn=facets);
      translate([94, 56, 0]) cylinder(h=height, r=2, $fn=facets);
    }
}

bbs_20x4_lcd();
translate([0, 0, -2]) color("red") bbs_20x4_lcd_cutouts(2, 20);