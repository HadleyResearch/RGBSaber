//POVRay-File created by 3d41.ulp v1.05
///Users/georgehadley/Documents/NBitWonder/Projects/RGBSaber/Hardware/v1/v1.6/RGBSaber_Control/rgbsaber_control_v1.6.brd
//12/10/10 1:55 PM

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare Environment = on;

#local cam_x = 0;
#local cam_y = 203;
#local cam_z = -61;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -2;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 15;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 24;
#local lgt1_pos_y = 36;
#local lgt1_pos_z = 14;
#local lgt1_intense = 0.724212;
#local lgt2_pos_x = -24;
#local lgt2_pos_y = 36;
#local lgt2_pos_z = 14;
#local lgt2_intense = 0.724212;
#local lgt3_pos_x = 24;
#local lgt3_pos_y = 36;
#local lgt3_pos_z = -9;
#local lgt3_intense = 0.724212;
#local lgt4_pos_x = -24;
#local lgt4_pos_y = 36;
#local lgt4_pos_z = -9;
#local lgt4_intense = 0.724212;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 63.551000;
#declare pcb_y_size = 26.668500;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(919);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "tools.inc"
#include "user.inc"

global_settings{charset utf8}

#if(Environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-31.775500,0,-13.334250>
}
#end

background{col_bgr}


//Axis uncomment to activate
//object{TOOLS_AXIS_XYZ(100,100,100 //texture{ pigment{rgb<1,0,0>} finish{diffuse 0.8 phong 1}}, //texture{ pigment{rgb<1,1,1>} finish{diffuse 0.8 phong 1}})}

light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro RGBSABER_CONTROL_V1_6(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,-0.001000><63.551000,0.000000>
<63.551000,0.000000><63.551000,26.660000>
<63.551000,26.660000><0.000000,26.667500>
<0.000000,26.667500><0.000000,-0.001000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
cylinder{<2.285500,1,2.540000><2.285500,-5,2.540000>1.651000 texture{col_hls}}
cylinder{<2.288000,1,24.130000><2.288000,-5,24.130000>1.651000 texture{col_hls}}
cylinder{<60.960000,1,24.130000><60.960000,-5,24.130000>1.651000 texture{col_hls}}
cylinder{<60.960000,1,2.540000><60.960000,-5,2.540000>1.651000 texture{col_hls}}
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_BATT) #declare global_pack_BATT=yes; object {PH_1X2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<5.889000,0.000000,23.485000>}#end		//Header 2,54mm Grid 2Pin 1Row (jumper.lib) BATT  1X02
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_WIMA_5_072_072_130("100uf",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<24.456500,0.000000,22.428500>}#end		//WIMA-Capacitor Grid 5.08 (capacitator-wima.lib) C1 100uf C5B7.2
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<39.370000,0.000000,8.636000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C5 .01uF 0805
#ifndef(pack_LUX) #declare global_pack_LUX=yes; object {PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<61.183000,0.000000,17.199000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) LUX  1X04
#ifndef(pack_PERIPH) #declare global_pack_PERIPH=yes; object {PH_1X9()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<19.072000,0.000000,1.821500>}#end		//Header 2,54mm Grid 9Pin 1Row (jumper.lib) PERIPH M09 1X09
#ifndef(pack_PRG) #declare global_pack_PRG=yes; object {PH_1X5()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<3.045500,0.000000,18.081000>}#end		//Header 2,54mm Grid 5Pin 1Row (jumper.lib) PRG  1X05
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("662",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<40.259000,0.000000,18.161000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R1 6.65K M0805
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0805("332",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<40.259000,0.000000,15.367000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R2 3.3K M0805
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_0805("332",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<40.259000,0.000000,12.573000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R3 3.3K M0805
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<18.542000,-1.500000,5.969000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R4 10K M0805
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_0805("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<18.542000,-1.500000,9.144000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R5 10K M0805
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_SMD_CHIP_0805("251",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<18.494000,-1.500000,14.999000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R6 250 M0805
#ifndef(pack_SOIC1) #declare global_pack_SOIC1=yes; object {IC_SMD_SSOP28("P18F2221SSOP","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<31.750000,0.000000,11.430000>translate<0,0.035000,0> }#end		//SSOP28 SOIC1 P18F2221SSOP SSOP-28
#ifndef(pack_T1) #declare global_pack_T1=yes; object {IC_SMD_SOT223("FZTA14V1","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<49.276000,0.000000,20.701000>translate<0,0.035000,0> }#end		//SOT223 T1 FZTA14V1 SOT223
#ifndef(pack_T2) #declare global_pack_T2=yes; object {IC_SMD_SOT223("FZTA14V1","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<49.276000,0.000000,13.208000>translate<0,0.035000,0> }#end		//SOT223 T2 FZTA14V1 SOT223
#ifndef(pack_T3) #declare global_pack_T3=yes; object {IC_SMD_SOT223("FZTA14V1","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<49.276000,0.000000,5.588000>translate<0,0.035000,0> }#end		//SOT223 T3 FZTA14V1 SOT223
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_BATT) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<5.889000,0,23.485000> texture{col_thl}}
#ifndef(global_pack_BATT) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<5.889000,0,20.945000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<26.996500,0,22.428500> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<21.916500,0,22.428500> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<39.370000,0.000000,9.536000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<39.370000,0.000000,7.736000>}
#ifndef(global_pack_LUX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,0+global_tmp,0) rotate<0,-0.000000,0>translate<61.183000,0,17.199000> texture{col_thl}}
#ifndef(global_pack_LUX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<61.183000,0,14.659000> texture{col_thl}}
#ifndef(global_pack_LUX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<61.183000,0,12.119000> texture{col_thl}}
#ifndef(global_pack_LUX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<61.183000,0,9.579000> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<19.072000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<21.612000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<24.152000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<26.692000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<29.232000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<31.772000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<34.312000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<36.852000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PERIPH) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<39.392000,0,1.821500> texture{col_thl}}
#ifndef(global_pack_PRG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.045500,0,18.081000> texture{col_thl}}
#ifndef(global_pack_PRG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.045500,0,15.541000> texture{col_thl}}
#ifndef(global_pack_PRG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.045500,0,13.001000> texture{col_thl}}
#ifndef(global_pack_PRG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.045500,0,10.461000> texture{col_thl}}
#ifndef(global_pack_PRG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.625600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.045500,0,7.921000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<39.309000,0.000000,18.161000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<41.209000,0.000000,18.161000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<39.309000,0.000000,15.367000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<41.209000,0.000000,15.367000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<39.309000,0.000000,12.573000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<41.209000,0.000000,12.573000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.592000,-1.537000,5.969000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.492000,-1.537000,5.969000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.592000,-1.537000,9.144000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.492000,-1.537000,9.144000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.544000,-1.537000,14.999000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.444000,-1.537000,14.999000>}
#ifndef(global_pack_REG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.609600,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<10.682500,0,20.275500> texture{col_thl}}
#ifndef(global_pack_REG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.609600,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<12.482500,0,20.275500> texture{col_thl}}
#ifndef(global_pack_REG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.609600,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<14.282500,0,20.275500> texture{col_thl}}
#ifndef(global_pack_REG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.609600,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<16.082500,0,20.275500> texture{col_thl}}
#ifndef(global_pack_REG) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.609600,1.000000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<17.882500,0,20.275500> texture{col_thl}}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,15.655000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,15.005000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,14.355000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,13.705000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,13.055000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,12.405000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,11.755000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,11.105000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,10.455000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,9.805000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,9.155000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,8.505000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,7.855000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.094000,0.000000,7.205000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,7.205000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,7.855000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,8.505000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,9.155000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,9.805000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,10.455000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,11.105000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,11.755000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,12.405000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,13.055000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,13.705000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,14.355000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,15.005000>}
object{TOOLS_PCB_SMD(0.348000,1.397000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<35.406000,0.000000,15.655000>}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.726000,0.000000,23.001000>}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.736000,0.000000,20.701000>}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.726000,0.000000,18.401000>}
object{TOOLS_PCB_SMD(1.850000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.816000,0.000000,20.701000>}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.726000,0.000000,15.508000>}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.736000,0.000000,13.208000>}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.726000,0.000000,10.908000>}
object{TOOLS_PCB_SMD(1.850000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.816000,0.000000,13.208000>}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.726000,0.000000,7.888000>}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.736000,0.000000,5.588000>}
object{TOOLS_PCB_SMD(1.800000,0.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.726000,0.000000,3.288000>}
object{TOOLS_PCB_SMD(1.850000,3.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.816000,0.000000,5.588000>}
//Pads/Vias
object{TOOLS_PCB_VIA(0.914400,0.508000,1,16,1,0) translate<33.528000,0,12.446000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<22.863500,0,16.484500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.914400,0.508000,1,16,1,0) translate<30.480000,0,10.795000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<22.078000,0,6.980500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<24.183000,0,7.854500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,1,0) translate<30.899000,0,14.146000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,1,0) translate<31.057000,0,15.685000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,1,0) translate<26.163500,0,11.077000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.914400,0.508000,1,16,1,0) translate<30.504000,0,12.706000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.914400,0.508000,1,16,1,0) translate<32.385000,0,11.430000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.530000,0,16.510000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.260000,0,16.510000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.881000,0,14.646500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.874000,0,13.433000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.602500,0,21.962500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.820000,0,21.962000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.820000,0,20.798000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.628500,0,19.633500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.820000,0,19.633000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<53.340000,0,22.860000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,22.860000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,22.860000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,20.320000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,20.320000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<50.800000,0,16.510000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.743500,0,14.669000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.721500,0,13.442500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.743000,0,12.150000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.859500,0,12.111500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<52.070000,0,16.510000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<53.340000,0,16.510000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,16.510000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,16.510000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,15.240000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,15.240000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,13.970000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,13.970000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,12.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,12.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,7.620000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<55.880000,0,6.350000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,5.080000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,6.350000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,7.620000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<54.610000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<53.340000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<53.340000,0,7.620000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<52.070000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<50.800000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.530000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.260000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.595500,0,6.826500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.789500,0,6.811000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.789000,0,5.663000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.595500,0,5.663500> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.595500,0,4.485000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.789500,0,4.484500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<15.240000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<49.820000,0,20.798000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.906400,0.500000,1,16,2,0) translate<48.596000,0,20.782500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.006400,0.600000,1,16,1,0) translate<15.234000,0,5.926000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.270000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.270000,-1.535000,16.510000>}
box{<0,0,-0.152400><8.890000,0.035000,0.152400> rotate<0,90.000000,0> translate<1.270000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.270000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.794000,-1.535000,18.034000>}
box{<0,0,-0.152400><2.155261,0.035000,0.152400> rotate<0,-44.997030,0> translate<1.270000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.794000,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.045500,-1.535000,18.081000>}
box{<0,0,-0.152400><0.255854,0.035000,0.152400> rotate<0,-10.584565,0> translate<2.794000,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.045500,-1.535000,13.001000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.305500,-1.535000,12.950500>}
box{<0,0,-0.127000><0.264859,0.035000,0.127000> rotate<0,10.991018,0> translate<3.045500,-1.535000,13.001000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.305500,-1.535000,12.950500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.997000,-1.535000,12.950500>}
box{<0,0,-0.127000><1.691500,0.035000,0.127000> rotate<0,0.000000,0> translate<3.305500,-1.535000,12.950500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.270000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,-1.535000,3.810000>}
box{<0,0,-0.152400><5.388154,0.035000,0.152400> rotate<0,44.997030,0> translate<1.270000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.889000,-1.535000,23.321000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.889000,-1.535000,23.485000>}
box{<0,0,-0.127000><0.164000,0.035000,0.127000> rotate<0,90.000000,0> translate<5.889000,-1.535000,23.485000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.889000,0.000000,20.945000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.070500,0.000000,20.945000>}
box{<0,0,-0.406400><1.181500,0.035000,0.406400> rotate<0,0.000000,0> translate<5.889000,0.000000,20.945000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.997000,-1.535000,12.950500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,15.573500>}
box{<0,0,-0.127000><3.709482,0.035000,0.127000> rotate<0,-44.997030,0> translate<4.997000,-1.535000,12.950500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.889000,-1.535000,23.321000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,21.590000>}
box{<0,0,-0.127000><2.448004,0.035000,0.127000> rotate<0,44.997030,0> translate<5.889000,-1.535000,23.321000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,15.573500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,21.590000>}
box{<0,0,-0.127000><6.016500,0.035000,0.127000> rotate<0,90.000000,0> translate<7.620000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.070500,0.000000,20.945000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.289000,0.000000,22.163500>}
box{<0,0,-0.406400><1.723219,0.035000,0.406400> rotate<0,-44.997030,0> translate<7.070500,0.000000,20.945000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.682500,-1.535000,20.275500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.685000,-1.535000,20.273000>}
box{<0,0,-0.152400><0.003536,0.035000,0.152400> rotate<0,44.997030,0> translate<10.682500,-1.535000,20.275500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.685000,-1.535000,17.782000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.685000,-1.535000,20.273000>}
box{<0,0,-0.152400><2.491000,0.035000,0.152400> rotate<0,90.000000,0> translate<10.685000,-1.535000,20.273000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.045500,-1.535000,7.921000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.632000,-1.535000,7.874000>}
box{<0,0,-0.152400><8.586629,0.035000,0.152400> rotate<0,0.313597,0> translate<3.045500,-1.535000,7.921000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.471000,-1.535000,20.264000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.471000,-1.535000,18.710000>}
box{<0,0,-0.406400><1.554000,0.035000,0.406400> rotate<0,-90.000000,0> translate<12.471000,-1.535000,18.710000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.473500,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.473500,0.000000,11.654000>}
box{<0,0,-0.152400><3.840000,0.035000,0.152400> rotate<0,-90.000000,0> translate<12.473500,0.000000,11.654000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.045500,0.000000,15.541000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.473500,0.000000,15.494000>}
box{<0,0,-0.152400><9.428117,0.035000,0.152400> rotate<0,0.285607,0> translate<3.045500,0.000000,15.541000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.473000,0.000000,19.326000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.473500,0.000000,15.494000>}
box{<0,0,-0.152400><3.832000,0.035000,0.152400> rotate<0,89.986585,0> translate<12.473000,0.000000,19.326000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.471000,-1.535000,20.264000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.482500,-1.535000,20.275500>}
box{<0,0,-0.406400><0.016263,0.035000,0.406400> rotate<0,-44.997030,0> translate<12.471000,-1.535000,20.264000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.473000,0.000000,19.326000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.482500,0.000000,20.275500>}
box{<0,0,-0.152400><0.949548,0.035000,0.152400> rotate<0,-89.420858,0> translate<12.473000,0.000000,19.326000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.473500,0.000000,11.654000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.697500,0.000000,11.430000>}
box{<0,0,-0.152400><0.316784,0.035000,0.152400> rotate<0,44.997030,0> translate<12.473500,0.000000,11.654000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.697500,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,0.000000,11.430000>}
box{<0,0,-0.152400><0.002500,0.035000,0.152400> rotate<0,0.000000,0> translate<12.697500,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.045500,-1.535000,10.461000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.954000,-1.535000,10.414000>}
box{<0,0,-0.127000><9.908611,0.035000,0.127000> rotate<0,0.271757,0> translate<3.045500,-1.535000,10.461000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.889000,-1.535000,23.485000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.973500,-1.535000,23.485000>}
box{<0,0,-0.406400><7.084500,0.035000,0.406400> rotate<0,0.000000,0> translate<5.889000,-1.535000,23.485000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.471000,-1.535000,18.710000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.401000,-1.535000,17.780000>}
box{<0,0,-0.406400><1.315219,0.035000,0.406400> rotate<0,44.997030,0> translate<12.471000,-1.535000,18.710000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.685000,-1.535000,17.782000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.468000,-1.535000,14.999000>}
box{<0,0,-0.152400><3.935756,0.035000,0.152400> rotate<0,44.997030,0> translate<10.685000,-1.535000,17.782000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.282500,0.000000,20.275500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.282500,0.000000,18.737500>}
box{<0,0,-0.406400><1.538000,0.035000,0.406400> rotate<0,-90.000000,0> translate<14.282500,0.000000,18.737500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.282500,-1.535000,20.275500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.288000,-1.535000,20.281000>}
box{<0,0,-0.406400><0.007778,0.035000,0.406400> rotate<0,-44.997030,0> translate<14.282500,-1.535000,20.275500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.288000,-1.535000,22.170500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.288000,-1.535000,20.281000>}
box{<0,0,-0.406400><1.889500,0.035000,0.406400> rotate<0,-90.000000,0> translate<14.288000,-1.535000,20.281000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.973500,-1.535000,23.485000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.288000,-1.535000,22.170500>}
box{<0,0,-0.406400><1.858984,0.035000,0.406400> rotate<0,44.997030,0> translate<12.973500,-1.535000,23.485000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,0.000000,8.890000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<12.700000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.954000,-1.535000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,12.700000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.954000,-1.535000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.282500,0.000000,18.737500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,0.000000,17.780000>}
box{<0,0,-0.406400><1.354109,0.035000,0.406400> rotate<0,44.997030,0> translate<14.282500,0.000000,18.737500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.234000,-1.535000,5.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.277000,-1.535000,5.969000>}
box{<0,0,-0.127000><0.060811,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.234000,-1.535000,5.926000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.289000,0.000000,22.163500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.456500,0.000000,22.163500>}
box{<0,0,-0.406400><7.167500,0.035000,0.406400> rotate<0,0.000000,0> translate<8.289000,0.000000,22.163500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.494000,-1.535000,9.144000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,-44.997030,0> translate<15.240000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.632000,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.857500,-1.535000,12.099500>}
box{<0,0,-0.152400><5.975759,0.035000,0.152400> rotate<0,-44.997030,0> translate<11.632000,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.098000,0.000000,21.522000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.098000,0.000000,20.291000>}
box{<0,0,-0.406400><1.231000,0.035000,0.406400> rotate<0,-90.000000,0> translate<16.098000,0.000000,20.291000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.456500,0.000000,22.163500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.098000,0.000000,21.522000>}
box{<0,0,-0.406400><0.907218,0.035000,0.406400> rotate<0,44.997030,0> translate<15.456500,0.000000,22.163500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.234000,0.000000,5.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.507500,0.000000,5.926000>}
box{<0,0,-0.127000><2.273500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.234000,0.000000,5.926000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.468000,-1.535000,14.999000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.544000,-1.535000,14.999000>}
box{<0,0,-0.152400><4.076000,0.035000,0.152400> rotate<0,0.000000,0> translate<13.468000,-1.535000,14.999000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.277000,-1.535000,5.969000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.592000,-1.535000,5.969000>}
box{<0,0,-0.127000><2.315000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.277000,-1.535000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.592000,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.592000,-1.535000,5.969000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.592000,-1.535000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.494000,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.592000,-1.535000,9.144000>}
box{<0,0,-0.152400><2.098000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.494000,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.919500,-1.535000,3.810000>}
box{<0,0,-0.152400><13.839500,0.035000,0.152400> rotate<0,0.000000,0> translate<5.080000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.919500,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.037000,-1.535000,3.927500>}
box{<0,0,-0.152400><0.166170,0.035000,0.152400> rotate<0,-44.997030,0> translate<18.919500,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.037000,-1.535000,3.927500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.037000,-1.535000,3.967000>}
box{<0,0,-0.152400><0.039500,0.035000,0.152400> rotate<0,90.000000,0> translate<19.037000,-1.535000,3.967000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.037000,-1.535000,3.967000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.488500,-1.535000,4.418500>}
box{<0,0,-0.152400><0.638517,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.037000,-1.535000,3.967000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.488500,-1.535000,4.418500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.488500,-1.535000,5.965500>}
box{<0,0,-0.152400><1.547000,0.035000,0.152400> rotate<0,90.000000,0> translate<19.488500,-1.535000,5.965500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.488500,-1.535000,5.965500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.492000,-1.535000,5.969000>}
box{<0,0,-0.152400><0.004950,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.488500,-1.535000,5.965500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.072000,0.000000,1.821500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.705500,0.000000,1.821500>}
box{<0,0,-0.127000><0.633500,0.035000,0.127000> rotate<0,0.000000,0> translate<19.072000,0.000000,1.821500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.401000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,-1.535000,17.780000>}
box{<0,0,-0.406400><6.919000,0.035000,0.406400> rotate<0,0.000000,0> translate<13.401000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.321000,0.000000,17.780000>}
box{<0,0,-0.406400><5.081000,0.035000,0.406400> rotate<0,0.000000,0> translate<15.240000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.705500,0.000000,1.821500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.973000,0.000000,0.554000>}
box{<0,0,-0.127000><1.792516,0.035000,0.127000> rotate<0,44.997030,0> translate<19.705500,0.000000,1.821500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.492000,-1.535000,5.969000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.066500,-1.535000,5.969000>}
box{<0,0,-0.152400><1.574500,0.035000,0.152400> rotate<0,0.000000,0> translate<19.492000,-1.535000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.079000,0.000000,18.425500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.079000,0.000000,18.269000>}
box{<0,0,-0.127000><0.156500,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.079000,0.000000,18.269000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.444000,-1.535000,14.999000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.349000,-1.535000,14.999000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,0.000000,0> translate<19.444000,-1.535000,14.999000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.507500,0.000000,5.926000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.612000,0.000000,1.821500>}
box{<0,0,-0.127000><5.804640,0.035000,0.127000> rotate<0,44.997030,0> translate<17.507500,0.000000,5.926000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.079000,0.000000,18.425500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.913000,0.000000,19.259500>}
box{<0,0,-0.127000><1.179454,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.079000,0.000000,18.425500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.913000,0.000000,19.372000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.913000,0.000000,19.259500>}
box{<0,0,-0.127000><0.112500,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.913000,0.000000,19.259500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.321000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.913000,0.000000,19.372000>}
box{<0,0,-0.406400><2.251428,0.035000,0.406400> rotate<0,-44.997030,0> translate<20.321000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.913000,0.000000,19.372000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.913000,0.000000,22.425000>}
box{<0,0,-0.406400><3.053000,0.035000,0.406400> rotate<0,90.000000,0> translate<21.913000,0.000000,22.425000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.913000,0.000000,22.425000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.916500,0.000000,22.428500>}
box{<0,0,-0.406400><0.004950,0.035000,0.406400> rotate<0,-44.997030,0> translate<21.913000,0.000000,22.425000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.066500,-1.535000,5.969000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.078000,-1.535000,6.980500>}
box{<0,0,-0.152400><1.430477,0.035000,0.152400> rotate<0,-44.997030,0> translate<21.066500,-1.535000,5.969000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.078000,0.000000,6.980500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.078000,0.000000,11.938500>}
box{<0,0,-0.152400><4.958000,0.035000,0.152400> rotate<0,90.000000,0> translate<22.078000,0.000000,11.938500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.349000,-1.535000,14.999000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.834500,-1.535000,16.484500>}
box{<0,0,-0.127000><2.100814,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.349000,-1.535000,14.999000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,20.320000>}
box{<0,0,-0.406400><3.592102,0.035000,0.406400> rotate<0,-44.997030,0> translate<20.320000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.079000,0.000000,18.269000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.863500,0.000000,16.484500>}
box{<0,0,-0.127000><2.523664,0.035000,0.127000> rotate<0,44.997030,0> translate<21.079000,0.000000,18.269000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.834500,-1.535000,16.484500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.863500,-1.535000,16.484500>}
box{<0,0,-0.127000><0.029000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.834500,-1.535000,16.484500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.863500,0.000000,16.484500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.863500,0.000000,16.513500>}
box{<0,0,-0.127000><0.029000,0.035000,0.127000> rotate<0,90.000000,0> translate<22.863500,0.000000,16.513500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.492000,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.893500,-1.535000,9.144000>}
box{<0,0,-0.152400><3.401500,0.035000,0.152400> rotate<0,0.000000,0> translate<19.492000,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.863500,0.000000,16.513500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,17.780000>}
box{<0,0,-0.127000><1.791101,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.863500,0.000000,16.513500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.152000,-1.535000,5.058000>}
box{<0,0,-0.127000><0.031113,0.035000,0.127000> rotate<0,44.997030,0> translate<24.130000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.152000,-1.535000,1.821500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.152000,-1.535000,5.058000>}
box{<0,0,-0.127000><3.236500,0.035000,0.127000> rotate<0,90.000000,0> translate<24.152000,-1.535000,5.058000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.893500,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.183000,-1.535000,7.854500>}
box{<0,0,-0.152400><1.823628,0.035000,0.152400> rotate<0,44.997030,0> translate<22.893500,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.888000,-1.535000,20.320000>}
box{<0,0,-0.406400><2.028000,0.035000,0.406400> rotate<0,0.000000,0> translate<22.860000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.916500,-1.535000,22.428500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.888000,-1.535000,25.400000>}
box{<0,0,-0.406400><4.202336,0.035000,0.406400> rotate<0,-44.997030,0> translate<21.916500,-1.535000,22.428500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,-1.535000,20.320000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.860000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,-1.535000,20.744500>}
box{<0,0,-0.127000><0.424500,0.035000,0.127000> rotate<0,90.000000,0> translate<25.400000,-1.535000,20.744500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.078000,0.000000,11.938500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.788000,0.000000,15.648500>}
box{<0,0,-0.152400><5.246732,0.035000,0.152400> rotate<0,-44.997030,0> translate<22.078000,0.000000,11.938500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.973000,0.000000,0.554000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.042500,0.000000,0.554000>}
box{<0,0,-0.127000><5.069500,0.035000,0.127000> rotate<0,0.000000,0> translate<20.973000,0.000000,0.554000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.163500,-1.535000,7.113500>}
box{<0,0,-0.127000><2.875803,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.130000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.163500,-1.535000,7.113500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.163500,-1.535000,11.077000>}
box{<0,0,-0.127000><3.963500,0.035000,0.127000> rotate<0,90.000000,0> translate<26.163500,-1.535000,11.077000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.163500,0.000000,11.077000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.412500,0.000000,11.326000>}
box{<0,0,-0.127000><0.352139,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.163500,0.000000,11.077000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.412500,0.000000,11.326000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.412500,0.000000,14.464500>}
box{<0,0,-0.127000><3.138500,0.035000,0.127000> rotate<0,90.000000,0> translate<26.412500,0.000000,14.464500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.042500,0.000000,0.554000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.692000,0.000000,1.203500>}
box{<0,0,-0.127000><0.918532,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.042500,0.000000,0.554000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.692000,0.000000,1.203500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.692000,0.000000,1.821500>}
box{<0,0,-0.127000><0.618000,0.035000,0.127000> rotate<0,90.000000,0> translate<26.692000,0.000000,1.821500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.412500,0.000000,14.464500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.953000,0.000000,15.005000>}
box{<0,0,-0.127000><0.764382,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.412500,0.000000,14.464500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,-1.535000,20.744500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.986500,-1.535000,22.331000>}
box{<0,0,-0.127000><2.243650,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.400000,-1.535000,20.744500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.888000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.996500,-1.535000,22.428500>}
box{<0,0,-0.406400><2.981869,0.035000,0.406400> rotate<0,-44.997030,0> translate<24.888000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.996500,-1.535000,22.428500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.170500,-1.535000,22.254500>}
box{<0,0,-0.406400><0.246073,0.035000,0.406400> rotate<0,44.997030,0> translate<26.996500,-1.535000,22.428500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.692000,0.000000,1.203500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.324000,0.000000,0.571500>}
box{<0,0,-0.127000><0.893783,0.035000,0.127000> rotate<0,44.997030,0> translate<26.692000,0.000000,1.203500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,17.780000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.130000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.938100,0.000000,15.663100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.946200,0.000000,15.655000>}
box{<0,0,-0.127000><0.011455,0.035000,0.127000> rotate<0,44.997030,0> translate<27.938100,0.000000,15.663100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.938100,0.000000,15.663100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.081300,0.000000,15.663700>}
box{<0,0,-0.127000><0.143201,0.035000,0.127000> rotate<0,-0.240049,0> translate<27.938100,0.000000,15.663100> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.788000,0.000000,15.648500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.087500,0.000000,15.648500>}
box{<0,0,-0.152400><2.299500,0.035000,0.152400> rotate<0,0.000000,0> translate<25.788000,0.000000,15.648500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.183000,0.000000,7.854500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.093500,0.000000,7.854500>}
box{<0,0,-0.152400><3.910500,0.035000,0.152400> rotate<0,0.000000,0> translate<24.183000,0.000000,7.854500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.093500,0.000000,7.854500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.094000,0.000000,7.855000>}
box{<0,0,-0.152400><0.000707,0.035000,0.152400> rotate<0,-44.997030,0> translate<28.093500,0.000000,7.854500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.953000,0.000000,15.005000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.094000,0.000000,15.005000>}
box{<0,0,-0.127000><1.141000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.953000,0.000000,15.005000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.946200,0.000000,15.655000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.094000,0.000000,15.655000>}
box{<0,0,-0.127000><0.147800,0.035000,0.127000> rotate<0,0.000000,0> translate<27.946200,0.000000,15.655000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.087500,0.000000,15.648500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.094000,0.000000,15.655000>}
box{<0,0,-0.152400><0.009192,0.035000,0.152400> rotate<0,-44.997030,0> translate<28.087500,0.000000,15.648500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.094000,0.000000,11.105000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.097000,0.000000,11.102000>}
box{<0,0,-0.127000><0.004243,0.035000,0.127000> rotate<0,44.997030,0> translate<28.094000,0.000000,11.105000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.332000,-1.535000,12.700000>}
box{<0,0,-0.127000><13.092000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.240000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.857500,-1.535000,12.099500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.620000,-1.535000,12.099500>}
box{<0,0,-0.127000><12.762500,0.035000,0.127000> rotate<0,0.000000,0> translate<15.857500,-1.535000,12.099500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.097000,0.000000,11.102000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.129000,0.000000,11.102000>}
box{<0,0,-0.127000><1.032000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.097000,0.000000,11.102000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.129000,0.000000,11.102000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,0.000000,11.183000>}
box{<0,0,-0.152400><0.114551,0.035000,0.152400> rotate<0,-44.997030,0> translate<29.129000,0.000000,11.102000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,11.183000>}
box{<0,0,-0.127000><5.327000,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.210000,0.000000,11.183000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,16.510000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<27.940000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.213000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.213000,0.000000,1.840500>}
box{<0,0,-0.127000><3.239500,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.213000,0.000000,1.840500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.213000,0.000000,5.080000>}
box{<0,0,-0.152400><0.003000,0.035000,0.152400> rotate<0,0.000000,0> translate<29.210000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.213000,0.000000,1.840500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.232000,0.000000,1.821500>}
box{<0,0,-0.127000><0.026870,0.035000,0.127000> rotate<0,44.997030,0> translate<29.213000,0.000000,1.840500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.094000,0.000000,7.855000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.327000,0.000000,7.855000>}
box{<0,0,-0.152400><1.233000,0.035000,0.152400> rotate<0,0.000000,0> translate<28.094000,0.000000,7.855000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.457500,0.000000,10.935500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.457500,0.000000,10.076000>}
box{<0,0,-0.127000><0.859500,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.457500,0.000000,10.076000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,11.183000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.457500,0.000000,10.935500>}
box{<0,0,-0.127000><0.350018,0.035000,0.127000> rotate<0,44.997030,0> translate<29.210000,0.000000,11.183000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.448000,-1.535000,11.649500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.464500,-1.535000,11.633000>}
box{<0,0,-0.127000><0.023335,0.035000,0.127000> rotate<0,44.997030,0> translate<29.448000,-1.535000,11.649500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.464500,-1.535000,7.477000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.464500,-1.535000,11.633000>}
box{<0,0,-0.127000><4.156000,0.035000,0.127000> rotate<0,90.000000,0> translate<29.464500,-1.535000,11.633000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.213000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.692500,0.000000,5.559500>}
box{<0,0,-0.152400><0.678115,0.035000,0.152400> rotate<0,-44.997030,0> translate<29.213000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.692500,0.000000,7.489500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.692500,0.000000,5.559500>}
box{<0,0,-0.152400><1.930000,0.035000,0.152400> rotate<0,-90.000000,0> translate<29.692500,0.000000,5.559500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.327000,0.000000,7.855000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.692500,0.000000,7.489500>}
box{<0,0,-0.152400><0.516895,0.035000,0.152400> rotate<0,44.997030,0> translate<29.327000,0.000000,7.855000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.457500,0.000000,10.076000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.725000,0.000000,9.808500>}
box{<0,0,-0.127000><0.378302,0.035000,0.127000> rotate<0,44.997030,0> translate<29.457500,0.000000,10.076000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.324000,0.000000,0.571500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.907000,0.000000,0.571500>}
box{<0,0,-0.127000><2.583000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.324000,0.000000,0.571500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.725000,0.000000,9.808500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.368500,0.000000,9.808500>}
box{<0,0,-0.127000><0.643500,0.035000,0.127000> rotate<0,0.000000,0> translate<29.725000,0.000000,9.808500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.368500,0.000000,9.808500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.372000,0.000000,9.805000>}
box{<0,0,-0.127000><0.004950,0.035000,0.127000> rotate<0,44.997030,0> translate<30.368500,0.000000,9.808500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,-1.535000,10.795000>}
box{<0,0,-0.127000><0.635000,0.035000,0.127000> rotate<0,90.000000,0> translate<30.480000,-1.535000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.372000,0.000000,9.805000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.493000,0.000000,9.805000>}
box{<0,0,-0.127000><0.121000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.372000,0.000000,9.805000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.448000,-1.535000,11.649500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.504000,-1.535000,12.705500>}
box{<0,0,-0.127000><1.493410,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.448000,-1.535000,11.649500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.504000,-1.535000,12.705500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.504000,-1.535000,12.706000>}
box{<0,0,-0.127000><0.000500,0.035000,0.127000> rotate<0,90.000000,0> translate<30.504000,-1.535000,12.706000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.907000,0.000000,0.571500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.508000,0.000000,1.172500>}
box{<0,0,-0.127000><0.849942,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.907000,0.000000,0.571500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.493000,0.000000,9.805000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.513000,0.000000,8.966500>}
box{<0,0,-0.127000><0.838738,0.035000,0.127000> rotate<0,88.627784,0> translate<30.493000,0.000000,9.805000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.508000,0.000000,1.172500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.513000,0.000000,8.966500>}
box{<0,0,-0.127000><7.794002,0.035000,0.127000> rotate<0,-89.957306,0> translate<30.508000,0.000000,1.172500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.504000,0.000000,12.706000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.518000,0.000000,12.692000>}
box{<0,0,-0.127000><0.019799,0.035000,0.127000> rotate<0,44.997030,0> translate<30.504000,0.000000,12.706000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.620000,-1.535000,12.099500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.666500,-1.535000,14.146000>}
box{<0,0,-0.127000><2.894188,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.620000,-1.535000,12.099500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.666500,-1.535000,14.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.899000,-1.535000,14.146000>}
box{<0,0,-0.127000><0.232500,0.035000,0.127000> rotate<0,0.000000,0> translate<30.666500,-1.535000,14.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.899000,0.000000,14.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.978500,0.000000,14.135000>}
box{<0,0,-0.127000><0.080257,0.035000,0.127000> rotate<0,7.877180,0> translate<30.899000,0.000000,14.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.518000,0.000000,12.692000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.994000,0.000000,12.692000>}
box{<0,0,-0.127000><0.476000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.518000,0.000000,12.692000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.332000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.057000,-1.535000,15.685000>}
box{<0,0,-0.127000><4.041763,0.035000,0.127000> rotate<0,-47.603972,0> translate<28.332000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,-1.535000,8.890000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<30.480000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,-1.535000,8.890000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<31.750000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.978500,0.000000,14.135000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.834500,0.000000,14.991000>}
box{<0,0,-0.127000><1.210567,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.978500,0.000000,14.135000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.986500,-1.535000,22.331000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.191500,-1.535000,22.331000>}
box{<0,0,-0.127000><5.205000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.986500,-1.535000,22.331000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.375000,-1.535000,16.265500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.380500,-1.535000,16.271000>}
box{<0,0,-0.127000><0.007778,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.375000,-1.535000,16.265500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.380500,-1.535000,22.142000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.380500,-1.535000,16.271000>}
box{<0,0,-0.127000><5.871000,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.380500,-1.535000,16.271000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.191500,-1.535000,22.331000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.380500,-1.535000,22.142000>}
box{<0,0,-0.127000><0.267286,0.035000,0.127000> rotate<0,44.997030,0> translate<32.191500,-1.535000,22.331000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,6.985000>}
box{<0,0,-0.127000><4.445000,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.385000,-1.535000,6.985000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.375000,-1.535000,16.265500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,11.430000>}
box{<0,0,-0.127000><4.835510,0.035000,0.127000> rotate<0,89.875578,0> translate<32.375000,-1.535000,16.265500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.994000,0.000000,12.692000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.657000,0.000000,14.355000>}
box{<0,0,-0.127000><2.351837,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.994000,0.000000,12.692000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,-1.535000,6.347500>}
box{<0,0,-0.127000><0.002500,0.035000,0.127000> rotate<0,-90.000000,0> translate<33.020000,-1.535000,6.347500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,-1.535000,6.985000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,-1.535000,6.350000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,44.997030,0> translate<32.385000,-1.535000,6.985000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.772000,-1.535000,1.821500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.067500,-1.535000,0.526000>}
box{<0,0,-0.127000><1.832114,0.035000,0.127000> rotate<0,44.997030,0> translate<31.772000,-1.535000,1.821500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.244000,0.000000,13.716000>}
box{<0,0,-0.127000><4.021435,0.035000,0.127000> rotate<0,-46.578835,0> translate<30.480000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.298000,0.000000,10.471500>}
box{<0,0,-0.127000><1.323741,0.035000,0.127000> rotate<0,46.389642,0> translate<32.385000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.528000,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.528000,-1.535000,12.446000>}
box{<0,0,-0.127000><5.334000,0.035000,0.127000> rotate<0,90.000000,0> translate<33.528000,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.528000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.137000,0.000000,13.055000>}
box{<0,0,-0.127000><0.861256,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.528000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.464500,-1.535000,7.477000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.312000,-1.535000,2.629500>}
box{<0,0,-0.127000><6.855400,0.035000,0.127000> rotate<0,44.997030,0> translate<29.464500,-1.535000,7.477000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.312000,-1.535000,1.821500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.312000,-1.535000,2.629500>}
box{<0,0,-0.127000><0.808000,0.035000,0.127000> rotate<0,90.000000,0> translate<34.312000,-1.535000,2.629500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.244000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.417000,0.000000,13.716000>}
box{<0,0,-0.127000><1.173000,0.035000,0.127000> rotate<0,0.000000,0> translate<33.244000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.057000,0.000000,15.685000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.371000,0.000000,15.690000>}
box{<0,0,-0.127000><4.314003,0.035000,0.127000> rotate<0,-0.066402,0> translate<31.057000,0.000000,15.685000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.834500,0.000000,14.991000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.392000,0.000000,14.991000>}
box{<0,0,-0.127000><3.557500,0.035000,0.127000> rotate<0,0.000000,0> translate<31.834500,0.000000,14.991000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.493000,0.000000,9.805000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,9.805000>}
box{<0,0,-0.127000><4.913000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.493000,0.000000,9.805000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.298000,0.000000,10.471500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,10.455000>}
box{<0,0,-0.127000><2.108065,0.035000,0.127000> rotate<0,0.448434,0> translate<33.298000,0.000000,10.471500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.137000,0.000000,13.055000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,13.055000>}
box{<0,0,-0.127000><1.269000,0.035000,0.127000> rotate<0,0.000000,0> translate<34.137000,0.000000,13.055000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.417000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,13.705000>}
box{<0,0,-0.127000><0.989061,0.035000,0.127000> rotate<0,0.637195,0> translate<34.417000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.657000,0.000000,14.355000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,14.355000>}
box{<0,0,-0.127000><2.749000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.657000,0.000000,14.355000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.392000,0.000000,14.991000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,15.005000>}
box{<0,0,-0.127000><0.019799,0.035000,0.127000> rotate<0,-44.997030,0> translate<35.392000,0.000000,14.991000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.371000,0.000000,15.690000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,15.655000>}
box{<0,0,-0.127000><0.049497,0.035000,0.127000> rotate<0,44.997030,0> translate<35.371000,0.000000,15.690000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,11.755000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.407500,0.000000,11.753500>}
box{<0,0,-0.127000><0.002121,0.035000,0.127000> rotate<0,44.997030,0> translate<35.406000,0.000000,11.755000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,11.105000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.410500,0.000000,11.109500>}
box{<0,0,-0.127000><0.006364,0.035000,0.127000> rotate<0,-44.997030,0> translate<35.406000,0.000000,11.105000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,12.405000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.411000,0.000000,12.400000>}
box{<0,0,-0.127000><0.007071,0.035000,0.127000> rotate<0,44.997030,0> translate<35.406000,0.000000,12.405000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,9.805000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.432000,0.000000,9.779000>}
box{<0,0,-0.127000><0.036770,0.035000,0.127000> rotate<0,44.997030,0> translate<35.406000,0.000000,9.805000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.406000,0.000000,10.455000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.447000,0.000000,10.414000>}
box{<0,0,-0.127000><0.057983,0.035000,0.127000> rotate<0,44.997030,0> translate<35.406000,0.000000,10.455000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.528000,-1.535000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.560000,-1.535000,5.080000>}
box{<0,0,-0.127000><2.873682,0.035000,0.127000> rotate<0,44.997030,0> translate<33.528000,-1.535000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,-1.535000,6.347500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.267500,-1.535000,3.100000>}
box{<0,0,-0.127000><4.592659,0.035000,0.127000> rotate<0,44.997030,0> translate<33.020000,-1.535000,6.347500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.278500,-1.535000,1.821500>}
box{<0,0,-0.127000><6.404266,0.035000,0.127000> rotate<0,44.997030,0> translate<31.750000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.411000,0.000000,12.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.507500,0.000000,12.400000>}
box{<0,0,-0.127000><1.096500,0.035000,0.127000> rotate<0,0.000000,0> translate<35.411000,0.000000,12.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.407500,0.000000,11.753500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.635000,0.000000,11.753500>}
box{<0,0,-0.127000><1.227500,0.035000,0.127000> rotate<0,0.000000,0> translate<35.407500,0.000000,11.753500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.410500,0.000000,11.109500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.738000,0.000000,11.109500>}
box{<0,0,-0.127000><1.327500,0.035000,0.127000> rotate<0,0.000000,0> translate<35.410500,0.000000,11.109500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.278500,-1.535000,1.821500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.852000,-1.535000,1.821500>}
box{<0,0,-0.127000><0.573500,0.035000,0.127000> rotate<0,0.000000,0> translate<36.278500,-1.535000,1.821500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.432000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.084000,0.000000,9.779000>}
box{<0,0,-0.127000><1.652000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.432000,0.000000,9.779000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.447000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.338000,0.000000,10.414000>}
box{<0,0,-0.127000><1.891000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.447000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.067500,-1.535000,0.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.470500,-1.535000,0.526000>}
box{<0,0,-0.127000><4.403000,0.035000,0.127000> rotate<0,0.000000,0> translate<33.067500,-1.535000,0.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.267500,-1.535000,3.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.540000,-1.535000,3.100000>}
box{<0,0,-0.127000><1.272500,0.035000,0.127000> rotate<0,0.000000,0> translate<36.267500,-1.535000,3.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.507500,0.000000,12.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.575000,0.000000,13.467500>}
box{<0,0,-0.127000><1.509673,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.507500,0.000000,12.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.575000,0.000000,13.467500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.575000,0.000000,17.210000>}
box{<0,0,-0.127000><3.742500,0.035000,0.127000> rotate<0,90.000000,0> translate<37.575000,0.000000,17.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.470500,-1.535000,0.526000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,1.155500>}
box{<0,0,-0.127000><0.890247,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.470500,-1.535000,0.526000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,1.155500>}
box{<0,0,-0.127000><1.384500,0.035000,0.127000> rotate<0,-90.000000,0> translate<38.100000,-1.535000,1.155500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.540000,-1.535000,3.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,2.540000>}
box{<0,0,-0.127000><0.791960,0.035000,0.127000> rotate<0,44.997030,0> translate<37.540000,-1.535000,3.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.560000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,5.080000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.560000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.635000,0.000000,11.753500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,0.000000,13.218500>}
box{<0,0,-0.127000><2.071823,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.635000,0.000000,11.753500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,0.000000,13.218500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,0.000000,15.240000>}
box{<0,0,-0.127000><2.021500,0.035000,0.127000> rotate<0,90.000000,0> translate<38.100000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.738000,0.000000,11.109500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.201500,0.000000,12.573000>}
box{<0,0,-0.127000><2.069702,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.738000,0.000000,11.109500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.338000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.216000,0.000000,9.536000>}
box{<0,0,-0.127000><1.241680,0.035000,0.127000> rotate<0,44.997030,0> translate<37.338000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.227000,0.000000,15.367000>}
box{<0,0,-0.127000><0.179605,0.035000,0.127000> rotate<0,-44.997030,0> translate<38.100000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.575000,0.000000,17.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.526000,0.000000,18.161000>}
box{<0,0,-0.127000><1.344917,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.575000,0.000000,17.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.084000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.127000,0.000000,7.736000>}
box{<0,0,-0.127000><2.889238,0.035000,0.127000> rotate<0,44.997030,0> translate<37.084000,0.000000,9.779000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.201500,0.000000,12.573000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.309000,0.000000,12.573000>}
box{<0,0,-0.127000><1.107500,0.035000,0.127000> rotate<0,0.000000,0> translate<38.201500,0.000000,12.573000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.227000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.309000,0.000000,15.367000>}
box{<0,0,-0.127000><1.082000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.227000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.526000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.309000,0.000000,18.161000>}
box{<0,0,-0.127000><0.783000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.526000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,-1.535000,3.810000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<38.100000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,-1.535000,1.843500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,-1.535000,3.810000>}
box{<0,0,-0.127000><1.966500,0.035000,0.127000> rotate<0,90.000000,0> translate<39.370000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.127000,0.000000,7.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,0.000000,7.736000>}
box{<0,0,-0.127000><0.243000,0.035000,0.127000> rotate<0,0.000000,0> translate<39.127000,0.000000,7.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.216000,0.000000,9.536000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,0.000000,9.536000>}
box{<0,0,-0.127000><1.154000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.216000,0.000000,9.536000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,-1.535000,1.843500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.392000,-1.535000,1.821500>}
box{<0,0,-0.127000><0.031113,0.035000,0.127000> rotate<0,44.997030,0> translate<39.370000,-1.535000,1.843500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.170500,-1.535000,22.254500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.008500,-1.535000,22.254500>}
box{<0,0,-0.406400><12.838000,0.035000,0.406400> rotate<0,0.000000,0> translate<27.170500,-1.535000,22.254500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.008500,-1.535000,22.254500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.614000,-1.535000,22.860000>}
box{<0,0,-0.406400><0.856306,0.035000,0.406400> rotate<0,-44.997030,0> translate<40.008500,-1.535000,22.254500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.209000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.037000,0.000000,12.573000>}
box{<0,0,-0.127000><0.828000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.209000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.209000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.291000,0.000000,18.161000>}
box{<0,0,-0.127000><1.082000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.209000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.209000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.046000,0.000000,15.367000>}
box{<0,0,-0.127000><1.837000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.209000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.046000,0.000000,15.367000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.179000,0.000000,15.500000>}
box{<0,0,-0.127000><0.188090,0.035000,0.127000> rotate<0,-44.997030,0> translate<43.046000,0.000000,15.367000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,8.890000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,-90.000000,0> translate<43.180000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.037000,0.000000,12.573000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,11.430000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,44.997030,0> translate<42.037000,0.000000,12.573000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.291000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,19.050000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.291000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,21.590000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<43.180000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.187000,0.000000,8.890000>}
box{<0,0,-0.127000><0.007000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.180000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.187000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.193500,0.000000,7.883500>}
box{<0,0,-0.127000><1.423406,0.035000,0.127000> rotate<0,44.997030,0> translate<43.187000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,22.860000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<43.180000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.828500,0.000000,16.939500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.828500,0.000000,21.791000>}
box{<0,0,-0.406400><4.851500,0.035000,0.406400> rotate<0,90.000000,0> translate<44.828500,0.000000,21.791000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.828500,0.000000,21.791000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.906500,0.000000,21.869000>}
box{<0,0,-0.406400><0.110309,0.035000,0.406400> rotate<0,-44.997030,0> translate<44.828500,0.000000,21.791000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.174500,0.000000,16.412000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.174500,0.000000,19.139500>}
box{<0,0,-0.127000><2.727500,0.035000,0.127000> rotate<0,90.000000,0> translate<45.174500,0.000000,19.139500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.174500,0.000000,19.139500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.190500,0.000000,19.139500>}
box{<0,0,-0.127000><0.016000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.174500,0.000000,19.139500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.190500,0.000000,19.139500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.190500,0.000000,20.697500>}
box{<0,0,-0.127000><1.558000,0.035000,0.127000> rotate<0,90.000000,0> translate<45.190500,0.000000,20.697500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.174500,0.000000,16.412000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.272500,0.000000,16.510000>}
box{<0,0,-0.127000><0.138593,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.174500,0.000000,16.412000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.585000,0.000000,22.860000>}
box{<0,0,-0.127000><2.135000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.450000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.179000,0.000000,15.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.718000,0.000000,15.500000>}
box{<0,0,-0.127000><3.539000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.179000,0.000000,15.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.193500,0.000000,7.883500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.721500,0.000000,7.883500>}
box{<0,0,-0.127000><2.528000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.193500,0.000000,7.883500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.721500,0.000000,7.883500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.726000,0.000000,7.888000>}
box{<0,0,-0.127000><0.006364,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.721500,0.000000,7.883500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.718000,0.000000,15.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.726000,0.000000,15.508000>}
box{<0,0,-0.127000><0.011314,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.718000,0.000000,15.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.585000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.726000,0.000000,23.001000>}
box{<0,0,-0.127000><0.199404,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.585000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.720000,0.000000,5.604000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,0.000000,5.588000>}
box{<0,0,-0.127000><0.022627,0.035000,0.127000> rotate<0,44.997030,0> translate<46.720000,0.000000,5.604000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.190500,0.000000,20.697500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,0.000000,20.697500>}
box{<0,0,-0.127000><1.545500,0.035000,0.127000> rotate<0,0.000000,0> translate<45.190500,0.000000,20.697500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,0.000000,20.697500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,0.000000,20.701000>}
box{<0,0,-0.127000><0.003500,0.035000,0.127000> rotate<0,90.000000,0> translate<46.736000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.498000,0.000000,13.208000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,0.000000,0> translate<46.736000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.272500,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,0.000000,16.510000>}
box{<0,0,-0.127000><2.987500,0.035000,0.127000> rotate<0,0.000000,0> translate<45.272500,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.614000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<48.260000,-1.535000,22.860000>}
box{<0,0,-0.406400><7.646000,0.035000,0.406400> rotate<0,0.000000,0> translate<40.614000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.736000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.022000,0.000000,13.208000>}
box{<0,0,-0.406400><2.286000,0.035000,0.406400> rotate<0,0.000000,0> translate<46.736000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.288500,0.000000,13.208000>}
box{<0,0,-0.127000><2.552500,0.035000,0.127000> rotate<0,0.000000,0> translate<46.736000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.022000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,0.000000,12.700000>}
box{<0,0,-0.406400><0.718420,0.035000,0.406400> rotate<0,44.997030,0> translate<49.022000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.530000,0.000000,16.510000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<48.260000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,0.000000,16.510000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,90.000000,0> translate<49.530000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,0.000000,16.635500>}
box{<0,0,-0.406400><0.125500,0.035000,0.406400> rotate<0,90.000000,0> translate<49.530000,0.000000,16.635500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.595500,0.000000,4.485000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.789500,0.000000,4.484500>}
box{<0,0,-0.127000><1.194000,0.035000,0.127000> rotate<0,0.023992,0> translate<48.595500,0.000000,4.485000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.828500,0.000000,16.939500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.834000,0.000000,16.939500>}
box{<0,0,-0.406400><5.005500,0.035000,0.406400> rotate<0,0.000000,0> translate<44.828500,0.000000,16.939500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.530000,0.000000,16.635500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<49.834000,0.000000,16.939500>}
box{<0,0,-0.406400><0.429921,0.035000,0.406400> rotate<0,-44.997030,0> translate<49.530000,0.000000,16.635500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.288500,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.874000,0.000000,13.433000>}
box{<0,0,-0.127000><0.627244,0.035000,0.127000> rotate<0,-21.019728,0> translate<49.288500,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.530000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.881000,0.000000,14.646500>}
box{<0,0,-0.127000><1.896268,0.035000,0.127000> rotate<0,79.327779,0> translate<49.530000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.874000,0.000000,13.433000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.881000,0.000000,14.646500>}
box{<0,0,-0.127000><1.213520,0.035000,0.127000> rotate<0,-89.663579,0> translate<49.874000,0.000000,13.433000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.288500,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.816000,0.000000,13.208000>}
box{<0,0,-0.127000><2.527500,0.035000,0.127000> rotate<0,0.000000,0> translate<49.288500,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.816000,0.000000,20.701000>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,0.000000,0> translate<46.736000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.726000,0.000000,3.288000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.892000,0.000000,3.288000>}
box{<0,0,-0.406400><8.166000,0.035000,0.406400> rotate<0,0.000000,0> translate<46.726000,0.000000,3.288000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.726000,0.000000,10.908000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<56.933000,0.000000,10.908000>}
box{<0,0,-0.406400><10.207000,0.035000,0.406400> rotate<0,0.000000,0> translate<46.726000,0.000000,10.908000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.888000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,-1.535000,25.400000>}
box{<0,0,-0.406400><32.262000,0.035000,0.406400> rotate<0,0.000000,0> translate<24.888000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<46.726000,0.000000,18.401000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.441000,0.000000,18.401000>}
box{<0,0,-0.406400><10.715000,0.035000,0.406400> rotate<0,0.000000,0> translate<46.726000,0.000000,18.401000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<56.933000,0.000000,10.908000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.144500,0.000000,12.119500>}
box{<0,0,-0.406400><1.713320,0.035000,0.406400> rotate<0,-44.997030,0> translate<56.933000,0.000000,10.908000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,-1.535000,22.860000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,-90.000000,0> translate<58.420000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.150000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,-1.535000,24.130000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<57.150000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.144500,0.000000,12.119500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.182500,0.000000,12.119500>}
box{<0,0,-0.406400><3.038000,0.035000,0.406400> rotate<0,0.000000,0> translate<58.144500,0.000000,12.119500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<54.892000,0.000000,3.288000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.183000,0.000000,9.579000>}
box{<0,0,-0.406400><8.896818,0.035000,0.406400> rotate<0,-44.997030,0> translate<54.892000,0.000000,3.288000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.182500,0.000000,12.119500>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.183000,0.000000,12.119000>}
box{<0,0,-0.406400><0.000707,0.035000,0.406400> rotate<0,44.997030,0> translate<61.182500,0.000000,12.119500> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<57.441000,0.000000,18.401000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.183000,0.000000,14.659000>}
box{<0,0,-0.406400><5.291987,0.035000,0.406400> rotate<0,44.997030,0> translate<57.441000,0.000000,18.401000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.183000,-1.535000,20.097000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.183000,-1.535000,17.199000>}
box{<0,0,-0.406400><2.898000,0.035000,0.406400> rotate<0,-90.000000,0> translate<61.183000,-1.535000,17.199000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<58.420000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<61.183000,-1.535000,20.097000>}
box{<0,0,-0.406400><3.907472,0.035000,0.406400> rotate<0,44.997030,0> translate<58.420000,-1.535000,22.860000> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,0.000000>}
box{<0,0,-0.127000><25.400000,0.035000,0.127000> rotate<0,0.000000,0> translate<0.000000,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,-1.535000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,-1.535000,0.000000>}
box{<0,0,-0.127000><33.020000,0.035000,0.127000> rotate<0,0.000000,0> translate<0.000000,-1.535000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,0.000000,0.000000>}
box{<0,0,-0.127000><26.670000,0.035000,0.127000> rotate<0,-90.000000,0> translate<0.000000,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,-1.535000,0.000000>}
box{<0,0,-0.127000><26.670000,0.035000,0.127000> rotate<0,-90.000000,0> translate<0.000000,-1.535000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,26.670000>}
box{<0,0,-0.127000><25.400000,0.035000,0.127000> rotate<0,0.000000,0> translate<0.000000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,-1.535000,26.670000>}
box{<0,0,-0.127000><33.020000,0.035000,0.127000> rotate<0,0.000000,0> translate<0.000000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,26.670000>}
box{<0,0,-0.127000><26.670000,0.035000,0.127000> rotate<0,90.000000,0> translate<25.400000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,-1.535000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.020000,-1.535000,26.670000>}
box{<0,0,-0.127000><26.670000,0.035000,0.127000> rotate<0,90.000000,0> translate<33.020000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,23.876000>}
box{<0,0,-0.127000><21.590000,0.035000,0.127000> rotate<0,90.000000,0> translate<44.450000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,23.876000>}
box{<0,0,-0.304800><21.590000,0.035000,0.304800> rotate<0,90.000000,0> translate<44.450000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.135000,-1.535000,2.216000>}
box{<0,0,-0.304800><12.685193,0.035000,0.304800> rotate<0,0.316153,0> translate<44.450000,-1.535000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,0.000000,2.286000>}
box{<0,0,-0.127000><12.700000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.450000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.164500,-1.535000,23.888000>}
box{<0,0,-0.304800><12.714506,0.035000,0.304800> rotate<0,-0.054072,0> translate<44.450000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.204500,0.000000,23.837000>}
box{<0,0,-0.127000><12.754560,0.035000,0.127000> rotate<0,0.175184,0> translate<44.450000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.135000,-1.535000,2.216000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<57.164500,-1.535000,23.888000>}
box{<0,0,-0.304800><21.672020,0.035000,0.304800> rotate<0,-89.916074,0> translate<57.135000,-1.535000,2.216000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.204500,0.000000,23.837000>}
box{<0,0,-0.127000><21.551069,0.035000,0.127000> rotate<0,-89.849176,0> translate<57.150000,0.000000,2.286000> }
texture{col_pol}
}
#end
union{
cylinder{<5.889000,0.038000,23.485000><5.889000,-1.538000,23.485000>0.508000}
cylinder{<5.889000,0.038000,20.945000><5.889000,-1.538000,20.945000>0.508000}
cylinder{<26.996500,0.038000,22.428500><26.996500,-1.538000,22.428500>0.406400}
cylinder{<21.916500,0.038000,22.428500><21.916500,-1.538000,22.428500>0.406400}
cylinder{<61.183000,0.038000,17.199000><61.183000,-1.538000,17.199000>0.508000}
cylinder{<61.183000,0.038000,14.659000><61.183000,-1.538000,14.659000>0.508000}
cylinder{<61.183000,0.038000,12.119000><61.183000,-1.538000,12.119000>0.508000}
cylinder{<61.183000,0.038000,9.579000><61.183000,-1.538000,9.579000>0.508000}
cylinder{<19.072000,0.038000,1.821500><19.072000,-1.538000,1.821500>0.508000}
cylinder{<21.612000,0.038000,1.821500><21.612000,-1.538000,1.821500>0.508000}
cylinder{<24.152000,0.038000,1.821500><24.152000,-1.538000,1.821500>0.508000}
cylinder{<26.692000,0.038000,1.821500><26.692000,-1.538000,1.821500>0.508000}
cylinder{<29.232000,0.038000,1.821500><29.232000,-1.538000,1.821500>0.508000}
cylinder{<31.772000,0.038000,1.821500><31.772000,-1.538000,1.821500>0.508000}
cylinder{<34.312000,0.038000,1.821500><34.312000,-1.538000,1.821500>0.508000}
cylinder{<36.852000,0.038000,1.821500><36.852000,-1.538000,1.821500>0.508000}
cylinder{<39.392000,0.038000,1.821500><39.392000,-1.538000,1.821500>0.508000}
cylinder{<3.045500,0.038000,18.081000><3.045500,-1.538000,18.081000>0.508000}
cylinder{<3.045500,0.038000,15.541000><3.045500,-1.538000,15.541000>0.508000}
cylinder{<3.045500,0.038000,13.001000><3.045500,-1.538000,13.001000>0.508000}
cylinder{<3.045500,0.038000,10.461000><3.045500,-1.538000,10.461000>0.508000}
cylinder{<3.045500,0.038000,7.921000><3.045500,-1.538000,7.921000>0.508000}
cylinder{<10.682500,0.038000,20.275500><10.682500,-1.538000,20.275500>0.500000}
cylinder{<12.482500,0.038000,20.275500><12.482500,-1.538000,20.275500>0.500000}
cylinder{<14.282500,0.038000,20.275500><14.282500,-1.538000,20.275500>0.500000}
cylinder{<16.082500,0.038000,20.275500><16.082500,-1.538000,20.275500>0.500000}
cylinder{<17.882500,0.038000,20.275500><17.882500,-1.538000,20.275500>0.500000}
//Holes(fast)/Vias
cylinder{<33.528000,0.038000,12.446000><33.528000,-1.538000,12.446000>0.254000 }
cylinder{<22.863500,0.038000,16.484500><22.863500,-1.538000,16.484500>0.300000 }
cylinder{<30.480000,0.038000,10.795000><30.480000,-1.538000,10.795000>0.254000 }
cylinder{<22.078000,0.038000,6.980500><22.078000,-1.538000,6.980500>0.300000 }
cylinder{<24.183000,0.038000,7.854500><24.183000,-1.538000,7.854500>0.300000 }
cylinder{<30.899000,0.038000,14.146000><30.899000,-1.538000,14.146000>0.250000 }
cylinder{<31.057000,0.038000,15.685000><31.057000,-1.538000,15.685000>0.250000 }
cylinder{<26.163500,0.038000,11.077000><26.163500,-1.538000,11.077000>0.250000 }
cylinder{<30.504000,0.038000,12.706000><30.504000,-1.538000,12.706000>0.254000 }
cylinder{<32.385000,0.038000,11.430000><32.385000,-1.538000,11.430000>0.254000 }
cylinder{<49.530000,0.038000,16.510000><49.530000,-1.538000,16.510000>0.250000 }
cylinder{<48.260000,0.038000,16.510000><48.260000,-1.538000,16.510000>0.250000 }
cylinder{<49.881000,0.038000,14.646500><49.881000,-1.538000,14.646500>0.250000 }
cylinder{<49.874000,0.038000,13.433000><49.874000,-1.538000,13.433000>0.250000 }
cylinder{<48.602500,0.038000,21.962500><48.602500,-1.538000,21.962500>0.250000 }
cylinder{<49.820000,0.038000,21.962000><49.820000,-1.538000,21.962000>0.250000 }
cylinder{<49.820000,0.038000,20.798000><49.820000,-1.538000,20.798000>0.250000 }
cylinder{<48.628500,0.038000,19.633500><48.628500,-1.538000,19.633500>0.250000 }
cylinder{<49.820000,0.038000,19.633000><49.820000,-1.538000,19.633000>0.250000 }
cylinder{<53.340000,0.038000,22.860000><53.340000,-1.538000,22.860000>0.250000 }
cylinder{<54.610000,0.038000,22.860000><54.610000,-1.538000,22.860000>0.250000 }
cylinder{<55.880000,0.038000,22.860000><55.880000,-1.538000,22.860000>0.250000 }
cylinder{<54.610000,0.038000,21.590000><54.610000,-1.538000,21.590000>0.250000 }
cylinder{<55.880000,0.038000,21.590000><55.880000,-1.538000,21.590000>0.250000 }
cylinder{<55.880000,0.038000,20.320000><55.880000,-1.538000,20.320000>0.250000 }
cylinder{<54.610000,0.038000,20.320000><54.610000,-1.538000,20.320000>0.250000 }
cylinder{<50.800000,0.038000,16.510000><50.800000,-1.538000,16.510000>0.250000 }
cylinder{<48.743500,0.038000,14.669000><48.743500,-1.538000,14.669000>0.250000 }
cylinder{<48.721500,0.038000,13.442500><48.721500,-1.538000,13.442500>0.250000 }
cylinder{<48.743000,0.038000,12.150000><48.743000,-1.538000,12.150000>0.250000 }
cylinder{<49.859500,0.038000,12.111500><49.859500,-1.538000,12.111500>0.250000 }
cylinder{<52.070000,0.038000,16.510000><52.070000,-1.538000,16.510000>0.250000 }
cylinder{<53.340000,0.038000,16.510000><53.340000,-1.538000,16.510000>0.250000 }
cylinder{<54.610000,0.038000,16.510000><54.610000,-1.538000,16.510000>0.250000 }
cylinder{<55.880000,0.038000,16.510000><55.880000,-1.538000,16.510000>0.250000 }
cylinder{<54.610000,0.038000,15.240000><54.610000,-1.538000,15.240000>0.250000 }
cylinder{<55.880000,0.038000,15.240000><55.880000,-1.538000,15.240000>0.250000 }
cylinder{<54.610000,0.038000,13.970000><54.610000,-1.538000,13.970000>0.250000 }
cylinder{<55.880000,0.038000,13.970000><55.880000,-1.538000,13.970000>0.250000 }
cylinder{<54.610000,0.038000,12.700000><54.610000,-1.538000,12.700000>0.250000 }
cylinder{<55.880000,0.038000,12.700000><55.880000,-1.538000,12.700000>0.250000 }
cylinder{<55.880000,0.038000,8.890000><55.880000,-1.538000,8.890000>0.250000 }
cylinder{<55.880000,0.038000,7.620000><55.880000,-1.538000,7.620000>0.250000 }
cylinder{<55.880000,0.038000,6.350000><55.880000,-1.538000,6.350000>0.250000 }
cylinder{<54.610000,0.038000,5.080000><54.610000,-1.538000,5.080000>0.250000 }
cylinder{<54.610000,0.038000,6.350000><54.610000,-1.538000,6.350000>0.250000 }
cylinder{<54.610000,0.038000,7.620000><54.610000,-1.538000,7.620000>0.250000 }
cylinder{<54.610000,0.038000,8.890000><54.610000,-1.538000,8.890000>0.250000 }
cylinder{<53.340000,0.038000,8.890000><53.340000,-1.538000,8.890000>0.250000 }
cylinder{<53.340000,0.038000,7.620000><53.340000,-1.538000,7.620000>0.250000 }
cylinder{<52.070000,0.038000,8.890000><52.070000,-1.538000,8.890000>0.250000 }
cylinder{<50.800000,0.038000,8.890000><50.800000,-1.538000,8.890000>0.250000 }
cylinder{<49.530000,0.038000,8.890000><49.530000,-1.538000,8.890000>0.250000 }
cylinder{<48.260000,0.038000,8.890000><48.260000,-1.538000,8.890000>0.250000 }
cylinder{<48.595500,0.038000,6.826500><48.595500,-1.538000,6.826500>0.250000 }
cylinder{<49.789500,0.038000,6.811000><49.789500,-1.538000,6.811000>0.250000 }
cylinder{<49.789000,0.038000,5.663000><49.789000,-1.538000,5.663000>0.250000 }
cylinder{<48.595500,0.038000,5.663500><48.595500,-1.538000,5.663500>0.250000 }
cylinder{<48.595500,0.038000,4.485000><48.595500,-1.538000,4.485000>0.250000 }
cylinder{<49.789500,0.038000,4.484500><49.789500,-1.538000,4.484500>0.250000 }
cylinder{<15.240000,0.038000,8.890000><15.240000,-1.538000,8.890000>0.300000 }
cylinder{<49.820000,0.038000,20.798000><49.820000,-1.538000,20.798000>0.250000 }
cylinder{<48.596000,0.038000,20.782500><48.596000,-1.538000,20.782500>0.250000 }
cylinder{<15.234000,0.038000,5.926000><15.234000,-1.538000,5.926000>0.300000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.139700 translate<21.548700,0.000000,24.339100>}
cylinder{<0,0,0><0,0.036000,0>0.139700 translate<22.548600,0.000000,24.339100>}
box{<0,0,-0.139700><0.999900,0.036000,0.139700> rotate<0,0.000000,0> translate<21.548700,0.000000,24.339100> }
cylinder{<0,0,0><0,0.036000,0>0.139700 translate<26.592700,0.000000,24.316600>}
cylinder{<0,0,0><0,0.036000,0>0.139700 translate<27.592600,0.000000,24.316600>}
box{<0,0,-0.139700><0.999900,0.036000,0.139700> rotate<0,0.000000,0> translate<26.592700,0.000000,24.316600> }
cylinder{<0,0,0><0,0.036000,0>0.139700 translate<27.092600,0.000000,24.816600>}
cylinder{<0,0,0><0,0.036000,0>0.139700 translate<27.092600,0.000000,23.816600>}
box{<0,0,-0.139700><1.000000,0.036000,0.139700> rotate<0,-90.000000,0> translate<27.092600,0.000000,23.816600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.835600,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.835600,0.000000,25.896800>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,90.000000,0> translate<28.835600,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.835600,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.369400,0.000000,25.896800>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<28.835600,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.369400,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.547400,0.000000,25.718800>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<29.369400,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.547400,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.547400,0.000000,25.362900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,-90.000000,0> translate<29.547400,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.547400,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.369400,0.000000,25.185000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<29.369400,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.369400,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.835600,0.000000,25.185000>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<28.835600,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.191500,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.547400,0.000000,24.829100>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,44.997030,0> translate<29.191500,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.716700,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.538700,0.000000,25.896800>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<30.538700,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.538700,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.182800,0.000000,25.896800>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<30.182800,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.182800,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.004900,0.000000,25.718800>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<30.004900,0.000000,25.718800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.004900,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.004900,0.000000,25.007000>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.004900,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.004900,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.182800,0.000000,24.829100>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<30.004900,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.182800,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.538700,0.000000,24.829100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<30.182800,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.538700,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.716700,0.000000,25.007000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<30.538700,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.716700,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.716700,0.000000,25.362900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<30.716700,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.716700,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.360800,0.000000,25.362900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<30.360800,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.174200,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.174200,0.000000,25.896800>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,90.000000,0> translate<31.174200,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.174200,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.708000,0.000000,25.896800>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<31.174200,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.708000,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.886000,0.000000,25.718800>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<31.708000,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.886000,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.886000,0.000000,25.540900>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<31.886000,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.886000,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.708000,0.000000,25.362900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,-44.997030,0> translate<31.708000,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.708000,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.886000,0.000000,25.185000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,44.980932,0> translate<31.708000,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.886000,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.886000,0.000000,25.007000>}
box{<0,0,-0.101600><0.178000,0.036000,0.101600> rotate<0,-90.000000,0> translate<31.886000,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.886000,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.708000,0.000000,24.829100>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<31.708000,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.708000,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.174200,0.000000,24.829100>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<31.174200,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.174200,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.708000,0.000000,25.362900>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<31.174200,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.055300,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.877300,0.000000,25.896800>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<32.877300,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.877300,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.521400,0.000000,25.896800>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<32.521400,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.521400,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.343500,0.000000,25.718800>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<32.343500,0.000000,25.718800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.343500,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.343500,0.000000,25.540900>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.343500,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.343500,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.521400,0.000000,25.362900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,45.013128,0> translate<32.343500,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.521400,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.877300,0.000000,25.362900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<32.521400,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.877300,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.055300,0.000000,25.185000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,44.980932,0> translate<32.877300,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.055300,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.055300,0.000000,25.007000>}
box{<0,0,-0.101600><0.178000,0.036000,0.101600> rotate<0,-90.000000,0> translate<33.055300,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.055300,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.877300,0.000000,24.829100>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<32.877300,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.877300,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.521400,0.000000,24.829100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<32.521400,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.521400,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.343500,0.000000,25.007000>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<32.343500,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.690700,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.046600,0.000000,25.540900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<33.690700,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.046600,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.224600,0.000000,25.362900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<34.046600,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.224600,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.224600,0.000000,24.829100>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.224600,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.224600,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.690700,0.000000,24.829100>}
box{<0,0,-0.101600><0.533900,0.036000,0.101600> rotate<0,0.000000,0> translate<33.690700,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.690700,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.512800,0.000000,25.007000>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<33.512800,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.512800,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.690700,0.000000,25.185000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<33.512800,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.690700,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.224600,0.000000,25.185000>}
box{<0,0,-0.101600><0.533900,0.036000,0.101600> rotate<0,0.000000,0> translate<33.690700,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.682100,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.682100,0.000000,24.829100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.682100,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.682100,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.215900,0.000000,24.829100>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<34.682100,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.215900,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.393900,0.000000,25.007000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<35.215900,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.393900,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.393900,0.000000,25.362900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<35.393900,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.393900,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.215900,0.000000,25.540900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<35.215900,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.215900,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.682100,0.000000,25.540900>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<34.682100,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.385200,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.029300,0.000000,24.829100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<36.029300,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.029300,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.851400,0.000000,25.007000>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<35.851400,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.851400,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.851400,0.000000,25.362900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<35.851400,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.851400,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.029300,0.000000,25.540900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<35.851400,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.029300,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.385200,0.000000,25.540900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<36.029300,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.385200,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.563200,0.000000,25.362900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<36.385200,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.563200,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.563200,0.000000,25.185000>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.563200,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.563200,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.851400,0.000000,25.185000>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<35.851400,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.020700,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.020700,0.000000,25.540900>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,90.000000,0> translate<37.020700,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.020700,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.376600,0.000000,25.540900>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<37.020700,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.376600,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.554500,0.000000,25.540900>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,0.000000,0> translate<37.376600,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.995100,0.000000,24.651200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.706900,0.000000,24.651200>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<37.995100,0.000000,24.651200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.876200,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.698200,0.000000,25.896800>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<39.698200,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.698200,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.342300,0.000000,25.896800>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<39.342300,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.342300,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.164400,0.000000,25.718800>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<39.164400,0.000000,25.718800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.164400,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.164400,0.000000,25.007000>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<39.164400,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.164400,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.342300,0.000000,24.829100>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<39.164400,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.342300,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.698200,0.000000,24.829100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<39.342300,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.698200,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.876200,0.000000,25.007000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<39.698200,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.511600,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.867500,0.000000,24.829100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<40.511600,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.867500,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.045500,0.000000,25.007000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<40.867500,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.045500,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.045500,0.000000,25.362900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<41.045500,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.045500,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.867500,0.000000,25.540900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<40.867500,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.867500,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.511600,0.000000,25.540900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<40.511600,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.511600,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.333700,0.000000,25.362900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<40.333700,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.333700,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.333700,0.000000,25.007000>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.333700,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.333700,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.511600,0.000000,24.829100>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<40.333700,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.503000,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.503000,0.000000,25.540900>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,90.000000,0> translate<41.503000,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.503000,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.036800,0.000000,25.540900>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<41.503000,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.036800,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.214800,0.000000,25.362900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<42.036800,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.214800,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.214800,0.000000,24.829100>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,-90.000000,0> translate<42.214800,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.850200,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.850200,0.000000,25.007000>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<42.850200,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.850200,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.028200,0.000000,24.829100>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,44.980932,0> translate<42.850200,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.672300,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.028200,0.000000,25.540900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<42.672300,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.451800,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.451800,0.000000,25.540900>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,90.000000,0> translate<43.451800,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.451800,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.807700,0.000000,25.540900>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<43.451800,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.807700,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.985600,0.000000,25.540900>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,0.000000,0> translate<43.807700,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.604100,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.960000,0.000000,24.829100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<44.604100,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.960000,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.138000,0.000000,25.007000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<44.960000,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.138000,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.138000,0.000000,25.362900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<45.138000,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.138000,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.960000,0.000000,25.540900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<44.960000,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.960000,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.604100,0.000000,25.540900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<44.604100,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.604100,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.426200,0.000000,25.362900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<44.426200,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.426200,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.426200,0.000000,25.007000>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,-90.000000,0> translate<44.426200,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.426200,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.604100,0.000000,24.829100>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<44.426200,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.595500,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.773400,0.000000,25.896800>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,0.000000,0> translate<45.595500,0.000000,25.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.773400,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.773400,0.000000,24.829100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<45.773400,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.595500,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.951400,0.000000,24.829100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<45.595500,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.544300,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.900200,0.000000,24.829100>}
box{<0,0,-0.101600><0.795817,0.036000,0.101600> rotate<0,63.430762,0> translate<47.544300,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.900200,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.256100,0.000000,25.540900>}
box{<0,0,-0.101600><0.795817,0.036000,0.101600> rotate<0,-63.430762,0> translate<47.900200,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.713600,0.000000,25.540900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.069500,0.000000,25.896800>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.713600,0.000000,25.540900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.069500,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.069500,0.000000,24.829100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.069500,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.713600,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.425400,0.000000,24.829100>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<48.713600,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.882900,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.882900,0.000000,25.007000>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,90.000000,0> translate<49.882900,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.882900,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.060800,0.000000,25.007000>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,0.000000,0> translate<49.882900,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.060800,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.060800,0.000000,24.829100>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<50.060800,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.060800,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.882900,0.000000,24.829100>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,0.000000,0> translate<49.882900,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.179300,0.000000,25.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.823400,0.000000,25.718800>}
box{<0,0,-0.101600><0.397931,0.036000,0.101600> rotate<0,-26.569737,0> translate<50.823400,0.000000,25.718800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.823400,0.000000,25.718800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.467500,0.000000,25.362900>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<50.467500,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.467500,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.467500,0.000000,25.007000>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,-90.000000,0> translate<50.467500,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.467500,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.645400,0.000000,24.829100>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<50.467500,0.000000,25.007000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.645400,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.001300,0.000000,24.829100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<50.645400,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.001300,0.000000,24.829100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.179300,0.000000,25.007000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<51.001300,0.000000,24.829100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.179300,0.000000,25.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.179300,0.000000,25.185000>}
box{<0,0,-0.101600><0.178000,0.036000,0.101600> rotate<0,90.000000,0> translate<51.179300,0.000000,25.185000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.179300,0.000000,25.185000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.001300,0.000000,25.362900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,44.980932,0> translate<51.001300,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.001300,0.000000,25.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.467500,0.000000,25.362900>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<50.467500,0.000000,25.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.980100,0.000000,21.495900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.336000,0.000000,21.851800>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<28.980100,0.000000,21.495900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.336000,0.000000,21.851800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.336000,0.000000,20.784100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<29.336000,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.980100,0.000000,20.784100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.691900,0.000000,20.784100>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<28.980100,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.149400,0.000000,21.495900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.505300,0.000000,21.851800>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<30.149400,0.000000,21.495900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.505300,0.000000,21.851800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.505300,0.000000,20.784100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.505300,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.149400,0.000000,20.784100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.861200,0.000000,20.784100>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<30.149400,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.318700,0.000000,21.317900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.030500,0.000000,21.317900>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<31.318700,0.000000,21.317900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.488000,0.000000,21.495900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.843900,0.000000,21.851800>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<32.488000,0.000000,21.495900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.843900,0.000000,21.851800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.843900,0.000000,20.784100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.843900,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.488000,0.000000,20.784100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.199800,0.000000,20.784100>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<32.488000,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.657300,0.000000,21.851800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.369100,0.000000,21.851800>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<33.657300,0.000000,21.851800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.369100,0.000000,21.851800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.369100,0.000000,21.673800>}
box{<0,0,-0.101600><0.178000,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.369100,0.000000,21.673800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.369100,0.000000,21.673800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.657300,0.000000,20.962000>}
box{<0,0,-0.101600><1.006637,0.036000,0.101600> rotate<0,-44.997030,0> translate<33.657300,0.000000,20.962000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.657300,0.000000,20.962000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.657300,0.000000,20.784100>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<33.657300,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.826600,0.000000,21.317900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.538400,0.000000,21.317900>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<34.826600,0.000000,21.317900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.995900,0.000000,21.495900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.351800,0.000000,21.851800>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<35.995900,0.000000,21.495900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.351800,0.000000,21.851800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.351800,0.000000,20.784100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.351800,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.995900,0.000000,20.784100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.707700,0.000000,20.784100>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<35.995900,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.165200,0.000000,20.962000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.165200,0.000000,21.673800>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,90.000000,0> translate<37.165200,0.000000,21.673800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.165200,0.000000,21.673800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.343100,0.000000,21.851800>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<37.165200,0.000000,21.673800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.343100,0.000000,21.851800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.699000,0.000000,21.851800>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<37.343100,0.000000,21.851800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.699000,0.000000,21.851800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.877000,0.000000,21.673800>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<37.699000,0.000000,21.851800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.877000,0.000000,21.673800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.877000,0.000000,20.962000>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<37.877000,0.000000,20.962000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.877000,0.000000,20.962000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.699000,0.000000,20.784100>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<37.699000,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.699000,0.000000,20.784100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.343100,0.000000,20.784100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<37.343100,0.000000,20.784100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.343100,0.000000,20.784100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.165200,0.000000,20.962000>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<37.165200,0.000000,20.962000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.165200,0.000000,20.962000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.877000,0.000000,21.673800>}
box{<0,0,-0.101600><1.006637,0.036000,0.101600> rotate<0,-44.997030,0> translate<37.165200,0.000000,20.962000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.965200,0.000000,17.661700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.965200,0.000000,18.526000>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,90.000000,0> translate<4.965200,0.000000,18.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.965200,0.000000,18.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.253300,0.000000,18.237900>}
box{<0,0,-0.076200><0.407435,0.036000,0.076200> rotate<0,44.997030,0> translate<4.965200,0.000000,18.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.253300,0.000000,18.237900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.541400,0.000000,18.526000>}
box{<0,0,-0.076200><0.407435,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.253300,0.000000,18.237900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.541400,0.000000,18.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.541400,0.000000,17.661700>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.541400,0.000000,17.661700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.476900,0.000000,18.381900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.332800,0.000000,18.526000>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,44.997030,0> translate<6.332800,0.000000,18.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.332800,0.000000,18.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.044700,0.000000,18.526000>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.044700,0.000000,18.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.044700,0.000000,18.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.900700,0.000000,18.381900>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-45.016916,0> translate<5.900700,0.000000,18.381900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.900700,0.000000,18.381900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.900700,0.000000,17.805700>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.900700,0.000000,17.805700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.900700,0.000000,17.805700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.044700,0.000000,17.661700>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,44.997030,0> translate<5.900700,0.000000,17.805700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.044700,0.000000,17.661700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.332800,0.000000,17.661700>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.044700,0.000000,17.661700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.332800,0.000000,17.661700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.476900,0.000000,17.805700>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-44.977144,0> translate<6.332800,0.000000,17.661700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836200,0.000000,18.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836200,0.000000,17.661700>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.836200,0.000000,17.661700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836200,0.000000,17.661700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.412400,0.000000,17.661700>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<6.836200,0.000000,17.661700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.771700,0.000000,17.661700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.771700,0.000000,18.526000>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,90.000000,0> translate<7.771700,0.000000,18.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.771700,0.000000,18.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.203800,0.000000,18.526000>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,0.000000,0> translate<7.771700,0.000000,18.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.203800,0.000000,18.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.347900,0.000000,18.381900>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,44.997030,0> translate<8.203800,0.000000,18.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.347900,0.000000,18.381900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.347900,0.000000,18.093800>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.347900,0.000000,18.093800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.347900,0.000000,18.093800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.203800,0.000000,17.949800>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-44.977144,0> translate<8.203800,0.000000,17.949800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.203800,0.000000,17.949800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.771700,0.000000,17.949800>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,0.000000,0> translate<7.771700,0.000000,17.949800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.059800,0.000000,17.949800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.347900,0.000000,17.661700>}
box{<0,0,-0.076200><0.407435,0.036000,0.076200> rotate<0,44.997030,0> translate<8.059800,0.000000,17.949800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.965200,0.000000,15.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.965200,0.000000,15.285800>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.965200,0.000000,15.285800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.965200,0.000000,15.285800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.253300,0.000000,14.997700>}
box{<0,0,-0.076200><0.407435,0.036000,0.076200> rotate<0,44.997030,0> translate<4.965200,0.000000,15.285800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.253300,0.000000,14.997700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.541400,0.000000,15.285800>}
box{<0,0,-0.076200><0.407435,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.253300,0.000000,14.997700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.541400,0.000000,15.285800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.541400,0.000000,15.862000>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,90.000000,0> translate<5.541400,0.000000,15.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.900700,0.000000,15.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.900700,0.000000,14.997700>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.900700,0.000000,14.997700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.900700,0.000000,14.997700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.332800,0.000000,14.997700>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,0.000000,0> translate<5.900700,0.000000,14.997700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.332800,0.000000,14.997700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.476900,0.000000,15.141700>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-44.977144,0> translate<6.332800,0.000000,14.997700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.476900,0.000000,15.141700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.476900,0.000000,15.717900>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,90.000000,0> translate<6.476900,0.000000,15.717900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.476900,0.000000,15.717900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.332800,0.000000,15.862000>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,44.997030,0> translate<6.332800,0.000000,15.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.332800,0.000000,15.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.900700,0.000000,15.862000>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,0.000000,0> translate<5.900700,0.000000,15.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836200,0.000000,15.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836200,0.000000,14.997700>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.836200,0.000000,14.997700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836200,0.000000,14.997700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268300,0.000000,14.997700>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.836200,0.000000,14.997700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268300,0.000000,14.997700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.412400,0.000000,15.141700>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-44.977144,0> translate<7.268300,0.000000,14.997700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.412400,0.000000,15.141700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.412400,0.000000,15.717900>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,90.000000,0> translate<7.412400,0.000000,15.717900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.412400,0.000000,15.717900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268300,0.000000,15.862000>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,44.997030,0> translate<7.268300,0.000000,15.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268300,0.000000,15.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836200,0.000000,15.862000>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.836200,0.000000,15.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.965200,0.000000,13.343500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.965200,0.000000,12.767300>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.965200,0.000000,12.767300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.965200,0.000000,12.767300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.253300,0.000000,12.479200>}
box{<0,0,-0.076200><0.407435,0.036000,0.076200> rotate<0,44.997030,0> translate<4.965200,0.000000,12.767300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.253300,0.000000,12.479200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.541400,0.000000,12.767300>}
box{<0,0,-0.076200><0.407435,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.253300,0.000000,12.479200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.541400,0.000000,12.767300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.541400,0.000000,13.343500>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,90.000000,0> translate<5.541400,0.000000,13.343500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.476900,0.000000,13.199400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.332800,0.000000,13.343500>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,44.997030,0> translate<6.332800,0.000000,13.343500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.332800,0.000000,13.343500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.044700,0.000000,13.343500>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.044700,0.000000,13.343500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.044700,0.000000,13.343500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.900700,0.000000,13.199400>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-45.016916,0> translate<5.900700,0.000000,13.199400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.900700,0.000000,13.199400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.900700,0.000000,13.055400>}
box{<0,0,-0.076200><0.144000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.900700,0.000000,13.055400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.900700,0.000000,13.055400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.044700,0.000000,12.911300>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<5.900700,0.000000,13.055400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.044700,0.000000,12.911300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.332800,0.000000,12.911300>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.044700,0.000000,12.911300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.332800,0.000000,12.911300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.476900,0.000000,12.767300>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,44.977144,0> translate<6.332800,0.000000,12.911300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.476900,0.000000,12.767300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.476900,0.000000,12.623200>}
box{<0,0,-0.076200><0.144100,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.476900,0.000000,12.623200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.476900,0.000000,12.623200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.332800,0.000000,12.479200>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-44.977144,0> translate<6.332800,0.000000,12.479200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.332800,0.000000,12.479200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.044700,0.000000,12.479200>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.044700,0.000000,12.479200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.044700,0.000000,12.479200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.900700,0.000000,12.623200>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,44.997030,0> translate<5.900700,0.000000,12.623200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.412400,0.000000,13.199400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268300,0.000000,13.343500>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,44.997030,0> translate<7.268300,0.000000,13.343500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268300,0.000000,13.343500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980200,0.000000,13.343500>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.980200,0.000000,13.343500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980200,0.000000,13.343500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836200,0.000000,13.199400>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-45.016916,0> translate<6.836200,0.000000,13.199400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836200,0.000000,13.199400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836200,0.000000,13.055400>}
box{<0,0,-0.076200><0.144000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.836200,0.000000,13.055400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836200,0.000000,13.055400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980200,0.000000,12.911300>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<6.836200,0.000000,13.055400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980200,0.000000,12.911300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268300,0.000000,12.911300>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.980200,0.000000,12.911300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268300,0.000000,12.911300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.412400,0.000000,12.767300>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,44.977144,0> translate<7.268300,0.000000,12.911300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.412400,0.000000,12.767300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.412400,0.000000,12.623200>}
box{<0,0,-0.076200><0.144100,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.412400,0.000000,12.623200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.412400,0.000000,12.623200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268300,0.000000,12.479200>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-44.977144,0> translate<7.268300,0.000000,12.479200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268300,0.000000,12.479200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980200,0.000000,12.479200>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.980200,0.000000,12.479200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980200,0.000000,12.479200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836200,0.000000,12.623200>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,44.997030,0> translate<6.836200,0.000000,12.623200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.965700,0.000000,10.063200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.965700,0.000000,10.927500>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,90.000000,0> translate<4.965700,0.000000,10.927500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.965700,0.000000,10.927500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397800,0.000000,10.927500>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,0.000000,0> translate<4.965700,0.000000,10.927500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397800,0.000000,10.927500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.541900,0.000000,10.783400>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,44.997030,0> translate<5.397800,0.000000,10.927500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.541900,0.000000,10.783400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.541900,0.000000,10.495300>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.541900,0.000000,10.495300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.541900,0.000000,10.495300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397800,0.000000,10.351300>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-44.977144,0> translate<5.397800,0.000000,10.351300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397800,0.000000,10.351300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.965700,0.000000,10.351300>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,0.000000,0> translate<4.965700,0.000000,10.351300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477400,0.000000,10.783400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.333300,0.000000,10.927500>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,44.997030,0> translate<6.333300,0.000000,10.927500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.333300,0.000000,10.927500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.045200,0.000000,10.927500>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.045200,0.000000,10.927500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.045200,0.000000,10.927500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.901200,0.000000,10.783400>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-45.016916,0> translate<5.901200,0.000000,10.783400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.901200,0.000000,10.783400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.901200,0.000000,10.207200>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.901200,0.000000,10.207200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.901200,0.000000,10.207200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.045200,0.000000,10.063200>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,44.997030,0> translate<5.901200,0.000000,10.207200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.045200,0.000000,10.063200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.333300,0.000000,10.063200>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.045200,0.000000,10.063200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.333300,0.000000,10.063200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477400,0.000000,10.207200>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-44.977144,0> translate<6.333300,0.000000,10.063200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477400,0.000000,10.207200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477400,0.000000,10.495300>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,90.000000,0> translate<6.477400,0.000000,10.495300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477400,0.000000,10.495300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.189300,0.000000,10.495300>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.189300,0.000000,10.495300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836700,0.000000,10.927500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836700,0.000000,10.063200>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.836700,0.000000,10.063200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836700,0.000000,10.063200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268800,0.000000,10.063200>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.836700,0.000000,10.063200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268800,0.000000,10.063200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.412900,0.000000,10.207200>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-44.977144,0> translate<7.268800,0.000000,10.063200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.412900,0.000000,10.207200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.412900,0.000000,10.783400>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,90.000000,0> translate<7.412900,0.000000,10.783400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.412900,0.000000,10.783400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268800,0.000000,10.927500>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,44.997030,0> translate<7.268800,0.000000,10.927500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268800,0.000000,10.927500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836700,0.000000,10.927500>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.836700,0.000000,10.927500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.965700,0.000000,7.547700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.965700,0.000000,8.412000>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,90.000000,0> translate<4.965700,0.000000,8.412000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.965700,0.000000,8.412000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397800,0.000000,8.412000>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,0.000000,0> translate<4.965700,0.000000,8.412000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397800,0.000000,8.412000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.541900,0.000000,8.267900>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,44.997030,0> translate<5.397800,0.000000,8.412000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.541900,0.000000,8.267900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.541900,0.000000,7.979800>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.541900,0.000000,7.979800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.541900,0.000000,7.979800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397800,0.000000,7.835800>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-44.977144,0> translate<5.397800,0.000000,7.835800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397800,0.000000,7.835800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.965700,0.000000,7.835800>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,0.000000,0> translate<4.965700,0.000000,7.835800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477400,0.000000,8.267900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.333300,0.000000,8.412000>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,44.997030,0> translate<6.333300,0.000000,8.412000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.333300,0.000000,8.412000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.045200,0.000000,8.412000>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.045200,0.000000,8.412000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.045200,0.000000,8.412000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.901200,0.000000,8.267900>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-45.016916,0> translate<5.901200,0.000000,8.267900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.901200,0.000000,8.267900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.901200,0.000000,7.691700>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.901200,0.000000,7.691700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.901200,0.000000,7.691700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.045200,0.000000,7.547700>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,44.997030,0> translate<5.901200,0.000000,7.691700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.045200,0.000000,7.547700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.333300,0.000000,7.547700>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.045200,0.000000,7.547700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.333300,0.000000,7.547700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477400,0.000000,7.691700>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-44.977144,0> translate<6.333300,0.000000,7.547700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477400,0.000000,7.691700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477400,0.000000,7.979800>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,90.000000,0> translate<6.477400,0.000000,7.979800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477400,0.000000,7.979800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.189300,0.000000,7.979800>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.189300,0.000000,7.979800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.412900,0.000000,8.267900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268800,0.000000,8.412000>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,44.997030,0> translate<7.268800,0.000000,8.412000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268800,0.000000,8.412000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980700,0.000000,8.412000>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.980700,0.000000,8.412000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980700,0.000000,8.412000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836700,0.000000,8.267900>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-45.016916,0> translate<6.836700,0.000000,8.267900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836700,0.000000,8.267900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836700,0.000000,7.691700>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.836700,0.000000,7.691700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.836700,0.000000,7.691700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980700,0.000000,7.547700>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,44.997030,0> translate<6.836700,0.000000,7.691700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.980700,0.000000,7.547700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268800,0.000000,7.547700>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<6.980700,0.000000,7.547700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.268800,0.000000,7.547700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.412900,0.000000,7.691700>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-44.977144,0> translate<7.268800,0.000000,7.547700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.711300,0.000000,9.065600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.711300,0.000000,10.133300>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,90.000000,0> translate<58.711300,0.000000,10.133300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.711300,0.000000,10.133300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.245100,0.000000,10.133300>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<58.711300,0.000000,10.133300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.245100,0.000000,10.133300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.423100,0.000000,9.955300>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<59.245100,0.000000,10.133300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.423100,0.000000,9.955300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.423100,0.000000,9.777400>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<59.423100,0.000000,9.777400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.423100,0.000000,9.777400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.245100,0.000000,9.599400>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,-44.997030,0> translate<59.245100,0.000000,9.599400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.245100,0.000000,9.599400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.423100,0.000000,9.421500>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,44.980932,0> translate<59.245100,0.000000,9.599400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.423100,0.000000,9.421500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.423100,0.000000,9.243500>}
box{<0,0,-0.101600><0.178000,0.036000,0.101600> rotate<0,-90.000000,0> translate<59.423100,0.000000,9.243500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.423100,0.000000,9.243500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.245100,0.000000,9.065600>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<59.245100,0.000000,9.065600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.245100,0.000000,9.065600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.711300,0.000000,9.065600>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<58.711300,0.000000,9.065600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.711300,0.000000,9.599400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.245100,0.000000,9.599400>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<58.711300,0.000000,9.599400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330600,0.000000,12.401800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.152600,0.000000,12.579800>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<59.152600,0.000000,12.579800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.152600,0.000000,12.579800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.796700,0.000000,12.579800>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<58.796700,0.000000,12.579800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.796700,0.000000,12.579800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.618800,0.000000,12.401800>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<58.618800,0.000000,12.401800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.618800,0.000000,12.401800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.618800,0.000000,11.690000>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<58.618800,0.000000,11.690000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.618800,0.000000,11.690000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.796700,0.000000,11.512100>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<58.618800,0.000000,11.690000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.796700,0.000000,11.512100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.152600,0.000000,11.512100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<58.796700,0.000000,11.512100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.152600,0.000000,11.512100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330600,0.000000,11.690000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<59.152600,0.000000,11.512100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330600,0.000000,11.690000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330600,0.000000,12.045900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<59.330600,0.000000,12.045900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330600,0.000000,12.045900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.974700,0.000000,12.045900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<58.974700,0.000000,12.045900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.691800,0.000000,16.998900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.403600,0.000000,16.998900>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<58.691800,0.000000,16.998900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.618300,0.000000,14.125600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.618300,0.000000,15.193300>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,90.000000,0> translate<58.618300,0.000000,15.193300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.618300,0.000000,15.193300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.152100,0.000000,15.193300>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<58.618300,0.000000,15.193300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.152100,0.000000,15.193300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330100,0.000000,15.015300>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<59.152100,0.000000,15.193300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330100,0.000000,15.015300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330100,0.000000,14.659400>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,-90.000000,0> translate<59.330100,0.000000,14.659400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330100,0.000000,14.659400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.152100,0.000000,14.481500>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<59.152100,0.000000,14.481500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.152100,0.000000,14.481500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.618300,0.000000,14.481500>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<58.618300,0.000000,14.481500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.974200,0.000000,14.481500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.330100,0.000000,14.125600>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,44.997030,0> translate<58.974200,0.000000,14.481500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.599100,0.000000,23.516400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.310900,0.000000,23.516400>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<7.599100,0.000000,23.516400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.595600,0.000000,20.898400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.307400,0.000000,20.898400>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<7.595600,0.000000,20.898400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.951500,0.000000,21.254300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.951500,0.000000,20.542500>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<7.951500,0.000000,20.542500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.381900,0.000000,17.854700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.805700,0.000000,17.854700>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<15.805700,0.000000,17.854700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.805700,0.000000,17.854700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.381900,0.000000,18.430900>}
box{<0,0,-0.076200><0.814870,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.805700,0.000000,17.854700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.381900,0.000000,18.430900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.381900,0.000000,18.574900>}
box{<0,0,-0.076200><0.144000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.381900,0.000000,18.574900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.381900,0.000000,18.574900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.237800,0.000000,18.719000>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,44.997030,0> translate<16.237800,0.000000,18.719000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.237800,0.000000,18.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.949700,0.000000,18.719000>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<15.949700,0.000000,18.719000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.949700,0.000000,18.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.805700,0.000000,18.574900>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-45.016916,0> translate<15.805700,0.000000,18.574900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.610200,0.000000,18.453900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.898300,0.000000,18.742000>}
box{<0,0,-0.076200><0.407435,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.610200,0.000000,18.453900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.898300,0.000000,18.742000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.898300,0.000000,17.877700>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.898300,0.000000,17.877700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.610200,0.000000,17.877700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.186400,0.000000,17.877700>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<17.610200,0.000000,17.877700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.978200,0.000000,18.574900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.122200,0.000000,18.719000>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-45.016916,0> translate<13.978200,0.000000,18.574900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.122200,0.000000,18.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.410300,0.000000,18.719000>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<14.122200,0.000000,18.719000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.410300,0.000000,18.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.554400,0.000000,18.574900>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,44.997030,0> translate<14.410300,0.000000,18.719000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.554400,0.000000,18.574900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.554400,0.000000,18.430900>}
box{<0,0,-0.076200><0.144000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.554400,0.000000,18.430900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.554400,0.000000,18.430900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.410300,0.000000,18.286800>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.410300,0.000000,18.286800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.410300,0.000000,18.286800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.266300,0.000000,18.286800>}
box{<0,0,-0.076200><0.144000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.266300,0.000000,18.286800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.410300,0.000000,18.286800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.554400,0.000000,18.142800>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,44.977144,0> translate<14.410300,0.000000,18.286800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.554400,0.000000,18.142800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.554400,0.000000,17.998700>}
box{<0,0,-0.076200><0.144100,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.554400,0.000000,17.998700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.554400,0.000000,17.998700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.410300,0.000000,17.854700>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-44.977144,0> translate<14.410300,0.000000,17.854700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.410300,0.000000,17.854700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.122200,0.000000,17.854700>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<14.122200,0.000000,17.854700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.122200,0.000000,17.854700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.978200,0.000000,17.998700>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,44.997030,0> translate<13.978200,0.000000,17.998700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.583300,0.000000,17.854700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.583300,0.000000,18.719000>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,90.000000,0> translate<12.583300,0.000000,18.719000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.583300,0.000000,18.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.151200,0.000000,18.286800>}
box{<0,0,-0.076200><0.611152,0.036000,0.076200> rotate<0,-45.003659,0> translate<12.151200,0.000000,18.286800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.151200,0.000000,18.286800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.727400,0.000000,18.286800>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<12.151200,0.000000,18.286800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.969400,0.000000,18.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.393200,0.000000,18.719000>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<10.393200,0.000000,18.719000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.393200,0.000000,18.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.393200,0.000000,18.286800>}
box{<0,0,-0.076200><0.432200,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.393200,0.000000,18.286800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.393200,0.000000,18.286800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.681300,0.000000,18.430900>}
box{<0,0,-0.076200><0.322128,0.036000,0.076200> rotate<0,-26.571252,0> translate<10.393200,0.000000,18.286800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.681300,0.000000,18.430900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.825300,0.000000,18.430900>}
box{<0,0,-0.076200><0.144000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.681300,0.000000,18.430900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.825300,0.000000,18.430900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.969400,0.000000,18.286800>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,44.997030,0> translate<10.825300,0.000000,18.430900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.969400,0.000000,18.286800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.969400,0.000000,17.998700>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.969400,0.000000,17.998700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.969400,0.000000,17.998700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.825300,0.000000,17.854700>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-44.977144,0> translate<10.825300,0.000000,17.854700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.825300,0.000000,17.854700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.537200,0.000000,17.854700>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<10.537200,0.000000,17.854700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.537200,0.000000,17.854700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.393200,0.000000,17.998700>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,44.997030,0> translate<10.393200,0.000000,17.998700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.953100,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.953100,0.000000,23.944800>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,90.000000,0> translate<28.953100,0.000000,23.944800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.953100,0.000000,23.944800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.664900,0.000000,22.877100>}
box{<0,0,-0.101600><1.283216,0.036000,0.101600> rotate<0,56.306216,0> translate<28.953100,0.000000,23.944800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.664900,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.664900,0.000000,23.944800>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,90.000000,0> translate<29.664900,0.000000,23.944800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.122400,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.122400,0.000000,23.944800>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,90.000000,0> translate<30.122400,0.000000,23.944800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.122400,0.000000,23.944800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.656200,0.000000,23.944800>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<30.122400,0.000000,23.944800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.656200,0.000000,23.944800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.834200,0.000000,23.766800>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<30.656200,0.000000,23.944800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.834200,0.000000,23.766800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.834200,0.000000,23.588900>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.834200,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.834200,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.656200,0.000000,23.410900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,-44.997030,0> translate<30.656200,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.656200,0.000000,23.410900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.834200,0.000000,23.233000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,44.980932,0> translate<30.656200,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.834200,0.000000,23.233000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.834200,0.000000,23.055000>}
box{<0,0,-0.101600><0.178000,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.834200,0.000000,23.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.834200,0.000000,23.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.656200,0.000000,22.877100>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<30.656200,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.656200,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.122400,0.000000,22.877100>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<30.122400,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.122400,0.000000,23.410900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.656200,0.000000,23.410900>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<30.122400,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.291700,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.469600,0.000000,23.588900>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,0.000000,0> translate<31.291700,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.469600,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.469600,0.000000,22.877100>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<31.469600,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.291700,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.647600,0.000000,22.877100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<31.291700,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.469600,0.000000,24.122700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.469600,0.000000,23.944800>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<31.469600,0.000000,23.944800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.249100,0.000000,23.766800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.249100,0.000000,23.055000>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.249100,0.000000,23.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.249100,0.000000,23.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.427100,0.000000,22.877100>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,44.980932,0> translate<32.249100,0.000000,23.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.071200,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.427100,0.000000,23.588900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<32.071200,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.850700,0.000000,23.944800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.850700,0.000000,22.877100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.850700,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.850700,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.206600,0.000000,23.233000>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<32.850700,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.206600,0.000000,23.233000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.562500,0.000000,22.877100>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,44.997030,0> translate<33.206600,0.000000,23.233000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.562500,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.562500,0.000000,23.944800>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,90.000000,0> translate<33.562500,0.000000,23.944800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.197900,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.553800,0.000000,22.877100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<34.197900,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.553800,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.731800,0.000000,23.055000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-44.980932,0> translate<34.553800,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.731800,0.000000,23.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.731800,0.000000,23.410900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<34.731800,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.731800,0.000000,23.410900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.553800,0.000000,23.588900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<34.553800,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.553800,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.197900,0.000000,23.588900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<34.197900,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.197900,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.020000,0.000000,23.410900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<34.020000,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.020000,0.000000,23.410900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.020000,0.000000,23.055000>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.020000,0.000000,23.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.020000,0.000000,23.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.197900,0.000000,22.877100>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<34.020000,0.000000,23.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.189300,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.189300,0.000000,23.588900>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,90.000000,0> translate<35.189300,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.189300,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.723100,0.000000,23.588900>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,0.000000,0> translate<35.189300,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.723100,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.901100,0.000000,23.410900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<35.723100,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.901100,0.000000,23.410900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.901100,0.000000,22.877100>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,-90.000000,0> translate<35.901100,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.070400,0.000000,23.944800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.070400,0.000000,22.877100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,-90.000000,0> translate<37.070400,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.070400,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.536500,0.000000,22.877100>}
box{<0,0,-0.101600><0.533900,0.036000,0.101600> rotate<0,0.000000,0> translate<36.536500,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.536500,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.358600,0.000000,23.055000>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<36.358600,0.000000,23.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.358600,0.000000,23.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.358600,0.000000,23.410900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<36.358600,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.358600,0.000000,23.410900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.536500,0.000000,23.588900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<36.358600,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.536500,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.070400,0.000000,23.588900>}
box{<0,0,-0.101600><0.533900,0.036000,0.101600> rotate<0,0.000000,0> translate<36.536500,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.061700,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.705800,0.000000,22.877100>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<37.705800,0.000000,22.877100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.705800,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.527900,0.000000,23.055000>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,44.997030,0> translate<37.527900,0.000000,23.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.527900,0.000000,23.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.527900,0.000000,23.410900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<37.527900,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.527900,0.000000,23.410900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.705800,0.000000,23.588900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<37.527900,0.000000,23.410900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.705800,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.061700,0.000000,23.588900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<37.705800,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.061700,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.239700,0.000000,23.410900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<38.061700,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.239700,0.000000,23.410900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.239700,0.000000,23.233000>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,-90.000000,0> translate<38.239700,0.000000,23.233000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.239700,0.000000,23.233000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.527900,0.000000,23.233000>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<37.527900,0.000000,23.233000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.697200,0.000000,22.877100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.697200,0.000000,23.588900>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,90.000000,0> translate<38.697200,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.697200,0.000000,23.233000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.053100,0.000000,23.588900>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<38.697200,0.000000,23.233000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.053100,0.000000,23.588900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.231000,0.000000,23.588900>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,0.000000,0> translate<39.053100,0.000000,23.588900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.744100,0.000000,4.128900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.600000,0.000000,3.984800>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.600000,0.000000,3.984800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.600000,0.000000,3.984800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.600000,0.000000,3.696700>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.600000,0.000000,3.696700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.600000,0.000000,3.696700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.744100,0.000000,3.552700>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,44.977144,0> translate<18.600000,0.000000,3.696700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.744100,0.000000,3.552700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.320300,0.000000,3.552700>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<18.744100,0.000000,3.552700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.320300,0.000000,3.552700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.464300,0.000000,3.696700>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.320300,0.000000,3.552700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.464300,0.000000,3.696700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.464300,0.000000,3.984800>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,90.000000,0> translate<19.464300,0.000000,3.984800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.464300,0.000000,3.984800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.320300,0.000000,4.128900>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<19.320300,0.000000,4.128900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.320300,0.000000,4.128900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.032200,0.000000,4.128900>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<19.032200,0.000000,4.128900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.032200,0.000000,4.128900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.032200,0.000000,3.840800>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.032200,0.000000,3.840800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.464300,0.000000,4.488200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.600000,0.000000,4.488200>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<18.600000,0.000000,4.488200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.600000,0.000000,4.488200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.464300,0.000000,5.064400>}
box{<0,0,-0.076200><1.038759,0.036000,0.076200> rotate<0,-33.687844,0> translate<18.600000,0.000000,4.488200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.464300,0.000000,5.064400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.600000,0.000000,5.064400>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<18.600000,0.000000,5.064400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.600000,0.000000,5.423700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.464300,0.000000,5.423700>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<18.600000,0.000000,5.423700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.464300,0.000000,5.423700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.464300,0.000000,5.855800>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,90.000000,0> translate<19.464300,0.000000,5.855800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.464300,0.000000,5.855800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.320300,0.000000,5.999900>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<19.320300,0.000000,5.999900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.320300,0.000000,5.999900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.744100,0.000000,5.999900>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<18.744100,0.000000,5.999900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.744100,0.000000,5.999900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.600000,0.000000,5.855800>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.600000,0.000000,5.855800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.600000,0.000000,5.855800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.600000,0.000000,5.423700>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.600000,0.000000,5.423700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.427600,0.000000,3.992400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.283500,0.000000,3.848300>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.283500,0.000000,3.848300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.283500,0.000000,3.848300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.283500,0.000000,3.560200>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.283500,0.000000,3.560200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.283500,0.000000,3.560200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.427600,0.000000,3.416200>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,44.977144,0> translate<26.283500,0.000000,3.560200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.427600,0.000000,3.416200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.003800,0.000000,3.416200>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<26.427600,0.000000,3.416200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.003800,0.000000,3.416200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.147800,0.000000,3.560200>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.003800,0.000000,3.416200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.147800,0.000000,3.560200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.147800,0.000000,3.848300>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,90.000000,0> translate<27.147800,0.000000,3.848300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.147800,0.000000,3.848300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.003800,0.000000,3.992400>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<27.003800,0.000000,3.992400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.003800,0.000000,3.992400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.715700,0.000000,3.992400>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<26.715700,0.000000,3.992400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.715700,0.000000,3.992400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.715700,0.000000,3.704300>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.715700,0.000000,3.704300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.147800,0.000000,4.351700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.283500,0.000000,4.351700>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<26.283500,0.000000,4.351700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.283500,0.000000,4.351700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.147800,0.000000,4.927900>}
box{<0,0,-0.076200><1.038759,0.036000,0.076200> rotate<0,-33.687844,0> translate<26.283500,0.000000,4.351700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.147800,0.000000,4.927900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.283500,0.000000,4.927900>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<26.283500,0.000000,4.927900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.283500,0.000000,5.287200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.147800,0.000000,5.287200>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<26.283500,0.000000,5.287200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.147800,0.000000,5.287200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.147800,0.000000,5.719300>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,90.000000,0> translate<27.147800,0.000000,5.719300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.147800,0.000000,5.719300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.003800,0.000000,5.863400>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<27.003800,0.000000,5.863400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.003800,0.000000,5.863400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.427600,0.000000,5.863400>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<26.427600,0.000000,5.863400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.427600,0.000000,5.863400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.283500,0.000000,5.719300>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.283500,0.000000,5.719300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.283500,0.000000,5.719300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.283500,0.000000,5.287200>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.283500,0.000000,5.287200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,3.484600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.946400,0.000000,3.484600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<21.319300,0.000000,3.484600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.946400,0.000000,3.484600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,3.798100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<21.946400,0.000000,3.484600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,3.798100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.946400,0.000000,4.111600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<21.946400,0.000000,4.111600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.946400,0.000000,4.111600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,4.111600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<21.319300,0.000000,4.111600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,5.047100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,4.890400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<21.319300,0.000000,4.890400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,4.890400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,4.576800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.319300,0.000000,4.576800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,4.576800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,4.420100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<21.319300,0.000000,4.576800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,4.420100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,4.420100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<21.476100,0.000000,4.420100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,4.420100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,4.576800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<22.103200,0.000000,4.420100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,4.576800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,4.890400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<22.259900,0.000000,4.890400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,4.890400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,5.047100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<22.103200,0.000000,5.047100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,5.982600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,5.825900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<21.319300,0.000000,5.825900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,5.825900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,5.512300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.319300,0.000000,5.512300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.319300,0.000000,5.512300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,5.355600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<21.319300,0.000000,5.512300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.476100,0.000000,5.355600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,5.355600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<21.476100,0.000000,5.355600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,5.355600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,5.512300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<22.103200,0.000000,5.355600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,5.512300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,5.825900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<22.259900,0.000000,5.825900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.259900,0.000000,5.825900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.103200,0.000000,5.982600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<22.103200,0.000000,5.982600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.593800,0.000000,3.463200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.729500,0.000000,3.463200>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<23.729500,0.000000,3.463200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.729500,0.000000,3.463200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.729500,0.000000,3.895300>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,90.000000,0> translate<23.729500,0.000000,3.895300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.729500,0.000000,3.895300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.873600,0.000000,4.039400>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.729500,0.000000,3.895300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.873600,0.000000,4.039400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.161700,0.000000,4.039400>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<23.873600,0.000000,4.039400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.161700,0.000000,4.039400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.305700,0.000000,3.895300>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<24.161700,0.000000,4.039400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.305700,0.000000,3.895300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.305700,0.000000,3.463200>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.305700,0.000000,3.463200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.729500,0.000000,4.830800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.729500,0.000000,4.542700>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.729500,0.000000,4.542700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.729500,0.000000,4.542700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.873600,0.000000,4.398700>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,44.977144,0> translate<23.729500,0.000000,4.542700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.873600,0.000000,4.398700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.449800,0.000000,4.398700>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<23.873600,0.000000,4.398700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.449800,0.000000,4.398700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.593800,0.000000,4.542700>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.449800,0.000000,4.398700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.593800,0.000000,4.542700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.593800,0.000000,4.830800>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,90.000000,0> translate<24.593800,0.000000,4.830800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.593800,0.000000,4.830800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.449800,0.000000,4.974900>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<24.449800,0.000000,4.974900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.449800,0.000000,4.974900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.873600,0.000000,4.974900>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<23.873600,0.000000,4.974900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.873600,0.000000,4.974900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.729500,0.000000,4.830800>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.729500,0.000000,4.830800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.593800,0.000000,5.622300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.729500,0.000000,5.622300>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<23.729500,0.000000,5.622300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.729500,0.000000,5.334200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.729500,0.000000,5.910400>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,90.000000,0> translate<23.729500,0.000000,5.910400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.634800,0.000000,3.433700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.770500,0.000000,3.433700>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<28.770500,0.000000,3.433700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.770500,0.000000,3.433700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.770500,0.000000,3.865800>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,90.000000,0> translate<28.770500,0.000000,3.865800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.770500,0.000000,3.865800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.914600,0.000000,4.009900>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.770500,0.000000,3.865800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.914600,0.000000,4.009900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.202700,0.000000,4.009900>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<28.914600,0.000000,4.009900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.202700,0.000000,4.009900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.346700,0.000000,3.865800>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<29.202700,0.000000,4.009900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.346700,0.000000,3.865800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.346700,0.000000,3.433700>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.346700,0.000000,3.433700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.634800,0.000000,4.369200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.770500,0.000000,4.369200>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<28.770500,0.000000,4.369200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.770500,0.000000,4.369200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.770500,0.000000,4.801300>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,90.000000,0> translate<28.770500,0.000000,4.801300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.770500,0.000000,4.801300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.914600,0.000000,4.945400>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.770500,0.000000,4.801300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.914600,0.000000,4.945400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.058600,0.000000,4.945400>}
box{<0,0,-0.076200><0.144000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.914600,0.000000,4.945400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.058600,0.000000,4.945400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.202700,0.000000,4.801300>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,44.997030,0> translate<29.058600,0.000000,4.945400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.202700,0.000000,4.801300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.346700,0.000000,4.945400>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-45.016916,0> translate<29.202700,0.000000,4.801300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.346700,0.000000,4.945400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.490800,0.000000,4.945400>}
box{<0,0,-0.076200><0.144100,0.036000,0.076200> rotate<0,0.000000,0> translate<29.346700,0.000000,4.945400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.490800,0.000000,4.945400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.634800,0.000000,4.801300>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<29.490800,0.000000,4.945400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.634800,0.000000,4.801300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.634800,0.000000,4.369200>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.634800,0.000000,4.369200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.202700,0.000000,4.369200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.202700,0.000000,4.801300>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,90.000000,0> translate<29.202700,0.000000,4.801300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.490800,0.000000,5.304700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.914600,0.000000,5.304700>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<28.914600,0.000000,5.304700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.914600,0.000000,5.304700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.770500,0.000000,5.448700>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,44.977144,0> translate<28.770500,0.000000,5.448700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.770500,0.000000,5.448700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.770500,0.000000,5.736800>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,90.000000,0> translate<28.770500,0.000000,5.736800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.770500,0.000000,5.736800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.914600,0.000000,5.880900>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.770500,0.000000,5.736800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.914600,0.000000,5.880900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.490800,0.000000,5.880900>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<28.914600,0.000000,5.880900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.490800,0.000000,5.880900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.634800,0.000000,5.736800>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<29.490800,0.000000,5.880900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.634800,0.000000,5.736800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.634800,0.000000,5.448700>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.634800,0.000000,5.448700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.634800,0.000000,5.448700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.490800,0.000000,5.304700>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.490800,0.000000,5.304700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.490800,0.000000,5.304700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.914600,0.000000,5.880900>}
box{<0,0,-0.076200><0.814870,0.036000,0.076200> rotate<0,44.997030,0> translate<28.914600,0.000000,5.880900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.357500,0.000000,3.522700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.933700,0.000000,3.522700>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<21.357500,0.000000,3.522700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.933700,0.000000,3.522700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.221800,0.000000,3.810800>}
box{<0,0,-0.076200><0.407435,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.933700,0.000000,3.522700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.221800,0.000000,3.810800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.933700,0.000000,4.098900>}
box{<0,0,-0.076200><0.407435,0.036000,0.076200> rotate<0,44.997030,0> translate<21.933700,0.000000,4.098900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.933700,0.000000,4.098900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.357500,0.000000,4.098900>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<21.357500,0.000000,4.098900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.501600,0.000000,5.034400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.357500,0.000000,4.890300>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.357500,0.000000,4.890300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.357500,0.000000,4.890300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.357500,0.000000,4.602200>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.357500,0.000000,4.602200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.357500,0.000000,4.602200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.501600,0.000000,4.458200>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,44.977144,0> translate<21.357500,0.000000,4.602200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.501600,0.000000,4.458200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.077800,0.000000,4.458200>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<21.501600,0.000000,4.458200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.077800,0.000000,4.458200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.221800,0.000000,4.602200>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.077800,0.000000,4.458200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.221800,0.000000,4.602200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.221800,0.000000,4.890300>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,90.000000,0> translate<22.221800,0.000000,4.890300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.221800,0.000000,4.890300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.077800,0.000000,5.034400>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<22.077800,0.000000,5.034400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.501600,0.000000,5.969900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.357500,0.000000,5.825800>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.357500,0.000000,5.825800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.357500,0.000000,5.825800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.357500,0.000000,5.537700>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.357500,0.000000,5.537700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.357500,0.000000,5.537700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.501600,0.000000,5.393700>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,44.977144,0> translate<21.357500,0.000000,5.537700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.501600,0.000000,5.393700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.077800,0.000000,5.393700>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<21.501600,0.000000,5.393700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.077800,0.000000,5.393700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.221800,0.000000,5.537700>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.077800,0.000000,5.393700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.221800,0.000000,5.537700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.221800,0.000000,5.825800>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,90.000000,0> translate<22.221800,0.000000,5.825800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.221800,0.000000,5.825800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.077800,0.000000,5.969900>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<22.077800,0.000000,5.969900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.517500,0.000000,3.522700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.093700,0.000000,3.522700>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<31.517500,0.000000,3.522700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.093700,0.000000,3.522700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.381800,0.000000,3.810800>}
box{<0,0,-0.076200><0.407435,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.093700,0.000000,3.522700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.381800,0.000000,3.810800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.093700,0.000000,4.098900>}
box{<0,0,-0.076200><0.407435,0.036000,0.076200> rotate<0,44.997030,0> translate<32.093700,0.000000,4.098900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.093700,0.000000,4.098900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.517500,0.000000,4.098900>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<31.517500,0.000000,4.098900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.661600,0.000000,5.034400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.517500,0.000000,4.890300>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.517500,0.000000,4.890300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.517500,0.000000,4.890300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.517500,0.000000,4.602200>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.517500,0.000000,4.602200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.517500,0.000000,4.602200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.661600,0.000000,4.458200>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,44.977144,0> translate<31.517500,0.000000,4.602200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.661600,0.000000,4.458200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.237800,0.000000,4.458200>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<31.661600,0.000000,4.458200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.237800,0.000000,4.458200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.381800,0.000000,4.602200>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.237800,0.000000,4.458200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.381800,0.000000,4.602200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.381800,0.000000,4.890300>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,90.000000,0> translate<32.381800,0.000000,4.890300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.381800,0.000000,4.890300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.237800,0.000000,5.034400>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<32.237800,0.000000,5.034400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.661600,0.000000,5.969900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.517500,0.000000,5.825800>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.517500,0.000000,5.825800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.517500,0.000000,5.825800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.517500,0.000000,5.537700>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.517500,0.000000,5.537700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.517500,0.000000,5.537700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.661600,0.000000,5.393700>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,44.977144,0> translate<31.517500,0.000000,5.537700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.661600,0.000000,5.393700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.237800,0.000000,5.393700>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<31.661600,0.000000,5.393700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.237800,0.000000,5.393700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.381800,0.000000,5.537700>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.237800,0.000000,5.393700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.381800,0.000000,5.537700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.381800,0.000000,5.825800>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,90.000000,0> translate<32.381800,0.000000,5.825800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.381800,0.000000,5.825800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.237800,0.000000,5.969900>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<32.237800,0.000000,5.969900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.739800,0.000000,3.439200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.875500,0.000000,3.439200>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<33.875500,0.000000,3.439200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.875500,0.000000,3.439200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.875500,0.000000,3.871300>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,90.000000,0> translate<33.875500,0.000000,3.871300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.875500,0.000000,3.871300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.019600,0.000000,4.015400>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.875500,0.000000,3.871300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.019600,0.000000,4.015400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.307700,0.000000,4.015400>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<34.019600,0.000000,4.015400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.307700,0.000000,4.015400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.451700,0.000000,3.871300>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<34.307700,0.000000,4.015400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.451700,0.000000,3.871300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.451700,0.000000,3.439200>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.451700,0.000000,3.439200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.451700,0.000000,3.727300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.739800,0.000000,4.015400>}
box{<0,0,-0.076200><0.407435,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.451700,0.000000,3.727300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.875500,0.000000,4.950900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.875500,0.000000,4.374700>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.875500,0.000000,4.374700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.875500,0.000000,4.374700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.739800,0.000000,4.374700>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<33.875500,0.000000,4.374700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.739800,0.000000,4.374700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.739800,0.000000,4.950900>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,90.000000,0> translate<34.739800,0.000000,4.950900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.307700,0.000000,4.374700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.307700,0.000000,4.662800>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,90.000000,0> translate<34.307700,0.000000,4.662800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.875500,0.000000,5.310200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.739800,0.000000,5.310200>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<33.875500,0.000000,5.310200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.739800,0.000000,5.310200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.739800,0.000000,5.742300>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,90.000000,0> translate<34.739800,0.000000,5.742300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.739800,0.000000,5.742300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.595800,0.000000,5.886400>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<34.595800,0.000000,5.886400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.595800,0.000000,5.886400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.019600,0.000000,5.886400>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<34.019600,0.000000,5.886400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.019600,0.000000,5.886400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.875500,0.000000,5.742300>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.875500,0.000000,5.742300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.875500,0.000000,5.742300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.875500,0.000000,5.310200>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.875500,0.000000,5.310200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.515100,0.000000,3.990900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.371000,0.000000,3.846800>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.371000,0.000000,3.846800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.371000,0.000000,3.846800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.371000,0.000000,3.558700>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.371000,0.000000,3.558700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.371000,0.000000,3.558700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.515100,0.000000,3.414700>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,44.977144,0> translate<36.371000,0.000000,3.558700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.515100,0.000000,3.414700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.091300,0.000000,3.414700>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,0.000000,0> translate<36.515100,0.000000,3.414700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.091300,0.000000,3.414700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.235300,0.000000,3.558700>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.091300,0.000000,3.414700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.235300,0.000000,3.558700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.235300,0.000000,3.846800>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,90.000000,0> translate<37.235300,0.000000,3.846800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.235300,0.000000,3.846800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.091300,0.000000,3.990900>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<37.091300,0.000000,3.990900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.091300,0.000000,3.990900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.803200,0.000000,3.990900>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<36.803200,0.000000,3.990900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.803200,0.000000,3.990900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.803200,0.000000,3.702800>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.803200,0.000000,3.702800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.235300,0.000000,4.350200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.371000,0.000000,4.350200>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<36.371000,0.000000,4.350200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.371000,0.000000,4.350200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.371000,0.000000,4.782300>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,90.000000,0> translate<36.371000,0.000000,4.782300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.371000,0.000000,4.782300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.515100,0.000000,4.926400>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.371000,0.000000,4.782300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.515100,0.000000,4.926400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.803200,0.000000,4.926400>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,0.000000,0> translate<36.515100,0.000000,4.926400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.803200,0.000000,4.926400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.947200,0.000000,4.782300>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<36.803200,0.000000,4.926400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.947200,0.000000,4.782300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.947200,0.000000,4.350200>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.947200,0.000000,4.350200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.947200,0.000000,4.638300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.235300,0.000000,4.926400>}
box{<0,0,-0.076200><0.407435,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.947200,0.000000,4.638300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.235300,0.000000,5.285700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.371000,0.000000,5.285700>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<36.371000,0.000000,5.285700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.371000,0.000000,5.285700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.235300,0.000000,5.861900>}
box{<0,0,-0.076200><1.038759,0.036000,0.076200> rotate<0,-33.687844,0> translate<36.371000,0.000000,5.285700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.235300,0.000000,5.861900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.371000,0.000000,5.861900>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<36.371000,0.000000,5.861900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.755800,0.000000,3.488700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.891500,0.000000,3.488700>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<38.891500,0.000000,3.488700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.891500,0.000000,3.488700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.891500,0.000000,3.920800>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,90.000000,0> translate<38.891500,0.000000,3.920800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.891500,0.000000,3.920800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.035600,0.000000,4.064900>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.891500,0.000000,3.920800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.035600,0.000000,4.064900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.179600,0.000000,4.064900>}
box{<0,0,-0.076200><0.144000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.035600,0.000000,4.064900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.179600,0.000000,4.064900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.323700,0.000000,3.920800>}
box{<0,0,-0.076200><0.203788,0.036000,0.076200> rotate<0,44.997030,0> translate<39.179600,0.000000,4.064900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.323700,0.000000,3.920800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.467700,0.000000,4.064900>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,-45.016916,0> translate<39.323700,0.000000,3.920800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.467700,0.000000,4.064900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.611800,0.000000,4.064900>}
box{<0,0,-0.076200><0.144100,0.036000,0.076200> rotate<0,0.000000,0> translate<39.467700,0.000000,4.064900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.611800,0.000000,4.064900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.755800,0.000000,3.920800>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<39.611800,0.000000,4.064900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.755800,0.000000,3.920800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.755800,0.000000,3.488700>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.755800,0.000000,3.488700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.323700,0.000000,3.488700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.323700,0.000000,3.920800>}
box{<0,0,-0.076200><0.432100,0.036000,0.076200> rotate<0,90.000000,0> translate<39.323700,0.000000,3.920800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.891500,0.000000,4.424200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.755800,0.000000,4.424200>}
box{<0,0,-0.076200><0.864300,0.036000,0.076200> rotate<0,0.000000,0> translate<38.891500,0.000000,4.424200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.755800,0.000000,4.424200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.755800,0.000000,5.000400>}
box{<0,0,-0.076200><0.576200,0.036000,0.076200> rotate<0,90.000000,0> translate<39.755800,0.000000,5.000400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.891500,0.000000,5.359700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.611800,0.000000,5.359700>}
box{<0,0,-0.076200><0.720300,0.036000,0.076200> rotate<0,0.000000,0> translate<38.891500,0.000000,5.359700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.611800,0.000000,5.359700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.755800,0.000000,5.503700>}
box{<0,0,-0.076200><0.203647,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.611800,0.000000,5.359700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.755800,0.000000,5.503700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.755800,0.000000,5.791800>}
box{<0,0,-0.076200><0.288100,0.036000,0.076200> rotate<0,90.000000,0> translate<39.755800,0.000000,5.791800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.755800,0.000000,5.791800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.611800,0.000000,5.935900>}
box{<0,0,-0.076200><0.203717,0.036000,0.076200> rotate<0,45.016916,0> translate<39.611800,0.000000,5.935900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.611800,0.000000,5.935900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.891500,0.000000,5.935900>}
box{<0,0,-0.076200><0.720300,0.036000,0.076200> rotate<0,0.000000,0> translate<38.891500,0.000000,5.935900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.176400,0.000000,19.002100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.108700,0.000000,19.002100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,0.000000,0> translate<54.108700,0.000000,19.002100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.108700,0.000000,19.002100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.108700,0.000000,19.535900>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,90.000000,0> translate<54.108700,0.000000,19.535900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.108700,0.000000,19.535900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.286700,0.000000,19.713900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,-44.997030,0> translate<54.108700,0.000000,19.535900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.286700,0.000000,19.713900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.642600,0.000000,19.713900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<54.286700,0.000000,19.713900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.642600,0.000000,19.713900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.820500,0.000000,19.535900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,45.013128,0> translate<54.642600,0.000000,19.713900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.820500,0.000000,19.535900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.820500,0.000000,19.002100>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,-90.000000,0> translate<54.820500,0.000000,19.002100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.820500,0.000000,19.358000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.176400,0.000000,19.713900>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<54.820500,0.000000,19.358000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.108700,0.000000,20.883200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.108700,0.000000,20.171400>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<54.108700,0.000000,20.171400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.108700,0.000000,20.171400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.176400,0.000000,20.171400>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,0.000000,0> translate<54.108700,0.000000,20.171400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.176400,0.000000,20.171400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.176400,0.000000,20.883200>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,90.000000,0> translate<55.176400,0.000000,20.883200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.642600,0.000000,20.171400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.642600,0.000000,20.527300>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<54.642600,0.000000,20.527300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.108700,0.000000,21.340700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.176400,0.000000,21.340700>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,0.000000,0> translate<54.108700,0.000000,21.340700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.176400,0.000000,21.340700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.176400,0.000000,21.874500>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,90.000000,0> translate<55.176400,0.000000,21.874500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.176400,0.000000,21.874500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.998500,0.000000,22.052500>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,45.013128,0> translate<54.998500,0.000000,22.052500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.998500,0.000000,22.052500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.286700,0.000000,22.052500>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<54.286700,0.000000,22.052500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.286700,0.000000,22.052500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.108700,0.000000,21.874500>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,-44.997030,0> translate<54.108700,0.000000,21.874500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.108700,0.000000,21.874500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.108700,0.000000,21.340700>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,-90.000000,0> translate<54.108700,0.000000,21.340700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.247700,0.000000,11.171900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.069700,0.000000,10.993900>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,-44.997030,0> translate<54.069700,0.000000,10.993900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.069700,0.000000,10.993900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.069700,0.000000,10.638000>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,-90.000000,0> translate<54.069700,0.000000,10.638000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.069700,0.000000,10.638000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.247700,0.000000,10.460100>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,44.980932,0> translate<54.069700,0.000000,10.638000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.247700,0.000000,10.460100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.959500,0.000000,10.460100>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,0.000000,0> translate<54.247700,0.000000,10.460100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.959500,0.000000,10.460100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.137400,0.000000,10.638000>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,-44.997030,0> translate<54.959500,0.000000,10.460100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.137400,0.000000,10.638000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.137400,0.000000,10.993900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<55.137400,0.000000,10.993900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.137400,0.000000,10.993900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.959500,0.000000,11.171900>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,45.013128,0> translate<54.959500,0.000000,11.171900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.959500,0.000000,11.171900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.603600,0.000000,11.171900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<54.603600,0.000000,11.171900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.603600,0.000000,11.171900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.603600,0.000000,10.816000>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,-90.000000,0> translate<54.603600,0.000000,10.816000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.137400,0.000000,11.629400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.069700,0.000000,11.629400>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,0.000000,0> translate<54.069700,0.000000,11.629400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.069700,0.000000,11.629400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.069700,0.000000,12.163200>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,90.000000,0> translate<54.069700,0.000000,12.163200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.069700,0.000000,12.163200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.247700,0.000000,12.341200>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,-44.997030,0> translate<54.069700,0.000000,12.163200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.247700,0.000000,12.341200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.603600,0.000000,12.341200>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,0.000000,0> translate<54.247700,0.000000,12.341200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.603600,0.000000,12.341200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.781500,0.000000,12.163200>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,45.013128,0> translate<54.603600,0.000000,12.341200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.781500,0.000000,12.163200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.781500,0.000000,11.629400>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,-90.000000,0> translate<54.781500,0.000000,11.629400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.781500,0.000000,11.985300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.137400,0.000000,12.341200>}
box{<0,0,-0.101600><0.503319,0.036000,0.101600> rotate<0,-44.997030,0> translate<54.781500,0.000000,11.985300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.069700,0.000000,13.510500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.069700,0.000000,12.798700>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<54.069700,0.000000,12.798700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.069700,0.000000,12.798700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.137400,0.000000,12.798700>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,0.000000,0> translate<54.069700,0.000000,12.798700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.137400,0.000000,12.798700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.137400,0.000000,13.510500>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,90.000000,0> translate<55.137400,0.000000,13.510500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.603600,0.000000,12.798700>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.603600,0.000000,13.154600>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<54.603600,0.000000,13.154600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.069700,0.000000,14.679800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.069700,0.000000,13.968000>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<54.069700,0.000000,13.968000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.069700,0.000000,13.968000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.137400,0.000000,13.968000>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,0.000000,0> translate<54.069700,0.000000,13.968000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.137400,0.000000,13.968000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.137400,0.000000,14.679800>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,90.000000,0> translate<55.137400,0.000000,14.679800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.603600,0.000000,13.968000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.603600,0.000000,14.323900>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<54.603600,0.000000,14.323900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.137400,0.000000,15.137300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.069700,0.000000,15.137300>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,0.000000,0> translate<54.069700,0.000000,15.137300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.069700,0.000000,15.137300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.137400,0.000000,15.849100>}
box{<0,0,-0.101600><1.283216,0.036000,0.101600> rotate<0,-33.687844,0> translate<54.069700,0.000000,15.137300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.137400,0.000000,15.849100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.069700,0.000000,15.849100>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,0.000000,0> translate<54.069700,0.000000,15.849100> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.098900,0.000000,3.657600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.031200,0.000000,3.657600>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,0.000000,0> translate<54.031200,0.000000,3.657600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.031200,0.000000,3.657600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.031200,0.000000,4.191400>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,90.000000,0> translate<54.031200,0.000000,4.191400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.031200,0.000000,4.191400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.209200,0.000000,4.369400>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,-44.997030,0> translate<54.031200,0.000000,4.191400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.209200,0.000000,4.369400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.387100,0.000000,4.369400>}
box{<0,0,-0.101600><0.177900,0.036000,0.101600> rotate<0,0.000000,0> translate<54.209200,0.000000,4.369400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.387100,0.000000,4.369400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.565100,0.000000,4.191400>}
box{<0,0,-0.101600><0.251730,0.036000,0.101600> rotate<0,44.997030,0> translate<54.387100,0.000000,4.369400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.565100,0.000000,4.191400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.743000,0.000000,4.369400>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,-45.013128,0> translate<54.565100,0.000000,4.191400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.743000,0.000000,4.369400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.921000,0.000000,4.369400>}
box{<0,0,-0.101600><0.178000,0.036000,0.101600> rotate<0,0.000000,0> translate<54.743000,0.000000,4.369400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.921000,0.000000,4.369400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.098900,0.000000,4.191400>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,45.013128,0> translate<54.921000,0.000000,4.369400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.098900,0.000000,4.191400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.098900,0.000000,3.657600>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,-90.000000,0> translate<55.098900,0.000000,3.657600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.565100,0.000000,3.657600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.565100,0.000000,4.191400>}
box{<0,0,-0.101600><0.533800,0.036000,0.101600> rotate<0,90.000000,0> translate<54.565100,0.000000,4.191400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.031200,0.000000,4.826900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.098900,0.000000,4.826900>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,0.000000,0> translate<54.031200,0.000000,4.826900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.098900,0.000000,4.826900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.098900,0.000000,5.538700>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,90.000000,0> translate<55.098900,0.000000,5.538700> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.031200,0.000000,5.996200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.921000,0.000000,5.996200>}
box{<0,0,-0.101600><0.889800,0.036000,0.101600> rotate<0,0.000000,0> translate<54.031200,0.000000,5.996200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.921000,0.000000,5.996200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.098900,0.000000,6.174100>}
box{<0,0,-0.101600><0.251589,0.036000,0.101600> rotate<0,-44.997030,0> translate<54.921000,0.000000,5.996200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.098900,0.000000,6.174100>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.098900,0.000000,6.530000>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<55.098900,0.000000,6.530000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.098900,0.000000,6.530000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.921000,0.000000,6.708000>}
box{<0,0,-0.101600><0.251659,0.036000,0.101600> rotate<0,45.013128,0> translate<54.921000,0.000000,6.708000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.921000,0.000000,6.708000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.031200,0.000000,6.708000>}
box{<0,0,-0.101600><0.889800,0.036000,0.101600> rotate<0,0.000000,0> translate<54.031200,0.000000,6.708000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.031200,0.000000,7.877300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.031200,0.000000,7.165500>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,-90.000000,0> translate<54.031200,0.000000,7.165500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.031200,0.000000,7.165500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.098900,0.000000,7.165500>}
box{<0,0,-0.101600><1.067700,0.036000,0.101600> rotate<0,0.000000,0> translate<54.031200,0.000000,7.165500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.098900,0.000000,7.165500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.098900,0.000000,7.877300>}
box{<0,0,-0.101600><0.711800,0.036000,0.101600> rotate<0,90.000000,0> translate<55.098900,0.000000,7.877300> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.565100,0.000000,7.165500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.565100,0.000000,7.521400>}
box{<0,0,-0.101600><0.355900,0.036000,0.101600> rotate<0,90.000000,0> translate<54.565100,0.000000,7.521400> }
//BATT silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.159000,0.000000,24.120000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.159000,0.000000,22.850000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<7.159000,0.000000,22.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.159000,0.000000,22.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.524000,0.000000,22.215000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<6.524000,0.000000,22.215000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.254000,0.000000,22.215000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.619000,0.000000,22.850000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.619000,0.000000,22.850000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.524000,0.000000,22.215000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.159000,0.000000,21.580000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<6.524000,0.000000,22.215000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.159000,0.000000,21.580000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.159000,0.000000,20.310000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<7.159000,0.000000,20.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.159000,0.000000,20.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.524000,0.000000,19.675000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<6.524000,0.000000,19.675000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.254000,0.000000,19.675000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.619000,0.000000,20.310000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.619000,0.000000,20.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.619000,0.000000,20.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.619000,0.000000,21.580000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.619000,0.000000,21.580000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.619000,0.000000,21.580000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.254000,0.000000,22.215000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.619000,0.000000,21.580000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.524000,0.000000,24.755000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.254000,0.000000,24.755000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.254000,0.000000,24.755000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.159000,0.000000,24.120000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.524000,0.000000,24.755000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<6.524000,0.000000,24.755000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.254000,0.000000,24.755000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.619000,0.000000,24.120000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.619000,0.000000,24.120000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.619000,0.000000,22.850000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.619000,0.000000,24.120000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.619000,0.000000,24.120000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.524000,0.000000,19.675000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.254000,0.000000,19.675000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.254000,0.000000,19.675000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<5.889000,0.000000,20.945000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<5.889000,0.000000,23.485000>}
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.980500,0.000000,22.428500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.913700,0.000000,22.428500>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,0.000000,0> translate<24.913700,0.000000,22.428500> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.913700,0.000000,22.428500>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.913700,0.000000,21.666500>}
box{<0,0,-0.203200><0.762000,0.036000,0.203200> rotate<0,-90.000000,0> translate<24.913700,0.000000,21.666500> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.913700,0.000000,22.428500>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.913700,0.000000,23.190500>}
box{<0,0,-0.203200><0.762000,0.036000,0.203200> rotate<0,90.000000,0> translate<24.913700,0.000000,23.190500> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.024700,0.000000,21.666500>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.024700,0.000000,22.428500>}
box{<0,0,-0.203200><0.762000,0.036000,0.203200> rotate<0,90.000000,0> translate<24.024700,0.000000,22.428500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.024700,0.000000,22.428500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.932500,0.000000,22.428500>}
box{<0,0,-0.076200><1.092200,0.036000,0.076200> rotate<0,0.000000,0> translate<22.932500,0.000000,22.428500> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.024700,0.000000,22.428500>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<24.024700,0.000000,23.190500>}
box{<0,0,-0.203200><0.762000,0.036000,0.203200> rotate<0,90.000000,0> translate<24.024700,0.000000,23.190500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.139500,0.000000,18.999500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.139500,0.000000,25.857500>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.139500,0.000000,25.857500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.885500,0.000000,26.111500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.027500,0.000000,26.111500>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.027500,0.000000,26.111500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.773500,0.000000,25.857500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.773500,0.000000,18.999500>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.773500,0.000000,18.999500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.027500,0.000000,18.745500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.885500,0.000000,18.745500>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.027500,0.000000,18.745500> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<21.027500,0.000000,18.999500>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<21.027500,0.000000,25.857500>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<27.885500,0.000000,25.857500>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<27.885500,0.000000,18.999500>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.970000,0.000000,8.936000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.970000,0.000000,8.336000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.970000,0.000000,8.336000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.770000,0.000000,8.936000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.770000,0.000000,8.336000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.770000,0.000000,8.336000> }
//LUX silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,10.214000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,8.944000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<62.453000,0.000000,8.944000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,8.944000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,8.309000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<61.818000,0.000000,8.309000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,8.309000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,8.944000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<59.913000,0.000000,8.944000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,13.389000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,12.754000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<61.818000,0.000000,13.389000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,12.754000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,11.484000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<62.453000,0.000000,11.484000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,11.484000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,10.849000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<61.818000,0.000000,10.849000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,10.849000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,11.484000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<59.913000,0.000000,11.484000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,11.484000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,12.754000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<59.913000,0.000000,12.754000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,12.754000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,13.389000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<59.913000,0.000000,12.754000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,10.214000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,10.849000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<61.818000,0.000000,10.849000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,10.849000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,10.214000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<59.913000,0.000000,10.214000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,8.944000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,10.214000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<59.913000,0.000000,10.214000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,17.834000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,16.564000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<62.453000,0.000000,16.564000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,16.564000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,15.929000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<61.818000,0.000000,15.929000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,15.929000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,16.564000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<59.913000,0.000000,16.564000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,15.929000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,15.294000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<61.818000,0.000000,15.929000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,15.294000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,14.024000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<62.453000,0.000000,14.024000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,14.024000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,13.389000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<61.818000,0.000000,13.389000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,13.389000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,14.024000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<59.913000,0.000000,14.024000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,14.024000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,15.294000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<59.913000,0.000000,15.294000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,15.294000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,15.929000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<59.913000,0.000000,15.294000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,18.469000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,18.469000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<60.548000,0.000000,18.469000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<62.453000,0.000000,17.834000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,18.469000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<61.818000,0.000000,18.469000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,18.469000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,17.834000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<59.913000,0.000000,17.834000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,16.564000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.913000,0.000000,17.834000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<59.913000,0.000000,17.834000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.818000,0.000000,8.309000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<60.548000,0.000000,8.309000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<60.548000,0.000000,8.309000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<61.183000,0.000000,9.579000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<61.183000,0.000000,12.119000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<61.183000,0.000000,14.659000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<61.183000,0.000000,17.199000>}
//PERIPH silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.677000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.677000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.582000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<34.947000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.582000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<34.947000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.502000,0.000000,2.456500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.137000,0.000000,3.091500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<30.502000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.137000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<31.137000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.042000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<32.407000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.042000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<32.407000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.407000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.137000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<31.137000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.137000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.502000,0.000000,1.186500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<30.502000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.677000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.042000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<33.042000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.042000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.677000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<33.042000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.947000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.677000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.677000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.057000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.327000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<26.057000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.327000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.962000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<27.327000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.962000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.327000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<27.327000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.962000,0.000000,2.456500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.597000,0.000000,3.091500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<27.962000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.597000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.867000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<28.597000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.867000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.502000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<29.867000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.502000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.867000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<29.867000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.867000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.597000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<28.597000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.597000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.962000,0.000000,1.186500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<27.962000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.882000,0.000000,2.456500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.517000,0.000000,3.091500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<22.882000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.517000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.787000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.517000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.787000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.422000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<24.787000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.422000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.787000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<24.787000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.787000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.517000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.517000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.517000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.882000,0.000000,1.186500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<22.882000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.057000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.422000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<25.422000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.422000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.057000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<25.422000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.327000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.057000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<26.057000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.437000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.707000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.437000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.707000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.342000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<19.707000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.342000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.707000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<19.707000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.342000,0.000000,2.456500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.977000,0.000000,3.091500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<20.342000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.977000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.247000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<20.977000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.247000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.882000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<22.247000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.882000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.247000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<22.247000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.247000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.977000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<20.977000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.977000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.342000,0.000000,1.186500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<20.342000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.802000,0.000000,2.456500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.802000,0.000000,1.186500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<17.802000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.437000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.802000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<17.802000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.802000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.437000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<17.802000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.707000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.437000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.437000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.217000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.487000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.217000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.487000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.122000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<37.487000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.122000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.487000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<37.487000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.217000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.582000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<35.582000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.582000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.217000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<35.582000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.487000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.217000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.217000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.757000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.027000,0.000000,3.091500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.757000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.027000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.662000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<40.027000,0.000000,3.091500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.662000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.027000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<40.027000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.757000,0.000000,3.091500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.122000,0.000000,2.456500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<38.122000,0.000000,2.456500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.122000,0.000000,1.186500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.757000,0.000000,0.551500>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<38.122000,0.000000,1.186500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.027000,0.000000,0.551500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.757000,0.000000,0.551500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.757000,0.000000,0.551500> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.662000,0.000000,2.456500>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.662000,0.000000,1.186500>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.662000,0.000000,1.186500> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<34.312000,0.000000,1.821500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<31.772000,0.000000,1.821500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<29.232000,0.000000,1.821500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<26.692000,0.000000,1.821500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<24.152000,0.000000,1.821500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<21.612000,0.000000,1.821500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<19.072000,0.000000,1.821500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<36.852000,0.000000,1.821500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<39.392000,0.000000,1.821500>}
//PRG silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,11.096000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,9.826000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.315500,0.000000,9.826000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,9.826000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,9.191000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<3.680500,0.000000,9.191000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,9.191000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,9.826000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<1.775500,0.000000,9.826000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,9.191000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,8.556000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<3.680500,0.000000,9.191000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,8.556000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,7.286000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.315500,0.000000,7.286000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,7.286000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,6.651000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<3.680500,0.000000,6.651000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,6.651000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,7.286000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<1.775500,0.000000,7.286000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,7.286000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,8.556000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<1.775500,0.000000,8.556000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,8.556000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,9.191000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<1.775500,0.000000,8.556000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,14.271000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,13.636000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<3.680500,0.000000,14.271000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,13.636000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,12.366000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.315500,0.000000,12.366000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,12.366000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,11.731000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<3.680500,0.000000,11.731000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,11.731000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,12.366000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<1.775500,0.000000,12.366000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,12.366000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,13.636000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<1.775500,0.000000,13.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,13.636000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,14.271000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<1.775500,0.000000,13.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,11.096000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,11.731000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<3.680500,0.000000,11.731000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,11.731000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,11.096000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<1.775500,0.000000,11.096000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,9.826000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,11.096000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<1.775500,0.000000,11.096000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,18.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,17.446000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.315500,0.000000,17.446000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,17.446000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,16.811000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<3.680500,0.000000,16.811000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,16.811000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,17.446000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<1.775500,0.000000,17.446000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,16.811000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,16.176000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<3.680500,0.000000,16.811000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,16.176000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,14.906000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.315500,0.000000,14.906000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,14.906000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,14.271000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<3.680500,0.000000,14.271000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,14.271000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,14.906000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<1.775500,0.000000,14.906000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,14.906000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,16.176000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<1.775500,0.000000,16.176000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,16.176000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,16.811000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<1.775500,0.000000,16.176000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,19.351000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,19.351000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.410500,0.000000,19.351000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.315500,0.000000,18.716000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,19.351000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<3.680500,0.000000,19.351000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,19.351000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,18.716000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<1.775500,0.000000,18.716000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,17.446000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.775500,0.000000,18.716000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<1.775500,0.000000,18.716000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.680500,0.000000,6.651000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.410500,0.000000,6.651000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.410500,0.000000,6.651000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.045500,0.000000,7.921000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.045500,0.000000,10.461000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.045500,0.000000,13.001000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.045500,0.000000,15.541000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.045500,0.000000,18.081000>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.970200,0.000000,18.796000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,18.796000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<39.547800,0.000000,18.796000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.970200,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,17.526000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<39.547800,0.000000,17.526000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<39.395400,0.000000,18.161000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<41.122600,0.000000,18.161000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.970200,0.000000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,16.002000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<39.547800,0.000000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.970200,0.000000,14.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,14.732000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<39.547800,0.000000,14.732000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<39.395400,0.000000,15.367000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<41.122600,0.000000,15.367000>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.970200,0.000000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,13.208000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<39.547800,0.000000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.970200,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,11.938000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<39.547800,0.000000,11.938000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<39.395400,0.000000,12.573000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<41.122600,0.000000,12.573000>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.253200,-1.536000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.830800,-1.536000,5.334000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<17.830800,-1.536000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.253200,-1.536000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.830800,-1.536000,6.604000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<17.830800,-1.536000,6.604000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<17.678400,-1.536000,5.969000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<19.405600,-1.536000,5.969000>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.253200,-1.536000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.830800,-1.536000,8.509000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<17.830800,-1.536000,8.509000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.253200,-1.536000,9.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.830800,-1.536000,9.779000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<17.830800,-1.536000,9.779000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<17.678400,-1.536000,9.144000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<19.405600,-1.536000,9.144000>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.205200,-1.536000,14.364000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.782800,-1.536000,14.364000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<17.782800,-1.536000,14.364000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.205200,-1.536000,15.634000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.782800,-1.536000,15.634000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<17.782800,-1.536000,15.634000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<17.630400,-1.536000,14.999000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<19.357600,-1.536000,14.999000>}
//REG silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.632500,0.000000,20.775500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.182500,0.000000,21.325500>}
box{<0,0,-0.063500><0.777817,0.036000,0.063500> rotate<0,-44.997030,0> translate<9.632500,0.000000,20.775500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.182500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.182500,0.000000,21.325500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<10.182500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.182500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.582500,0.000000,20.925500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,44.997030,0> translate<11.182500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.582500,0.000000,20.925500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.982500,0.000000,21.325500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.582500,0.000000,20.925500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.982500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.982500,0.000000,21.325500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<11.982500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.982500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.382500,0.000000,20.925500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,44.997030,0> translate<12.982500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.382500,0.000000,20.925500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.782500,0.000000,21.325500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,-44.997030,0> translate<13.382500,0.000000,20.925500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.782500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.782500,0.000000,21.325500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.782500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.782500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.182500,0.000000,20.925500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,44.997030,0> translate<14.782500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.182500,0.000000,20.925500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.582500,0.000000,21.325500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,-44.997030,0> translate<15.182500,0.000000,20.925500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.582500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.582500,0.000000,21.325500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<15.582500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.582500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.982500,0.000000,20.925500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,44.997030,0> translate<16.582500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.982500,0.000000,20.925500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.382500,0.000000,21.325500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,-44.997030,0> translate<16.982500,0.000000,20.925500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.382500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.382500,0.000000,21.325500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.382500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.382500,0.000000,21.325500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.932500,0.000000,20.775500>}
box{<0,0,-0.063500><0.777817,0.036000,0.063500> rotate<0,44.997030,0> translate<18.382500,0.000000,21.325500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.932500,0.000000,20.775500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.932500,0.000000,19.775500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<18.932500,0.000000,19.775500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.932500,0.000000,19.775500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.382500,0.000000,19.225500>}
box{<0,0,-0.063500><0.777817,0.036000,0.063500> rotate<0,-44.997030,0> translate<18.382500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.382500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.382500,0.000000,19.225500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.382500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.382500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.982500,0.000000,19.625500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,44.997030,0> translate<16.982500,0.000000,19.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.982500,0.000000,19.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.582500,0.000000,19.225500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,-44.997030,0> translate<16.582500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.582500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.582500,0.000000,19.225500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<15.582500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.582500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.182500,0.000000,19.625500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,44.997030,0> translate<15.182500,0.000000,19.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.182500,0.000000,19.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.782500,0.000000,19.225500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,-44.997030,0> translate<14.782500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.782500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.782500,0.000000,19.225500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.782500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.782500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.382500,0.000000,19.625500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,44.997030,0> translate<13.382500,0.000000,19.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.382500,0.000000,19.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.982500,0.000000,19.225500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,-44.997030,0> translate<12.982500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.982500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.982500,0.000000,19.225500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<11.982500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.982500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.582500,0.000000,19.625500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,44.997030,0> translate<11.582500,0.000000,19.625500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.582500,0.000000,19.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.182500,0.000000,19.225500>}
box{<0,0,-0.063500><0.565685,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.182500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.182500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.182500,0.000000,19.225500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<10.182500,0.000000,19.225500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.182500,0.000000,19.225500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.632500,0.000000,19.775500>}
box{<0,0,-0.063500><0.777817,0.036000,0.063500> rotate<0,44.997030,0> translate<9.632500,0.000000,19.775500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.632500,0.000000,19.775500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.632500,0.000000,20.775500>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<9.632500,0.000000,20.775500> }
box{<-0.300000,0,-0.300000><0.300000,0.036000,0.300000> rotate<0,-0.000000,0> translate<10.682500,0.000000,20.275500>}
box{<-0.300000,0,-0.300000><0.300000,0.036000,0.300000> rotate<0,-0.000000,0> translate<12.482500,0.000000,20.275500>}
box{<-0.300000,0,-0.300000><0.300000,0.036000,0.300000> rotate<0,-0.000000,0> translate<14.282500,0.000000,20.275500>}
box{<-0.300000,0,-0.300000><0.300000,0.036000,0.300000> rotate<0,-0.000000,0> translate<16.082500,0.000000,20.275500>}
box{<-0.300000,0,-0.300000><0.300000,0.036000,0.300000> rotate<0,-0.000000,0> translate<17.882500,0.000000,20.275500>}
//SOIC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.675000,0.000000,16.630000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.675000,0.000000,6.230000>}
box{<0,0,-0.076200><10.400000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.675000,0.000000,6.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.675000,0.000000,6.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.825000,0.000000,6.230000>}
box{<0,0,-0.076200><5.850000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.825000,0.000000,6.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.825000,0.000000,6.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.825000,0.000000,16.630000>}
box{<0,0,-0.076200><10.400000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.825000,0.000000,16.630000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.825000,0.000000,16.630000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.675000,0.000000,16.630000>}
box{<0,0,-0.076200><5.850000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.825000,0.000000,16.630000> }
difference{
cylinder{<29.800000,0,15.655000><29.800000,0.036000,15.655000>0.535800 translate<0,0.000000,0>}
cylinder{<29.800000,-0.1,15.655000><29.800000,0.135000,15.655000>0.383400 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,15.655000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,15.655000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,15.005000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,14.355000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,15.005000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,14.355000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,13.705000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,13.055000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,12.405000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,11.755000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,11.105000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,10.455000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,9.805000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,9.155000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,8.505000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,7.855000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<35.182800,0.000000,7.205000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,13.705000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,13.055000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,12.405000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,11.755000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,11.105000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,10.455000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,9.805000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,9.155000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,8.505000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,7.855000>}
box{<-0.162500,0,-0.467200><0.162500,0.036000,0.467200> rotate<0,-270.000000,0> translate<28.317200,0.000000,7.205000>}
//T1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,23.951000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,23.951000>}
box{<0,0,-0.063500><3.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.526000,0.000000,23.951000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,23.951000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,17.451000>}
box{<0,0,-0.063500><6.500000,0.036000,0.063500> rotate<0,-90.000000,0> translate<47.526000,0.000000,17.451000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,17.451000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,17.451000>}
box{<0,0,-0.063500><3.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.526000,0.000000,17.451000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,17.451000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,23.951000>}
box{<0,0,-0.063500><6.500000,0.036000,0.063500> rotate<0,90.000000,0> translate<51.026000,0.000000,23.951000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,18.161000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<50.546000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,18.161000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<48.006000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,23.241000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<48.006000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,23.241000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<48.006000,0.000000,23.241000> }
//T2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,16.458000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,16.458000>}
box{<0,0,-0.063500><3.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.526000,0.000000,16.458000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,16.458000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,9.958000>}
box{<0,0,-0.063500><6.500000,0.036000,0.063500> rotate<0,-90.000000,0> translate<47.526000,0.000000,9.958000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,9.958000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,9.958000>}
box{<0,0,-0.063500><3.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.526000,0.000000,9.958000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,9.958000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,16.458000>}
box{<0,0,-0.063500><6.500000,0.036000,0.063500> rotate<0,90.000000,0> translate<51.026000,0.000000,16.458000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,10.668000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<50.546000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,10.668000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<48.006000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,15.748000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<48.006000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,15.748000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<48.006000,0.000000,15.748000> }
//T3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,8.838000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,8.838000>}
box{<0,0,-0.063500><3.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.526000,0.000000,8.838000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,8.838000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,2.338000>}
box{<0,0,-0.063500><6.500000,0.036000,0.063500> rotate<0,-90.000000,0> translate<47.526000,0.000000,2.338000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.526000,0.000000,2.338000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,2.338000>}
box{<0,0,-0.063500><3.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.526000,0.000000,2.338000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,2.338000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.026000,0.000000,8.838000>}
box{<0,0,-0.063500><6.500000,0.036000,0.063500> rotate<0,90.000000,0> translate<51.026000,0.000000,8.838000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,3.048000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<50.546000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,3.048000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<48.006000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,8.128000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<48.006000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.546000,0.000000,8.128000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<48.006000,0.000000,8.128000> }
//U$1 silk screen
//U$2 silk screen
//U$3 silk screen
//U$4 silk screen
//U$5 silk screen
box{<-0.693400,0,-0.004400><0.693400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.723200,0.000000,10.648900>}
box{<-0.022200,0,-0.004400><0.022200,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.892200,0.000000,10.648900>}
box{<-0.969000,0,-0.004400><0.969000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.972100,0.000000,10.657800>}
box{<-0.977900,0,-0.004400><0.977900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.972100,0.000000,10.666700>}
box{<-0.986800,0,-0.004400><0.986800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.972100,0.000000,10.675600>}
box{<-0.986800,0,-0.004400><0.986800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.972100,0.000000,10.684500>}
box{<-0.986800,0,-0.004400><0.986800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.972100,0.000000,10.693300>}
box{<-0.986800,0,-0.004400><0.986800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.972100,0.000000,10.702200>}
box{<-0.986800,0,-0.004400><0.986800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.972100,0.000000,10.711100>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.100900,0.000000,10.720000>}
box{<-0.053300,0,-0.004400><0.053300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.905500,0.000000,10.720000>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.728900>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.918900,0.000000,10.728900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.737800>}
box{<-0.035500,0,-0.004400><0.035500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.923300,0.000000,10.737800>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.746700>}
box{<-0.035500,0,-0.004400><0.035500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.923300,0.000000,10.746700>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.755600>}
box{<-0.035500,0,-0.004400><0.035500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.923300,0.000000,10.755600>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.764500>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.764500>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.773400>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.773400>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.782200>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.782200>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.791100>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.791100>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.800000>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.800000>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.808900>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.808900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.817800>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.817800>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.826700>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.826700>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.835600>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.835600>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.844500>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.844500>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.853400>}
box{<-0.213300,0,-0.004400><0.213300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.061000,0.000000,10.853400>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.853400>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.862300>}
box{<-0.213300,0,-0.004400><0.213300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.061000,0.000000,10.862300>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.862300>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.871100>}
box{<-0.213300,0,-0.004400><0.213300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.061000,0.000000,10.871100>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.871100>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.880000>}
box{<-0.213300,0,-0.004400><0.213300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.061000,0.000000,10.880000>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.880000>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.888900>}
box{<-0.213300,0,-0.004400><0.213300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.061000,0.000000,10.888900>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.888900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.897800>}
box{<-0.213300,0,-0.004400><0.213300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.061000,0.000000,10.897800>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.897800>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.906700>}
box{<-0.213300,0,-0.004400><0.213300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.061000,0.000000,10.906700>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.906700>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.915600>}
box{<-0.213300,0,-0.004400><0.213300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.061000,0.000000,10.915600>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.915600>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.924500>}
box{<-0.213300,0,-0.004400><0.213300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.061000,0.000000,10.924500>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.924500>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.933400>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,10.933400>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,10.933400>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.933400>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.942300>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,10.942300>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,10.942300>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.942300>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.951200>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,10.951200>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,10.951200>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.951200>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.960000>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,10.960000>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,10.960000>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.960000>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.968900>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,10.968900>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,10.968900>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,10.968900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,10.977800>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,10.977800>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,10.977800>}
box{<-0.035500,0,-0.004400><0.035500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.932200,0.000000,10.977800>}
box{<-3.413700,0,-0.004400><3.413700,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.776000,0.000000,10.986700>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,10.986700>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,10.986700>}
box{<-3.387100,0,-0.004400><3.387100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.283800,0.000000,10.986700>}
box{<-3.440400,0,-0.004400><3.440400,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.749400,0.000000,10.995600>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,10.995600>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,10.995600>}
box{<-3.413700,0,-0.004400><3.413700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.310400,0.000000,10.995600>}
box{<-3.453700,0,-0.004400><3.453700,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.736000,0.000000,11.004500>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.004500>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.004500>}
box{<-3.427100,0,-0.004400><3.427100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,11.004500>}
box{<-3.627100,0,-0.004400><3.627100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.891600,0.000000,11.013400>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.013400>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.013400>}
box{<-3.596000,0,-0.004400><3.596000,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.172700,0.000000,11.013400>}
box{<-3.649300,0,-0.004400><3.649300,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.896000,0.000000,11.022300>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.022300>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.022300>}
box{<-3.618200,0,-0.004400><3.618200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.168200,0.000000,11.022300>}
box{<-3.658200,0,-0.004400><3.658200,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.887100,0.000000,11.031200>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.031200>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.031200>}
box{<-3.631500,0,-0.004400><3.631500,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.172600,0.000000,11.031200>}
box{<-3.662600,0,-0.004400><3.662600,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.882700,0.000000,11.040100>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.040100>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.040100>}
box{<-3.636000,0,-0.004400><3.636000,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.177100,0.000000,11.040100>}
box{<-3.667100,0,-0.004400><3.667100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.878300,0.000000,11.048900>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.048900>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.048900>}
box{<-3.640400,0,-0.004400><3.640400,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.181500,0.000000,11.048900>}
box{<-3.671500,0,-0.004400><3.671500,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.873800,0.000000,11.057800>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.057800>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.057800>}
box{<-3.644900,0,-0.004400><3.644900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.186000,0.000000,11.057800>}
box{<-3.676000,0,-0.004400><3.676000,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.869400,0.000000,11.066700>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.066700>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.066700>}
box{<-3.649300,0,-0.004400><3.649300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.190400,0.000000,11.066700>}
box{<-3.680400,0,-0.004400><3.680400,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.864900,0.000000,11.075600>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.075600>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.075600>}
box{<-3.653800,0,-0.004400><3.653800,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.194900,0.000000,11.075600>}
box{<-3.684900,0,-0.004400><3.684900,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.860500,0.000000,11.084500>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.084500>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.084500>}
box{<-3.658200,0,-0.004400><3.658200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.199300,0.000000,11.084500>}
box{<-3.689300,0,-0.004400><3.689300,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.856000,0.000000,11.093400>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.093400>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.093400>}
box{<-3.662700,0,-0.004400><3.662700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.203800,0.000000,11.093400>}
box{<-3.516000,0,-0.004400><3.516000,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.673800,0.000000,11.102300>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.102300>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.102300>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.102300>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.590000,0.000000,11.102300>}
box{<-3.489300,0,-0.004400><3.489300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.386000,0.000000,11.102300>}
box{<-3.516000,0,-0.004400><3.516000,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.673800,0.000000,11.111200>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.111200>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.111200>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.111200>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.590000,0.000000,11.111200>}
box{<-3.489300,0,-0.004400><3.489300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.386000,0.000000,11.111200>}
box{<-3.520400,0,-0.004400><3.520400,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.669300,0.000000,11.120100>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.120100>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.120100>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.120100>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.590000,0.000000,11.120100>}
box{<-3.493700,0,-0.004400><3.493700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.390400,0.000000,11.120100>}
box{<-3.520400,0,-0.004400><3.520400,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.669300,0.000000,11.129000>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.129000>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.129000>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.129000>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.590000,0.000000,11.129000>}
box{<-3.493700,0,-0.004400><3.493700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.390400,0.000000,11.129000>}
box{<-3.524900,0,-0.004400><3.524900,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.664900,0.000000,11.137800>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.137800>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.137800>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.137800>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.590000,0.000000,11.137800>}
box{<-3.498200,0,-0.004400><3.498200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.394900,0.000000,11.137800>}
box{<-0.186700,0,-0.004400><0.186700,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.326700,0.000000,11.146700>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.146700>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.146700>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.146700>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.146700>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.590000,0.000000,11.146700>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.146700>}
box{<-0.168900,0,-0.004400><0.168900,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.724200,0.000000,11.146700>}
box{<-0.173300,0,-0.004400><0.173300,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.304500,0.000000,11.155600>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.155600>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.155600>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.155600>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.155600>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.590000,0.000000,11.155600>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.155600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.746400,0.000000,11.155600>}
box{<-0.164400,0,-0.004400><0.164400,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.295600,0.000000,11.164500>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.164500>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.164500>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.164500>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.164500>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.590000,0.000000,11.164500>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.164500>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.755300,0.000000,11.164500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.286700,0.000000,11.173400>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.173400>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.173400>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.173400>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.173400>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.590000,0.000000,11.173400>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.173400>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.764200,0.000000,11.173400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.273400,0.000000,11.182300>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.182300>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.182300>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.182300>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.182300>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.590000,0.000000,11.182300>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.182300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.777500,0.000000,11.182300>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.268900,0.000000,11.191200>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.191200>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.191200>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.191200>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.191200>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.590000,0.000000,11.191200>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.191200>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.782000,0.000000,11.191200>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.264500,0.000000,11.200100>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.200100>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.200100>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.200100>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.200100>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.590000,0.000000,11.200100>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.200100>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.786400,0.000000,11.200100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.260100,0.000000,11.209000>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.209000>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.209000>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.209000>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.234400,0.000000,11.209000>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.590000,0.000000,11.209000>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.209000>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.790900,0.000000,11.209000>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.251200,0.000000,11.217900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.217900>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.217900>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.217900>}
box{<-0.044400,0,-0.004400><0.044400,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.238800,0.000000,11.217900>}
box{<-0.044400,0,-0.004400><0.044400,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.585500,0.000000,11.217900>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.217900>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.799800,0.000000,11.217900>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.251200,0.000000,11.226700>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.226700>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.226700>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.226700>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.412200,0.000000,11.226700>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.226700>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.799800,0.000000,11.226700>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.242300,0.000000,11.235600>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.235600>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.235600>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.235600>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.412200,0.000000,11.235600>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.235600>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.804200,0.000000,11.235600>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.237800,0.000000,11.244500>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.244500>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.244500>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.244500>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.412200,0.000000,11.244500>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.244500>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.813100,0.000000,11.244500>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.233400,0.000000,11.253400>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.253400>}
box{<-0.044400,0,-0.004400><0.044400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.509800,0.000000,11.253400>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.253400>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.412200,0.000000,11.253400>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.253400>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.817500,0.000000,11.253400>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.228900,0.000000,11.262300>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.262300>}
box{<-0.044400,0,-0.004400><0.044400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.509800,0.000000,11.262300>}
box{<-0.044400,0,-0.004400><0.044400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.883200,0.000000,11.262300>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.412200,0.000000,11.262300>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.262300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.822000,0.000000,11.262300>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.228900,0.000000,11.271200>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.271200>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.271200>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.887700,0.000000,11.271200>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.412200,0.000000,11.271200>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.271200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.822000,0.000000,11.271200>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.224500,0.000000,11.280100>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.280100>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.505400,0.000000,11.280100>}
box{<-0.044400,0,-0.004400><0.044400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.883200,0.000000,11.280100>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.412200,0.000000,11.280100>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.280100>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.826400,0.000000,11.280100>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.224500,0.000000,11.289000>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.289000>}
box{<-0.231100,0,-0.004400><0.231100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.696500,0.000000,11.289000>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.412200,0.000000,11.289000>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.289000>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.826400,0.000000,11.289000>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.220000,0.000000,11.297900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.297900>}
box{<-0.226700,0,-0.004400><0.226700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.701000,0.000000,11.297900>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.412200,0.000000,11.297900>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.297900>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.830900,0.000000,11.297900>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.220000,0.000000,11.306800>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.306800>}
box{<-0.226700,0,-0.004400><0.226700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.701000,0.000000,11.306800>}
box{<-0.044400,0,-0.004400><0.044400,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.585500,0.000000,11.306800>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.306800>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.830900,0.000000,11.306800>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.215600,0.000000,11.315600>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.315600>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.692100,0.000000,11.315600>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.315600>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.835300,0.000000,11.315600>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.215600,0.000000,11.324500>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.324500>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.692100,0.000000,11.324500>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.324500>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.835300,0.000000,11.324500>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.215600,0.000000,11.333400>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.333400>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.692100,0.000000,11.333400>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.333400>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.835300,0.000000,11.333400>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.215600,0.000000,11.342300>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.342300>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.692100,0.000000,11.342300>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.342300>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.835300,0.000000,11.342300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.351200>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.351200>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.692100,0.000000,11.351200>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.351200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.351200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.360100>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.360100>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.692100,0.000000,11.360100>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.360100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.360100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.369000>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.369000>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.369000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.369000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.377900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.377900>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.377900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.377900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.386800>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.386800>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.386800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.386800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.395700>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.087500,0.000000,11.395700>}
box{<-0.031100,0,-0.004400><0.031100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.927800,0.000000,11.395700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.395700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.404500>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.092000,0.000000,11.404500>}
box{<-0.035500,0,-0.004400><0.035500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.923300,0.000000,11.404500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.404500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.413400>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.092000,0.000000,11.413400>}
box{<-0.035500,0,-0.004400><0.035500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.923300,0.000000,11.413400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.413400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.422300>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.092000,0.000000,11.422300>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.918900,0.000000,11.422300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.422300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.431200>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.096400,0.000000,11.431200>}
box{<-0.044400,0,-0.004400><0.044400,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.914400,0.000000,11.431200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.431200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.440100>}
box{<-0.986800,0,-0.004400><0.986800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.972100,0.000000,11.440100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.440100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.449000>}
box{<-0.986800,0,-0.004400><0.986800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.972100,0.000000,11.449000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.449000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.457900>}
box{<-0.986800,0,-0.004400><0.986800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.972100,0.000000,11.457900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.457900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.466800>}
box{<-0.986800,0,-0.004400><0.986800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.972100,0.000000,11.466800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.466800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.475700>}
box{<-0.986800,0,-0.004400><0.986800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.972100,0.000000,11.475700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.475700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.484600>}
box{<-0.982300,0,-0.004400><0.982300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.976500,0.000000,11.484600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.484600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.493400>}
box{<-0.977900,0,-0.004400><0.977900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.972100,0.000000,11.493400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.493400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.502300>}
box{<-0.964500,0,-0.004400><0.964500,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.976500,0.000000,11.502300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.502300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.511200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.511200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.520100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.520100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.529000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.529000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.537900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.537900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.546800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.546800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.555700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.555700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.564600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.564600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.573500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.573500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.582300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.582300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.591200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.591200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.600100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.600100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.609000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.609000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.617900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.617900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.626800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.626800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.635700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.635700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.644600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.644600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.653500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.653500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.662400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.662400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.671200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.671200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.680100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.680100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.689000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.689000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.697900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.697900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.706800>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,11.706800>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,11.706800>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.706800>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554200,0.000000,11.706800>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.060900,0.000000,11.706800>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.603400,0.000000,11.706800>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,11.706800>}
box{<-0.048900,0,-0.004400><0.048900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395200,0.000000,11.706800>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.417500,0.000000,11.706800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.706800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.715700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.715700>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655700,0.000000,11.715700>}
box{<-0.431200,0,-0.004400><0.431200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,11.715700>}
box{<-0.302200,0,-0.004400><0.302200,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,11.715700>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.715700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.558600,0.000000,11.715700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.065300,0.000000,11.715700>}
box{<-0.306700,0,-0.004400><0.306700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.447700,0.000000,11.715700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.715700>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634600,0.000000,11.715700>}
box{<-0.431100,0,-0.004400><0.431100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.674800,0.000000,11.715700>}
box{<-0.373400,0,-0.004400><0.373400,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.501700,0.000000,11.715700>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.715700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413100,0.000000,11.715700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.715700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.724600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.724600>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,11.724600>}
box{<-0.466700,0,-0.004400><0.466700,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,11.724600>}
box{<-0.333300,0,-0.004400><0.333300,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,11.724600>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.724600>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554100,0.000000,11.724600>}
box{<-0.097700,0,-0.004400><0.097700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.065300,0.000000,11.724600>}
box{<-0.337800,0,-0.004400><0.337800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,11.724600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.724600>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,11.724600>}
box{<-0.466700,0,-0.004400><0.466700,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,11.724600>}
box{<-0.400000,0,-0.004400><0.400000,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.724600>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,11.724600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413100,0.000000,11.724600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.724600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.733500>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.733500>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,11.733500>}
box{<-0.480000,0,-0.004400><0.480000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709200,0.000000,11.733500>}
box{<-0.351100,0,-0.004400><0.351100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,11.733500>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260700,0.000000,11.733500>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.558600,0.000000,11.733500>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.065300,0.000000,11.733500>}
box{<-0.355600,0,-0.004400><0.355600,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,11.733500>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.733500>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,11.733500>}
box{<-0.480000,0,-0.004400><0.480000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688100,0.000000,11.733500>}
box{<-0.417800,0,-0.004400><0.417800,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.733500>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,11.733500>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,11.733500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.733500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.742400>}
box{<-0.124500,0,-0.004400><0.124500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.742400>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,11.742400>}
box{<-0.497800,0,-0.004400><0.497800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709200,0.000000,11.742400>}
box{<-0.364500,0,-0.004400><0.364500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,11.742400>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260600,0.000000,11.742400>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.558600,0.000000,11.742400>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.065300,0.000000,11.742400>}
box{<-0.364500,0,-0.004400><0.364500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,11.742400>}
box{<-0.124500,0,-0.004400><0.124500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.742400>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,11.742400>}
box{<-0.493400,0,-0.004400><0.493400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.692600,0.000000,11.742400>}
box{<-0.431100,0,-0.004400><0.431100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.488300,0.000000,11.742400>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395200,0.000000,11.742400>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,11.742400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.742400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.751300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.628900,0.000000,11.751300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,11.751300>}
box{<-0.506700,0,-0.004400><0.506700,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709200,0.000000,11.751300>}
box{<-0.373400,0,-0.004400><0.373400,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,11.751300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260600,0.000000,11.751300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.558600,0.000000,11.751300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.065300,0.000000,11.751300>}
box{<-0.373400,0,-0.004400><0.373400,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,11.751300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607800,0.000000,11.751300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,11.751300>}
box{<-0.502300,0,-0.004400><0.502300,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.692600,0.000000,11.751300>}
box{<-0.440000,0,-0.004400><0.440000,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.488300,0.000000,11.751300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.751300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,11.751300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.751300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.760100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,11.760100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,11.760100>}
box{<-0.515600,0,-0.004400><0.515600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709200,0.000000,11.760100>}
box{<-0.382200,0,-0.004400><0.382200,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,11.760100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.760100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554200,0.000000,11.760100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.069800,0.000000,11.760100>}
box{<-0.382300,0,-0.004400><0.382300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,11.760100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,11.760100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,11.760100>}
box{<-0.511200,0,-0.004400><0.511200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.692600,0.000000,11.760100>}
box{<-0.448900,0,-0.004400><0.448900,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.488300,0.000000,11.760100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.760100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,11.760100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.760100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.769000>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.769000>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,11.769000>}
box{<-0.515600,0,-0.004400><0.515600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709200,0.000000,11.769000>}
box{<-0.386700,0,-0.004400><0.386700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,11.769000>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.769000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554200,0.000000,11.769000>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.065300,0.000000,11.769000>}
box{<-0.391200,0,-0.004400><0.391200,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,11.769000>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.769000>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,11.769000>}
box{<-0.515600,0,-0.004400><0.515600,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688100,0.000000,11.769000>}
box{<-0.453400,0,-0.004400><0.453400,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.769000>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,11.769000>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,11.769000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.769000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.777900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.777900>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,11.777900>}
box{<-0.524500,0,-0.004400><0.524500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709200,0.000000,11.777900>}
box{<-0.395600,0,-0.004400><0.395600,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,11.777900>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.777900>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554200,0.000000,11.777900>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.069800,0.000000,11.777900>}
box{<-0.391200,0,-0.004400><0.391200,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,11.777900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.777900>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,11.777900>}
box{<-0.524500,0,-0.004400><0.524500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688100,0.000000,11.777900>}
box{<-0.462300,0,-0.004400><0.462300,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.777900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.777900>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,11.777900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.777900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.786800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.786800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,11.786800>}
box{<-0.528900,0,-0.004400><0.528900,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,11.786800>}
box{<-0.395600,0,-0.004400><0.395600,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,11.786800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.786800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.558600,0.000000,11.786800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.065300,0.000000,11.786800>}
box{<-0.400000,0,-0.004400><0.400000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452100,0.000000,11.786800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.786800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,11.786800>}
box{<-0.524500,0,-0.004400><0.524500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688100,0.000000,11.786800>}
box{<-0.462300,0,-0.004400><0.462300,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.786800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.786800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,11.786800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.786800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.795700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.795700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,11.795700>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709300,0.000000,11.795700>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,11.795700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.795700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554200,0.000000,11.795700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.065300,0.000000,11.795700>}
box{<-0.400000,0,-0.004400><0.400000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452100,0.000000,11.795700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.795700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,11.795700>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688200,0.000000,11.795700>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.795700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.795700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,11.795700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.795700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.804600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.804600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,11.804600>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709300,0.000000,11.804600>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,11.804600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.804600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554200,0.000000,11.804600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.069800,0.000000,11.804600>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,11.804600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.804600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,11.804600>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688200,0.000000,11.804600>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.804600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,11.804600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,11.804600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.804600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.813500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,11.813500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,11.813500>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709300,0.000000,11.813500>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,11.813500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.813500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554200,0.000000,11.813500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.069800,0.000000,11.813500>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,11.813500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.603400,0.000000,11.813500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,11.813500>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688200,0.000000,11.813500>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.813500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.813500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,11.813500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.813500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.822400>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.822400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,11.822400>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,11.822400>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,11.822400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.822400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554200,0.000000,11.822400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.069800,0.000000,11.822400>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,11.822400>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.822400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,11.822400>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,11.822400>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.822400>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.822400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,11.822400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.822400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.831300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.831300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,11.831300>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,11.831300>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,11.831300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.831300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554200,0.000000,11.831300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.069800,0.000000,11.831300>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,11.831300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.831300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,11.831300>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,11.831300>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.831300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.831300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,11.831300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.831300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.840200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.840200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,11.840200>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,11.840200>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,11.840200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.840200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554200,0.000000,11.840200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.069800,0.000000,11.840200>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,11.840200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.840200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,11.840200>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,11.840200>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.840200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.840200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,11.840200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.840200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.849000>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,11.849000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,11.849000>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,11.849000>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,11.849000>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.849000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554200,0.000000,11.849000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.069800,0.000000,11.849000>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,11.849000>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.603400,0.000000,11.849000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,11.849000>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,11.849000>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.849000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.849000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,11.849000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.849000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.857900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.857900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,11.857900>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,11.857900>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,11.857900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.857900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554200,0.000000,11.857900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.069800,0.000000,11.857900>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,11.857900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.857900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,11.857900>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,11.857900>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.857900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.857900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,11.857900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.857900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.866800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.866800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,11.866800>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709300,0.000000,11.866800>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,11.866800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.866800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554200,0.000000,11.866800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.065300,0.000000,11.866800>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,11.866800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.866800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,11.866800>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688200,0.000000,11.866800>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.866800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.866800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,11.866800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.866800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.875700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.875700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,11.875700>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709300,0.000000,11.875700>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,11.875700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260700,0.000000,11.875700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.558600,0.000000,11.875700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.065300,0.000000,11.875700>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,11.875700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.875700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,11.875700>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688200,0.000000,11.875700>}
box{<-0.466700,0,-0.004400><0.466700,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.497200,0.000000,11.875700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.875700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,11.875700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.875700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.884600>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,11.884600>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,11.884600>}
box{<-0.528900,0,-0.004400><0.528900,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,11.884600>}
box{<-0.400000,0,-0.004400><0.400000,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.078300,0.000000,11.884600>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.884600>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554200,0.000000,11.884600>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.069800,0.000000,11.884600>}
box{<-0.400000,0,-0.004400><0.400000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452100,0.000000,11.884600>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.603400,0.000000,11.884600>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,11.884600>}
box{<-0.528900,0,-0.004400><0.528900,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,11.884600>}
box{<-0.462300,0,-0.004400><0.462300,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.884600>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386300,0.000000,11.884600>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,11.884600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.884600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.893500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.893500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,11.893500>}
box{<-0.528900,0,-0.004400><0.528900,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,11.893500>}
box{<-0.400000,0,-0.004400><0.400000,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.078300,0.000000,11.893500>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.893500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.558600,0.000000,11.893500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.065300,0.000000,11.893500>}
box{<-0.400000,0,-0.004400><0.400000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452100,0.000000,11.893500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.893500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,11.893500>}
box{<-0.528900,0,-0.004400><0.528900,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,11.893500>}
box{<-0.462300,0,-0.004400><0.462300,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.893500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.893500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,11.893500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.893500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.902400>}
box{<-0.137700,0,-0.004400><0.137700,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,11.902400>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,11.902400>}
box{<-0.520100,0,-0.004400><0.520100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,11.902400>}
box{<-0.391100,0,-0.004400><0.391100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.078300,0.000000,11.902400>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.902400>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554200,0.000000,11.902400>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.069800,0.000000,11.902400>}
box{<-0.395600,0,-0.004400><0.395600,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,11.902400>}
box{<-0.137700,0,-0.004400><0.137700,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.603400,0.000000,11.902400>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,11.902400>}
box{<-0.520100,0,-0.004400><0.520100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,11.902400>}
box{<-0.453400,0,-0.004400><0.453400,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.902400>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386300,0.000000,11.902400>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,11.902400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.902400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.911300>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,11.911300>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.646900,0.000000,11.911300>}
box{<-0.520100,0,-0.004400><0.520100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,11.911300>}
box{<-0.391100,0,-0.004400><0.391100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.078300,0.000000,11.911300>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.911300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.558600,0.000000,11.911300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.065300,0.000000,11.911300>}
box{<-0.386700,0,-0.004400><0.386700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,11.911300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607800,0.000000,11.911300>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.625800,0.000000,11.911300>}
box{<-0.511200,0,-0.004400><0.511200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,11.911300>}
box{<-0.448900,0,-0.004400><0.448900,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.497200,0.000000,11.911300>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386300,0.000000,11.911300>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,11.911300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.911300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.920200>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,11.920200>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.646900,0.000000,11.920200>}
box{<-0.511200,0,-0.004400><0.511200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,11.920200>}
box{<-0.382300,0,-0.004400><0.382300,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.078300,0.000000,11.920200>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260600,0.000000,11.920200>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.558600,0.000000,11.920200>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.065300,0.000000,11.920200>}
box{<-0.377800,0,-0.004400><0.377800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,11.920200>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.603400,0.000000,11.920200>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.625800,0.000000,11.920200>}
box{<-0.511200,0,-0.004400><0.511200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,11.920200>}
box{<-0.440000,0,-0.004400><0.440000,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.497200,0.000000,11.920200>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386300,0.000000,11.920200>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,11.920200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.920200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.929100>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.929100>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,11.929100>}
box{<-0.502300,0,-0.004400><0.502300,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,11.929100>}
box{<-0.373400,0,-0.004400><0.373400,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.078300,0.000000,11.929100>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.929100>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554200,0.000000,11.929100>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.069800,0.000000,11.929100>}
box{<-0.368900,0,-0.004400><0.368900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,11.929100>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.929100>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,11.929100>}
box{<-0.497800,0,-0.004400><0.497800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.679200,0.000000,11.929100>}
box{<-0.431100,0,-0.004400><0.431100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.497200,0.000000,11.929100>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.381800,0.000000,11.929100>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,11.929100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.929100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.937900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.937900>}
box{<-0.097700,0,-0.004400><0.097700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,11.937900>}
box{<-0.484500,0,-0.004400><0.484500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,11.937900>}
box{<-0.364500,0,-0.004400><0.364500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.078300,0.000000,11.937900>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.937900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.558600,0.000000,11.937900>}
box{<-0.097700,0,-0.004400><0.097700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.065300,0.000000,11.937900>}
box{<-0.360000,0,-0.004400><0.360000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,11.937900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.937900>}
box{<-0.097700,0,-0.004400><0.097700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,11.937900>}
box{<-0.484500,0,-0.004400><0.484500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,11.937900>}
box{<-0.422200,0,-0.004400><0.422200,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.497200,0.000000,11.937900>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386200,0.000000,11.937900>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,11.937900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.937900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.946800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.946800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,11.946800>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.700300,0.000000,11.946800>}
box{<-0.346700,0,-0.004400><0.346700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.078300,0.000000,11.946800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260700,0.000000,11.946800>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.554100,0.000000,11.946800>}
box{<-0.071100,0,-0.004400><0.071100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.065300,0.000000,11.946800>}
box{<-0.342200,0,-0.004400><0.342200,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,11.946800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.946800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,11.946800>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.679200,0.000000,11.946800>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,11.946800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.946800>}
box{<-0.062200,0,-0.004400><0.062200,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.404100,0.000000,11.946800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.946800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.955700>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,11.955700>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,11.955700>}
box{<-0.444500,0,-0.004400><0.444500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.691500,0.000000,11.955700>}
box{<-0.320000,0,-0.004400><0.320000,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,11.955700>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.955700>}
box{<-0.022200,0,-0.004400><0.022200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.563000,0.000000,11.955700>}
box{<-0.306700,0,-0.004400><0.306700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,11.955700>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,11.955700>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,11.955700>}
box{<-0.448900,0,-0.004400><0.448900,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.674800,0.000000,11.955700>}
box{<-0.168900,0,-0.004400><0.168900,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.279500,0.000000,11.955700>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386200,0.000000,11.955700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.955700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.964600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.964600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,11.964600>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.340300,0.000000,11.964600>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,11.964600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260700,0.000000,11.964600>}
box{<-0.053300,0,-0.004400><0.053300,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.309700,0.000000,11.964600>}
box{<-0.053300,0,-0.004400><0.053300,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.798600,0.000000,11.964600>}
box{<-0.062200,0,-0.004400><0.062200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,11.964600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.964600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,11.964600>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.319200,0.000000,11.964600>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,11.964600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.964600>}
box{<-0.053300,0,-0.004400><0.053300,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,11.964600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.964600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.973500>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.973500>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655700,0.000000,11.973500>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.335900,0.000000,11.973500>}
box{<-0.066700,0,-0.004400><0.066700,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.344900,0.000000,11.973500>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,11.973500>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260700,0.000000,11.973500>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,11.973500>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.807500,0.000000,11.973500>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323200,0.000000,11.973500>}
box{<-0.053300,0,-0.004400><0.053300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,11.973500>}
box{<-0.062200,0,-0.004400><0.062200,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.967800,0.000000,11.973500>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.973500>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634600,0.000000,11.973500>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.314800,0.000000,11.973500>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,11.973500>}
box{<-0.057800,0,-0.004400><0.057800,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.928300,0.000000,11.973500>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.973500>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155300,0.000000,11.973500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.973500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.982400>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,11.982400>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,11.982400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,11.982400>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.344800,0.000000,11.982400>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,11.982400>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.982400>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,11.982400>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.807500,0.000000,11.982400>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,11.982400>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,11.982400>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.967800,0.000000,11.982400>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.603400,0.000000,11.982400>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,11.982400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,11.982400>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,11.982400>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923900,0.000000,11.982400>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.982400>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,11.982400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.982400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,11.991300>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,11.991300>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,11.991300>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,11.991300>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.344900,0.000000,11.991300>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,11.991300>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,11.991300>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,11.991300>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.807500,0.000000,11.991300>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,11.991300>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,11.991300>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,11.991300>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,11.991300>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,11.991300>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,11.991300>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,11.991300>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,11.991300>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,11.991300>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,11.991300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,11.991300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.000200>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,12.000200>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.000200>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.000200>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.344900,0.000000,12.000200>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.000200>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.000200>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305300,0.000000,12.000200>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.807500,0.000000,12.000200>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.000200>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.000200>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.000200>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.603400,0.000000,12.000200>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.000200>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.301400,0.000000,12.000200>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.000200>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.000200>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386300,0.000000,12.000200>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.000200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.000200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.009100>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.628900,0.000000,12.009100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.009100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.009100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.344900,0.000000,12.009100>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.009100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.009100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305300,0.000000,12.009100>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.807500,0.000000,12.009100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.009100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.009100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.009100>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607800,0.000000,12.009100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.009100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.301400,0.000000,12.009100>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.009100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.009100>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.009100>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.009100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.009100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.018000>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.018000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.018000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.018000>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.018000>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.018000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.018000>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.018000>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.807500,0.000000,12.018000>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.018000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.018000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.018000>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.018000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.018000>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.018000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.018000>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.018000>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.018000>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.018000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.018000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.026800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.026800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.026800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,12.026800>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.344900,0.000000,12.026800>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.026800>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.026800>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.026800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.026800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.026800>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.026800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.026800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.026800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.026800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.026800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.026800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.026800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.026800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.026800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.026800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.035700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.035700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.035700>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.035700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.035700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.035700>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.035700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.035700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.035700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.035700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.035700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.035700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.035700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.035700>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.301400,0.000000,12.035700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.035700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.035700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.035700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.035700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.035700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.044600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.044600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.044600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.044600>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.344900,0.000000,12.044600>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.044600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.044600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.044600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.044600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.044600>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.044600>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.044600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.044600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.044600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.044600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.044600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.044600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.044600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.044600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.044600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.053500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.053500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.053500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.053500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.053500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.053500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.053500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.053500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.053500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.053500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.053500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.053500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.053500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.053500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.053500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.053500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.053500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.053500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.053500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.053500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.062400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,12.062400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.062400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.062400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.062400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.062400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.062400>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.062400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.062400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.062400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.062400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.062400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.603400,0.000000,12.062400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.062400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.062400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.062400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.062400>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.062400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.062400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.062400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.071300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,12.071300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.071300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.071300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.071300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.071300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.071300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.071300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.071300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.071300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.071300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.071300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.603400,0.000000,12.071300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.071300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.071300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.071300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.071300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.071300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.071300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.071300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.080200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.080200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.080200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.080200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.080200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.080200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.080200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.080200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.080200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.080200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.080200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.080200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.080200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.080200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.080200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.080200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.080200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.080200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.080200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.080200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.089100>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.089100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.089100>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.089100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.344900,0.000000,12.089100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.089100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.089100>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.089100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.089100>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.089100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.089100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.089100>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.089100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.089100>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.089100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.089100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.089100>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.089100>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.089100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.089100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.098000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.098000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.098000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.098000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.344900,0.000000,12.098000>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.098000>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.098000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.098000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.098000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.098000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.098000>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.098000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.098000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.098000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.098000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.098000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.098000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.098000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.159700,0.000000,12.098000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.098000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.106900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,12.106900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.106900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.106900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.106900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.106900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.106900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.106900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.106900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.106900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.106900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.106900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.603400,0.000000,12.106900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.106900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.106900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.106900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.106900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.106900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.159700,0.000000,12.106900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.106900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.115700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.115700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.115700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.115700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.115700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.115700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.115700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.115700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.115700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.115700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.115700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.115700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.115700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.115700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.115700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.115700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.115700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.115700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.115700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.115700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.124600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.124600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.124600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.124600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.124600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.124600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.124600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.124600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.124600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.124600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.124600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.124600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.124600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.124600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.124600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.124600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.124600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.124600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.124600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.124600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.133500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.133500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.133500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.133500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.133500>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.133500>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.133500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.133500>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.133500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.133500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.133500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.133500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.133500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.133500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.133500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.133500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.133500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.133500>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.159700,0.000000,12.133500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.133500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.142400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.142400>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.142400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.142400>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.344900,0.000000,12.142400>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.142400>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.142400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.142400>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.142400>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.142400>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.142400>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.142400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.142400>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.142400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.142400>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.142400>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.142400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.142400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.142400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.142400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.151300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.151300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.151300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,12.151300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.151300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.151300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260600,0.000000,12.151300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.151300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.807500,0.000000,12.151300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.151300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.151300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.151300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.151300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.151300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.151300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.151300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.151300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.151300>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.159700,0.000000,12.151300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.151300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.160200>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.628900,0.000000,12.160200>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.160200>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,12.160200>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.344900,0.000000,12.160200>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.160200>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.160200>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.160200>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.160200>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.160200>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.160200>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.160200>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607800,0.000000,12.160200>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.160200>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.160200>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.160200>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.160200>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.160200>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.160200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.160200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.169100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,12.169100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.169100>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,12.169100>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.169100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.169100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.169100>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.169100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.169100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.169100>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.169100>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.169100>}
box{<-0.124500,0,-0.004400><0.124500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.169100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.169100>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.169100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.169100>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.169100>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.169100>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.169100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.169100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.178000>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.178000>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.178000>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,12.178000>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.178000>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.078300,0.000000,12.178000>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.178000>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.178000>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.178000>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.178000>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.178000>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.178000>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.178000>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.178000>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.178000>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.178000>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.178000>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.178000>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.178000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.178000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.186900>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.186900>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.186900>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.186900>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.186900>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.078300,0.000000,12.186900>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260700,0.000000,12.186900>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.186900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.186900>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.332000,0.000000,12.186900>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.186900>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.186900>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.186900>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.186900>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.186900>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.186900>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.928300,0.000000,12.186900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386200,0.000000,12.186900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.159700,0.000000,12.186900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.186900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.195800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.195800>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655700,0.000000,12.195800>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.195800>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.344900,0.000000,12.195800>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.195800>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.195800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.195800>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.811900,0.000000,12.195800>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.195800>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.195800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.195800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.195800>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634600,0.000000,12.195800>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.301400,0.000000,12.195800>}
box{<-0.097700,0,-0.004400><0.097700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.195800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923900,0.000000,12.195800>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.195800>}
box{<-0.084500,0,-0.004400><0.084500,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.159700,0.000000,12.195800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.195800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.204600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.204600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.204600>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.204600>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.204600>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.204600>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.204600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.204600>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.204600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323200,0.000000,12.204600>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.204600>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.204600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.204600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.204600>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.204600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.204600>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923900,0.000000,12.204600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.204600>}
box{<-0.053300,0,-0.004400><0.053300,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.155200,0.000000,12.204600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.204600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.213500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.213500>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.213500>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.213500>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.344900,0.000000,12.213500>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.213500>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.213500>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.296300,0.000000,12.213500>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.213500>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.213500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.213500>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.213500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.213500>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.213500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.213500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.213500>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.213500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.213500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.213500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.222400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.222400>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655700,0.000000,12.222400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.222400>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.344900,0.000000,12.222400>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.222400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260700,0.000000,12.222400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.222400>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.222400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323200,0.000000,12.222400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.222400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.222400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.222400>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634600,0.000000,12.222400>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.301400,0.000000,12.222400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.222400>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.222400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.222400>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.222400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.222400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.231300>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.231300>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655700,0.000000,12.231300>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.231300>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.344800,0.000000,12.231300>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.231300>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.231300>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.231300>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.811900,0.000000,12.231300>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.231300>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.231300>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.231300>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.231300>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634600,0.000000,12.231300>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.301400,0.000000,12.231300>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323700,0.000000,12.231300>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.231300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.231300>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901800,0.000000,12.231300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.231300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.240200>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.240200>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.240200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.240200>}
box{<-0.097700,0,-0.004400><0.097700,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.240200>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.240200>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260700,0.000000,12.240200>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.240200>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.240200>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.240200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.240200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.240200>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.240200>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.240200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.240200>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.240200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923900,0.000000,12.240200>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.240200>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.240200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.240200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.249100>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.249100>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.249100>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.249100>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.249100>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.249100>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260600,0.000000,12.249100>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.249100>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.249100>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.249100>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.249100>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.249100>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.249100>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.249100>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.249100>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.249100>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.249100>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386300,0.000000,12.249100>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.249100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.249100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.258000>}
box{<-0.124500,0,-0.004400><0.124500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.258000>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.258000>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,12.258000>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.258000>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.258000>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260600,0.000000,12.258000>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.258000>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.258000>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.258000>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.258000>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.258000>}
box{<-0.124500,0,-0.004400><0.124500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.258000>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.258000>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.258000>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.258000>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.258000>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386300,0.000000,12.258000>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.258000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.258000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.266900>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.628900,0.000000,12.266900>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.266900>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,12.266900>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.336000,0.000000,12.266900>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.266900>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.266900>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.266900>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.266900>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.266900>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.266900>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.266900>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607800,0.000000,12.266900>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.266900>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.266900>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.266900>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.266900>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386300,0.000000,12.266900>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.266900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.266900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.275800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.275800>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.275800>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.275800>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.275800>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.275800>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.275800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.275800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.275800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.275800>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.275800>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.275800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.275800>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.275800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.275800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.275800>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.275800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.275800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.897400,0.000000,12.275800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.275800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.284700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.284700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.284700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,12.284700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.284700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.284700>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.284700>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.284700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.284700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.284700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.284700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.284700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.284700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.284700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.284700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.284700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.284700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386300,0.000000,12.284700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.284700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.284700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.293500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.293500>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.293500>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.293500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.293500>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.293500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.293500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.293500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.816400,0.000000,12.293500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.293500>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.293500>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.293500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.293500>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.293500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.293500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.293500>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.293500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.293500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.897400,0.000000,12.293500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.293500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.302400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.302400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.302400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.302400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.302400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.302400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.302400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.302400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.302400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.302400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.302400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.302400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.302400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.302400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.302400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.302400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.302400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.302400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.897400,0.000000,12.302400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.302400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.311300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.311300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.311300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.311300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.311300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.311300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.311300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.311300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.311300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.311300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.311300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.311300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.311300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.311300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.311300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.311300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.311300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.311300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.311300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.311300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.320200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,12.320200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.320200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.320200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.320200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.320200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.320200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.320200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.320200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.320200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.320200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.320200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.603400,0.000000,12.320200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.320200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.320200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.320200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.320200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.320200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.320200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.320200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.329100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,12.329100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.329100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.329100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.329100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.329100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.329100>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.329100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.329100>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.329100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.329100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.329100>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.329100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.329100>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.329100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.329100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.329100>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.329100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.329100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.329100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.338000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.338000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.338000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.338000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.338000>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.338000>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.338000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.338000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.338000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.338000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.338000>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.338000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.338000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.338000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.338000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.338000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.338000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.338000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.338000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.338000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.346900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.346900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.346900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.346900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.344900,0.000000,12.346900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.346900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.346900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.346900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.346900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.346900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.346900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.346900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.346900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.346900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.346900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.346900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.346900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.346900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.346900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.346900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.355800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,12.355800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.355800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.355800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.355800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.355800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.355800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.355800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.355800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.355800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.355800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.355800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.355800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.355800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.355800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.355800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.355800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.355800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.355800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.355800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.364700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,12.364700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.364700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.364700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.364700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.364700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.364700>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.364700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.364700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.364700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.364700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.364700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.603400,0.000000,12.364700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.364700>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.364700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.364700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.364700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,12.364700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.364700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.364700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.373600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.373600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.373600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.373600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.373600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.373600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.373600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.373600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.373600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.373600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.373600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.373600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.373600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.373600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.373600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.373600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.373600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.373600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.897400,0.000000,12.373600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.373600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.382400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.382400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.382400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.382400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.382400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.382400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.382400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.382400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.382400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.382400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.382400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.382400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.382400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.382400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.382400>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.382400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.382400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.382400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.897400,0.000000,12.382400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.382400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.391300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.391300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.391300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.391300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.391300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.391300>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.391300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.391300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.391300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.391300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.391300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.391300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.391300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.391300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.391300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.391300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.391300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.391300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.391300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.391300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.400200>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,12.400200>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.400200>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.400200>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.400200>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.400200>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.400200>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.400200>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.400200>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.400200>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.400200>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.400200>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.400200>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.400200>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.400200>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.400200>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.400200>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,12.400200>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.897400,0.000000,12.400200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.400200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.409100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.409100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.409100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,12.409100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.409100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.078300,0.000000,12.409100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.409100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.409100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.816400,0.000000,12.409100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.409100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.409100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.409100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.409100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.409100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.409100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.409100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.409100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.409100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.409100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.409100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.418000>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.628900,0.000000,12.418000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.418000>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,12.418000>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.418000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.418000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.418000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305300,0.000000,12.418000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.418000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.418000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.418000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.418000>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607800,0.000000,12.418000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.418000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.418000>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.418000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.418000>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.418000>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.418000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.418000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.426900>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,12.426900>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.426900>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.426900>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.426900>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.426900>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.426900>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.426900>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.426900>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.426900>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.426900>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.426900>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.603400,0.000000,12.426900>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.426900>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.426900>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.426900>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.426900>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.426900>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.426900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.426900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.435800>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.435800>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.435800>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.435800>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.435800>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.435800>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260700,0.000000,12.435800>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.435800>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.816400,0.000000,12.435800>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.435800>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.435800>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.435800>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.435800>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.435800>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.435800>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.435800>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.435800>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.435800>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.435800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.435800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.444700>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.444700>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.444700>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.444700>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.444700>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.444700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260700,0.000000,12.444700>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.444700>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.816400,0.000000,12.444700>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.444700>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.444700>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.444700>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.444700>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.444700>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.444700>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.444700>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.444700>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,12.444700>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901900,0.000000,12.444700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.444700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.453600>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.453600>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.646900,0.000000,12.453600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.453600>}
box{<-0.097700,0,-0.004400><0.097700,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.340400,0.000000,12.453600>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.453600>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.453600>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.453600>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.816400,0.000000,12.453600>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.453600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.453600>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.453600>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.453600>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.625800,0.000000,12.453600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.453600>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.453600>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.928300,0.000000,12.453600>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,12.453600>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.901800,0.000000,12.453600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.453600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.462500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.462500>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.642500,0.000000,12.462500>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.335900,0.000000,12.462500>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.336000,0.000000,12.462500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.462500>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.462500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.462500>}
box{<-0.057800,0,-0.004400><0.057800,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.812000,0.000000,12.462500>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.462500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.462500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.462500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.462500>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.621400,0.000000,12.462500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.462500>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.462500>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.932800,0.000000,12.462500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.462500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.906300,0.000000,12.462500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.462500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.471300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.471300>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.642500,0.000000,12.471300>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.340300,0.000000,12.471300>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.336000,0.000000,12.471300>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.471300>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.471300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.471300>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.471300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.471300>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.471300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.471300>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.621400,0.000000,12.471300>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.301400,0.000000,12.471300>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.471300>}
box{<-0.084500,0,-0.004400><0.084500,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.937200,0.000000,12.471300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.471300>}
box{<-0.244400,0,-0.004400><0.244400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.955200,0.000000,12.471300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.471300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.480200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.480200>}
box{<-0.191100,0,-0.004400><0.191100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.549100,0.000000,12.480200>}
box{<-0.457800,0,-0.004400><0.457800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,12.480200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.480200>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.480200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.480200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.332000,0.000000,12.480200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.480200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.480200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.480200>}
box{<-0.191100,0,-0.004400><0.191100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.528000,0.000000,12.480200>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.301400,0.000000,12.480200>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323700,0.000000,12.480200>}
box{<-0.382200,0,-0.004400><0.382200,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.226100,0.000000,12.480200>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.480200>}
box{<-0.275600,0,-0.004400><0.275600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.968600,0.000000,12.480200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.480200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.489100>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,12.489100>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.531300,0.000000,12.489100>}
box{<-0.475600,0,-0.004400><0.475600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.713700,0.000000,12.489100>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.489100>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.489100>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.489100>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.489100>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.489100>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.489100>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.489100>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.510200,0.000000,12.489100>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.489100>}
box{<-0.097700,0,-0.004400><0.097700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.489100>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.230600,0.000000,12.489100>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386200,0.000000,12.489100>}
box{<-0.293300,0,-0.004400><0.293300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.968500,0.000000,12.489100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.489100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.498000>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.498000>}
box{<-0.231100,0,-0.004400><0.231100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526800,0.000000,12.498000>}
box{<-0.493400,0,-0.004400><0.493400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.713700,0.000000,12.498000>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.498000>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.498000>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.498000>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.498000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.498000>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.498000>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.498000>}
box{<-0.231100,0,-0.004400><0.231100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505700,0.000000,12.498000>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.498000>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.498000>}
box{<-0.417800,0,-0.004400><0.417800,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.235000,0.000000,12.498000>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.498000>}
box{<-0.302200,0,-0.004400><0.302200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.968500,0.000000,12.498000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.498000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.506900>}
box{<-0.124500,0,-0.004400><0.124500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.506900>}
box{<-0.248900,0,-0.004400><0.248900,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526900,0.000000,12.506900>}
box{<-0.502300,0,-0.004400><0.502300,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.713700,0.000000,12.506900>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.506900>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.506900>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.506900>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.506900>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.506900>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.506900>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.506900>}
box{<-0.248900,0,-0.004400><0.248900,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505800,0.000000,12.506900>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.506900>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.506900>}
box{<-0.435600,0,-0.004400><0.435600,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.235000,0.000000,12.506900>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.506900>}
box{<-0.311100,0,-0.004400><0.311100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.968500,0.000000,12.506900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.506900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.515800>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.628900,0.000000,12.515800>}
box{<-0.257800,0,-0.004400><0.257800,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526900,0.000000,12.515800>}
box{<-0.511200,0,-0.004400><0.511200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.713700,0.000000,12.515800>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.515800>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.515800>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305300,0.000000,12.515800>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.515800>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.515800>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.515800>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607800,0.000000,12.515800>}
box{<-0.257800,0,-0.004400><0.257800,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505800,0.000000,12.515800>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.515800>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.515800>}
box{<-0.444500,0,-0.004400><0.444500,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.235000,0.000000,12.515800>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.515800>}
box{<-0.320000,0,-0.004400><0.320000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.968500,0.000000,12.515800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.515800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.524700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,12.524700>}
box{<-0.266700,0,-0.004400><0.266700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526900,0.000000,12.524700>}
box{<-0.515600,0,-0.004400><0.515600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709200,0.000000,12.524700>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.524700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.524700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305300,0.000000,12.524700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.524700>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.524700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.524700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.524700>}
box{<-0.266700,0,-0.004400><0.266700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505800,0.000000,12.524700>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.524700>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.524700>}
box{<-0.453400,0,-0.004400><0.453400,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.235000,0.000000,12.524700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.524700>}
box{<-0.328900,0,-0.004400><0.328900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.968500,0.000000,12.524700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.524700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.533600>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.533600>}
box{<-0.266700,0,-0.004400><0.266700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526900,0.000000,12.533600>}
box{<-0.524500,0,-0.004400><0.524500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709200,0.000000,12.533600>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.533600>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.251800,0.000000,12.533600>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.533600>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.533600>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.533600>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.533600>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.533600>}
box{<-0.266700,0,-0.004400><0.266700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505800,0.000000,12.533600>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.533600>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.533600>}
box{<-0.457800,0,-0.004400><0.457800,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.239400,0.000000,12.533600>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.533600>}
box{<-0.333400,0,-0.004400><0.333400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.964100,0.000000,12.533600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.533600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.542500>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,12.542500>}
box{<-0.275600,0,-0.004400><0.275600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526900,0.000000,12.542500>}
box{<-0.524500,0,-0.004400><0.524500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709200,0.000000,12.542500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.542500>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.542500>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.542500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.542500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.542500>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.542500>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.542500>}
box{<-0.275600,0,-0.004400><0.275600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505800,0.000000,12.542500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.542500>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.542500>}
box{<-0.462300,0,-0.004400><0.462300,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.235000,0.000000,12.542500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.542500>}
box{<-0.337800,0,-0.004400><0.337800,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.968500,0.000000,12.542500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.542500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.551400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.551400>}
box{<-0.275600,0,-0.004400><0.275600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526900,0.000000,12.551400>}
box{<-0.528900,0,-0.004400><0.528900,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,12.551400>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.551400>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.551400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.551400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.551400>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.551400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.551400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.551400>}
box{<-0.275600,0,-0.004400><0.275600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505800,0.000000,12.551400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.551400>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.551400>}
box{<-0.466700,0,-0.004400><0.466700,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.239400,0.000000,12.551400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.551400>}
box{<-0.342200,0,-0.004400><0.342200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.964100,0.000000,12.551400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.551400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.560200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.560200>}
box{<-0.280000,0,-0.004400><0.280000,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.522400,0.000000,12.560200>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709300,0.000000,12.560200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.560200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.560200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.560200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.560200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.560200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.560200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.560200>}
box{<-0.280000,0,-0.004400><0.280000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.501300,0.000000,12.560200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.560200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.560200>}
box{<-0.466700,0,-0.004400><0.466700,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.239400,0.000000,12.560200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.560200>}
box{<-0.342200,0,-0.004400><0.342200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.964100,0.000000,12.560200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.560200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.569100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,12.569100>}
box{<-0.284500,0,-0.004400><0.284500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526900,0.000000,12.569100>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709300,0.000000,12.569100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.569100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.569100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.569100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.569100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.569100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.569100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.569100>}
box{<-0.284500,0,-0.004400><0.284500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505800,0.000000,12.569100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.569100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.569100>}
box{<-0.471200,0,-0.004400><0.471200,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.235000,0.000000,12.569100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,12.569100>}
box{<-0.342200,0,-0.004400><0.342200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.964100,0.000000,12.569100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.569100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.578000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.578000>}
box{<-0.284500,0,-0.004400><0.284500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526900,0.000000,12.578000>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,12.578000>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.578000>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.578000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.578000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.578000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.578000>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.578000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.578000>}
box{<-0.284500,0,-0.004400><0.284500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505800,0.000000,12.578000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.578000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.578000>}
box{<-0.475600,0,-0.004400><0.475600,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.239400,0.000000,12.578000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.578000>}
box{<-0.346700,0,-0.004400><0.346700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.968600,0.000000,12.578000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.578000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.586900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.586900>}
box{<-0.284500,0,-0.004400><0.284500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526900,0.000000,12.586900>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,12.586900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.586900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.586900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.586900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.586900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.586900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.586900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.586900>}
box{<-0.284500,0,-0.004400><0.284500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505800,0.000000,12.586900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.586900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.586900>}
box{<-0.475600,0,-0.004400><0.475600,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.239400,0.000000,12.586900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.586900>}
box{<-0.346700,0,-0.004400><0.346700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.968600,0.000000,12.586900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.586900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.595800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.595800>}
box{<-0.284500,0,-0.004400><0.284500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526900,0.000000,12.595800>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,12.595800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.595800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.595800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.595800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.595800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.595800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.595800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.595800>}
box{<-0.284500,0,-0.004400><0.284500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505800,0.000000,12.595800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.595800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.595800>}
box{<-0.475600,0,-0.004400><0.475600,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.239400,0.000000,12.595800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.595800>}
box{<-0.346700,0,-0.004400><0.346700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.968600,0.000000,12.595800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.595800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.604700>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.604700>}
box{<-0.284500,0,-0.004400><0.284500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526900,0.000000,12.604700>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,12.604700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.604700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.604700>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.604700>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.604700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.604700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.604700>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.604700>}
box{<-0.284500,0,-0.004400><0.284500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505800,0.000000,12.604700>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.604700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.604700>}
box{<-0.475600,0,-0.004400><0.475600,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.239400,0.000000,12.604700>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.604700>}
box{<-0.346700,0,-0.004400><0.346700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.968600,0.000000,12.604700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.604700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.613600>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.613600>}
box{<-0.284500,0,-0.004400><0.284500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526900,0.000000,12.613600>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,12.613600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.613600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.613600>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.613600>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.613600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.613600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.613600>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.613600>}
box{<-0.284500,0,-0.004400><0.284500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505800,0.000000,12.613600>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.613600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.613600>}
box{<-0.475600,0,-0.004400><0.475600,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.239400,0.000000,12.613600>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.613600>}
box{<-0.346700,0,-0.004400><0.346700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.968600,0.000000,12.613600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.613600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.622500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.622500>}
box{<-0.284500,0,-0.004400><0.284500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526900,0.000000,12.622500>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,12.622500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.622500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.622500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.622500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.622500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.622500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.622500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.622500>}
box{<-0.284500,0,-0.004400><0.284500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505800,0.000000,12.622500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.622500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.622500>}
box{<-0.475600,0,-0.004400><0.475600,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.239400,0.000000,12.622500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,12.622500>}
box{<-0.342200,0,-0.004400><0.342200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.964100,0.000000,12.622500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.622500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.631400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,12.631400>}
box{<-0.284500,0,-0.004400><0.284500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526900,0.000000,12.631400>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709300,0.000000,12.631400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.631400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.631400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.631400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.631400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.631400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.631400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.631400>}
box{<-0.284500,0,-0.004400><0.284500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505800,0.000000,12.631400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.631400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.631400>}
box{<-0.475600,0,-0.004400><0.475600,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.239400,0.000000,12.631400>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.631400>}
box{<-0.342200,0,-0.004400><0.342200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.964100,0.000000,12.631400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.631400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.640300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,12.640300>}
box{<-0.275600,0,-0.004400><0.275600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526900,0.000000,12.640300>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709300,0.000000,12.640300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.640300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.640300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.640300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.640300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.640300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.640300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.640300>}
box{<-0.275600,0,-0.004400><0.275600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505800,0.000000,12.640300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.640300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.640300>}
box{<-0.466700,0,-0.004400><0.466700,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.239400,0.000000,12.640300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.640300>}
box{<-0.337800,0,-0.004400><0.337800,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.968500,0.000000,12.640300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.640300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.649100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.649100>}
box{<-0.275600,0,-0.004400><0.275600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526900,0.000000,12.649100>}
box{<-0.528900,0,-0.004400><0.528900,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,12.649100>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.649100>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.649100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.649100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.649100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.649100>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.649100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.649100>}
box{<-0.275600,0,-0.004400><0.275600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505800,0.000000,12.649100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.649100>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.649100>}
box{<-0.466700,0,-0.004400><0.466700,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.239400,0.000000,12.649100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.649100>}
box{<-0.333400,0,-0.004400><0.333400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.964100,0.000000,12.649100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.649100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.658000>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,12.658000>}
box{<-0.271100,0,-0.004400><0.271100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.531300,0.000000,12.658000>}
box{<-0.524500,0,-0.004400><0.524500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709200,0.000000,12.658000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.658000>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.658000>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.658000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.658000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.658000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.658000>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.658000>}
box{<-0.271100,0,-0.004400><0.271100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.510200,0.000000,12.658000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.658000>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.658000>}
box{<-0.466700,0,-0.004400><0.466700,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.239400,0.000000,12.658000>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.658000>}
box{<-0.328900,0,-0.004400><0.328900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.968500,0.000000,12.658000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.658000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.666900>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.666900>}
box{<-0.266700,0,-0.004400><0.266700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526900,0.000000,12.666900>}
box{<-0.520100,0,-0.004400><0.520100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,12.666900>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.666900>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.666900>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.666900>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.666900>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.666900>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.666900>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.666900>}
box{<-0.266700,0,-0.004400><0.266700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505800,0.000000,12.666900>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.666900>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.666900>}
box{<-0.457800,0,-0.004400><0.457800,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.239400,0.000000,12.666900>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395200,0.000000,12.666900>}
box{<-0.324500,0,-0.004400><0.324500,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.964100,0.000000,12.666900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.666900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.675800>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,12.675800>}
box{<-0.262200,0,-0.004400><0.262200,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.531300,0.000000,12.675800>}
box{<-0.515600,0,-0.004400><0.515600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709200,0.000000,12.675800>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.675800>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260600,0.000000,12.675800>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305300,0.000000,12.675800>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.675800>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.675800>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.675800>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.675800>}
box{<-0.262200,0,-0.004400><0.262200,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.510200,0.000000,12.675800>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.675800>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.675800>}
box{<-0.453400,0,-0.004400><0.453400,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.243900,0.000000,12.675800>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.675800>}
box{<-0.315600,0,-0.004400><0.315600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.964100,0.000000,12.675800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.675800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.684700>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.628900,0.000000,12.684700>}
box{<-0.253300,0,-0.004400><0.253300,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.531300,0.000000,12.684700>}
box{<-0.506700,0,-0.004400><0.506700,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709200,0.000000,12.684700>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.684700>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260600,0.000000,12.684700>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305300,0.000000,12.684700>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.684700>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.684700>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.684700>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607800,0.000000,12.684700>}
box{<-0.253300,0,-0.004400><0.253300,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.510200,0.000000,12.684700>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.684700>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.684700>}
box{<-0.448900,0,-0.004400><0.448900,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.239400,0.000000,12.684700>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.684700>}
box{<-0.306700,0,-0.004400><0.306700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.964100,0.000000,12.684700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.684700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.693600>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.693600>}
box{<-0.244400,0,-0.004400><0.244400,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.531300,0.000000,12.693600>}
box{<-0.497800,0,-0.004400><0.497800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709200,0.000000,12.693600>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.693600>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260700,0.000000,12.693600>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.693600>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.693600>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.693600>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.693600>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.693600>}
box{<-0.244400,0,-0.004400><0.244400,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.510200,0.000000,12.693600>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.693600>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.693600>}
box{<-0.435600,0,-0.004400><0.435600,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.243900,0.000000,12.693600>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,12.693600>}
box{<-0.297800,0,-0.004400><0.297800,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.964100,0.000000,12.693600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.693600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.702500>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.702500>}
box{<-0.231100,0,-0.004400><0.231100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.526800,0.000000,12.702500>}
box{<-0.480000,0,-0.004400><0.480000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.709200,0.000000,12.702500>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.702500>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.702500>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.702500>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.702500>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.702500>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.702500>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.702500>}
box{<-0.231100,0,-0.004400><0.231100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.505700,0.000000,12.702500>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.314800,0.000000,12.702500>}
box{<-0.097700,0,-0.004400><0.097700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.702500>}
box{<-0.426700,0,-0.004400><0.426700,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.243900,0.000000,12.702500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.702500>}
box{<-0.280000,0,-0.004400><0.280000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.964100,0.000000,12.702500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.702500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.711400>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.711400>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.531300,0.000000,12.711400>}
box{<-0.466700,0,-0.004400><0.466700,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.704800,0.000000,12.711400>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.711400>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.711400>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.711400>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323200,0.000000,12.711400>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.711400>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.711400>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.711400>}
box{<-0.217800,0,-0.004400><0.217800,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.510200,0.000000,12.711400>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.711400>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323700,0.000000,12.711400>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.243900,0.000000,12.711400>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,12.711400>}
box{<-0.248900,0,-0.004400><0.248900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.959700,0.000000,12.711400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.711400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.720300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.720300>}
box{<-0.200000,0,-0.004400><0.200000,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.531300,0.000000,12.720300>}
box{<-0.444500,0,-0.004400><0.444500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.691500,0.000000,12.720300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.078300,0.000000,12.720300>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.720300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.720300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323200,0.000000,12.720300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.720300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.720300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.720300>}
box{<-0.200000,0,-0.004400><0.200000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.510200,0.000000,12.720300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.720300>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.720300>}
box{<-0.386700,0,-0.004400><0.386700,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.230600,0.000000,12.720300>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,12.720300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.720300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.729200>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,12.729200>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.642500,0.000000,12.729200>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.340300,0.000000,12.729200>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.729200>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.729200>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.296300,0.000000,12.729200>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.729200>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.729200>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.729200>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.729200>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.621400,0.000000,12.729200>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.301400,0.000000,12.729200>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.729200>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.932800,0.000000,12.729200>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386200,0.000000,12.729200>}
box{<-0.053300,0,-0.004400><0.053300,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,12.729200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.729200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.738000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.738000>}
box{<-0.071100,0,-0.004400><0.071100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.144600,0.000000,12.738000>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.646900,0.000000,12.738000>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.335900,0.000000,12.738000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.738000>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.738000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.738000>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.738000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.738000>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.738000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.738000>}
box{<-0.071100,0,-0.004400><0.071100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.123500,0.000000,12.738000>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.625800,0.000000,12.738000>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.301400,0.000000,12.738000>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.738000>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.928300,0.000000,12.738000>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386200,0.000000,12.738000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413100,0.000000,12.738000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.738000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.746900>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,12.746900>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.149000,0.000000,12.746900>}
box{<-0.097700,0,-0.004400><0.097700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.746900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.746900>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.746900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.251800,0.000000,12.746900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.746900>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.746900>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.746900>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.746900>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.746900>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.127900,0.000000,12.746900>}
box{<-0.097700,0,-0.004400><0.097700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.746900>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.301400,0.000000,12.746900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.746900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923900,0.000000,12.746900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386200,0.000000,12.746900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,12.746900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.746900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.755800>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.755800>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.144600,0.000000,12.755800>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.755800>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.755800>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.755800>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.755800>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.755800>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.755800>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.755800>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.755800>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.755800>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.123500,0.000000,12.755800>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.755800>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.301400,0.000000,12.755800>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.755800>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.755800>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386200,0.000000,12.755800>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,12.755800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.755800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.764700>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,12.764700>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.149000,0.000000,12.764700>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.764700>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.764700>}
box{<-0.062200,0,-0.004400><0.062200,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,12.764700>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.764700>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.764700>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.764700>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.764700>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.764700>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.764700>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.764700>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.127900,0.000000,12.764700>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.764700>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.764700>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.764700>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.764700>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.764700>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,12.764700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.764700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.773600>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.628900,0.000000,12.773600>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.149100,0.000000,12.773600>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.773600>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.773600>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,12.773600>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.773600>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.773600>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305300,0.000000,12.773600>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.773600>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.773600>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.773600>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607800,0.000000,12.773600>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.128000,0.000000,12.773600>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.773600>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.301400,0.000000,12.773600>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.773600>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.773600>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.773600>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,12.773600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.773600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.782500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,12.782500>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.144600,0.000000,12.782500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.782500>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,12.782500>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,12.782500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.782500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.782500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305300,0.000000,12.782500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.782500>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.782500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.782500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.782500>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.123500,0.000000,12.782500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.782500>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.782500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.782500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.782500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.782500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,12.782500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.782500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.791400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.791400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.144600,0.000000,12.791400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.791400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,12.791400>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.220400,0.000000,12.791400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.791400>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.791400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.791400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.791400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.791400>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.791400>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.791400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.123500,0.000000,12.791400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.791400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.791400>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.791400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.791400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.791400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,12.791400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.791400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.800300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.800300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.140200,0.000000,12.800300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.800300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,12.800300>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.220400,0.000000,12.800300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.800300>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.800300>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.800300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.800300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.800300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.800300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.800300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.119100,0.000000,12.800300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.800300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.800300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.800300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.800300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.800300>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,12.800300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.800300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.809200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.809200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.144600,0.000000,12.809200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.809200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.809200>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.215900,0.000000,12.809200>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.809200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.809200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.809200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.809200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.809200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.809200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.809200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.123500,0.000000,12.809200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.809200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.809200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.809200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.809200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.809200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,12.809200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.809200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.818100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,12.818100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.144600,0.000000,12.818100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.818100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.818100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.215900,0.000000,12.818100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.818100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.818100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.818100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.818100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.818100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.818100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.818100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.123500,0.000000,12.818100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.818100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.818100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.818100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.818100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.818100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,12.818100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.818100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.826900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,12.826900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.140100,0.000000,12.826900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.826900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.826900>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.215900,0.000000,12.826900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.826900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.826900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.826900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.826900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.826900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.826900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.826900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.119000,0.000000,12.826900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.826900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.826900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.826900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.826900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.826900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,12.826900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.826900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.835800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.835800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.140100,0.000000,12.835800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.835800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.835800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,12.835800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.835800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.835800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.835800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.835800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.835800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.835800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.835800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.119000,0.000000,12.835800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.835800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.835800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.835800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.835800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.835800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,12.835800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.835800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.844700>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.844700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.140100,0.000000,12.844700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.844700>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.844700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,12.844700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.844700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.844700>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.844700>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.844700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.844700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.844700>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.844700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.119000,0.000000,12.844700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.844700>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.844700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.844700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.844700>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.844700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,12.844700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.844700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.853600>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.853600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.140100,0.000000,12.853600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.853600>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.853600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,12.853600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.853600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.853600>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.853600>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.853600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.853600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.853600>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.853600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.119000,0.000000,12.853600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.853600>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.853600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.853600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.853600>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.853600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,12.853600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.853600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.862500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.862500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.140100,0.000000,12.862500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.862500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.862500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,12.862500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.862500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.862500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.862500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.862500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.862500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.862500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.862500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.119000,0.000000,12.862500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.862500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.862500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.862500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.862500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.862500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,12.862500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.862500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.871400>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.871400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.140100,0.000000,12.871400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.871400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.871400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,12.871400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.871400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.871400>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.871400>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323100,0.000000,12.871400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.871400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.871400>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.871400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.119000,0.000000,12.871400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.871400>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.871400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.871400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.871400>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.871400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,12.871400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.871400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.880300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.880300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.140100,0.000000,12.880300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.880300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.880300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,12.880300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.880300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.880300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.880300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.880300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.880300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.880300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.880300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.119000,0.000000,12.880300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.880300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.880300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.880300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.880300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,12.880300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,12.880300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.880300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.889200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,12.889200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.140100,0.000000,12.889200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.889200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.889200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,12.889200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.889200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.889200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.889200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.889200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.889200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.889200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.889200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.119000,0.000000,12.889200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.889200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.889200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.889200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.889200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.889200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,12.889200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.889200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.898100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.898100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.140100,0.000000,12.898100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.898100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.898100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,12.898100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,12.898100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260700,0.000000,12.898100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.898100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.898100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.898100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.898100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.898100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.119000,0.000000,12.898100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.898100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.898100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.898100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.898100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.898100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,12.898100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.898100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.907000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.907000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.140200,0.000000,12.907000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.907000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.907000>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,12.907000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.907000>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.907000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.907000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.907000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.907000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.907000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.907000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.119100,0.000000,12.907000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.907000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.907000>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.907000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.907000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.907000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,12.907000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.907000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.915800>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,12.915800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.140200,0.000000,12.915800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.915800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,12.915800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,12.915800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.915800>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.915800>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.915800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.915800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.915800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.915800>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.915800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.119100,0.000000,12.915800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.915800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.915800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.915800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.915800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.915800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,12.915800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.915800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.924700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.924700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.140200,0.000000,12.924700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.924700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,12.924700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,12.924700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.924700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.924700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.924700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.924700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.924700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.924700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.924700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.119100,0.000000,12.924700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.924700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.924700>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.924700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.924700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395200,0.000000,12.924700>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,12.924700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.924700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.933600>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.628900,0.000000,12.933600>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.140200,0.000000,12.933600>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.933600>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,12.933600>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,12.933600>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.933600>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.933600>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305300,0.000000,12.933600>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.933600>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.933600>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.933600>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607800,0.000000,12.933600>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.119100,0.000000,12.933600>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.933600>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.933600>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.933600>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.933600>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.933600>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,12.933600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.933600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.942500>}
box{<-0.124500,0,-0.004400><0.124500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.942500>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.140200,0.000000,12.942500>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.942500>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,12.942500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.215900,0.000000,12.942500>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,12.942500>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.942500>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305300,0.000000,12.942500>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.942500>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,12.942500>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,12.942500>}
box{<-0.124500,0,-0.004400><0.124500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.942500>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.119100,0.000000,12.942500>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.942500>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,12.942500>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.942500>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,12.942500>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.942500>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,12.942500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.942500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.951400>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.951400>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.135700,0.000000,12.951400>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.951400>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,12.951400>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,12.951400>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.078300,0.000000,12.951400>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.251800,0.000000,12.951400>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.951400>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.951400>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.951400>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.951400>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.951400>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.119100,0.000000,12.951400>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.951400>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.951400>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.951400>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.951400>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.951400>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,12.951400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.951400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.960300>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,12.960300>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.140100,0.000000,12.960300>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.960300>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.331400,0.000000,12.960300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.215900,0.000000,12.960300>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.960300>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.960300>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.960300>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.960300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.960300>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.960300>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,12.960300>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.119000,0.000000,12.960300>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.960300>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.960300>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.960300>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.960300>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,12.960300>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413100,0.000000,12.960300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.960300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.969200>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,12.969200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.135700,0.000000,12.969200>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,12.969200>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.331400,0.000000,12.969200>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.215900,0.000000,12.969200>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.969200>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.969200>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.969200>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.323200,0.000000,12.969200>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,12.969200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.969200>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,12.969200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.114600,0.000000,12.969200>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,12.969200>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,12.969200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,12.969200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923900,0.000000,12.969200>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,12.969200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413100,0.000000,12.969200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.969200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.978100>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.637900,0.000000,12.978100>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.131300,0.000000,12.978100>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.978100>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.331400,0.000000,12.978100>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,12.978100>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.978100>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.978100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.978100>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.978100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.978100>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.978100>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.616800,0.000000,12.978100>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.110200,0.000000,12.978100>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.978100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,12.978100>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,12.978100>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.978100>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,12.978100>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,12.978100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.978100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.987000>}
box{<-0.186700,0,-0.004400><0.186700,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.744600,0.000000,12.987000>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,12.987000>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.987000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,12.987000>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.987000>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.987000>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,12.987000>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.987000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.987000>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,12.987000>}
box{<-0.186700,0,-0.004400><0.186700,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.723500,0.000000,12.987000>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,12.987000>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.301400,0.000000,12.987000>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323700,0.000000,12.987000>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,12.987000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.987000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413100,0.000000,12.987000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.987000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,12.995900>}
box{<-0.208900,0,-0.004400><0.208900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.757900,0.000000,12.995900>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655700,0.000000,12.995900>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,12.995900>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,12.995900>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,12.995900>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,12.995900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,12.995900>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,12.995900>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,12.995900>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,12.995900>}
box{<-0.208900,0,-0.004400><0.208900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,12.995900>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634600,0.000000,12.995900>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.301400,0.000000,12.995900>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323700,0.000000,12.995900>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923900,0.000000,12.995900>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,12.995900>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413100,0.000000,12.995900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,12.995900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.004700>}
box{<-0.226700,0,-0.004400><0.226700,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.757900,0.000000,13.004700>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655700,0.000000,13.004700>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,13.004700>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,13.004700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.004700>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.004700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.004700>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.004700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945500,0.000000,13.004700>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,13.004700>}
box{<-0.226700,0,-0.004400><0.226700,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,13.004700>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634600,0.000000,13.004700>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.301400,0.000000,13.004700>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,13.004700>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,13.004700>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386200,0.000000,13.004700>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,13.004700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.004700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.013600>}
box{<-0.235600,0,-0.004400><0.235600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.757900,0.000000,13.013600>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,13.013600>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,13.013600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,13.013600>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.013600>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260700,0.000000,13.013600>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.013600>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.013600>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,13.013600>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,13.013600>}
box{<-0.235600,0,-0.004400><0.235600,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,13.013600>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,13.013600>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,13.013600>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,13.013600>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,13.013600>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386300,0.000000,13.013600>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,13.013600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.013600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.022500>}
box{<-0.253400,0,-0.004400><0.253400,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.757900,0.000000,13.022500>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,13.022500>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,13.022500>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.220400,0.000000,13.022500>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.065000,0.000000,13.022500>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260600,0.000000,13.022500>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.022500>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.022500>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,13.022500>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,13.022500>}
box{<-0.253400,0,-0.004400><0.253400,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,13.022500>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,13.022500>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,13.022500>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,13.022500>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,13.022500>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386300,0.000000,13.022500>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,13.022500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.022500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.031400>}
box{<-0.257800,0,-0.004400><0.257800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.753400,0.000000,13.031400>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,13.031400>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,13.031400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,13.031400>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.065000,0.000000,13.031400>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260600,0.000000,13.031400>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.031400>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.031400>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,13.031400>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,13.031400>}
box{<-0.257800,0,-0.004400><0.257800,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.732300,0.000000,13.031400>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,13.031400>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,13.031400>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,13.031400>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,13.031400>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.031400>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,13.031400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.031400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.040300>}
box{<-0.266700,0,-0.004400><0.266700,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.753500,0.000000,13.040300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,13.040300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,13.040300>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,13.040300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.040300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260600,0.000000,13.040300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.040300>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.040300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,13.040300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,13.040300>}
box{<-0.262300,0,-0.004400><0.262300,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,13.040300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,13.040300>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,13.040300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,13.040300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,13.040300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.040300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,13.040300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.040300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.049200>}
box{<-0.271100,0,-0.004400><0.271100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.757900,0.000000,13.049200>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,13.049200>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,13.049200>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.215900,0.000000,13.049200>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.049200>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.049200>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.049200>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.332000,0.000000,13.049200>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,13.049200>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,13.049200>}
box{<-0.271100,0,-0.004400><0.271100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,13.049200>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,13.049200>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,13.049200>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,13.049200>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,13.049200>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.386300,0.000000,13.049200>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,13.049200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.049200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.058100>}
box{<-0.275500,0,-0.004400><0.275500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.753400,0.000000,13.058100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,13.058100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,13.058100>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.215900,0.000000,13.058100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.058100>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.058100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.058100>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.058100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,13.058100>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,13.058100>}
box{<-0.275500,0,-0.004400><0.275500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.732300,0.000000,13.058100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,13.058100>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,13.058100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,13.058100>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,13.058100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.058100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,13.058100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.058100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.067000>}
box{<-0.280000,0,-0.004400><0.280000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.757900,0.000000,13.067000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,13.067000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,13.067000>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,13.067000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.067000>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.067000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.067000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.067000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,13.067000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,13.067000>}
box{<-0.280000,0,-0.004400><0.280000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,13.067000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,13.067000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,13.067000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,13.067000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,13.067000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.067000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,13.067000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.067000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.075900>}
box{<-0.280000,0,-0.004400><0.280000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.757900,0.000000,13.075900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,13.075900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,13.075900>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,13.075900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.075900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.075900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,13.075900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.075900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,13.075900>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,13.075900>}
box{<-0.280000,0,-0.004400><0.280000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,13.075900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,13.075900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,13.075900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,13.075900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,13.075900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.075900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,13.075900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.075900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.084800>}
box{<-0.280000,0,-0.004400><0.280000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.757900,0.000000,13.084800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.084800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,13.084800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,13.084800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,13.084800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.084800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.084800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.084800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,13.084800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,13.084800>}
box{<-0.280000,0,-0.004400><0.280000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,13.084800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.084800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,13.084800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,13.084800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,13.084800>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.084800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,13.084800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.084800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.093600>}
box{<-0.288900,0,-0.004400><0.288900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.757900,0.000000,13.093600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.093600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,13.093600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,13.093600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,13.093600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.093600>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.093600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.093600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,13.093600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,13.093600>}
box{<-0.288900,0,-0.004400><0.288900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,13.093600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.093600>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,13.093600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,13.093600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,13.093600>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.093600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,13.093600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.093600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.102500>}
box{<-0.288900,0,-0.004400><0.288900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.757900,0.000000,13.102500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.102500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,13.102500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,13.102500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,13.102500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.102500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.102500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.102500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,13.102500>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,13.102500>}
box{<-0.288900,0,-0.004400><0.288900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,13.102500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.102500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,13.102500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,13.102500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,13.102500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.102500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,13.102500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.102500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.111400>}
box{<-0.288900,0,-0.004400><0.288900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.757900,0.000000,13.111400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.111400>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,13.111400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,13.111400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,13.111400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.111400>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.111400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.111400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,13.111400>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,13.111400>}
box{<-0.288900,0,-0.004400><0.288900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,13.111400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.111400>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,13.111400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,13.111400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,13.111400>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.111400>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,13.111400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.111400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.120300>}
box{<-0.288900,0,-0.004400><0.288900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.757900,0.000000,13.120300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.120300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,13.120300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,13.120300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,13.120300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.120300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.120300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.120300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,13.120300>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,13.120300>}
box{<-0.288900,0,-0.004400><0.288900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,13.120300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.120300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,13.120300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,13.120300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,13.120300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.120300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,13.120300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.120300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.129200>}
box{<-0.288900,0,-0.004400><0.288900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.757900,0.000000,13.129200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.129200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,13.129200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,13.129200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,13.129200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.129200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.129200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.129200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,13.129200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,13.129200>}
box{<-0.288900,0,-0.004400><0.288900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,13.129200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.129200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,13.129200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,13.129200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,13.129200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.129200>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,13.129200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.129200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.138100>}
box{<-0.284400,0,-0.004400><0.284400,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.753400,0.000000,13.138100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.138100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,13.138100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,13.138100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,13.138100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.138100>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.138100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.138100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,13.138100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963300,0.000000,13.138100>}
box{<-0.280000,0,-0.004400><0.280000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,13.138100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.138100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,13.138100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,13.138100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,13.138100>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.395100,0.000000,13.138100>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,13.138100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.138100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.147000>}
box{<-0.280000,0,-0.004400><0.280000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.757900,0.000000,13.147000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.147000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,13.147000>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.211500,0.000000,13.147000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.147000>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.147000>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,13.147000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.147000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,13.147000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,13.147000>}
box{<-0.280000,0,-0.004400><0.280000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,13.147000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.147000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,13.147000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,13.147000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,13.147000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.147000>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,13.147000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.147000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.155900>}
box{<-0.280000,0,-0.004400><0.280000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.757900,0.000000,13.155900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,13.155900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.327000,0.000000,13.155900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,13.155900>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,13.155900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260700,0.000000,13.155900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.155900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.332000,0.000000,13.155900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,13.155900>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,13.155900>}
box{<-0.280000,0,-0.004400><0.280000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,13.155900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,13.155900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305900,0.000000,13.155900>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,13.155900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,13.155900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.155900>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.408600,0.000000,13.155900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.155900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.164800>}
box{<-0.275500,0,-0.004400><0.275500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.753400,0.000000,13.164800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.164800>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,13.164800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,13.164800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,13.164800>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.164800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.164800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.164800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,13.164800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,13.164800>}
box{<-0.275500,0,-0.004400><0.275500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.732300,0.000000,13.164800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.164800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,13.164800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,13.164800>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,13.164800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.164800>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,13.164800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.164800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.173700>}
box{<-0.271100,0,-0.004400><0.271100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.757900,0.000000,13.173700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.173700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,13.173700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,13.173700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,13.173700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260600,0.000000,13.173700>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,13.173700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.173700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,13.173700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,13.173700>}
box{<-0.271100,0,-0.004400><0.271100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.736800,0.000000,13.173700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.173700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.305800,0.000000,13.173700>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,13.173700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,13.173700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.173700>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,13.173700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.173700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.182500>}
box{<-0.266700,0,-0.004400><0.266700,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.753500,0.000000,13.182500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.182500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.322500,0.000000,13.182500>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,13.182500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,13.182500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.182500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.182500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.182500>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.945400,0.000000,13.182500>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,13.182500>}
box{<-0.266700,0,-0.004400><0.266700,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.732400,0.000000,13.182500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.182500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,13.182500>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,13.182500>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,13.182500>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.182500>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,13.182500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.182500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.191400>}
box{<-0.257800,0,-0.004400><0.257800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.753400,0.000000,13.191400>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,13.191400>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,13.191400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.215900,0.000000,13.191400>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,13.191400>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.191400>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.191400>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.332000,0.000000,13.191400>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,13.191400>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,13.191400>}
box{<-0.257800,0,-0.004400><0.257800,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.732300,0.000000,13.191400>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,13.191400>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,13.191400>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,13.191400>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,13.191400>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.191400>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,13.191400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.191400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.200300>}
box{<-0.248900,0,-0.004400><0.248900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.753400,0.000000,13.200300>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,13.200300>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.326900,0.000000,13.200300>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.215900,0.000000,13.200300>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,13.200300>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.200300>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.200300>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.200300>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,13.200300>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,13.200300>}
box{<-0.248900,0,-0.004400><0.248900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.732300,0.000000,13.200300>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,13.200300>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,13.200300>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.319300,0.000000,13.200300>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.919400,0.000000,13.200300>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.200300>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,13.200300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.200300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.209200>}
box{<-0.240000,0,-0.004400><0.240000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.753400,0.000000,13.209200>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,13.209200>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.331400,0.000000,13.209200>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.215900,0.000000,13.209200>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,13.209200>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.209200>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.209200>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.332000,0.000000,13.209200>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,13.209200>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,13.209200>}
box{<-0.240000,0,-0.004400><0.240000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.732300,0.000000,13.209200>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,13.209200>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.310300,0.000000,13.209200>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323800,0.000000,13.209200>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,13.209200>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.390700,0.000000,13.209200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413100,0.000000,13.209200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.209200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.218100>}
box{<-0.222200,0,-0.004400><0.222200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.753400,0.000000,13.218100>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.218100>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.331400,0.000000,13.218100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.220400,0.000000,13.218100>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,13.218100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.260700,0.000000,13.218100>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,13.218100>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.218100>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.941000,0.000000,13.218100>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.958900,0.000000,13.218100>}
box{<-0.222200,0,-0.004400><0.222200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.732300,0.000000,13.218100>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.218100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.314800,0.000000,13.218100>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.323700,0.000000,13.218100>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923900,0.000000,13.218100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.399600,0.000000,13.218100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413100,0.000000,13.218100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.218100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.227000>}
box{<-0.204400,0,-0.004400><0.204400,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.744500,0.000000,13.227000>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655700,0.000000,13.227000>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.335900,0.000000,13.227000>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.220400,0.000000,13.227000>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,13.227000>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.227000>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.227000>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.227000>}
box{<-0.071100,0,-0.004400><0.071100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.927700,0.000000,13.227000>}
box{<-0.057800,0,-0.004400><0.057800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.963400,0.000000,13.227000>}
box{<-0.204400,0,-0.004400><0.204400,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.723400,0.000000,13.227000>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634600,0.000000,13.227000>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.314800,0.000000,13.227000>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.314900,0.000000,13.227000>}
box{<-0.062200,0,-0.004400><0.062200,0.036000,0.004400> rotate<0,-0.000000,0> translate<20.923800,0.000000,13.227000>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.399600,0.000000,13.227000>}
box{<-0.035500,0,-0.004400><0.035500,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.413000,0.000000,13.227000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.227000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.235900>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.637900,0.000000,13.235900>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.235900>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.340300,0.000000,13.235900>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.216000,0.000000,13.235900>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,13.235900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.235900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.235900>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.235900>}
box{<-0.022200,0,-0.004400><0.022200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.914300,0.000000,13.235900>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.616800,0.000000,13.235900>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.235900>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.319200,0.000000,13.235900>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.399600,0.000000,13.235900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.235900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.244800>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.642300,0.000000,13.244800>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.244800>}
box{<-0.386700,0,-0.004400><0.386700,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.633700,0.000000,13.244800>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.220400,0.000000,13.244800>}
box{<-0.306700,0,-0.004400><0.306700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.065000,0.000000,13.244800>}
box{<-0.560100,0,-0.004400><0.560100,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.251800,0.000000,13.244800>}
box{<-0.075500,0,-0.004400><0.075500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,13.244800>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.244800>}
box{<-0.288900,0,-0.004400><0.288900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.465500,0.000000,13.244800>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.621200,0.000000,13.244800>}
box{<-0.075600,0,-0.004400><0.075600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.244800>}
box{<-0.448900,0,-0.004400><0.448900,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.674800,0.000000,13.244800>}
box{<-0.368900,0,-0.004400><0.368900,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.497200,0.000000,13.244800>}
box{<-0.448900,0,-0.004400><0.448900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.759600,0.000000,13.244800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.244800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.253700>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.642300,0.000000,13.253700>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655700,0.000000,13.253700>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.638100,0.000000,13.253700>}
box{<-0.066600,0,-0.004400><0.066600,0.036000,0.004400> rotate<0,-0.000000,0> translate<11.220400,0.000000,13.253700>}
box{<-0.337800,0,-0.004400><0.337800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.253700>}
box{<-0.591100,0,-0.004400><0.591100,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.253700>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,13.253700>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.253700>}
box{<-0.342200,0,-0.004400><0.342200,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,13.253700>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.621200,0.000000,13.253700>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634600,0.000000,13.253700>}
box{<-0.466700,0,-0.004400><0.466700,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,13.253700>}
box{<-0.400000,0,-0.004400><0.400000,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.253700>}
box{<-0.466700,0,-0.004400><0.466700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.768500,0.000000,13.253700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.253700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.262600>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.637900,0.000000,13.262600>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655700,0.000000,13.262600>}
box{<-0.422300,0,-0.004400><0.422300,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.642600,0.000000,13.262600>}
box{<-0.355600,0,-0.004400><0.355600,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.262600>}
box{<-0.608900,0,-0.004400><0.608900,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.262600>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,13.262600>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.262600>}
box{<-0.360000,0,-0.004400><0.360000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,13.262600>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.616800,0.000000,13.262600>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634600,0.000000,13.262600>}
box{<-0.484500,0,-0.004400><0.484500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,13.262600>}
box{<-0.417800,0,-0.004400><0.417800,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.262600>}
box{<-0.484500,0,-0.004400><0.484500,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.768500,0.000000,13.262600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.262600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.271400>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,13.271400>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.271400>}
box{<-0.435600,0,-0.004400><0.435600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.638100,0.000000,13.271400>}
box{<-0.368900,0,-0.004400><0.368900,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,13.271400>}
box{<-0.626700,0,-0.004400><0.626700,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.271400>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.271400>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.271400>}
box{<-0.368900,0,-0.004400><0.368900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,13.271400>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,13.271400>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.271400>}
box{<-0.497800,0,-0.004400><0.497800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.679200,0.000000,13.271400>}
box{<-0.426700,0,-0.004400><0.426700,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.271400>}
box{<-0.497800,0,-0.004400><0.497800,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.772900,0.000000,13.271400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.271400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.280300>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,13.280300>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.280300>}
box{<-0.444500,0,-0.004400><0.444500,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.638100,0.000000,13.280300>}
box{<-0.377800,0,-0.004400><0.377800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,13.280300>}
box{<-0.635600,0,-0.004400><0.635600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.280300>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.280300>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.280300>}
box{<-0.382300,0,-0.004400><0.382300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,13.280300>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,13.280300>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.280300>}
box{<-0.511200,0,-0.004400><0.511200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,13.280300>}
box{<-0.435600,0,-0.004400><0.435600,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.280300>}
box{<-0.511100,0,-0.004400><0.511100,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.768500,0.000000,13.280300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.280300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.289200>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.628900,0.000000,13.289200>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.289200>}
box{<-0.448900,0,-0.004400><0.448900,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.642500,0.000000,13.289200>}
box{<-0.386700,0,-0.004400><0.386700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,13.289200>}
box{<-0.644500,0,-0.004400><0.644500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.289200>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.289200>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.332000,0.000000,13.289200>}
box{<-0.386700,0,-0.004400><0.386700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,13.289200>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607800,0.000000,13.289200>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.289200>}
box{<-0.520100,0,-0.004400><0.520100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,13.289200>}
box{<-0.444500,0,-0.004400><0.444500,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.289200>}
box{<-0.515600,0,-0.004400><0.515600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.773000,0.000000,13.289200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.289200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.298100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,13.298100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.298100>}
box{<-0.457800,0,-0.004400><0.457800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.642500,0.000000,13.298100>}
box{<-0.391100,0,-0.004400><0.391100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.298100>}
box{<-0.653400,0,-0.004400><0.653400,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.298100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.298100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.298100>}
box{<-0.395600,0,-0.004400><0.395600,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,13.298100>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,13.298100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.298100>}
box{<-0.520100,0,-0.004400><0.520100,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,13.298100>}
box{<-0.453400,0,-0.004400><0.453400,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.298100>}
box{<-0.520000,0,-0.004400><0.520000,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.768500,0.000000,13.298100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.298100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.307000>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,13.307000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.307000>}
box{<-0.462200,0,-0.004400><0.462200,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.638100,0.000000,13.307000>}
box{<-0.395600,0,-0.004400><0.395600,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,13.307000>}
box{<-0.653400,0,-0.004400><0.653400,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.307000>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.307000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.307000>}
box{<-0.400000,0,-0.004400><0.400000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452100,0.000000,13.307000>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,13.307000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.307000>}
box{<-0.528900,0,-0.004400><0.528900,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,13.307000>}
box{<-0.457800,0,-0.004400><0.457800,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.488300,0.000000,13.307000>}
box{<-0.528900,0,-0.004400><0.528900,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.768500,0.000000,13.307000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.307000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.315900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,13.315900>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.315900>}
box{<-0.466700,0,-0.004400><0.466700,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.642600,0.000000,13.315900>}
box{<-0.400000,0,-0.004400><0.400000,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.315900>}
box{<-0.657900,0,-0.004400><0.657900,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.251800,0.000000,13.315900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.315900>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.315900>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,13.315900>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,13.315900>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.315900>}
box{<-0.528900,0,-0.004400><0.528900,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,13.315900>}
box{<-0.462300,0,-0.004400><0.462300,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.315900>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.773000,0.000000,13.315900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.315900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.324800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,13.324800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,13.324800>}
box{<-0.466700,0,-0.004400><0.466700,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.642600,0.000000,13.324800>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,13.324800>}
box{<-0.662300,0,-0.004400><0.662300,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.324800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.324800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.332000,0.000000,13.324800>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,13.324800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,13.324800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,13.324800>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688200,0.000000,13.324800>}
box{<-0.462300,0,-0.004400><0.462300,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.324800>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.773000,0.000000,13.324800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.324800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.333700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,13.333700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.333700>}
box{<-0.466700,0,-0.004400><0.466700,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.642600,0.000000,13.333700>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,13.333700>}
box{<-0.662300,0,-0.004400><0.662300,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.333700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,13.333700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.333700>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,13.333700>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,13.333700>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.333700>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688200,0.000000,13.333700>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.333700>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.773000,0.000000,13.333700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.333700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.342600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.633400,0.000000,13.342600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.342600>}
box{<-0.475600,0,-0.004400><0.475600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.642600,0.000000,13.342600>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.342600>}
box{<-0.666700,0,-0.004400><0.666700,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.251700,0.000000,13.342600>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.342600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.342600>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,13.342600>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.612300,0.000000,13.342600>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.342600>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,13.342600>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.342600>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.768500,0.000000,13.342600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.342600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.351500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,13.351500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.351500>}
box{<-0.475600,0,-0.004400><0.475600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.642600,0.000000,13.351500>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.351500>}
box{<-0.666700,0,-0.004400><0.666700,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.251700,0.000000,13.351500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.351500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.351500>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,13.351500>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,13.351500>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.351500>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,13.351500>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.351500>}
box{<-0.542300,0,-0.004400><0.542300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.773000,0.000000,13.351500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.351500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.360300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,13.360300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.360300>}
box{<-0.475600,0,-0.004400><0.475600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.642600,0.000000,13.360300>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.360300>}
box{<-0.666700,0,-0.004400><0.666700,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.251700,0.000000,13.360300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.360300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.360300>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,13.360300>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,13.360300>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.360300>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,13.360300>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.360300>}
box{<-0.542300,0,-0.004400><0.542300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.773000,0.000000,13.360300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.360300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.369200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,13.369200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.369200>}
box{<-0.475600,0,-0.004400><0.475600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.642600,0.000000,13.369200>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.369200>}
box{<-0.666700,0,-0.004400><0.666700,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.251700,0.000000,13.369200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.369200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.369200>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,13.369200>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,13.369200>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.369200>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,13.369200>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.369200>}
box{<-0.542300,0,-0.004400><0.542300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.773000,0.000000,13.369200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.369200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.378100>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,13.378100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.378100>}
box{<-0.475600,0,-0.004400><0.475600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.642600,0.000000,13.378100>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.378100>}
box{<-0.666700,0,-0.004400><0.666700,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.251700,0.000000,13.378100>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.378100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.378100>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,13.378100>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,13.378100>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.378100>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,13.378100>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.378100>}
box{<-0.542300,0,-0.004400><0.542300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.773000,0.000000,13.378100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.378100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.387000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,13.387000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.387000>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.647000,0.000000,13.387000>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.387000>}
box{<-0.666700,0,-0.004400><0.666700,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.251700,0.000000,13.387000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.387000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.387000>}
box{<-0.408900,0,-0.004400><0.408900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,13.387000>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,13.387000>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.387000>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688200,0.000000,13.387000>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.387000>}
box{<-0.537800,0,-0.004400><0.537800,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.777400,0.000000,13.387000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.387000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.395900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,13.395900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.395900>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.647000,0.000000,13.395900>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,13.395900>}
box{<-0.662300,0,-0.004400><0.662300,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.395900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.395900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.395900>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,13.395900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,13.395900>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.395900>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688200,0.000000,13.395900>}
box{<-0.471100,0,-0.004400><0.471100,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.395900>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.773000,0.000000,13.395900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.395900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.404800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,13.404800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.404800>}
box{<-0.466700,0,-0.004400><0.466700,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.642600,0.000000,13.404800>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,13.404800>}
box{<-0.662300,0,-0.004400><0.662300,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.404800>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305200,0.000000,13.404800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.404800>}
box{<-0.404500,0,-0.004400><0.404500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,13.404800>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,13.404800>}
box{<-0.155600,0,-0.004400><0.155600,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.404800>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688200,0.000000,13.404800>}
box{<-0.466700,0,-0.004400><0.466700,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.497200,0.000000,13.404800>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.773000,0.000000,13.404800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.404800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.413700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,13.413700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,13.413700>}
box{<-0.466700,0,-0.004400><0.466700,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.642600,0.000000,13.413700>}
box{<-0.400000,0,-0.004400><0.400000,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.413700>}
box{<-0.657900,0,-0.004400><0.657900,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.251800,0.000000,13.413700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.413700>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.413700>}
box{<-0.400000,0,-0.004400><0.400000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452100,0.000000,13.413700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,13.413700>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,13.413700>}
box{<-0.528900,0,-0.004400><0.528900,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,13.413700>}
box{<-0.462300,0,-0.004400><0.462300,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.413700>}
box{<-0.533400,0,-0.004400><0.533400,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.773000,0.000000,13.413700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.413700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.422600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,13.422600>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.422600>}
box{<-0.462300,0,-0.004400><0.462300,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.647000,0.000000,13.422600>}
box{<-0.395600,0,-0.004400><0.395600,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,13.422600>}
box{<-0.653400,0,-0.004400><0.653400,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.422600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.422600>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.422600>}
box{<-0.395600,0,-0.004400><0.395600,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,13.422600>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,13.422600>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.422600>}
box{<-0.524500,0,-0.004400><0.524500,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688100,0.000000,13.422600>}
box{<-0.457800,0,-0.004400><0.457800,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.497200,0.000000,13.422600>}
box{<-0.524500,0,-0.004400><0.524500,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.773000,0.000000,13.422600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.422600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.431500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,13.431500>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.431500>}
box{<-0.453400,0,-0.004400><0.453400,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.647000,0.000000,13.431500>}
box{<-0.391100,0,-0.004400><0.391100,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.431500>}
box{<-0.649000,0,-0.004400><0.649000,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.251800,0.000000,13.431500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.431500>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.431500>}
box{<-0.391200,0,-0.004400><0.391200,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,13.431500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,13.431500>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.431500>}
box{<-0.515600,0,-0.004400><0.515600,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688100,0.000000,13.431500>}
box{<-0.453400,0,-0.004400><0.453400,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.431500>}
box{<-0.524500,0,-0.004400><0.524500,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.773000,0.000000,13.431500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.431500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.440400>}
box{<-0.137700,0,-0.004400><0.137700,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,13.440400>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.440400>}
box{<-0.448900,0,-0.004400><0.448900,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.642500,0.000000,13.440400>}
box{<-0.386700,0,-0.004400><0.386700,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073900,0.000000,13.440400>}
box{<-0.644500,0,-0.004400><0.644500,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.440400>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.440400>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.440400>}
box{<-0.386700,0,-0.004400><0.386700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,13.440400>}
box{<-0.137700,0,-0.004400><0.137700,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.603400,0.000000,13.440400>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.440400>}
box{<-0.511200,0,-0.004400><0.511200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,13.440400>}
box{<-0.444500,0,-0.004400><0.444500,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.440400>}
box{<-0.515600,0,-0.004400><0.515600,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.773000,0.000000,13.440400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.440400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.449200>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.628900,0.000000,13.449200>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,13.449200>}
box{<-0.440000,0,-0.004400><0.440000,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.642500,0.000000,13.449200>}
box{<-0.377800,0,-0.004400><0.377800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,13.449200>}
box{<-0.635600,0,-0.004400><0.635600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.449200>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.449200>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.449200>}
box{<-0.377800,0,-0.004400><0.377800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,13.449200>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607800,0.000000,13.449200>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,13.449200>}
box{<-0.506700,0,-0.004400><0.506700,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688100,0.000000,13.449200>}
box{<-0.435600,0,-0.004400><0.435600,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.449200>}
box{<-0.506700,0,-0.004400><0.506700,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.773000,0.000000,13.449200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.449200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.458100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,13.458100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.458100>}
box{<-0.431100,0,-0.004400><0.431100,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.642500,0.000000,13.458100>}
box{<-0.368900,0,-0.004400><0.368900,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.073800,0.000000,13.458100>}
box{<-0.622300,0,-0.004400><0.622300,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.251800,0.000000,13.458100>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.458100>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.332000,0.000000,13.458100>}
box{<-0.368900,0,-0.004400><0.368900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.456600,0.000000,13.458100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.603400,0.000000,13.458100>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.458100>}
box{<-0.493400,0,-0.004400><0.493400,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,13.458100>}
box{<-0.426700,0,-0.004400><0.426700,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.458100>}
box{<-0.497800,0,-0.004400><0.497800,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.772900,0.000000,13.458100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.458100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.467000>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.629000,0.000000,13.467000>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.651300,0.000000,13.467000>}
box{<-0.417800,0,-0.004400><0.417800,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.647000,0.000000,13.467000>}
box{<-0.355600,0,-0.004400><0.355600,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.467000>}
box{<-0.608900,0,-0.004400><0.608900,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.467000>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.467000>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.467000>}
box{<-0.355600,0,-0.004400><0.355600,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,13.467000>}
box{<-0.115600,0,-0.004400><0.115600,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.607900,0.000000,13.467000>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.630200,0.000000,13.467000>}
box{<-0.480000,0,-0.004400><0.480000,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688100,0.000000,13.467000>}
box{<-0.417800,0,-0.004400><0.417800,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.467000>}
box{<-0.484500,0,-0.004400><0.484500,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.768500,0.000000,13.467000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.467000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.475900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.624500,0.000000,13.475900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.475900>}
box{<-0.395600,0,-0.004400><0.395600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.642600,0.000000,13.475900>}
box{<-0.337800,0,-0.004400><0.337800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.069400,0.000000,13.475900>}
box{<-0.591100,0,-0.004400><0.591100,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.475900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.475900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.475900>}
box{<-0.337800,0,-0.004400><0.337800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.452200,0.000000,13.475900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.603400,0.000000,13.475900>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.475900>}
box{<-0.462200,0,-0.004400><0.462200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.688100,0.000000,13.475900>}
box{<-0.400000,0,-0.004400><0.400000,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.475900>}
box{<-0.471200,0,-0.004400><0.471200,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.773000,0.000000,13.475900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.475900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.484800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.620100,0.000000,13.484800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.660200,0.000000,13.484800>}
box{<-0.355600,0,-0.004400><0.355600,0.036000,0.004400> rotate<0,-0.000000,0> translate<10.638100,0.000000,13.484800>}
box{<-0.297800,0,-0.004400><0.297800,0.036000,0.004400> rotate<0,-0.000000,0> translate<12.065000,0.000000,13.484800>}
box{<-0.555600,0,-0.004400><0.555600,0.036000,0.004400> rotate<0,-0.000000,0> translate<13.256200,0.000000,13.484800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.300800,0.000000,13.484800>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.484800>}
box{<-0.315500,0,-0.004400><0.315500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.447700,0.000000,13.484800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.599000,0.000000,13.484800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.639100,0.000000,13.484800>}
box{<-0.431200,0,-0.004400><0.431200,0.036000,0.004400> rotate<0,-0.000000,0> translate<19.683700,0.000000,13.484800>}
box{<-0.373400,0,-0.004400><0.373400,0.036000,0.004400> rotate<0,-0.000000,0> translate<21.492800,0.000000,13.484800>}
box{<-0.422300,0,-0.004400><0.422300,0.036000,0.004400> rotate<0,-0.000000,0> translate<22.795200,0.000000,13.484800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.484800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.493700>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.615700,0.000000,13.493700>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<9.655800,0.000000,13.493700>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<14.305300,0.000000,13.493700>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<15.327600,0.000000,13.493700>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<17.594600,0.000000,13.493700>}
box{<-0.040000,0,-0.004400><0.040000,0.036000,0.004400> rotate<0,-0.000000,0> translate<18.634700,0.000000,13.493700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.493700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.502600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.502600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.511500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.511500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.520400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.520400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.529300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.529300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.538100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.538100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.547000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.547000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.555900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.555900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.564800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.564800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.573700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.573700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.582600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.582600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.591500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.591500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.600400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.600400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.609300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.609300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.618200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.618200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.627000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.627000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.635900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.635900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.644800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.644800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.653700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.653700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.662600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.662600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.671500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.671500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.680400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.680400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.689300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.689300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.698200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.698200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.707100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.707100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.715900>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.715900>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.724800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.724800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.733700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.733700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.742600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.742600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.751500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.751500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.760400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.760400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.769300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.769300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.778200>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.778200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.787100>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.787100>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.796000>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.796000>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.804800>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.804800>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.813700>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.813700>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.822600>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.822600>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.831500>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.831500>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.840400>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.840400>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.211200,0.000000,13.849300>}
box{<-0.080000,0,-0.004400><0.080000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.839800,0.000000,13.849300>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.215600,0.000000,13.858200>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.835300,0.000000,13.858200>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.215600,0.000000,13.867100>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.835300,0.000000,13.867100>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.215600,0.000000,13.876000>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.835300,0.000000,13.876000>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.215600,0.000000,13.884900>}
box{<-0.084400,0,-0.004400><0.084400,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.835300,0.000000,13.884900>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.220000,0.000000,13.893700>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.830900,0.000000,13.893700>}
box{<-0.106600,0,-0.004400><0.106600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.220000,0.000000,13.902600>}
box{<-0.088900,0,-0.004400><0.088900,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.830900,0.000000,13.902600>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.224500,0.000000,13.911500>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.826400,0.000000,13.911500>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.224500,0.000000,13.920400>}
box{<-0.093300,0,-0.004400><0.093300,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.826400,0.000000,13.920400>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.228900,0.000000,13.929300>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.822000,0.000000,13.929300>}
box{<-0.115500,0,-0.004400><0.115500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.228900,0.000000,13.938200>}
box{<-0.097800,0,-0.004400><0.097800,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.822000,0.000000,13.938200>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.233400,0.000000,13.947100>}
box{<-0.102200,0,-0.004400><0.102200,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.817500,0.000000,13.947100>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.237800,0.000000,13.956000>}
box{<-0.106700,0,-0.004400><0.106700,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.813100,0.000000,13.956000>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.242300,0.000000,13.964900>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.808600,0.000000,13.964900>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.251200,0.000000,13.973800>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.799800,0.000000,13.973800>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.251200,0.000000,13.982600>}
box{<-0.111100,0,-0.004400><0.111100,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.799800,0.000000,13.982600>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.260100,0.000000,13.991500>}
box{<-0.120000,0,-0.004400><0.120000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.790900,0.000000,13.991500>}
box{<-0.142200,0,-0.004400><0.142200,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.264500,0.000000,14.000400>}
box{<-0.124400,0,-0.004400><0.124400,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.786400,0.000000,14.000400>}
box{<-0.146600,0,-0.004400><0.146600,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.268900,0.000000,14.009300>}
box{<-0.128900,0,-0.004400><0.128900,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.782000,0.000000,14.009300>}
box{<-0.151100,0,-0.004400><0.151100,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.273400,0.000000,14.018200>}
box{<-0.133300,0,-0.004400><0.133300,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.777500,0.000000,14.018200>}
box{<-0.155500,0,-0.004400><0.155500,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.286700,0.000000,14.027100>}
box{<-0.137800,0,-0.004400><0.137800,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.764200,0.000000,14.027100>}
box{<-0.164400,0,-0.004400><0.164400,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.295600,0.000000,14.036000>}
box{<-0.146700,0,-0.004400><0.146700,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.755300,0.000000,14.036000>}
box{<-0.177800,0,-0.004400><0.177800,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.309000,0.000000,14.044900>}
box{<-0.160000,0,-0.004400><0.160000,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.742000,0.000000,14.044900>}
box{<-0.186700,0,-0.004400><0.186700,0.036000,0.004400> rotate<0,-0.000000,0> translate<8.326700,0.000000,14.053800>}
box{<-0.168900,0,-0.004400><0.168900,0.036000,0.004400> rotate<0,-0.000000,0> translate<23.724200,0.000000,14.053800>}
box{<-7.876500,0,-0.004400><7.876500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016500,0.000000,14.062700>}
box{<-7.867600,0,-0.004400><7.867600,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016500,0.000000,14.071500>}
box{<-7.867600,0,-0.004400><7.867600,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016500,0.000000,14.080400>}
box{<-7.858700,0,-0.004400><7.858700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016500,0.000000,14.089300>}
box{<-7.858700,0,-0.004400><7.858700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016500,0.000000,14.098200>}
box{<-7.849900,0,-0.004400><7.849900,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016600,0.000000,14.107100>}
box{<-7.841000,0,-0.004400><7.841000,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016600,0.000000,14.116000>}
box{<-7.832100,0,-0.004400><7.832100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016600,0.000000,14.124900>}
box{<-7.823200,0,-0.004400><7.823200,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016600,0.000000,14.133800>}
box{<-7.814300,0,-0.004400><7.814300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016600,0.000000,14.142700>}
box{<-7.805400,0,-0.004400><7.805400,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016600,0.000000,14.151600>}
box{<-7.796500,0,-0.004400><7.796500,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016600,0.000000,14.160400>}
box{<-7.787600,0,-0.004400><7.787600,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016500,0.000000,14.169300>}
box{<-7.769800,0,-0.004400><7.769800,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016500,0.000000,14.178200>}
box{<-7.752100,0,-0.004400><7.752100,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016600,0.000000,14.187100>}
box{<-7.734300,0,-0.004400><7.734300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016600,0.000000,14.196000>}
box{<-7.698700,0,-0.004400><7.698700,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016500,0.000000,14.204900>}
box{<-7.654300,0,-0.004400><7.654300,0.036000,0.004400> rotate<0,-0.000000,0> translate<16.016600,0.000000,14.213800>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  RGBSABER_CONTROL_V1_6(-31.775500,0,-13.333250,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//REG	REG	1X05_2MM
//U$1		STAND-OFF
//U$2		STAND-OFF
//U$3		STAND-OFF
//U$4		STAND-OFF
//U$5	NBW_LOGO	NBW_LOGO2
