//
//  This defines a comb for storing cables of various sizes.
//
//
//  Cable sizes
//
banana_size = 4;
cat5_size = 6;
//
//  Module for the cable comb.
//    size - the diameter of the cable plus a little extra
//    number - the number of fingers in the comb
//
finger_width = 15;
finger_length = 100;
module bbs_finger(width, length, height)
{
  cube([width, length, 2]);
  translate([width/2, finger_length, 0]) cylinder(r=width/2, h=2);
  translate([width/2 + 1, 0, 0]) rotate([0, -90, 0]) linear_extrude(height=2)
    polygon([[0, 0], [0, length], [height, 0]]);
}

module bbs_cable_comb(size, number)
{
  height = 20;
  difference()
  {
    union()
    {
      for(a = [0:(number - 1)])
      {
        x_offset = a*(finger_width + size);
        translate([x_offset, 0, 0]) bbs_finger(finger_width, finger_length, height);
      }
      cube([number*(finger_width + size) - size, 2, height]);
    }
    union()
    {
      for(a = [1:(number - 1)])
      {
        translate([a*(finger_width + size) - size/2, -0.1, height/2]) rotate([-90, 0, 0])
          cylinder(r=1.5, h=3, $fn=12);
      }
    }
  }
}

bbs_cable_comb(cat5_size, 10);
