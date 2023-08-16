//
// Models for various electronic components
//

//--------------------------------------------------------------------------------------
//  Models for various DIPs.
//
//  A single 2-pin DIP module.  The complete DIP is a collection of these strung together.
//  Note that the width is in mm.
module bbs_DIP_temp(width)
{
  translate([0, 0, 0]) color("silver") cube([0.5, 0.25, 3.3]);
  translate([-0.45, 0, 3.3]) color("silver") cube([1.4, 0.25, 3.5/2]);
  translate([0, width-0.25, 0]) color("silver") cube([0.5, 0.25, 3.3]);
  translate([-0.45, width-0.25, 3.3]) color("silver") cube([1.4, 0.25, 3.5/2]);
  translate([-1.02, 0.25, 3.3]) color("black") cube([2.54, width-0.5, 3.5]);
}
//
//  Module for a standard DIP package.
//  Note that the width is in inches.  Expected values are 0.3 and 0.6.
module bbs_DIP(pins, width)
{
  difference()
  {
    for(a = [0:(pins/2)-1])
    {
      translate([a*2.54, 0, -3]) bbs_DIP_temp(width*25.4);
    }
    translate([-2.54/2, (width*25.4)/2, 3]) cylinder(h=10, r=1.5, $fn=12);
  }
}

bbs_DIP(28, 0.3);
