# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1



typedef unsigned short u16;
# 27 "myLib.h"
extern unsigned short *videoBuffer;

typedef struct
{
 int row;
 int col;
 int oldRow;
 int oldCol;
 int width;
 int height;
 u16 color;
 char dead;
} PLAYER;

typedef struct
{
 int row;
 int col;
 int oldRow;
 int oldCol;
 int height;
 int width;
 int rd;
 int cd;
 int active;
 u16 color;
} BLOCK;

typedef struct
{
 int row;
 int col;
 int oldRow;
 int oldCol;
 int rd;
 int cd;
 int size;
} BALL;


void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void drawRectInBounds(int row, int col, int height, int width, unsigned short color);
void waitForVBlank();
void fillScreen(unsigned short color);
void drawBackgroundImage3(const unsigned short*);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);

void update();
void initialize();
void initializeGame();
void draw();
void updatePlayer(PLAYER*);
void erasePlayer(PLAYER*);
void drawPlayer(PLAYER*);
void drawBall(BALL*, PLAYER*);
void blockCollision(BLOCK*, BALL*);
void drawBlock(BLOCK*);
void eraseBlock(BLOCK* b);
void start();
void lose();
void pause();
void win();
void game();
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);


int rand();
void srand();
# 113 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 123 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);






typedef struct
{
        const volatile void *src;
        const volatile void *dst;
        unsigned int cnt;
} DMA_CONTROLLER;
# 2 "myLib.c" 2

unsigned short * videoBuffer = (unsigned short *)0x6000000;
unsigned int oldButtons;
unsigned int buttons;

void setPixel(int row, int col, unsigned short color)
{
 videoBuffer[((row)*(240)+(col))] = color;
}

void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control)
{
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].src = source;
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].dst = destination;
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].cnt = (1 << 31) | control;
}

void drawRect(int row, int col, int height, int width, unsigned short color)
{
 volatile unsigned short c = color;
    for(int r = 0; r < height; r++) {
     DMANow(3, &c, &videoBuffer[((row + r)*(240)+(col))], (2 << 23) | width);
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
     DMANow(3, &c, &videoBuffer[((row + r)*(240)+(col))], (2 << 23) | width);
    }
}

void drawBackgroundImage3(const unsigned short * image)
{

 DMANow(3, (unsigned short *) image, videoBuffer, (240 * 160));
}

void drawImage3(const unsigned short* image, int row, int col, int height, int width)
{

 for(int r = 0; r < height; r++)
 {
  DMANow(3, (unsigned short *) &image[((r)*(width)+(0))], &videoBuffer[((row + r)*(240)+(col))], width);
 }
}

void fillScreen(unsigned short color)
{
 volatile unsigned short c = color;
 DMANow(3, &c, videoBuffer, (2 << 23) | 240 * 160);
}

void waitForVBlank()
{
 while(*(volatile u16 *)0x4000006>160);
 while(*(volatile u16 *)0x4000006<160);
}
