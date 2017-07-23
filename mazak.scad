//Mazak();

// 525: sirka 21mm, limec 10mm x 5mm
// 
kanal = 21;
limec_s = 4;
limec_v = 10;
hrbet = 8;
delka = 50;
zatacka = 10;

$fn = 50;


module Mazak() {
    difference() {
        kostka();
        kosy();
        umisti_armaturu();
        signature();
        uchyceni();
    }
    
}

Skrz();
module Skrz() {
    {
        %kostka();
        kosy();
        umisti_armaturu();
        signature();
        uchyceni();
    }
    
}

module uchyceni() {
    translate([-5,hrbet/2,delka*1/3]) rotate([0,90,0]) cylinder(d=3,h=kanal+2*limec_s+10);
    
}

module signature() {
    color("black")
    translate([limec_s+2,hrbet-1,20])
    rotate([-90, 0])
    linear_extrude(height = 2, convexity = 10, slices = 20, scale = 1.0)
    text("525", size=7, font="Roboto:style=Bold");        
}


module kostka() {
    linear_extrude(height = delka, convexity = 10, center = true, twist = 0, slices = 20, scale = 1.0) {
        polygon([[0,0],[kanal+(limec_s*2),0],
        [kanal+(limec_s*2),hrbet+limec_v],[kanal+(limec_s),hrbet+limec_v],
        [kanal+(limec_s),hrbet],[limec_s,hrbet],[limec_s,hrbet+limec_v],[0,hrbet+limec_v]]);
    }
}



module kosy(zkoseni = 2) {
    
    color("green") {
        translate([limec_s-zkoseni, hrbet+limec_v, -delka/2-1])
        rotate([90,0,0])
        linear_extrude(height=limec_v, convexity=10, twist=0, slices=20, scale=1.0)
        polygon([[0,0], [zkoseni,0], [zkoseni,10]]);
        
        
        translate([limec_s+kanal, hrbet+limec_v, -delka/2-1])
        rotate([90,0,0])
        linear_extrude(height=limec_v, convexity=10, twist=0, slices=20, scale=1.0)
        polygon([[0,0], [0,10], [zkoseni,0]]);
        
        translate([limec_s-zkoseni, hrbet, delka/2+1])
        rotate([270,0,0])
        linear_extrude(height=limec_v, convexity=10, twist=0, slices=20, scale=1.0)
        polygon([[0,0], [zkoseni,0], [zkoseni,10]]);
        
        
        translate([limec_s+kanal, hrbet, delka/2+1])
        rotate([270,0,0])
        linear_extrude(height=limec_v, convexity=10, twist=0, slices=20, scale=1.0)
        polygon([[0,0], [0,10], [zkoseni,0]]);
        
    }
    
}

module umisti_armaturu() {
    rotate([-180,0,0]) 
    translate([limec_s+5/2,-hrbet/2,0])
    trysky(2);
    
    rotate([-90,90,-180])
    translate([0,(2*limec_s+kanal)/2-zatacka,-hrbet/2])
    nahon(zatacka);
}

module trysky(prumer=2) {
   rotate([0,90,0]) cylinder(d=prumer,h=kanal-5);
   translate([0,prumer/2,-prumer/2]) rotate([90,0,0]) cube([prumer,prumer,kanal-5]);
   translate([kanal-5-prumer,prumer/2,-prumer/2]) rotate([90,0,0]) cube([prumer,prumer,kanal-5]);
}

module nahon(zatacka=10) {
    polomer = 1;
            color("red") {
                rotate_extrude(angle=90, convexity=10) translate([zatacka, 0]) circle(polomer);
                translate([zatacka,0,0]) rotate([90,0,0]) cylinder(r=polomer,h=kanal);
            }
}