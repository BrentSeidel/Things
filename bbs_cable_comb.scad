//
//  This defines a comb for storing cables of various sizes.
//
//
//  Cable sizes
//
banana_size = 4;
cat5_size = 5;
//
//  Module for the cable comb.
//    size - the diameter of the cable plus a little extra
//    number - the number of fingers in the comb
//
finger_width = 10;
module bbs_finger()
{
  cube([finger_width, 150, 2]);
  translate([finger_width/2, 150, 0]) cylinder(r=finger_width/2, h=2);
  translate([finger_width/2 + 1, 0, 0]) rotate([0, -90, 0]) linear_extrude(height=2)
    polygon([[0, 0], [0, 150], [20, 0]]);
}

module bbs_cable_comb(size, number)
{
  difference()
  {
    union()
    {
      for(a = [0:(number - 1)])
      {
        x_offset = a*(finger_width + size);
        translate([x_offset, 0, 0]) bbs_finger();
      }
      cube([number*(finger_width + size) - size, 2, 20]);
    }
    union()
    {
      for(a = [1:(number - 1)])
      {
        translate([a*(finger_width + size) - size/2, -0.1, 10]) rotate([-90, 0, 0])
          cylinder(r=1.5, h=3, $fn=12);
      }
    }
  }
}

bbs_cable_comb(banana_size, 10);
