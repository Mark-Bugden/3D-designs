

//Main plate geometry
main_base_thickness = 5;
main_base_r = 95;

//Main ring geometry
main_ring_outer_r = 100;
main_ring_inner_r = 95;
// will use this for final print//main_ring_h = 60;
main_ring_h = 5;

//Baseplate holder geometry (peg)
peg_r = 4;
//peg_h = 30;
peg_h = 2;
peg_cube_w = 4*peg_r;
peg_cube_d = peg_r;



union(){
    
    //Main Ring
    difference(){
        
    //Outer circle
    cylinder(h = main_ring_h, r=main_ring_outer_r, $fn=500);    
    //Inner circle
    cylinder(h = main_ring_h, r=main_ring_inner_r, $fn=500);    
    }



    

    
    
    //Pegs
    for (i = [0:5]){
        rotate(60*i){
            translate([0,main_ring_inner_r - peg_r,0]){
                union(){
                    //Peg pillar
                    cylinder(h=peg_h, r=peg_r, $fn=40);
                    //Peg1 support buttress
                    difference(){
                        translate([-2*peg_r,0,0]){
                            cube([peg_cube_w, peg_cube_d, peg_h]);
                        }
                        translate([-2*peg_r,0,0]){
                            cylinder(h=100, r = peg_r, $fn=40);
                        }
                        translate([2*peg_r,0,0]){
                            cylinder(h=100, r = peg_r, $fn=40);
                        }  
                    }
                }
            }
        }    
    }
    
    
    
    
}