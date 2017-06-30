//
// This is a catalogu of shapes that are used in other structures.  Each shape is
// parameterized to make them more flexible.
//
//===================================
// Triangular prism type 1.  This takes the form of an isosolese right triangle.
// The triangle is oriented with the hypotonuse in the y direction.  Extrusion is in the
// z direction.  Origin is at one end of the hypotonuse.
//
// Parameters
// s - size of triangle (length of hypotonuse)
// l - length of prism
//
module bbs_prism1(s, l)
{
    linear_extrude(height=l) polygon([[0, 0], [0, s], [s/2, s/2]]);
}
//
//===================================
// Triangular prism type 2.  This takes the form of an isosolese right triangle.
// The triangle is oriented with the right angle at the origin.  Extrusion is in the
// z direction.
//
// Parameters
// s - size of triangle (length of sides)
// l - length of prism
//
module bbs_prism2(s, l)
{
    linear_extrude(height=l) polygon([[0, 0], [0, s], [s, 0]]);
}
//
//===================================
// Fillet.  This is a square with a circle removed from it.  The circle
// has a radius equal to the square's sides and is positioned at one of the corners.  The
// length is in the z  direction.
//
// Parameters
// s - size of fillet
// l - length of extrusion
//
module bbs_fillet(s, l)
{
    difference()
    {
        cube([s, s, l]);
        translate([s, s, -0.1]) cylinder(r=s, h=l+0.2);
    }
}
//
//===================================
// Spacer.  This is a cylinder with a cylinder removed from the center of it.  It
// would typically be used to around a bolt to add some space like a standoff or
// as a washer.
//
// Parameters
// od - outside diameter
// id - inside diameter
// height - height
//
module bbs_spacer(od, id, height)
{
    difference()
    {
        cylinder(r=od/2, h=height);
        translate([0, 0, -0.1]) cylinder(r=id/2, h=height + 0.2);
    }
}
//
// Examples
//
//bbs_prism1(3, 5);
//translate([0, 7, 0]) bbs_prism2(3, 5);
//translate([7, 0, 0]) bbs_fillet(3, 5);
bbs_spacer(23, 10, 16);
