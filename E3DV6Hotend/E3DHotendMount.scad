include <C:/Users/gfellows/OneDrive - Eastside Preparatory School/Documents/GitHub/NopSCADlib/lib.scad>
include <C:/Users/gfellows/OneDrive - Eastside Preparatory School/Documents/GitHub/NopSCADlib/vitamins/e3d.scad>

linearShaftDiameter = 8;
linearShaftSpacing = 45;

printedColor = [0.9,0.1,0.2];

module linearShaft(){
    color(silver){
        cylinder(d=linearShaftDiameter,h=600, center = true);
    }
}

module posBearing1(){
    translate([0,0,linearShaftSpacing/2]){
        rotate([0,90,0]){
            children();
        }
    }
}

module posBearing2(){
    translate([0,0,-linearShaftSpacing/2]){
        rotate([0,90,0]){
            children();
        }
    }
}


posBearing1(){
    linear_bearing(LM8LUU);
    linearShaft();
}

posBearing2(){
    linear_bearing(LM8UU);
    linearShaft();
}

module hotEnd(){
translate([0,27,14]) e3d_hot_end_assembly(E3Dv6, 3, naked = false, resistor_wire_rotate = [-15,0,0]);
}

module chainHull(){
    for (i = [0: $children-2])
        hull(){
            children(i);
            children(i+1);
        }
}


module hotendHolderBracket(){
        difference(){
            translate([0,35,-5]){
                cylinder(d=25,h=13);
            }
            translate([-60,20,-10]) cube([200,15,100]);
            hotEnd();
            translate([0,35,-10]) cylinder(d=10,h=100);
            translate([10,50,1]) rotate([90,0,0]) cylinder(d=3,h=100);
            translate([-10,50,1]) rotate([90,0,0]) cylinder(d=3,h=100);
            translate([10,50,1]) rotate([90,0,0]) cylinder(d=6,h=10);
            translate([-10,50,1]) rotate([90,0,0]) cylinder(d=6,h=10);
        }

    }



module explode(distance = [10, 0, 0], center = false, enable = true) {
    if(enable){
        offset = center ? (($children * distance) / 2 - distance / 2) * -1 : [0, 0 , 0];
        for(i = [0 : 1 : $children - 1]) {
            translate(i * distance + offset) {
                children(i);
            }
        }
    } else {
        children();
    }
}


translate([0,10,53])rotate([-90,0,0])NEMA(NEMA17, shaft_angle = 0);

translate([-45/2,-20,-25]) rotate([90,0,0]) blower(RB5015);

//hotendHolderBracket();
hotEnd();



