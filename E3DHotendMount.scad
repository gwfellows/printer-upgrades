include <C:/Users/gfellows/OneDrive - Eastside Preparatory School/Documents/GitHub/NopSCADlib/lib.scad>
include <C:/Users/gfellows/OneDrive - Eastside Preparatory School/Documents/GitHub/NopSCADlib/vitamins/e3d.scad>

linearShaftDiameter = 8;
linearShaftSpacing = 50;

module linearShaft(){
    color(silver){
        rotate([0,90,0]){
            cylinder(d=linearShaftDiameter,h=600, center = true);
        }
    }
}

translate([0,0,linearShaftSpacing/2]){
    rotate([0,90,0]) linear_bearing(LM8LUU);
    linearShaft();
}

translate([0,0,-linearShaftSpacing/2]){
    rotate([0,90,0]) linear_bearing(LM8LUU);
    linearShaft();
}

translate([0,30,3]) e3d_hot_end_assembly(E3Dv6, 3, naked = false, resistor_wire_rotate = [0,0,0]);