/*
 * File: aliases.h
 * Author: George Hadley
 * Description: aliases used in the RGBSaber Firmware v2.0
 */

 //IO pin definitions
 #define regColorAdjust 	PORTAbits.0
 #define regBluePwm 		LATBbits.LATB0
 #define regGreenPwm 		LATBbits.LATB1
 #define regRedPwm 		LATBbits.LATB2
 #define regBlueIndicate	LATBbits.LATB3
 #define regGreenIndicate	LATBbits.LATB4
 #define regRedIndicate		LATBbits.LATB5
 #define regColorSelect		PORTCbits.RC2
 #define regEditSelect		PORTCbits.RC3
 
