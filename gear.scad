$fn = 64;

// Meccano 4mm shaft or 4mm with 3 flats

pitch = 0.5;

theGap = 18.75;




module hex(h,f){


    r = ( f / 0.866 ) / 2 ; // sin 60 


    difference(){
    
        translate([0,0,0]) cylinder(h,r,r);

        for ( i = [ 0: 60 : 360 ] ){
    
            x = r * cos(i);
            
            y = r * sin(i);
        
        
            translate([x,y,-0.1]) rotate([0,0,i + 30]) cube([5,r,h + 0.2]);
    
        }
        
        
    }




}

   

module bearingA(){

    r = 5.1;


    translate([0,0,0])cylinder(4,r,r);





}


module bearing(){

    difference(){
    
        bearingA();
        
         translate([0,0,-0.01])cylinder(4.02,1.5,1.5);
    
    
    
    }



}


module gearA(teeth,width){


    circumf = pitch * teeth * 2;
    
    rad = circumf / PI;

    translate([0,0 , 0]) rotate([0,0,0]) scale([1,1,1]) cylinder(width,rad,rad);
    
    step = ( 360 / teeth ) ;
    
    
    
    
    for ( i = [  0 : step : 360 ] ){
    
        x = rad * cos(i);
    
        y = rad * sin(i);
    
        // translate([x,y,0]) cylinder(width,pitch,pitch);
           
        translate([x,y,0]) rotate([0,0,i]) scale([1.618,1,1]) cylinder(width,pitch,pitch);
    
    
    }

 




}

module gear(teeth,width){

    circumf = pitch * teeth * 2;
    
    rad = circumf / PI;
    
    step = ( 360 / teeth );
        
   



    difference(){
    
        gearA(teeth,width);
        
       

        step = ( 360 / teeth ) ;
    
    
    
    
        for ( i = [  step / 2  : step : 360 ] ){
    
            x = rad * cos(i);
    
            y = rad * sin(i);
    
            translate([x,y,-0.1]) cylinder(width + 0.2,pitch,pitch);
    
    
        }
        

        translate([0,0 , - 0.1])cylinder(width + 0.2,2.5,2.5);
    
    }







}



module ringGearA(teeth,width){

    rad = ( teeth / 3 ) + 8;

    translate([0,0,0]) cylinder(width -1 ,rad,rad);
    
    

    
    
 /*   
    for ( i = [ 0 : 90 : 270 ]){

            x = rad * cos(i);
    
            y = rad * sin(i);
    
           // translate([x,y,0]) cylinder(4  ,5  ,5 );


        }
*/



}


module ringGear(teeth,width){

    difference(){
    
        ringGearA(teeth,width);
        
        translate([0,0,-0.1]) rotate([0,0,-3.7]) gear(teeth,width + 0.2);
        
        //translate([0,0,-0.1]) rotate([0,0,-3.7]) #cylinder(width + 0.2, 20);
        
        
        }



}


module pin(){

    translate([0,0,0]) cylinder(8,2.4,2.4);
    
  



}



module inputA(){

    //color("#008000")translate([13.2,0,0]) pin();

    //color("#008000")translate([-13.2,0,0]) pin();

    //color("#008000")translate([0,13.2,0]) pin();
    
    d = 13.5;
    
    for ( i = [ 0 : 120 : 240 ] ){
    
        x = d * cos(i);
        
        y = d * sin(i);
    
        color("#008000")translate([x,y,0]) pin();
    
    }
    
    color("#008000")translate([0,0,0]) pin();
    
    
    color("#008000")translate([0,0,5.5]) cylinder(4,23,23);
    
    
    //color("#008000")translate([0,0,9]) cylinder(10,2.5,2.5);


}


module input(){

    difference(){
    
        inputA();
        
        
    }
    
    
}

/*
color("#ff8080")translate([0,0,-0.5]) rotate([0,0,-5.5]) gear(24,6);

color("#ff8080")translate([0,0,-4.5]) cylinder(4,23,23);
*/


/*
color("#008080")translate([13.2,0,0]) rotate([0,0,-3.7]) gear(16,4);

color("#008080")translate([-13.2,0,0]) rotate([0,0,-3.7]) gear(16,4);

color("#008080")translate([0,13.2,0]) rotate([0,0,-3.7]) gear(16,4);

color("#008080")translate([0,-13.2,0]) rotate([0,0,-3.7]) gear(16,4);

*/
//color("#000080") translate([0,0,0]) ring(24,6);


//input();


//bearing();

module sunGear(){

    difference(){
    
        gear(32,4);
        
        scale([1,1,1.0001])bearing();
    
   
    }

   // bearing();


}



module planetGear(){

    difference(){
    
        gear(36,4);
        
        translate([0,0,-0.01]) scale([1,1,1.1])bearing();
    
   
    }

    //bearing();
    
   


}




module dimple(){

    difference(){
    
        translate([0,0,0]) cylinder(1  ,3.5  ,2.7 );
        
        translate([0,0,-0.01]) cylinder(2 ,1.5  ,1.5 );
    
    
    
    }




}

module carrierA(r){ 
    
     bigR = 29;
    
     translate([0,0,0]) cylinder(9,bigR,bigR);







}





module carrier(r){


    //r = theGap;
    
       // r = 19;
    
    

    

    difference(){
    
        carrierA(r);
        
        translate([0,0,-0.1]) cylinder(10,10,10);
        
        af = 5.7;


        for ( i = [ 0 : 90 : 270 ]){

            x = r * cos(i);
    
            y = r * sin(i);
    
            translate([x,y,0]) cylinder(20,1.5,1.5);

            
            translate([x,y,-0.01]) hex( 1.8 , af  );
             
             
              translate([x,y,3]) cylinder(8 , 14 , 14 );

        }
        
        translate([0,0,0]) cylinder(20,1.5,1.5);
        translate([0,0,-0.01]) hex( 3 , af  );
    
    
        ra = 25;
     
        for ( i = [ 0 : 90 : 270 ]){

            xa = ra * cos(i + 45);
    
            ya = ra * sin(i + 45);
    
            translate([xa,ya,-5]) cylinder(20  ,2  ,2 );


        }
    
    
    
    
    }
    
    
    
       for ( i = [ 0 : 90 : 270 ]){

            x = r * cos(i);
    
            y = r * sin(i);
            
            
           
    
            translate([x,y,3]) dimple();
            
            
            


        }
    
    


}



if ( false ){
    
    //sunGear();


    r = 18.5;

    for ( i = [ 0 : 120 : 240 ]){

        x = r * cos(i);
    
        y = r * sin(i);
    
        translate([x,y,0]) rotate([0,0,0]) planetGear();


    }


    carrier();


    color("#0000FF") translate([0,0,0.5]) ringGear(84,4);

}


module planet(r){

    //r = theGap;
    
    
    /*

    for ( i = [ 0 : 90 : 270 ]){

        x = r * cos(i);
    
        y = r * sin(i);
    
        translate([x,y,0]) rotate([0,0,0]) planetGear();


    }
    
    */

    translate([r,0,0]) rotate([0,0,5]) planetGear();
    
    translate([0,r,0]) rotate([0,0,0]) planetGear();
    
    
    translate([r * -1 ,0,0]) rotate([0,0,0]) planetGear();
    
    translate([0,r * -1,0]) rotate([0,0,0]) planetGear();


}


module smallGear(){

    difference(){
    
        gear(20,9);
        
        //translate([0,0,-0.01 ] )scale([1,1,1.2])bearing();
    
   
    }
    
    difference(){
        
        translate([0,0,0]) cylinder(9,4,4);
        
        adj = ( 3.95 / 3.33 )  ;
        
        
        translate([0,0,-0.1] )scale([adj,adj,1.0001])axle(15);
        
    }

   

}


module motorA(){

    translate([-19,-19,0]) cube([38,38,2.5]);
    
    //translate([0,0,2.5]) cylinder(13,2,2);
    
    translate([0,0,2.5]) axle(13.3);
    
    translate([17,-19,-38]) cube([2,38,38]);

    translate([0,0,-38]) cylinder(38,15,15);
    
    
    
    
    
    


}


module motor(){

    difference(){
    
        motorA();
        
        r = 1.8;
        
        h = 17;
        
        
       // translate([r,-1 * r,3]) rotate([0,0,0]) cube([5,2*r,20]);
        
        
       // translate([-0.6 * r,-1 * r,3]) rotate([0,0,120]) cube([5,2*r,20]);
       // translate([2, 3.2 ,3]) rotate([0,0,120]) cube([5,10 , 20]);
        
        
        translate([-19 + 5.8, -19 + 5.8 ,-0.1]) cylinder(5,2,2);
        
        translate([-19 + 5.8, 19 - 5.8 ,-0.1]) cylinder(5,2,2);
        
        
        translate([19 - 5.8, -19 + 5.8 ,-0.1]) cylinder(5,2,2);
        
        translate([19 - 5.8, 19 - 5.8 ,-0.1]) cylinder(5,2,2);


        
        
         translate([20, -19 + 5.8 ,-4.5])rotate([0,-90,0]) cylinder(5,2,2);
         
         
         translate([20, -19 + 5.8 ,-4.5 - 12.5 ])rotate([0,-90,0]) cylinder(5,2,2);
         
         
         translate([20, -19 + 5.8 ,-4.5 - 12.5 - 12.5])rotate([0,-90,0]) cylinder(5,2,2);
        
        
        
          translate([20, 19 - 5.8 ,-4.5])rotate([0,-90,0]) cylinder(5,2,2);
         
         
         translate([20, 19 - 5.8 ,-4.5 - 12.5 ])rotate([0,-90,0]) cylinder(5,2,2);
         
         
         translate([20, 19 - 5.8 ,-4.5 - 12.5 - 12.5])rotate([0,-90,0]) cylinder(5,2,2);
        
        
        

       }
      
     
    
  } 
             
       
module axle(z){


difference(){


    translate([0,0,0]) cylinder(z,2,2);
    
    
    r = 2 ;
    

    for ( i = [ 0 : 120 : 360 ] ){
    
        
        x = r * cos(i);
        
        y = r * sin(i);
        
        translate([x,y,-0.01]) rotate([0,0,i + 40 ]) cube([3,8,z + 0.02]);
    
    
    
    }


}


}
       
module motorGearA(){


    translate([0,0,0]) cylinder(4,3,3);

    gear(12,4);

}

module motorGear(){



    difference(){
    
        motorGearA();
        
        adj = 3.95 / 3.33 ;
        
        
        scale([adj,adj,1.0001])axle(6);
    
   
    }

    //scale([1,1,1.5]) bearing();


}


module flangeA(){


 translate([-19,-19,2.5]) cube([38,38,2.5]);

 translate([0,0,5.5]) ringGear(96,11);
    
 s = 40;
 
translate([0,0,4.6]) cylinder(2,s,s);



}

module hole(){

translate([0,0,0]) cylinder(10,2,2,);
translate([0,0,4]) cylinder(3,3.3,3.3);




}


module flange(){

    difference(){
        
       flangeA();
    
         
        translate([-19 + 5.8, -19 + 5.8 ,-0.1]) hole();
        
        translate([-19 + 5.8, 19 - 5.8 ,-0.1]) hole();
        
        
        translate([19 - 5.8, -19 + 5.8 ,-0.1]) hole();
        
        translate([19 - 5.8, 19 - 5.8 ,-0.1]) hole();
        
        
        translate([0,0,0]) cylinder(10,10,10);


        translate([0,-36,-1]) cylinder(20,1.5,1.5);
        
        translate([0,36,-1]) cylinder(20,1.5,1.5);
        
        translate([36,0,-1]) cylinder(20,1.5,1.5);
        
        translate([-36,0,-1]) cylinder(20,1.5,1.5);
        
         af = 5.6;
         
         
        translate([0,-34,4.5]) #hex( 3 , af  );
        translate([0,34,4.5])  hex( 3 , af  );
        translate([34,0,4.5])  hex( 3 , af  );
        translate([-34,0,4.5]) hex( 3 , af  );
         
         
         
         
         
        
   
    
    
    }




}


if ( false ){

    color("#FFFF00") translate([0,0,0]) carrier();


    color("#00FF00") translate([0,0,6]) planet();


    color("#FF0000") translate([0,0,6]) sunGear();


    color("#0000FF") translate([0,0,6]) ringGear(84,4.9);
    
    
}

//smallGear();


h = 11;

//motor();

//color("#0000ff") translate([0,0,h]) motorGear();


//color("#FF00ff")translate([0,0,h]) planet(16.0);

//translate([0,0,0]) flange();


//translate([0,0,21]) rotate([180,0,0])carrier(16);


if ( false ){

    color("#0000ff")rotate([0,0,0]) smallGear();

    color("#00ff00") planet(18.5);

    color("#ff0000") ringGear(96,4);
    
}

//smallGear();

//gear(24,5);


module pillar(){

    translate([0,0,5]) cylinder(4.0 ,1.8  ,2 );
    
     //translate([0,0,3]) cylinder(10  ,3  ,3 );
     
     
   



}

module nextA(){

        ra = 25;
     
        for ( i = [ 0 : 90 : 270 ]){

            xa = ra * cos(i + 45);
    
            ya = ra * sin(i + 45);
    
            translate([xa,ya,0])pillar();


        }
        
        
        translate([0,0,9]) cylinder(3  ,29  ,29 );
        
        translate([0,0,12]) smallGear();


}


module next(){

    difference(){
    
        nextA();
        
        
        
        ra = 18.5;
     
        for ( i = [ 0 : 90 : 360 ]){

            xa = ra * cos(i );
    
            ya = ra * sin(i );
    
            translate([xa,ya,8])cylinder(10,6,6);


        }
    
    
    }


}


module sideA(){


    color("#ff00FF") ringGear(96,25);


}


module side(){

    difference(){
    
        sideA();
        
        translate([0,0,0])cylinder( 40 , 10 , 10 ); // extra annyoing bit
        
        
        
        translate([0,-36,-1]) cylinder(40,1.5,1.5);
        
        translate([0,36,-1]) cylinder(40,1.5,1.5);
        
        translate([36,0,-1]) cylinder(40,1.5,1.5);
        
        translate([-36,0,-1]) cylinder(40,1.5,1.5);
        
        
       
        
    }
        




}


module pins(){

    translate([0,0,0]) cylinder(10,1.3,1.5);
    
    translate([0,0,10]) cylinder(10,1.5,1.3);




}

/**************************************************************/
/**************************************************************/
/**************************************************************/
/**************************************************************/

gap = 18.5;

//color("#ff0000") ringGear(96,4);  // 94 is too tight in paractice

//color("#00ff00")translate([0,0,4])  planet(gap);


//color("#0000ff") translate([0,0,0]) rotate([0,0,0])carrier(gap);

//color("#ff0000") flange();

//motor();


//translate([0,0,3]) smallGear();


//planetGear();


//color("#0000ff") translate([0,0,0]) rotate([0,0,0])carrier(gap);

next();

//pins();



//side();