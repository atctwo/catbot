// Bracket for micro metal gearbox motors
// Based off https://shop.pimoroni.com/products/pimoroni-gearmotor-bracket-pair?variant=23686314439

use <MCAD/boxes.scad>

w = 24;        // x axis length of the inside bit; the motors are actually 25mm long
srs = [[0, 1], [4.9, 1], [8.1, 1]]; // sections of smaller radius (pairs of 2-vectors where [0] is the x offset and [1] is the length)
// srs = [[0, 1.2], [4.3, 1.2], [7.6, 1.2]]; // sections of smaller radius (pairs of 2-vectors where [0] is the x offset and [1] is the length)
d = 12;         // y axis length of the inside's
h = 10;         // z axis height of the inside
t = 3;          // thickness of the bracket
ro = 1.5;       // outer radius of the bracket
ri = 2.5;      // inner radius of the inside
ris = 0.5;      // inner radius of the parts of the inside in reduced radius regions (as per hrs)
fw = w;     // x axis width of the flanges
fd = 8;         // y axis length of the flanges
fh = t;         // z axis thickness of the flanges
fhd = 3.5;      // diameter of the holes in the flange
fr = 1.5;       // radius of the flanges' corners
fn = 2;         // number of holes
fhm = 0.6;      // how much of the flange should the holes take up
$fn = 100;      // curve resolution

module micro_metal_bracket() {

    echo("Hole distance on x axis is", fw*fhm);
    echo("Hole distance on y axis is", (d+(t*2))+fhd)
    echo("Bracket width is", w)
    echo("Bracket depth is", d+(2*t)+(2*fd))
    echo("Bracket height is", h+(t*2))

    // bracket
    translate([0, 0, -(h)])
    difference() {

        // outer
        roundedCube([w, d+(2*t), (2*h)+t], ro);

        // first inner
        translate([0, t, 2*h])
        rotate([0, 90, 0])
        roundedCube([2*h, d, w], ri, sidesonly=true);

        // smaller radius
        for (sr=srs) {
            translate([sr[0], t, 2*h])
            rotate([0, 90, 0])
            roundedCube([2*h, d, sr[1]], ris, sidesonly=true);
        }

        // half
        translate([-0.5, -0.5, 0])
        cube([w+1, (d+(2*t))+1, h]);
    }

    // flanges
    module flange(hi) {
        difference() {

            // flange
            union() {
                roundedCube([fw, fd+t, fh], fr, sidesonly=true);
                translate([0, (fd/2) * hi, 0]) cube([fw, (fd/2)+t, fh]);
            }

            // holes
            hw = fw*fhm;
            s = hw/(fn-1);

            for (i = [0:fn-1]) {
                xo = (fw/2)-(hw/2)+(s*i);
                yo = (fd/2) + (t*(1-hi)); //(fd/2)+((fd/2)*(1-hi));
                echo("hole offset", i, "x=", xo, "y=", yo);
                translate([xo, yo, -0.5])
                cylinder(h=fh+1, d=fhd);
            }
        }
    }

    translate([0, -fd, 0]) flange(1);
    translate([0, d+t, 0]) flange(0);
}

micro_metal_bracket();

color("silver")
rotate([0, 0, 90])
translate([t, -9, 10])
import("imports/N20 v2.stl");