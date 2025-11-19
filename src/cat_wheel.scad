/*
 * Cat Bot Wheels v3.0
 * made by alex (atctwo) in july - oct 2025
 * no idea how well these will work so i guess we'll see!
 * please print in something squishy and grippy (eg: TPU)
 *
 */

wheel_d = 42;                       // overall wheel diameter, including all parts
wheel_h = 18;                       // wheel height (tread thicknes)
hub_ot = 4;                         // thickness of the outer section of the hub
hub_id = 16;                        // diameter of the inner hub
hub_m = 0.1;                        // space between the hub and the tyre
tyre_t = 4;                         // thickness of the outer tyre

n_spokes = 5;                       // number of spokes
spoke_t = 4;                        // thickness of each spoke
spoke_h = 12;                       // height of each spoke
shaft_d = 3.6;                      // shaft diameter
shaft_flat_offset = 2.5/3;          // how much of the shaft should be curved (ie: inverse of how much should be taken up by the flat edge)

split_hub = true;                   // whether to split the hub into a separate square bit
split_hub_size = [7, 7];            // size of the split hub
split_hub_padding = 0.01;           // how much bigger to make the hub hole in the wheel

split_hub_chamfer_angle = 45;
split_hub_chamfer_height = 1;

tooth_h = 15;                       // height of teeth (perpendicular to height of the wheel)
tooth_w = 2;                        // width of the teeth (ie: how much do they extend from the hub)
// tooth_a = 360 * ((-(2*$t) ^ 2) + (4*$t));
tooth_a = 20;                       // tooth arc (ie: how much of a circle sweep does each tooth make)
n_teeth = 5;                        // number of teeth
tooth_thingy_h = 12.9;              // height of the crescent shape removed from the teeth
tooth_thingy_w = 1.5;               // width of the crescent shape removed from the teeth

chevron_w = 4;                      // width of each chevron trench
chevron_d = 1.5;                      // depth of each chevron trench
chevron_a = 120;                    // angle the two parts of each chevron are to each other
n_chevron = 12;                     // number of chevrons across surface of wheel

tyre_edge_trim_h = 1;               // height of the bit around the tyre edges to remove
tyre_edge_trim_d = chevron_d;       // depth of the bit around the tyre edges to remove

hub_d = wheel_d - (hub_m*2) - (tyre_t*2);     // outer diameter of the inner hub
tooth_dz = (wheel_h - tooth_h) / 2;
tooth_thingy_dx = (tooth_w) / 2;
tooth_thingy_dh = (tooth_h - tooth_thingy_h) / 2;

show_tyre = false;                 // whether to show the outer tyre
show_wheel = true;                  // whether to show the inner hub
show_split_hub = false;              // whether to show the axel insert

enable_hub_teeth = true;            // whether to enable teeth on the hub
enable_tyre_teeth = true;           // whether to enable negative teeth in the tyres
enable_chevrons = true;             // whether to show chevrons on the tyres

$fn = 200;

// main wheel
if (show_wheel)
color("#222222") {
    difference() {

        union() {
        // outer bit
        difference() {
            
            // outer cylinder
            cylinder(d=hub_d, h=wheel_h);

            // inner hollow
            translate([0, 0, -0.5])
            cylinder(d=hub_d-(hub_ot*2), h=wheel_h+1);
        }

        // spokes
        for (i=[0:n_spokes]) {
            rotate([0, 0, i*(360/n_spokes)])
            translate([-spoke_t/2, 0, (wheel_h-spoke_h)/2])
            cube([spoke_t, (hub_d/2)-(hub_ot/2), spoke_h]);
        }

        // inner bit
        difference() {
            cylinder(d=hub_id, h=wheel_h);
        }

        // teeth
        if (enable_hub_teeth)
        for (i=[0:n_teeth]) {
            rotate([0, 0, i*(360/n_teeth)])
            cresent_tooth();
        }

    }

        // d-shaft
        if (!split_hub) d_shaft();
        else {
            split_hub_hub(split_hub_padding, 1);
            
            // chamfer on bottom
            translate([0, 0, split_hub_chamfer_height])
            rotate([180, 0, 0]) 
            split_hub_chamfer(split_hub_padding);
            
            // chamfer on top
            translate([0, 0, wheel_h-split_hub_chamfer_height])
            rotate([0, 0, 0]) 
            split_hub_chamfer(split_hub_padding);
        }
    }
}


// split hub
if (show_split_hub)
if (split_hub) {
    difference() {
        split_hub_hub();
        d_shaft();
    }
}



// tyres
if (show_tyre) {
    
    translate([0, 0, 0.0005])
    color("#ffeeee", 0.9)
    difference() {
        
        // outer diameter
        cylinder(d=wheel_d, h=wheel_h-0.001);

        // hole for the hub to go in
        translate([0, 0, -0.5])
        cylinder(d=(wheel_d-(tyre_t*2))-(hub_m*2), h=wheel_h+1);

        // negative teeth
        if (enable_tyre_teeth)
        render() {
            for (i=[0:n_teeth]) {
                rotate([0, 0, i*(360/n_teeth)])
                cresent_tooth();
            }
        }

        // chevrons
        if (enable_chevrons) {
            render() {
                chevrons();
            }
        }

        // edge trim
        difference() {
            union() {
                cylinder(d=wheel_d, h=tyre_edge_trim_h);
                translate([0, 0, wheel_h-tyre_edge_trim_h])
                cylinder(d=wheel_d, h=tyre_edge_trim_h);
            }
            translate([0, 0, -0.5])
            cylinder(d=wheel_d-tyre_edge_trim_d, h=wheel_d+1);
        }
    }
}




module split_hub_hub(padding=0, ph=0) {
    translate([0, 0, (wheel_h/2)])
    cube([split_hub_size.x+padding*2, split_hub_size.y+padding*2, wheel_h+ph], center=true);
}

module split_hub_chamfer(padding=0) {
    chamfer_size = [
        (split_hub_size.x + padding*2) + tan(split_hub_chamfer_angle) * split_hub_chamfer_height,
        (split_hub_size.y + padding*2) + tan(split_hub_chamfer_angle) * split_hub_chamfer_height
    ];

    chamfer_shape(
        (split_hub_size.x+padding*2) / 2, (split_hub_size.y+padding*2) / 2,
        chamfer_size.x / 2, chamfer_size.y / 2, 
        split_hub_chamfer_height
    );
    
}
    
module d_shaft() {
    translate([0, 0, -0.5])
    difference() {
        cylinder(d = shaft_d, h=wheel_h+1);
        translate([-split_hub_size.x/2, -split_hub_size.y/2, 0])
        cube([((split_hub_size.x-shaft_d)/2)+(shaft_d*(1-shaft_flat_offset)), split_hub_size.x, wheel_h+1]);
    }
}

module chamfer_shape(w1, l1, w2, l2, h) {
    polyhedron(
      points=[ 
        [w1,l1,0],[w1,-l1,0],[-w1,-l1,0],[-w1,l1,0], // the four points at base
        [w2,l2,h],[w2,-l2,h],[-w2,-l2,h],[-w2,l2,h]
      ],
      faces = [
        [0,1,2,3],
        [7,4,0,3], [6,7,3,2], [5,6,2,1], [4,5,1,0],
        [4,5,6,7]
      ]);                   // two triangles for square base
    
}

// need to make it smaller at top
// maybe have w_bottom, l_bottom, w_top, l_top
//!chamfer_shape(10, 10, 5, 5, 10);





// sector
// from https://openhome.cc/eGossip/OpenSCAD/SectorArc.html
module sector(radius, angles, fn = 24) {
    r = radius / cos(180 / fn);
    step = -360 / fn;

    points = concat([[0, 0]],
        [for(a = [angles[0] : step : angles[1] - 360]) 
            [r * cos(a), r * sin(a)]
        ],
        [[r * cos(angles[1]), r * sin(angles[1])]]
    );

    difference() {
        circle(radius, $fn = fn);
        polygon(points);
    }
}

module cresent_tooth() {
    rotate([0, 0, 90+(tooth_a/2)])
    translate([0, 0, tooth_dz])
    difference() {

        // extrude into circle
        translate([0, 0, tooth_h/2])
        rotate_extrude(convexity=10) {
            translate([hub_d/2, (-tooth_h/2)+(tooth_w), 0])

            // tube thing base
            difference() {

                // main tube
                hull() {
                    circle(d=tooth_w*2);

                    translate([0, tooth_h-(tooth_w*2), 0])
                    circle(d=tooth_w*2);
                }

                // remove inner part
                translate([-tooth_w-1, -tooth_w, 0])
                square([tooth_w+1, tooth_h]);
            }
        }


        // arc part 1
        // translate([(-hub_d/2)-tooth_w, 0, -0.5])
        // #cube([hub_d+(tooth_w*2), hub_d, tooth_h+1]);

        // arc part 2
        // rotate([0, 0, 180-tooth_a])
        // translate([(-hub_d/2)-tooth_w, 0, -0.5])
        // #cube([hub_d+(tooth_w*2), hub_d, tooth_h+1]);

        // arx
        linear_extrude(h=wheel_h)
        sector(hub_d, [0, 360-tooth_a]);

        // tooth thingy left
        ttdx = (hub_d/2)+tooth_thingy_dx;
        translate([ttdx, 0, (tooth_thingy_w/2)+tooth_thingy_dh])
        union() {
            hull() {
                sphere(d=tooth_thingy_w);
                translate([0, 0, tooth_thingy_h-tooth_thingy_w])
                sphere(d=tooth_thingy_w);
            }
        }

        // tooth thingy right
        translate([ttdx*sin(90+tooth_a), ttdx*cos(90+tooth_a), (tooth_thingy_w/2)+tooth_thingy_dh])
        union() {
            hull() {
                sphere(d=tooth_thingy_w);
                translate([0, 0, tooth_thingy_h-tooth_thingy_w])
                sphere(d=tooth_thingy_w);
            }
        }
    }
}


module chevrons() {
    difference() {
        // chevron shapes
        for (i=[0:n_chevron]) {
            rotate([0, 0, i*(360/n_chevron)])
            {

                // chevron_dalf_w = (((wheel_h + (chevron_w*2))/2) / (cos(90 - (chevron_a/2))));
                chevron_dalf_w = ((wheel_h + (chevron_w*2)) / 2) / (tan(chevron_a/2));
                
                // color("blue")
                // rotate([-chevron_a/2, 0, 0])
                // translate([0, -chevron_w/2, -chevron_w/2])
                // cube([(wheel_d/2)+5, chevron_w, chevron_dalf_w]);

                // color("green")
                // rotate([chevron_a/2, 0, 0])
                // translate([0, -chevron_w/2, -chevron_w/2])
                // cube([(wheel_d/2)+5, chevron_w, chevron_dalf_w]);

                translate([-(chevron_w+chevron_dalf_w)/2, 0, 0])
                rotate([90, 0, 0])
                linear_extrude((wheel_d/2) + 5)
                polygon(points=[
                    [0, wheel_h/2],
                    [chevron_dalf_w, 0],
                    [chevron_w+chevron_dalf_w, 0],
                    [chevron_w, wheel_h/2],
                    [chevron_w+chevron_dalf_w, wheel_h],
                    [chevron_dalf_w, wheel_h],

                ], convexity=10);

            }
        }

        // remove the middle
        translate([0, 0, -0.5])
        cylinder(h=wheel_h+1, d=wheel_d-chevron_d);
    }
}