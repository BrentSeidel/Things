//
// This is a collection of connector cutouts for panels.
//

//--------------------------------------------------------------------------------------
// Dimensions for D-Sub connectors from http://www.interfacebus.com/Connector_D-Sub_Mechanical_Dimensions.html
// Since the cutouts are intended for either gender connector and since 3-D printer holes tend to be a little
// smaller than specified, the maximum tolerance sizes are used.  These may be tweaked if they turn out to
// still be a little too small.
//
// The coordinate origin is at the center of the connector.
//
// The dimensions of interest are:
// C - Distance between mounting holes.  The connector is assumed to be centered between them
// H - Horizontal size of cutout
// J - Vertical size of cutout
//
// Other dimensions that don't depend on the specific connector:
// Corner radius - 0.062 inches
// Screw hole size - 0.125 inches
//
// Dimension table
// Size   C      H      J
//   1  24.87  19.53  10.97
//   2  33.45  27.76  10.97
//   3  47.17  41.53  10.97
//   4  63.63  57.96  10.97
//   5  61.24  55.58  13.82
//   6  63.63  58.72  15.39
//
// Pins per connector
// Size  Standard  Dense
//    1     9        15
//    2    15        26
//    3    25        44
//    4    37        62
//    5    50        78
//    6   104       n/a
//
module bbs_d_cutout(size, height)
{
    if ((size < 1) || (size > 6))
    {
        echo("bbs_connectors.scad Invalid size given for D-sub connector ", size);
//        assert(false); // Assert may not be supported yet
    }
    screw_rad = 0.125 * 25.4/2;
    corner_rad = 0.063 * 25.4;
    c_sizes = [24.87, 33.45, 47.17, 63.63, 61.24, 63.63];
    h_sizes = [19.53, 27.76, 41.53, 57.96, 55.59, 58.72];
    j_sizes = [10.97, 10.97, 10.97, 10.97, 13.82, 15.39];
    size_c = c_sizes[size - 1];
    size_h = h_sizes[size - 1] + 1.0;
    size_j = j_sizes[size - 1] + 1.0;
    union()
    {
        translate([-size_c/2, 0, 0]) cylinder(r = screw_rad, h = height, $fn=20);
        translate([size_c/2, 0, 0]) cylinder(r = screw_rad, h = height, $fn=20);
        minkowski()
        {
            linear_extrude(height = height/2)
                polygon(points=[[-size_h/2+corner_rad, -size_j/2+corner_rad],
                    [size_h/2-corner_rad, -size_j/2+corner_rad], 
                    [size_h/2-corner_rad-sin(10)*size_j, size_j/2-corner_rad],
                    [-size_h/2+corner_rad+sin(10)*size_j, size_j/2-corner_rad]]);
            cylinder(r=corner_rad, h=height/2, $fn=20);
        }
    }
}

//--------------------------------------------------------------------------------------
//  These are like bannana connectors, but are a smaller diameter.  I have a bag of them
// from some unknown source.  I did find them at Digi-Key - search for tip connectors.
// As with most things at Digi-Key, there is a bewildering variaty of them and you will
// need to narrow down just what you need.  These are also cheaper than bannana connectors,
// which is probably why I have a bag of them.
//
module bbs_tip_connector()
{
    union()
    {
        cylinder(r=9.41/2, h=4.8);
        translate([0, 0, -14.19]) cylinder(r=6.22/2, h=14.19);
        translate([0, 0, -21.83]) cylinder(r=2.35/2, h=21.83);
    }
}

module bbs_tip_connector_cutout(height)
{
    intersection()
    {
        cylinder(r=6.32/2, h=height, $fn=20);
        translate([-6.32/2, -5.4/2, 0]) cube([6.32, 5.4, height]);
    }
}

//--------------------------------------------------------------------------------------
bbs_d_cutout(1, 2);
translate([0, 15, 0]) bbs_tip_connector_cutout(2);
translate([10, 15, 0]) bbs_tip_connector();
