//Main plate geometry
main_base_thickness = 5;
main_base_r = 90;

//Main ring geometry
main_ring_outer_r = 100;
main_ring_inner_r = 95;
main_ring_h = 60;
ring_clearance = 10;

//Motor hole properties
axel_to_screw_centerline_dist = 8;
screwhole_to_screwhole_dist = 35;
axel_plug_r = 4.75;
axel_base_r = 5/2;
axel_tip_w = 3;


//Arm geometry
arm_length = 2*main_ring_inner_r - ring_clearance;
arm_width = 7;
groove_r = 3;
//The actual number of grooves is this +1
n_grooves = 10;

arm_h_offset = 1.49;


//Axel geometry
axel_r = 5/2;
axel_w = 3.6;
axel_h = 8;
axel_small_h = 0;

//Connector geometry
connector_r = 7;
connector_h = 15;

difference(){
    union(){
        //Grooved arm
        difference(){
            //Main arm
            difference(){
                translate([-arm_length/2, -arm_width/2, 0]){
                    
                    cube([arm_length, arm_width, 10]);
                }   
                translate([-arm_length/2,-arm_width/2,-10+arm_h_offset]){
                    cube([arm_length/2,arm_width,10]);
                }
            }
            //Grooves
            translate([arm_length/(4*n_grooves), arm_width, 0]){
                for (i = [1:n_grooves]){
                    translate([i*arm_length/(2*n_grooves), 0, 0,]){
                        rotate([90, 0, 0]) cylinder(h=2*arm_width, r=groove_r, $fn=50);  
                    }
                }
            }
              
        }
        
        //Connector
        translate([0,0,-connector_h+10]){
            cylinder(h=connector_h, r=connector_r, $fn=50);
        }

    }
    
    //Connector hole
//    translate([0,0,-connector_h/2]){
//        %cylinder(h=axel_small_h, r=axel_r, $fn=50);
//    }
    
    translate([0,0,-connector_h/2]){
        intersection(){
            cube([axel_w, 20,20],center=true);
            cylinder(h=axel_h, r=axel_r+0.1, $fn=50);
        }
    }
}
