#include "myLib.h"

unsigned short * videoBuffer = (unsigned short *)0x6000000;
unsigned int oldButtons;
unsigned int buttons;

void setPixel(int row, int col, unsigned short color)
{
	videoBuffer[OFFSET(row,col,240)] = color;
}

void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control)
{
	DMA[channel].src = source; 
	DMA[channel].dst = destination; 
	DMA[channel].cnt = DMA_ON | control; 
}

void drawRect(int row, int col, int height, int width, unsigned short color)
{
	volatile unsigned short c = color;
    for(int r = 0; r < height; r++) {
    	DMANow(3, &c, &videoBuffer[OFFSET(row + r, col, 240)], DMA_SOURCE_FIXED | width); 
    }   
}

void drawRectInBounds(int row, int col, int height, int width, unsigned short color)
{
	volatile unsigned short c = color;
	if(col < 0)
	{
		width += col;
		col = 0;
	}
	if(col+width > 240)
	{
		width -= ((col+width)-240);
		col = 240;
	}
    for(int r = 0; r < height; r++) {
    	DMANow(3, &c, &videoBuffer[OFFSET(row + r, col, 240)], DMA_SOURCE_FIXED | width); 
    }   
}

void drawBackgroundImage3(const unsigned short * image)
{
	//TODO: fill in this code
	DMANow(3, (unsigned short *) image, videoBuffer, (240 * 160));
}

void drawImage3(const unsigned short* image, int row, int col, int height, int width)
{
	//TODO: fill in this code
	for(int r = 0; r < height; r++)
	{
		DMANow(3, (unsigned short *) &image[OFFSET(r, 0, width)], &videoBuffer[OFFSET(row + r, col, 240)], width);
	}
}

void fillScreen(unsigned short color)
{
	volatile unsigned short c = color;
	DMANow(3, &c, videoBuffer, DMA_SOURCE_FIXED | 240 * 160); 
}

void waitForVBlank()
{
	while(SCANLINECOUNTER>160);
	while(SCANLINECOUNTER<160);
}