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

module posFanHole1(){
    translate([blower_exit(RB5015)/2,15/2+3,5]){
        rotate([90,0,180]){
            translate([4.3, 45.4]){
                children();
            }
        }
    }
}

module posFanHole2(){
    translate([blower_exit(RB5015)/2,15/2+3,5]){
        rotate([90,0,180]){
            translate([47.3,7.4]){
                children();
            }
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

translate([0,35,4]) e3d_hot_end_assembly(E3Dv6, 3, naked = false, resistor_wire_rotate = [-15,0,0]);

translate([blower_exit(RB5015)/2,15/2+3,5]){
    //fan(fan50x15);
    rotate([90,0,180]){
        blower(RB5015);
    }
}

module xCarraige(){
    difference(){
        union(){
            hull(){
                posBearing1(){
                    cylinder(d=5, h=50, center=true);
                }
                posBearing2(){
                    translate([0,0,3])cylinder(d=5, h=10, center=true);
                }
                posFanHole1(){
                translate([0,0,-5])cylinder(h=5,d=5);
                }
                posFanHole2(){
                translate([0,0,-5])cylinder(h=5,d=5);
                }
            }
            posBearing1(){
                cylinder(d=20, h=50, center=true);
            }
            posBearing2(){
                cylinder(d=20, h=27, center=true);
            }
            posFanHole1(){
            translate([0,0,-5])cylinder(h=5,d=8);
            }
            posFanHole2(){
            translate([0,0,-5])cylinder(h=5,d=8);
            }
        }
        
        posBearing1(){
                cylinder(d=15.3, h=45.3, center=true);
            }
        posBearing2(){
                cylinder(d=15.3, h=24.3, center=true);
            }
        posBearing1(){
                cylinder(d=9, h=100, center=true);
            }
        posBearing2(){
                cylinder(d=9, h=100, center=true);
            }
        posFanHole1(){
            translate([0,0,-50]) cylinder(h=100,d=4);
            }
        posFanHole1(){
            translate([0,0,-50+5])cylinder(h=40,d=10);
        }
        posFanHole2(){
            translate([0,0,-50])cylinder(h=100,d=4);
        }
        posFanHole2(){
            translate([0,0,-50+5])cylinder(h=40,d=10);
        }
    }
}

module sliceXZFront(){
    intersection(){
        children();
        translate([-500,0,-500])cube([1000,1000,1000]);
    }
}

module sliceXZBack(){
    intersection(){
        children();
        translate([-500,-1000,-500])cube([1000,1000,1000]);
    }
}

*sliceXZBack(){
    xCarraige();
}

xCarraige();