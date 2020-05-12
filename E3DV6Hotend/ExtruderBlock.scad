include <C:/Users/gfellows/OneDrive - Eastside Preparatory School/Documents/GitHub/NopSCADlib/lib.scad>

filamentPos = [0,NEMA_width(NEMA17)/2-15,15/2];

module mainBlock(){
    difference(){
        union(){
            difference(){
                linear_extrude(3.8){
                    NEMA_outline(NEMA17);
                }
                cylinder(d=20,h=20, center = true);
            }

            linear_extrude(15){
                    difference(){
                        NEMA_outline(NEMA17);
                        translate([-6.4,-50]){
                            square( size = [100,100]);
                        }
                        translate([-10,-30-5]){
                            square( size = [100,30]);
                        }
                    }
                }
        }
        NEMA_screw_positions(NEMA17, n = 4){
            cylinder(d=3.7,h=100,center=true);
        }
        translate(filamentPos){
            translate([-25,0,0]) rotate([0,90,0]) cylinder(d=5.7,h=50,center=true);
        }
    }
}

module secondaryBlock(){
    translate([0,0,3.8+0.1]){
        difference(){
            union(){
                linear_extrude(3.8){
                    difference(){
                        NEMA_outline(NEMA17);
                        translate([-50+10,-50+10]){
                            square( size = [50,50]);
                        }
                        translate([-50-5,0]){
                            square( size = [50,50]);
                        }
                    }
                }

                linear_extrude(15-3.8-0.1){
                        difference(){
                            NEMA_outline(NEMA17);
                            translate([-50+10,-25]){
                                square( size = [50,50]);
                            }
                        }
                    }
            }
            NEMA_screw_positions(NEMA17, n = 1){
                cylinder(d=3.7,h=100,center=true);
            }
            translate(filamentPos){
                translate([25,0,-3.8-0.1]) rotate([0,90,0]) cylinder(d=3.2,h=50,center=true);
            }
        }
    }
}

module extruderAssembly(){
    color([0.9,0.9,0.9])mainBlock();
    color([0.9,0.9,0.9]) secondaryBlock();
    NEMA(NEMA17, shaft_angle = 0);
}