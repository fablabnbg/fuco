// projection(cut=false) ausgelegt();
aufgebaut();

staerke = 18;
fraeser = 3;

module ausgelegt() {
  tischplatte();

  translate([800,1050+760-28-54]) {
  rotate([0,0,180]){
      seite();
      translate([170+fraeser,0,0])
        strebe();
    }
  }
  translate([800-250+fraeser,1050]){
    seite();
    translate([170+fraeser,0,0])
      strebe();
  }

  translate([1700,1050])
    bein();


  translate([1800,1050])
    bein();

  translate([0,1800])
    quer_k();
  translate([0,1870])
    quer_g();

  translate([1100,1870])
    plattenhalter();
  translate([1100,1950])
    plattenhalter();

  translate([1600,1870])
    strebenhalter();
  translate([1600,1950])
    strebenhalter();

  translate([1900,1050])
    fuss();
  translate([1900,1300])
    fuss();

}

module aufgebaut(){
  // tischplatte
  translate([0,0,734])
    tischplatte();

  translate([550-54/2,1000,0])
    rotate([90,0,0])
    bein();

  translate([550+900-54-54/2,1000,0])
  rotate([90,0,0])
    bein();

  translate([550-18-54/2,1000-54-54,110+34])
    quer_g();

  translate([505,200,34])
    rotate([90,0,90])
      seite();

  translate([505+900+18,200,34])
    rotate([90,0,90])
      seite();

  translate([505-(34-18)/2,200,0])
    fuss();

  translate([505+900+18-(34-18)/2,200,0])
    fuss();

  translate([170,450,734-34])
    quer_k();
}

module seite() {


  difference(){
    // grundplatte
    cube([800,760-28-54,staerke]);

    // hubwagen cut
    translate([170,0,0])
      hubwagen();

//    // querbalken gross cut
//    translate([750-54,110,0])
//      cube([54*2,54,staerke]);

    // querbalken klein cut
    translate([250,760-28-54-34,0])
      cube([34,34,staerke]);

    // ausschnitt
    translate([0,150-54,0])
      rotate([0,0,45])
        cube([250*sqrt(2),600,staerke]);
    translate([0,150-54+250,0])
      cube([250,375,staerke]);
  }
}

module bein(){
  cube([54,760-28,54]);
}

module quer_g(){
  cube([995,54,54]);
}

module quer_k(){
  difference(){
    cube([2000-110*2-25,34,34]);

    translate([-10,0,0]){
      rotate([0,0,45])
       cube([50,50,50]);
      translate([2000-110*2-5,0,0])
        rotate([0,0,45])
         cube([50,50,50]);
    }
  }
}

module fuss(){
  cube([54,170,54]);
}

module tischplatte(){
  cube([2000,1000,28]);
}

module plattenhalter(){
    cube([800-250-34-54,34,34]);
}

module strebenhalter(){
  difference(){
    cube([110,34,34]);

    rotate([0,0,45])
      cube([50,50,50]);
  }
}

module hubwagen(){
  cube([800-170,130-54,staerke]);
}

module strebe(){
  difference(){
    hubwagen();

    translate([0,130-54-fraeser,0])
      cube([800-170,fraeser,staerke]);
    translate([800-170-fraeser,0,0])
      cube([fraeser,130-54,staerke]);

    rotate([0,0,45])
       cube([200,200,staerke]);
    translate([800-170-fraeser,0,0])
      rotate([0,0,45])
       cube([200,200,staerke]);
  }
}