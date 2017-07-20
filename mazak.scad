Mazak(50);

module Mazak(size=50, $fn=50) {
    difference() {
        kostka();
        kosy();
        trubky();
        signature();
    }
    
}

module signature() {
    color("black")
    translate([95,49,25])
    rotate([270, 90])
    linear_extrude(height = 10, convexity = 10, slices = 20, scale = 1.0)
    text("Mazák 1", font="Roboto:style=Bold");
}

module kostka(size=50, $fn=50) {
    linear_extrude(height = 100, center = true, convexity = 10, twist = 0, slices = 20, scale = 1.0) {
        polygon([[0,0],[100,0],[100,50],[80,50],[80,20],[20,20],[20,50],[0,50]]);
    }
}

module kosy() {
    kosa();
    mirror([0,0,1]) kosa();
    mirror([1,0,0]) translate([-100,0,0]) kosa();
    mirror([0,0,1]) translate([100,0,0]) mirror([1,0,0]) kosa();
}

module kosa(size=50, $fn=50) {
    color("green")
        rotate([0,-20,0])
        translate([30,20,20])
        cube([10,30,50]);
}


module trubky(size=50, $fn=50) {
    prumer = 2;
    
    rotate([90,-90,0]) 
        translate([0,-130,-10]){
    
        
    color("red") {
        
        translate([0,60,0])
            rotate_extrude(angle=90, convexity=10)
               translate([20, 0]) circle(prumer);
        translate([20,60,0]) 
            rotate([90,0,0]) cylinder(r=prumer,h=80);
    }
    color("blue") {
        translate([0,24,-20])
        rotate([0,270,00]){
        translate([0,60,0])
            rotate_extrude(angle=90, convexity=10)
               translate([20, 0]) circle(prumer);
        translate([20,60,0]) 
            rotate([90,0,0]) cylinder(r=prumer,h=8);
        translate([0,52,0])
            rotate_extrude(angle=-90, convexity=10)
               translate([20, 0]) circle(2);
    
            }
        }
        }
}
