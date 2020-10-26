//-------------------------------------------------------------------------------------
// Model for a SPDT switch from AdaFruit (Product ID 3221)
//
// The switch module can be used for checking for interferance.
// The cutout module is to be used for making a hole for mounting the switch in a panel.
//
// This file will grow to include other switches, pots, and similar user interface items.
//
module bbs_spdt_switch()
{
    translate([-13/2, -7.88/2, -9.56]) difference()
    {
        union()
        {
            cube([13, 7.88, 9.56]);
            translate([1.59, 2.17, -3.75]) cube([0.73, 7.88-2.17*2, 3.75]);
            translate([6.5, 2.17, -3.75]) cube([0.73, 7.88-2.17*2, 3.75]);
            translate([11.09, 2.17, -3.75]) cube([0.73, 7.88-2.17*2, 3.75]);
            translate([13/2, 7.88/2, 9.56]) cylinder(h=8.79, r=5.72/2);
            translate([13/2, 7.88/2, 9.56 + 1]) cylinder(h=0.65, r=11.97/2);
            translate([13/2, 7.88/2, 9.56+8.79]) cylinder(h=9.86, r=2.95/2);
        }
        union()
        {
            translate([13.2/2-5.72/2, 7.88/2-0.55/2, 9.56]) cube([0.1, .55, 8.79]);
        }
    }
}

module bbs_spdt_switch_cutout(height)
{
    difference()
    {
        translate([0, 0, -1.0]) cylinder(h=height + 1, r=5.75/2 + 0.1, $fn=20);
        translate([-5.75/2 - 0.2, -0.55/2, -2.0]) cube([0.3, 0.55/2, height + 4]);
    }
}

//-------------------------------------------------------------------------------------
// Model for an 8-way rotary switch AdaFruit (Product ID 2925)
// Connectors are not included in the model, but extend 4.32mm from the base.
//
module bbs_sp8t_switch()
{
    union()
    {
        cylinder(r=8.82/2, h=7.34);
        cylinder(r=5.85/2, h=15.53);
        translate([0, 0, -9.26]) cylinder(r=15.94/2, h=9.26);
        translate([15.94/2 - 1.05, -1, 0]) cube([1.05, 2, 1.8]);
    }
}
//
// The cutout is a little unusual as it also includes a cutout for a tab
// to keep the switch from rotating.  It's size will probably need to be
// adjusted so that it will fit.  Also, logic could be added to limit
// its height to that of the actual tab, about 1.8mm.
//
module bbs_sp8t_switch_cutout(height)
{
    union()
    {
        cylinder(r=9.02/2, h=height);
        translate([15.94/2 - 1.05, -1, 0]) cube([1.05, 2, height]);
    }
}

//-------------------------------------------------------------------------------------
// Model for 16mm push button switch AdaFruit (Product ID 1442) and probably all other 16mm
// switches.
// Connectors are not included in the model, but extend 5.56mm from the base.
//
module bbs_16mm_switch()
{
    translate([0, 0, -18.45]) cylinder(r=8, h=18.45);
    translate([-9, -9, 0]) cube([18, 18, 2.18]);
    cylinder(r=7.5, h=5.79);
}

module bbs_16mm_switch_cutout(height)
{
//    cylinder(r=8.1, h=height, $fn=20);
    radius=8.2;
    width=15.2;
    intersection()
    {
        cylinder(r=radius, h=height, $fn=20);
        translate([-radius, -width/2, 0]) cube([radius*2, width, height]);
    }
}

//-------------------------------------------------------------------------------------
//  Model for 10k potentiometers.  It will probably work for other pots as well.  However,
//  I ordered some more 10k pots and they were a different size, so this has been renamed to
//  bbs_pot1() and the new pots will be bbs_pot2().
//
module bbs_pot1()
{
    cylinder(r=6.7/2, h=15.35);
    translate([0, 0, -9.06]) cylinder(r=16.42/2, h=9.06);
    translate([4.1+6.7/2, -2.46/2, 0]) cube([1.24, 2.46, 2.31]);
}

module bbs_pot1_cutout(height)
{
    cylinder(r=6.7/2 + 0.2, h=height);
    translate([4.1-0.1+6.7/2, -2.46/2-0.1, 0]) cube([1.24+0.2, 2.46+0.2, height]);
}
module bbs_pot2()
{
    cylinder(r=7.74/2, h=15.35);
    translate([0, 0, -11.28]) cylinder(r=24.0/2, h=11.28);
    translate([-20.17/2, 0, -2.11]) cube([20.17, 17.62+7.74/2, 2.11]);
    translate([7.11+7.74/2, -2.71/2, 0]) cube([1.17, 2.71, 2.31]);
}

module bbs_pot2_cutout(height)
{
    cylinder(r=7.47/2 + 0.2, h=height);
    translate([7.11-0.1+7.74/2, -2.71/2-0.1, 0]) cube([1.17+0.2, 2.71+0.2, height]);
}

module bbs_pot2_knob()
{
  difference()
  {
    union()
    {
      difference()
      {
        minkowski()
        {
          cylinder(r=5, h=15);
          sphere(r=5);
        }
        translate([0, 0, -5]) cylinder(r=20, h=5);
      }
      translate([-1, 0, 0]) cube([2, 12, 22]);
    }
    union()
    {
      translate([0, 0, -1]) cylinder(r1=6.2/2, r2=5.8/2, h=14);
      translate([0, 0, -1]) difference()
      {
        cylinder(r=8, h=14);
        cylinder(r=6, h=14);
      }
    }
  }
}

//-------------------------------------------------------------------------------------
bbs_spdt_switch();
translate([0, 20, 0]) bbs_sp8t_switch();

translate([15, 0, 0]) bbs_spdt_switch_cutout(2);
translate([15, 20, 0]) bbs_sp8t_switch_cutout(2);

translate([30, 0, 0]) bbs_16mm_switch();
translate([30, 20, 0]) bbs_16mm_switch_cutout(2);

translate([60, 0, 0]) bbs_pot1();
translate([60, 20, 0]) bbs_pot1_cutout(2);

translate([90, -20, 0]) bbs_pot2();
translate([90, 20, 0]) bbs_pot2_cutout(2);
translate([90, -60, 0]) bbs_pot2_knob();

