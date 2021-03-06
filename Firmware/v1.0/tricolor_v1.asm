;*********************************************************************************************
; File: main.asm
; Description: main assembly file for tricolor lightsaber LED code
; Programmer: George Hadley
; Program History:
;	   Date			Ver					Description
;   10/20/2008 		0.0		Initial program created
;	10/23/2008		0.0		I/O,RTI,ADC initializations developed, button debouncing code created
;								resolved #define error, toggle_color subroutine developed
;	10/25/2008		0.0		Button Toggle code debugged, read_color_port and is_editable routines
;								developed
;	10/26/2008		1.0		is_editable code completed, wrote and debugged pwm output code, removed
;								is_editable from code
;	11/06/2008		1.0		Worked on tricolor_v1 debug process
;	12/14/2008		1.1		Developed 2-button editability feature
;	12/16/2008		1.2		LED Flash Indicator feature added to indicate color is editable
;	02/19/2009		1.3		Firmware updated to work with common cathode luxeon led
; Notes:
;   1) color: A status register containing status flags for color control
;	   Bit	Abbrev. 		Name							Description									Bit Values
;	    0	 editable	Editable Flag				Indicates if currently selected color is	(1:editable, 0:uneditable)
;														editable by color adjuster
;		1	 red_flag	Red Color Select: 			Indicates if red is currently selected 		(1:selected, 0:unselected)
;		2    green_flag	Green Color Select: 		Indicates if green is currently selected 	(1:selected, 0:unselected)
;		3	 blue_flag	Blue Color Select: 			Indicates if blue is currently selected 	(1:selected, 0:unselected)
;		4	 colorpb	Color Pushbutton Flag: 		Indicates if the color pushbutton flag is 
;												   		pressed  								(1:was pressed, 0:was not pressed)
;		5	 prevpb0	Previous Pushbutton Flag 0: Saves previous state of color select
;														pushbutton (used to debounce color 		(1:was pressed, 0:was not pressed)
;														select button)
;		6	 editpb		Color editable pushbutton	Indicates if edit pushbutton is pressed		(1:was pressed, 0:was not pressed)
;		7	 prevpb1	Previous Pushbutton Flag 1:	Saves previous state of edit pushbutton		
;														(used for button debouncing) 			(1:was pressed, 0:was not pressed)
;	2) flashctl: Status register containing flags for flash control
;	   Bit	Abbrev.			Name							Description									Bit Values
;		0	flash		Initiate flash bit			Indicates whether to flash indicator or		(1:flash indicator, 0: don't flash)
;														not
;	3) Program I/O pins:
;	   Pin	      Abbrev			Name						Description
;     02(AN0)	color_adjust	Color Adjuster Pin		Color adjuster slider pin
;	  13(RC2)	color_select	Color Selector Pin		Color selecter pushbutton pin
;	  14(RC3)	edit_select		Edit Selector Pin		Color edit select pushbutton
;	  21(RB0)   blue_pwm		Blue PWM Output Pin		PWM output for Blue LEDs
;	  22(RB1)   green_pwm		Green PWM Output Pin	PWM output for Green LEDs
;	  23(RB2)   red_pwm			Red PWM Output Pin		PWM output for Red LEDs
;	  24(RB3)	blue_indicate	Blue LED indicator		Output for blue led status indicator
;	  25(RB4)	green_indicate	Green LED indicator		Output for green led status indicator
;	  26(RB5)	red_indicate	Red LED indicator		Output for red led status indicator
;
;	4) If there exists a chance that pins have "funky" voltages (diodes, transistors w/o resistors, etc), use latch pins instead of port pins
;
; To-Do List:
;   X) Initialize Interrupts
;	X) Initialize A/D Converter
;	X) Write up button debouncing code for color select button
;	X) Write up color select indicator code based on state of color select button
;	X) Debug color select indicator code
;	X) Write up A/D Converter input code for color adjuster
;	X) Write up PWM output code based on A/D converted color adjuster input
;	X) Develop color edit flag code and integrate into PWM output
;	9) Add auto shutdown feature after certain period of inactivity has passed
;  10) Write up code to save final state of blade before power off and re-enable upon power-up
;   X) Develop code to make indicator light flash when color is editable
;*********************************************************************************************
	#include<p18f2221.inc>
	;set configuration bits
	config wdt=off,lvp=off,osc=intio2,bor=off,cp0=off,cp1=off,cpb=off,cpd=off,wrt0=off,wrt1=off,wrtd=off
	list p = p18f2221, r = dec
	cblock 0	;Variable initializations
		color		  ;color status register (see note 1 in header)
		flashctl	  ;flash control register
		flashcnt	  ;flash count register (counts interrupts)
		prev_red	  ;stores previous red color level
		prev_green	  ;stores previous green color level
		prev_blue	  ;stores previous blue color level
		red_level1	  ;stores current color level of red leds
		green_level1  ;stores current color level of green leds
		blue_level1	  ;stores current color level of blue leds
		red_pwm_acc   ;red pwm accumulator register
		green_pwm_acc ;green pwm accumulator register
		blue_pwm_acc  ;blue pwm accumulator register
	endc
	;Color Bit definitions
	#define	editable color,0
	#define	red_flag color,1
	#define	green_flag color,2
	#define	blue_flag color,3
	#define	colorpb color,4
	#define	prevpb0 color,5
	#define	editpb	color,6
	#define	prevpb1	color,7

    ;I/O pin definitions
	#define color_adjust porta,0
	#define	blue_pwm latb,0
	#define	green_pwm latb,1
	#define red_pwm latb,2
	#define blue_indicate latb,3
	#define green_indicate latb,4
	#define red_indicate latb,5
	#define color_select portc,2
	#define edit_select portc,3

	;Other Definitions
	#define	flash flashctl,0
	#define flashval 0x20			;Flash count value

	org 0
	movlw 	b'01111000'
	movwf 	OSCCON
	bra 	initialize	;skip ahead to start of code (leave space for interrupt code)
	org	08h		;starting point for interrupt code

tmr0_overflow	;Timer0 overflow interrupt service routine
	bcf		INTCON,TMR0IF	;clear tmr0 overflow interrupt flag (prepare for next interrupt)
	btfsc 	color_select	;Clear colorpb, prevpb if button is not currently pressed
	bra 	no_colorpb
	btfss 	prevpb0		
	bra 	set_colorpb
	bcf 	colorpb
	bsf 	prevpb0
	bra 	check_editpb
set_colorpb
	bsf 	colorpb
	bsf		prevpb0
	bra 	check_editpb
no_colorpb
	bcf 	colorpb
	bcf		prevpb0
check_editpb
	btfsc 	edit_select	;Clear colorpb, prevpb if button is not currently pressed
	bra 	no_editpb
	btfss 	prevpb1		
	bra 	set_editpb
	bcf 	editpb
	bsf 	prevpb1
	bra 	check_flash
set_editpb
	bsf 	editpb
	bsf		prevpb1
	bra 	check_flash
no_editpb
	bcf 	editpb
	bcf		prevpb1
check_flash
	btfsc 	editable
	goto 	tmr0_return
	decf 	flashcnt
	bnz		tmr0_return
	movlw 	flashval
	movwf 	flashcnt
	bsf 	flash	
tmr0_return
	retfie 	fast

initialize
  ;I/O Port initializations
	bsf		trisc,2
	bsf		trisc,3
;	movlw	0x18		;Turn on red led, blade initially off
;	movwf 	trisb
	movlw 	b'00011000'		;Turn on red indicator, blade initially off
	movwf 	latb
	clrf	trisb
	setf 	trisa
  ;Interrupt initializations (TMR0 Overflow Interrupt)
	movlw 	b'11010101'
	movwf 	T0CON
	bsf		INTCON,TMR0IE
	bsf 	INTCON,GIE
  ;ADC Initializations
	bsf 	ADCON0,ADON
	movlw 	0x0E
	movwf 	ADCON1
  ;User Variable Initializations
    movlw 	0x02
	movwf 	color
	movlw 	flashval
	movwf 	flashcnt
	clrf 	prev_red
	clrf 	prev_green
	clrf 	prev_blue
	clrf 	red_level1
	clrf 	green_level1
	clrf 	blue_level1	
	clrf 	red_pwm_acc
	clrf 	green_pwm_acc
	clrf 	blue_pwm_acc
start
	btfsc 	colorpb
	call 	toggle_color
	call 	read_color_port
	btfsc 	editpb
	btg		editable
	btfsc 	editable
	call 	shift_color
	btfsc	editable
	call	indicate_color
	btfsc 	flash
	call 	flash_indicate
	call 	output_pwm
	bra 	start

;************************************************************************************************
; Subroutine: indicate_color
; Description: If color is editable, lights up appropriate color indicator (used to prevent output glitch)
;************************************************************************************************
indicate_color
	btfsc	red_flag
	bcf		red_indicate
	btfsc	green_flag
	bcf		green_indicate
	btfsc	blue_flag
	bcf		blue_indicate
	return

;************************************************************************************************
; Subroutine: toggle_color
; Description: looks at the current color state and goes to the next color state (sets flags and
;	indicator LED accordingly) (Red -> Green -> Blue -> Lock) (if lock is reached, color select goes
;	back to red)
;************************************************************************************************
toggle_color
	;bcf		editable
	btfsc 	red_flag
	bra 	select_green
	btfsc 	green_flag
	bra 	select_blue
	btfsc 	blue_flag
	bra 	select_lock
	bra 	select_red
end_toggle
	bcf 	colorpb
	return

select_red
	bsf 	red_flag
	bcf		red_indicate
	bra 	end_toggle
select_green
	bcf 	red_flag
	bsf		green_flag
	bsf 	red_indicate
	bcf 	green_indicate
	bra 	end_toggle
select_blue
	bcf 	green_flag
	bsf 	blue_flag
	bsf		green_indicate
	bcf		blue_indicate
	bra 	end_toggle
select_lock
	bcf 	blue_flag
	bsf 	blue_indicate
	bra 	end_toggle
	
;*******************************************************************************************
; Subroutine: read_color_port
; Description: Initiates A/D conversions on the currently selected color port
;*******************************************************************************************
read_color_port
	bsf		ADCON0,GO_DONE		;Initiate A/D Conversion on color_adjust pin
ADC_wait_loop
	btfsc 	ADCON0,GO_DONE	;Wait until A/D Conversion finishes
	bra		ADC_wait_loop
ADC_store
	btfsc 	red_flag
	bra 	store_red
	btfsc 	green_flag
	bra 	store_green
	btfsc 	blue_flag
	bra 	store_blue
ADC_return	
	return

store_red	
	movff 	ADRESH,prev_red
	bra 	ADC_return
store_green
	movff 	ADRESH,prev_green
	bra 	ADC_return
store_blue
	movff 	ADRESH,prev_blue
	bra 	ADC_return

;***********************************************************************************************
; Subroutine: shift_color
; Description: If color is editable, shifts color to level1 variable to be output via PWM
;***********************************************************************************************
shift_color
	btfsc	red_flag
	movff	prev_red,red_level1
	btfsc	green_flag
	movff	prev_green,green_level1
	btfsc	blue_flag
	movff	prev_blue,blue_level1
shift_return
	return

;***********************************************************************************************
; Subroutine: flash_indicate
; Description: Flash LED Indicator if selected color is editable
;***********************************************************************************************
flash_indicate
	bcf		flash
	movlw	flashval
	movwf	flashcnt
	btfsc	red_flag
	btg		red_indicate
	btfsc	green_flag
	btg		green_indicate
	btfsc	blue_flag
	btg		blue_indicate
	return

;***********************************************************************************************
; Subroutine: output_pwm
; Description: Software pwm routine for tricolor lightsaber
;***********************************************************************************************
output_pwm
	movf 	red_level1,w
	addwf 	red_pwm_acc,f
	bc 		output_red
	bcf 	red_pwm				;ERROR: shuts off red_indicator as well as red_pwm
test_green
	movf 	green_level1,w
	addwf 	green_pwm_acc,f
	bc 		output_green
	bcf		green_pwm
test_blue
	movf 	blue_level1,w
	addwf 	blue_pwm_acc,f
	bc 		output_blue
	bcf 	blue_pwm
output_return
	return

output_red
	bsf 	red_pwm
	bra 	test_green
output_green
	bsf 	green_pwm
	bra 	test_blue
output_blue
	bsf 	blue_pwm
	bra 	output_return
	end 