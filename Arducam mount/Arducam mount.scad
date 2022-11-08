top_baseplate_length = 38.5;
top_baseplate_width = 38;
height = 5;

box_width = 50;
box_length = 50;
box_height = 30;

cable_width = 14;

lens_length = 20;
lens_width = 20;
lens_height = 7.3;
lens_small_circle_radius = 3;
iris_rad_small = 6;
iris_rad_big = 7;
iris_height = 2;

bulk_width = 43;
bulk_length = 43;
bulk_height = 15;

mount_holes_radius = 2;
mount_holes_x_sep = 26.2 + 2*mount_holes_radius;
mount_holes_y_sep = 26.2 + 2*mount_holes_radius;

insert_height = 5;
insert_radius = 2.2;

screw_radius = 1.8;
screw_height = lens_height+iris_height+1;

box_wall = (box_width-bulk_width)/2;

//

difference()
{

// Main box
translate([0,0,0])
{
    
    #cube([box_width, box_length, box_height]);
    }


union()
{

// Hole
translate([box_width/2 - bulk_width/2, box_length/2-bulk_length/2, box_height-bulk_height-lens_height-iris_height]){
    

// Lens
translate([bulk_width/2-lens_width/2, bulk_length/2-lens_length/2, bulk_height])
{
union(){
    cube([lens_width, lens_length, lens_height]);
    translate([lens_width/2, 0, 0]){
        cylinder(h=lens_height, r=lens_small_circle_radius, $fn=50);
        }
    translate([lens_width/2, lens_length, 0]){
        cylinder(h=lens_height, r=lens_small_circle_radius, $fn=50);
        }
    translate([lens_width/2, lens_length/2, lens_height]){
        cylinder(h=iris_height+0.1, r1=iris_rad_big, r2=iris_rad_small, $fn=50);
        }
    }
}

// Bulk of the camera mount
translate([0,0,0])
{
    cube([bulk_width, bulk_length, bulk_height]);
}


// Threaded insert1
translate([bulk_width/2 - mount_holes_x_sep/2,bulk_length/2 - mount_holes_y_sep/2, bulk_height])
{   
    cylinder(h=insert_height,r=insert_radius, $fn=30);
}
// Threaded insert2
translate([bulk_width/2 - mount_holes_x_sep/2,bulk_length/2 + mount_holes_y_sep/2, bulk_height])
{   
    cylinder(h=insert_height,r=insert_radius, $fn=30);
}
// Threaded insert3
translate([bulk_width/2 + mount_holes_x_sep/2,bulk_length/2 - mount_holes_y_sep/2, bulk_height])
{   
    cylinder(h=insert_height,r=insert_radius, $fn=30);
}
// Threaded insert4
translate([bulk_width/2 + mount_holes_x_sep/2,bulk_length/2 + mount_holes_y_sep/2, bulk_height])
{
    cylinder(h=insert_height,r=insert_radius, $fn=30);
}



// Hole1 for screw access
translate([bulk_width/2 - mount_holes_x_sep/2 - (screw_radius + insert_radius)/sqrt(2),bulk_length/2 - mount_holes_y_sep/2 - (screw_radius + insert_radius)/sqrt(2), bulk_height])
{
    cylinder(h=screw_height, r=screw_radius, $fn=30);
}
// Hole2 for screw access
translate([bulk_width/2 - mount_holes_x_sep/2 - (screw_radius + insert_radius)/sqrt(2),bulk_length/2 + mount_holes_y_sep/2 + (screw_radius + insert_radius)/sqrt(2), bulk_height])
{
    cylinder(h=screw_height, r=screw_radius, $fn=30);
}
// Hole3 for screw access
translate([bulk_width/2 + mount_holes_x_sep/2 + (screw_radius + insert_radius)/sqrt(2),bulk_length/2 - mount_holes_y_sep/2 - (screw_radius + insert_radius)/sqrt(2), bulk_height])
{
    cylinder(h=screw_height, r=screw_radius, $fn=30);
}
// Hole4 for screw access
translate([bulk_width/2 + mount_holes_x_sep/2 + (screw_radius + insert_radius)/sqrt(2),bulk_length/2 + mount_holes_y_sep/2 + (screw_radius + insert_radius)/sqrt(2), bulk_height])
{
    cylinder(h=screw_height, r=screw_radius, $fn=30);
}

// Bulkbase
translate([0,0,-(box_height-iris_height-lens_height-bulk_height+1)])
{
    cube([bulk_width,bulk_length,10]);
}



}

//Threaded lid insert1
translate([box_wall/1.3, box_wall/1.3,-1])
{
    cylinder(r=insert_radius,h=insert_height+1, $fn=30);
}
//Threaded lid insert2
translate([box_width - box_wall/1.3, box_wall/1.3,-1])
{
    cylinder(r=insert_radius,h=insert_height+1, $fn=30);
}//Threaded lid insert3
translate([box_wall/1.3, box_width-box_wall/1.3,-1])
{
    cylinder(r=insert_radius,h=insert_height+1, $fn=30);
}//Threaded lid insert4
translate([box_width-box_wall/1.3, box_width-box_wall/1.3,-1])
{
    cylinder(r=insert_radius,h=insert_height+1, $fn=30);
}


}
}





