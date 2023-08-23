//
//  I picked up some analog panel meters.  There are two different sizes.  This file
//  provides models and panel cutouts for both sizes.
//
//
//  This is the smaller sized meter.  The meter model can be used to give an idea of conflicts
//  with other objects.  The cutout model is used to make holes in a panel for mounting the
//  meter.
//
module bbs_meter_1()
{
  width = 64.28;
  height = 56.24;
  screw = 2.75/2;
  translate([-width/2, -height/2, -10.55]) cube([width, height, 10.55]);
  translate([0, 1.98-(height-47.85)/2, 0]) cylinder(r=47.85/2, h=3.02);
  translate([0, 1.98-(height-25.06)/2, 0]) scale([38.02/25.06, 1, 1])cylinder(r=25.06/2, h=37.12 + 8.23);
  translate([(width/2 - 4.5 - screw), -(height/2 - 12.76 - screw), 0]) cylinder(r=screw, h=9.45, $fn=12);
  translate([-(width/2 - 4.5 - screw), -(height/2 - 12.76 - screw), 0]) cylinder(r=screw, h=9.45, $fn=12);
}

module bbs_meter_1_cutout(depth)
{
  width = 64.28;
  height = 56.24;
  screw = 3.75/2;
  translate([0, 1.98-(height-47.85)/2, -0.1]) cylinder(r=47.85/2, h=depth);
  translate([(width/2 - 4.5 - screw), -(height/2 - 12.76 - screw), -0.1]) cylinder(r=screw, h=depth, $fn=12);
  translate([-(width/2 - 4.5 - screw), -(height/2 - 12.76 - screw), -0.1]) cylinder(r=screw, h=depth, $fn=12);
}
//
//  This is the larger sized meter.  The meter model can be used to give an idea of conflicts
//  with other objects.  The cutout model is used to make holes in a panel for mounting the
//  meter.
//
module bbs_meter_2()
{
  width = 99.81;
  height = 79.35;
  screw = 4/2;
  translate([-width/2, -height/2, -10.55]) cube([width, height, 10.55]);
  translate([0, 2.66-(height-57.75)/2, 0]) cylinder(r=57.75/2, h=3.02);
  translate([0, 8.10-(height-25.06)/2, 0]) scale([39.40/25.06, 1, 1])cylinder(r=25.06/2, h=37.12 + 8.23);
  translate([(width/2 - 12.5 - screw), -(height/2 - 16.23 - screw), 0]) cylinder(r=screw, h=9.45, $fn=12);
  translate([-(width/2 - 12.5 - screw), -(height/2 - 16.23 - screw), 0]) cylinder(r=screw, h=9.45, $fn=12);
}

module bbs_meter_2_cutout(depth)
{
  width = 99.81;
  height = 79.35;
  screw = 5/2;
  translate([0, 2.66-(height-57.75)/2, -0.1]) cylinder(r=57.75/2, h=depth);
  translate([(width/2 - 12.5 - screw), -(height/2 - 16.23 - screw), -0.1]) cylinder(r=screw, h=depth, $fn=12);
  translate([-(width/2 - 12.5 - screw), -(height/2 - 16.23 - screw), -0.1])
    cylinder(r=screw, h=depth, $fn=12);
}

module test()
{
  difference()
  {
    translate([-40, -30, 0]) cube([80, 160, 2]);
    union()
    {
      translate([0, 0, -0.1]) bbs_meter_1_cutout(3);
      translate([0, 100, -0.1]) bbs_meter_2_cutout(3);
    }
  }
}

test();

//bbs_meter_2();
