/*
 * Cat Bot Wheels
 * made by alex (atctwo) in july 2025
 * no idea how well these will work so i guess we'll see!
 * please print in something squishy and grippy (eg: TPU)
 *
 */

coating_t = 3;                      // coating thickness
wheel_d = 42 - (coating_t * 2);     // wheel diameter
wheel_h = 18;                       // wheel height (tread thicknes)
wheel_ot = 4;                     // thickness of the outer section
wheel_id = 16;                      // diameter of the inner hub
n_spokes = 5;                       // number of spokes
spoke_t = 4;                      // thickness of each spoke
spoke_h = 12;                       // height of each spoke
shaft_d = 3;                        // shaft diameter
shaft_flat_offset = 0.75;           // how much of the shaft should be curved (ie: inverse of how much should be taken up by the flat edge)

split_hub = true;                   // whether to split the hub into a separate square bit
split_hub_size = [7, 7];            // size of the split hub
split_hub_padding = 0.01;            // how much bigger to make the hub hole in the wheel

split_hub_chamfer_angle = 45;
split_hub_chamfer_height = 1;

show_wheel = false;
show_split_hub = true;

$fn = 200;

// main wheel
if (show_wheel)
color("#222222") {
    difference() {

        union() {
        // outer bit
        difference() {
            
            // outer cylinder
            cylinder(d=wheel_d, h=wheel_h);

            // inner hollow
            translate([0, 0, -0.5])
            cylinder(d=wheel_d-(wheel_ot*2), h=wheel_h+1);
        }

        // spokes
        for (i=[0:n_spokes]) {
            rotate([0, 0, i*(360/n_spokes)])
            translate([-spoke_t/2, 0, (wheel_h-spoke_h)/2])
            cube([spoke_t, (wheel_d/2)-(wheel_ot/2), spoke_h]);
        }

        // inner bit
        difference() {
            cylinder(d=wheel_id, h=wheel_h);
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
        translate([shaft_flat_offset, -(shaft_d/2), 0])
        cube([1.5, 3, wheel_h+1]);
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

