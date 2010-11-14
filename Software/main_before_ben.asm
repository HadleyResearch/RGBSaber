;*********************************************************************************************
; File: main.asm
; Description: main assembly file for tricolor lightsaber LED code
; Programmer: George Hadley
; Program History:
;	   Date			Ver					Description
;   10/20/2008 		0.0		Initial program created
;	10/23/2008		0.0		I/O,RTI,ADC initializations developed, button debouncing code created
;								resolved #define error, toggle_color subroutine developed
; Notes:
;   1) color: A status register containing status flags for color control
;	   Bit	Abbrev. 		Name							Description									Bit Values
;		0    editable	Color Edit flag: 			Indicates if a color can be edited or not 	(1:editable, 0:not editable)
;		1	 red_flag	Red Color Select: 			Indicates if red is currently selected 		(1:selected, 0:unselected)
;		2    green_flag	Green Color Select: 		Indicates if green is currently selected 	(1:selected, 0:unselected)
;		3	 blue_flag	Blue Color Select: 			Indicates if blue is currently selected 	(1:selected, 0:unselected)
;		4	 colorpb	Color Pushbutton Flag: 		Indicates if the color pushbutton flag is 
;												   		pressed (used to debounce color  		(1:pressed, 0:not pressed)
;														select button)
;		5	 prevpb		Previous Pushbutton Flag: 	Saves previous state of color select
;														pushbutton (used to debounce color 		(1:was pressed, 0:was not pressed)
;														select button)
;	2) Program I/O pins:
;	   Pin	      Abbrev			Name						Description
;     03(AN0)	color_adjust	Color Adjuster Pin		Color adjuster slider pin
;	  21(RB0)   red_pwm			Red PWM Output Pin		PWM output for Red LEDs
;	  22(RB1)   green_pwm		Green PWM Output Pin	PWM output for Green LEDs
;	  23(RB2)   blue_pwm		Blue PWM Output Pin		PWM output for Blue LEDs
;	  24(RB3)	red_indicate	Red LED indicator		Output for red led status indicator
;	  25(RB4)	green_indicate	Green LED indicator		Output for green led status indicator
;	  26(RB5)	blue_indicate	Blue LED indicator		Output for blue led status indicator
;	  28(RB7)	color_select	Color Selector Pin		Color selecter pushbutton pin
;
; To-Do List:
;   X) Initialize Interrupts
;	X) Initialize A/D Converter
;	X) Write up button debouncing code for color select button
;	X) Write up color select indicator code based on state of color select button
;	5) Debug color select indicator code
;	6) Write up A/D Converter input code for color adjuster
;	7) Write up PWM output code based on A/D converted color adjuster input
;	8) Develop color edit flag code and integrate into PWM output
;	9) Add auto shutdown feature after certain period of inactivity has passed
;  10) Write up code to save final state of blade before power off and re-enable upon power-up
;*********************************************************************************************
	#include<p18f2221.inc>
	list p = p18f2221, r = dec
	cblock 0	;Variable initializations
		color		;color status register (see note 1 in header)
		prev_red	;stores previous color level of red leds
		prev_green	;stores previous color level of green leds
		prev_blue	;stores previous color level of blue leds
	endc
	;Color Bit initializations
	#define	editable color,0
	#define	red_flag color,1
	#define	green_flag color,2
	#define	blue_flag color,3
	#define	colorpb color,4
	#define	prevpb color,5
	;I/O pin initializations
	#define color_adjust porta,0
	#define	red_pwm portb,0
	#define	green_pwm portb,1
	#define blue_pwm portb,2
	#define red_indicate latb,3
	#define green_indicate latb,4
	#define blue_indicate latb,5
	#define color_select portc,2

	org 0
	movlw b'01111000'
	movwf OSCCON
	goto initialize	;skip ahead to start of code (leave space for interrupt code)
	
	org	08h		;starting point for interrupt code
tmr0_overflow	;Timer0 overflow interrupt service routine
	bcf	INTCON,TMR0IF	;clear tmr0 overflow interrupt flag (prepare for next interrupt)
	;btg color_select	;complement color_select bit (allows use of positive logic for following statements)
	btfsc color_select	;Clear colorpb, prevpb if button is not currently pressed
	bra no_colorpb
	btfss prevpb		
	bra set_colorpb
	bcf colorpb
	bsf prevpb
	bra tmr0_return
set_colorpb
	bsf colorpb
	bsf	prevpb
	bra tmr0_return
no_colorpb
	bcf colorpb
	bcf	prevpb
tmr0_return
	retfie fast

initialize
  ;I/O Port initializations
	bsf	trisc,2
	clrf trisb
	movlw h'18'
	movwf portb
	setf trisa
  ;Interrupt initializations (TMR0 Overflow Interrupt)
	movlw b'11010101'
	movwf T0CON
	bsf	INTCON,TMR0IE
	bsf INTCON,GIE
  ;ADC Initializations
	movlw b'00000101'
	movwf ADCON0
	movlw h'0F'
	movwf ADCON1
  ;User Variable Initializations
    movlw h'03'
	movwf color
    clrf prev_red
	clrf prev_green
	clrf prev_blue	
start
	btfsc colorpb
	;call toggle_color
	btg	red_indicate
;	bcf	colorpb
	bra start

;************************************************************************************************
; Subroutine: toggle_color
; Description: looks at the current color state and goes to the next color state (sets flags and
;	indicator LED accordingly) (Red -> Green -> Blue -> Lock) (if lock is reached, color select goes
;	back to red)
;************************************************************************************************
toggle_color
	btfsc red_flag
	bra select_green
	btfsc green_flag
	bra select_blue
	btfsc blue_flag
	bra select_lock
	bra select_red
end_toggle
	bcf colorpb
	return

select_red
	bsf red_flag
	bcf	red_indicate
	bra end_toggle
select_green
	btfsc editable
	movff adresh, prev_red		;Save last red ADC value if color was editable
	bcf red_flag
	bsf	green_flag
	bsf red_indicate
	bcf green_indicate
	bra end_toggle
select_blue
	btfsc editable
	movff adresh, prev_green	;Save last green ADC value if color was editable
	bcf green_flag
	bsf blue_flag
	bsf	green_indicate
	bcf	blue_indicate
	bra end_toggle
select_lock
	btfsc editable
	movff adresh, prev_blue		;Save the last blue ADC value if color was editable
	bcf blue_flag
	bsf blue_indicate
	bra end_toggle
	



	end