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

bulk_width = 42;
bulk_length = 42;
bulk_height = 15;

mount_holes_radius = 2;
mount_holes_x_sep = 26.11 + 2*mount_holes_radius;
mount_holes_y_sep = 26.11 + 2*mount_holes_radius;


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
        cylinder(h=iris_height, r1=iris_rad_big, r2=iris_rad_small, $fn=50);
        }
    }
}
// Camera mount
translate([0,0,0])
{
    cube([bulk_width, bulk_length, bulk_height]);
}
// Main box
translate([1,1,-100])
{
    #cube([box_width, box_length, box_height]);
    }


