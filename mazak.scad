Mazac(50);

module Mazac(size=50, $fn=100) {
    difference() {
    #linear_extrude(height = 100, center = true, convexity = 10, twist = 0, slices = 20, scale = 1.0) {
        polygon([[0,0],[100,0],[100,50],[80,50],[80,20],[20,20],[20,50],[0,50]]);
    }
    
    rotate([90,-90,0]) 
        translate([0,-130,-10]){
    
        
    color("red") {
        
        translate([0,60,0])
            rotate_extrude(angle=90, convexity=10)
               translate([20, 0]) circle(5);
        translate([20,60,0]) 
            rotate([90,0,0]) cylinder(r=5,h=80);
    }
    color("blue") {
        translate([0,24,-20])
        rotate([0,270,00]){
        translate([0,60,0])
            rotate_extrude(angle=90, convexity=10)
               translate([20, 0]) circle(5);
        translate([20,60,0]) 
            rotate([90,0,0]) cylinder(r=5,h=8);
        translate([0,52,0])
            rotate_extrude(angle=-90, convexity=10)
               translate([20, 0]) circle(5);
    
            }
        }
        }
    }
    
}