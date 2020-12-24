//
//  Models for stepper motors
//
use <bbs_constants.scad>
use <../pd-gears/pd-gears.scad>


//--------------------------------------------------------------------------------------
// Model for a NEMA 17 mounting plate.  These are just the cutouts for the shaft and
// screw holes.
//
module bbs_NEMA17_holes(height, countersink=false)
{
  cylinder(r=11.2, h=height);
  translate([ 15.5,  15.5, 0]) cylinder(r=screw_m3_size()/2, h=height, $fn=12);
  translate([ 15.5, -15.5, 0]) cylinder(r=screw_m3_size()/2, h=height, $fn=12);
  translate([-15.5,  15.5, 0]) cylinder(r=screw_m3_size()/2, h=height, $fn=12);
  translate([-15.5, -15.5, 0]) cylinder(r=screw_m3_size()/2, h=height, $fn=12);
  if(countersink)
  {
    translate([ 15.5,  15.5, height/2]) cylinder(r=3.5, h=height, $fn=12);
    translate([ 15.5, -15.5, height/2]) cylinder(r=3.5, h=height, $fn=12);
    translate([-15.5,  15.5, height/2]) cylinder(r=3.5, h=height, $fn=12);
    translate([-15.5, -15.5, height/2]) cylinder(r=3.5, h=height, $fn=12);
  }
}

module bbs_NEMA17_dshaft(height)
{
  difference()
  {
    cylinder(r=2.56, h=height, $fn=15);
    translate([2.5-(5-4.4), -3, -height/2]) cube([3, 6, 2*height]);
  }
}

//difference()
//{
//  translate([-20, -20, 0]) cube([40, 40, 4]);
//  translate([0, 0, -0.5]) bbs_NEMA17_holes(5, true);
//}

