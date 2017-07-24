

// 525: sirka 21mm, limec 10mm x 5mm
// roztec mazacich bodu 14mm
// 
kanal = 22.6;
roztec_mazani = 14;
limec_s = 4;
limec_v = 10;
hrbet = 8;
delka = 50;
zatacka = 10;

sirka = limec_s*2+kanal;

$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

Mazak();
module Mazak() {
    difference() {
        kostka();
        kosy();
        umisti_armaturu();
        signature();
        uchyceni();
    }
    
}

//Skrz();
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
    color("orange") {
        translate([-5,hrbet/2,delka/8]) rotate([0,90,0]) cylinder(d=3,h=kanal+2*limec_s+10);
        translate([-5,hrbet/2,delka/8+10]) rotate([0,90,0]) cylinder(d=3,h=kanal+2*limec_s+10);
    }    
}

module signature() {
    color("black")
    translate([sirka/2+3,hrbet-1,20])
    rotate([-90, 90])
    linear_extrude(height = 2, convexity = 10, slices = 20, scale = 1.0)
    text("525", size=6, font="Roboto Mono:style=Bold");        


    color("black")
    translate([sirka/2+2,hrbet-1,-5])
    rotate([-90, 90])
    linear_extrude(height = 2, convexity = 10, slices = 20, scale = 1.0)
    text("MAZÁK", size=4, font="Roboto Mono:style=Bold");

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
        translate([limec_s-zkoseni, hrbet+limec_v+1, -delka/2-1])
        zkoseni(2);

        translate([limec_s+kanal-zkoseni, hrbet+limec_v+1, -delka/2-1])
        zkoseni(2);
        
        mirror([0,0,1]) {
            translate([limec_s+kanal-zkoseni, hrbet+limec_v+1, -delka/2-1])
            zkoseni(2);

            translate([limec_s-zkoseni, hrbet+limec_v+1, -delka/2-1])
            zkoseni(2);
        }
    }
}

module zkoseni(zkoseni = 2) {
    rotate([90,0,0]) 
    linear_extrude(height=limec_v+1, convexity=10, twist=0, slices=20, scale=1.0)
    polygon([[0,0], [2*zkoseni,0], [zkoseni,10]], [[1,2,0]]);
}

module umisti_armaturu() {
    rotate([-180,0,0]) 
    translate([sirka/2-roztec_mazani/2,-hrbet/2,0])
    trysky(1);
    
    rotate([-90,90,-180])
    translate([0,(2*limec_s+kanal)/2-zatacka,-hrbet/2])
    nahon(zatacka);
}

module trysky(polomer=1) {
    color("darkblue") {
        rotate([0,90,0]) cylinder(r=polomer,h=roztec_mazani);
        translate([0,polomer/2,-polomer/2]) rotate([90,0,0]) cube([polomer,polomer,hrbet]);
        translate([roztec_mazani-polomer,polomer/2,-polomer/2]) rotate([90,0,0]) cube([polomer,      polomer,hrbet]);
    }
}

module nahon(zatacka=10) {
    polomer = 1;
            color("red") {
                rotate_extrude(angle=90, convexity=10) translate([zatacka, 0]) circle(polomer);
                translate([zatacka,0,0]) rotate([90,0,0]) cylinder(r=polomer,h=10);
            }
}