//
// Models for T-Slotted aluminum extrusion parts from 80-20.
//
// Note that the pattern for the extrusions are approximate.  The envelope is the
// the correct size and the T-slots are correctly places, but the T-slot profile
// is just to give an idea of the location.  Should more accuracy be needed, it
// can be improved.
//

module T_20_slot(height)
{
    translate([0, 0, -0.01]) linear_extrude(height=height + 0.02)
    polygon(points=[[0, -0.01], [0, 1.5], [-3.36, 1.5], [-3.36, 2.9], [0, 6.2],
        [5.26, 6.2], [5.26+3.36, 2.9], [5.26+3.36, 1.5], [5.26, 1.5], [5.26, -0.01]]);
}


module T_20_2020(height)
{
    echo("Part 20-2020 with length ", height);
    difference()
    {
        union()
        {
            cube([20, 20, height]);
        }
        union()
        {
            translate([7.37, 0, 0]) T_20_slot(height);
            translate([7.37, 20, 0]) scale([1, -1, 1]) T_20_slot(height);
            translate([0, 7.37+5.25, 0]) rotate([0, 0, -90]) T_20_slot(height);
            translate([20, 7.37+5.25, 0]) rotate([0, 0, -90]) scale([1, -1, 1]) T_20_slot(height);
            translate([10, 10, -0.01]) cylinder(r1=2.5, r2=2.5, h=height+0.02);
        }
    }
}


module T_20_2040(height)
{
    echo("Part 20-2040 with length ", height);
    difference()
    {
        union()
        {
            cube([20, 40, height]);
        }
        union()
        {
            translate([7.37, 0, 0]) T_20_slot(height);
            translate([7.37, 40, 0]) scale([1, -1, 1]) T_20_slot(height);
            translate([0, 7.37+5.25, 0]) rotate([0, 0, -90]) T_20_slot(height);
            translate([0, 27.37+5.25, 0]) rotate([0, 0, -90]) T_20_slot(height);
            translate([20, 7.37+5.25, 0]) rotate([0, 0, -90]) scale([1, -1, 1]) T_20_slot(height);
            translate([20, 27.37+5.25, 0]) rotate([0, 0, -90]) scale([1, -1, 1]) T_20_slot(height);
        }
    }
}

module T_20_4040(height)
{
    echo("Part 20-4040 with length ", height);
    difference()
    {
        union()
        {
            cube([40, 40, height]);
//            translate([20, 20, 10.01]) cylinder(r1=10, r2=10, height=height+0.02);
        }
        union()
        {
            translate([7.37, 0, 0]) T_20_slot(height);
            translate([27.37, 0, 0]) T_20_slot(height);
            translate([7.37, 40, 0]) scale([1, -1, 1]) T_20_slot(height);
            translate([27.37, 40, 0]) scale([1, -1, 1]) T_20_slot(height);
            translate([0, 7.37+5.25, 0]) rotate([0, 0, -90]) T_20_slot(height);
            translate([0, 27.37+5.25, 0]) rotate([0, 0, -90]) T_20_slot(height);
            translate([40, 7.37+5.25, 0]) rotate([0, 0, -90]) scale([1, -1, 1]) T_20_slot(height);
            translate([40, 27.37+5.25, 0]) rotate([0, 0, -90]) scale([1, -1, 1]) T_20_slot(height);
            translate([20, 20, -0.01]) cylinder(r1=14, r2=14, h=height+0.02);
        }
    }
}

//
// Connecting plates.
//
module T_20_4165()
{
    hole = 5.56/2;
    difference()
    {
        cube([80, 40, 4]);
        union()
        {
            translate([10, 10, -0.1]) cylinder(r=hole, h=4.5);
            translate([30, 10, -0.1]) cylinder(r=hole, h=4.5);
            translate([50, 10, -0.1]) cylinder(r=hole, h=4.5);
            translate([70, 10, -0.1]) cylinder(r=hole, h=4.5);
            translate([10, 30, -0.1]) cylinder(r=hole, h=4.5);
            translate([30, 30, -0.1]) cylinder(r=hole, h=4.5);
            translate([50, 30, -0.1]) cylinder(r=hole, h=4.5);
            translate([70, 30, -0.1]) cylinder(r=hole, h=4.5);
        }
    }
}

module T_20_4113()
{
    hole = 5.56/2;
    difference()
    {
        union()
        {
            translate([0, 1, 0]) cube([20, 38,  3]);
            translate([0, 1, 0]) cube([ 3, 38, 20]);
        }
        union()
        {
            translate([10, 10, -0.1]) cylinder(r=hole, h=3.5);
            translate([10, 30, -0.1]) cylinder(r=hole, h=3.5);
            translate([-0.1, 10, 10]) rotate([0, 90, 0]) cylinder(r=hole, h=3.5);
            translate([-0.1, 30, 10]) rotate([0, 90, 0]) cylinder(r=hole, h=3.5);
        }
    }
}

module T_20_4119()
{
    hole = 5.56/2;
    difference()
    {
        union()
        {
            translate([0, 1, 0]) cube([20, 18,  3]);
            translate([0, 1, 0]) cube([ 3, 18, 20]);
        }
        union()
        {
            translate([10, 10, -0.1]) cylinder(r=hole, h=3.5);
            translate([-0.1, 10, 10]) rotate([0, 90, 0]) cylinder(r=hole, h=3.5);
        }
    }
}

T_20_2020(10);
translate([30, 0, 0]) T_20_4040(10);
