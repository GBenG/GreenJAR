@ECHO OFF
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "D:\SPS\MY_PROJECTs\GreenJAR\labels.tmp" -fI -W+ie -C V2 -o "D:\SPS\MY_PROJECTs\GreenJAR\GreenJAR.hex" -d "D:\SPS\MY_PROJECTs\GreenJAR\GreenJAR.obj" -e "D:\SPS\MY_PROJECTs\GreenJAR\GreenJAR.eep" -m "D:\SPS\MY_PROJECTs\GreenJAR\GreenJAR.map" "D:\SPS\MY_PROJECTs\GreenJAR\GreenJAR.asm"
