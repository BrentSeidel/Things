//
// A pin header with 0.1 inch spacing
//
pitch = 2.54;

module bbs_header(pins)
{
    for (i = [1 : pins])
    {
        translate([(i-1)*pitch, 0, -9]) cylinder(h=11.57, r=0.5);
        translate([(i-1)*pitch, 0, -9 + 5.93]) cylinder(h=2.27, r=1.5);
    }
}

bbs_header(10);
