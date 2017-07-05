//
// Model for a SPDT switch from AdaFruit (Product ID 3221)
//
// The switch module can be used for checking for interferance.
// The cutout module is to be used for making a hole for mounting the switch in a panel.
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

//bbs_spdt_switch();
bbs_spdt_switch_cutout(2);