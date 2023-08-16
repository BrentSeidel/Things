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

//--------------------------------------------------------------------------------------
//  Model for SMD resistors
//  The following sizes are supported 0201, 0402, 0603, 0805, 1206, 1210, 1812, 2010, 2512.
//  Specify the size as a string.
module bbs_SMD_resistor(size)
{
  sizes = [
  ["0201", 0.60, 0.30, 0.25],
  ["0402", 1.00, 0.50, 0.35],
  ["0603", 1.55, 0.85, 0.45],
  ["0805", 2.00, 1.20, 0.45],
  ["1206", 3.20, 1.60, 0.55],
  ["1210", 3.20, 2.50, 0.55],
  ["1812", 3.20, 4.60, 0.55],
  ["2010", 5.00, 2.50, 0.60],
  ["2512", 6.30, 3.20, 0.60]];
  index = search([size], sizes, 1, 0);
  if (size == sizes[index[0]][0])
  {
    entry = sizes[index[0]];
    color("silver") cube([0.05, entry[2], entry[3]]);
    color("silver") translate([entry[1]-0.05, 0, 0]) cube([0.05, entry[2], entry[3]]);
    color("black") translate([0.05, 0, 0]) cube([entry[1]-0.1, entry[2], entry[3]]);
  }
  else
  {
    echo(str("ERROR: SMD Resistor size ", size, " not found"));
    color("red") cube([10, 10, 10]);
  }
}

translate([0, 20, 0]) bbs_SMD_resistor("1206");
translate([0, 30, 0]) bbs_SMD_resistor("1234");

bbs_DIP(28, 0.3);
