#include <stdio.h>
#include <stdlib.h>
#include "myLib.h"
#include "text.h"
#include "openbg.h"
#include "gameover.h"
#include "paddle.h"

/*player*/
PLAYER player;

/*blocks*/
BLOCK blocksRow[10];
int numblocks;

BLOCK blocksRow2[10];
int numblocks2;

/*ball*/
BALL ball;
int timer;
int state;

char oldBuffer[41];
char buffer[41];
int oldscore;
int score;
int deadBlocks;

//States
enum {STARTSCREEN, GAMESCREEN, WINSCREEN, LOSESCREEN, PAUSESCREEN };

int main()
{
	initialize();
	while(1)
	{
		oldButtons = buttons;
		buttons = BUTTONS;

		switch(state) {
			case STARTSCREEN:
				start();
				break;
			case GAMESCREEN:
				game();
				break;
			case WINSCREEN:
				win();
				break;
			case LOSESCREEN:
				lose();
				break;
			case PAUSESCREEN:
				pause();
				break;
		}
	}

	return 0;
}

void start() 
{
	//put in the drawimage function here
	//drawBackgroundImage3(openbgBitmap);
	drawString(10, 5, "WELCOME TO BREAKOUT! :D", WHITE);
	drawString(20, 5, "PRESS START (ENTER KEY) TO PLAY...", WHITE);
	//drawBackgroundImage3(openbgBitmap);
	timer++;
	if(BUTTON_PRESSED(BUTTON_START)) {

		//add drawBackgroundImage3
		//drawBackgroundImage3(openbgBitmap);
		//clears screen to black
		fillScreen(BLACK);
		//drawBackgroundImage3(gameoverBitmap);
		state = GAMESCREEN;
		srand(timer);
		initializeGame();
	}
	//drawBackgroundImage3(openbgBitmap);
}

void game()
{
	update();
	waitForVBlank();
	draw();
}

void pause() 
{
	if(BUTTON_PRESSED(BUTTON_START)) {
		fillScreen(BLACK);
		state = GAMESCREEN;
	} else if (BUTTON_PRESSED(BUTTON_SELECT)) {
		fillScreen(GREEN);
		state = STARTSCREEN;
	}
}

void win() 
{
	if(BUTTON_PRESSED(BUTTON_START)) {
		fillScreen(BLACK);
		//drawBackgroundImage3(gameoverBitmap);
		state = STARTSCREEN;
	}
}

void lose()
{
	if(BUTTON_PRESSED(BUTTON_START)) {
		//fillScreen(GREEN);
		drawBackgroundImage3(openbgBitmap);
		state = STARTSCREEN;
	}
}


void initialize()
{
	REG_DISPCTL = MODE3 | BG2_ENABLE;
	state = STARTSCREEN;
	drawBackgroundImage3(openbgBitmap);
	//fillScreen(GREEN);
}

void initializeGame()
{
	drawRect(0, 0, SCREENHEIGHT, SCREENWIDTH, BLACK);

	player.oldRow = 0;
	player.oldCol = 0;
	player.width = 20;
	player.height = 5;
	player.row = SCREENHEIGHT - player.height;
	player.col = SCREENWIDTH/2 - player.width/2;
	player.color = LIGHTBLUE;
	player.dead = 0;

	BLOCK block1;
	block1.row = 0;
	block1.col = 60;
	block1.oldRow = 0;
	block1.oldCol = 0;
	block1.height = 5;
	block1.width = 10;
	block1.active = 1;
	block1.color = YELLOW;
	numblocks = (sizeof(blocksRow)/sizeof(blocksRow[0]));
	blocksRow[0]= block1;

	for(int i = 1; i < numblocks; i++)
	{
		BLOCK block1 = blocksRow[i-1];
		block1.col = blocksRow[i-1].col + 11;
		blocksRow[i] = block1;
	}

	BLOCK block2;
	block2.row = 6;
	block2.col = 60;
	block2.oldRow = 0;
	block2.oldCol = 0;
	block2.height = 5;
	block2.width = 10;
	block2.active = 1;
	block2.color = GREEN;
	numblocks2 = (sizeof(blocksRow2)/sizeof(blocksRow2[0]));
	blocksRow2[0] = block2;

	for(int i = 1; i < numblocks2; i++)
	{
		BLOCK block2 = blocksRow2[i-1];
		block2.col = blocksRow2[i-1].col + 11;
		blocksRow2[i] = block2;
	}

	ball.row = 60;
	ball.col = 30;
	ball.oldRow = 0;
	ball.oldCol = 0;
	ball.size = 5;

	int dels[ ] = {-1, 1};
	int numdels = sizeof(dels)/sizeof(dels[0]);
	ball.rd = dels[rand()%numdels];
	ball.cd = dels[rand()%numdels];

	deadBlocks = 0;
	score = 0;
	oldscore = 0;
}


void update()
{
	if(BUTTON_PRESSED(BUTTON_A)) {
		state = PAUSESCREEN;
	} else {
		updatePlayer(&player);
		erasePlayer(&player);
		drawPlayer(&player);
		drawBall(&ball, &player);
		drawString(150, 5, "SCORE: ", RED);
	}
}

void updatePlayer(PLAYER* p)
{
	//Update old vars for player
	p->oldRow = p->row;
	p->oldCol = p->col;

	//LEFT button moves player left, RIGHT button moves player right
	if(BUTTON_HELD(BUTTON_LEFT)) {
		if(p->col > 0) {
			p->col = p->col - 2;
		}
	}

	if(BUTTON_HELD(BUTTON_RIGHT)) {
		int tmp = p->col + p->width + 1;
		if(tmp < SCREENWIDTH) {
			p->col = p->col + 2;
		}
	}
}

void draw()
{
	//Erasing the Blocks from Yellow Row
	for(int i = 0; i < numblocks; i++)
	{
		BLOCK * b = &blocksRow[i];
		blockCollision(b, &ball);
		if(!b->active) {
			eraseBlock(b);
		}
	}

	//Erasing blocks from Green Row
	for(int i = 0; i < numblocks2; i++)
	{
		BLOCK * b = &blocksRow2[i];
		blockCollision(b, &ball);
		if (!b->active) {
			eraseBlock(b);
		}
	}


	if(deadBlocks == (numblocks)) {
		state = WINSCREEN;
	} else {
		//draw the Yellow blocks
		for(int i = 0; i < numblocks; i++) {
			BLOCK * b = &blocksRow[i];
			if(b->active) {
				drawBlock(b);
			}
		}
		//draw the green blocks
		for(int i = 0; i < numblocks2; i++)
		{
			BLOCK * b = &blocksRow2[i];
			if(b->active){
				drawBlock(b);
			}

		}
	}

	switch(state) {
		case PAUSESCREEN:
			fillScreen(RED);
			drawString(10, 5, "GAME IS PAUSED", WHITE);
			drawString(20, 5, "PRESS START (ENTER) TO CONTINUE..", WHITE);
			break;
		case WINSCREEN:
			fillScreen(BLACK);
			drawString(10, 5, "YOU WIN! :D", GREEN);
			drawString(20, 5, "PRESS START (ENTER) TO PLAY AGAIN..", GREEN);
			break;
		case LOSESCREEN:
			//fillScreen(BLACK);
			drawBackgroundImage3(gameoverBitmap);
			drawString(10, 5, "YOU LOST! :(", RED);
			drawString(20, 5, "PRESS START (ENTER) TO PLAY AGAIN..", RED);
			break;
	}
}

//draws the moving ball
void drawBall(BALL* b, PLAYER* p)
{
	b->oldRow = b->row;
	b->oldCol = b->col;
	b->row += b->rd;
	b->col += b->cd;

	//Check for wall collisions
	// if ball hits top of screen, change direction of ball
	if(b->row < 0)
	{
		b->row = 0;
		b->rd = -b->rd;
	}

	//When ball hits bottom of screen, end the game
	if(b->row > 159 - b->size + 1)
	{
		p->dead = 1;
		state = LOSESCREEN;
	}

	//if ball goes left of screen, change direction of ball
	if(b->col < 0)
	{
		b->col = 0;
		b->cd = -b->cd;
	}

	//if ball goes right of screen, change direction of ball
	if(b->col > 239 - b->size + 1)
	{
		b->col = 239 - b->size + 1;
		b->cd = -b->cd;
	}

	// Collision with player
	for(int i = p->col; i < (p->col + p->width); i++) {
		if(b->col == i) {
			if(b->row == p->row - 3) {
				b->rd = -b->rd;
			}
		}
	}

	if(!p->dead) {
		drawRect(b->oldRow, b->oldCol, b->size, b->size, BLACK);
		drawRect(b->row, b->col, b->size, b->size, WHITE);
	}

}

void blockCollision(BLOCK* block, BALL* ball) 
{
	oldscore = score;

	if(ball->row < 34) {
		//bottom collision
		if((ball->row == block->row + block->height) && (ball->col >= block->col && ball->col <= block->col + block->width)) {
			block->active = 0;
			deadBlocks++;
			score++;
			ball->rd = -ball->rd;
		//right collision
		} else if ((ball->col == block->col) && (ball->row >= block->row && ball->row <= block->row + block->height)) {
			block->active = 0;
			deadBlocks++;
			score++;
			ball->cd = -ball->cd;
		//top collision
		} else if ((ball->row + ball->size == block->row) && (ball->col >= block->col && ball->col <= block->col + block->width)) {
			block->active = 0;
			deadBlocks++;
			score++;
			ball->rd = -ball->rd;
		//left collision
		} else if ((ball->col + ball->size == block->col) &&(ball->row >= block->row && ball->row <= block->row + block->height)) {
			block->active = 0;
			deadBlocks++;
			score++;
			ball->cd = -ball->cd;
		}

		if(!block->active) {
			sprintf(buffer, "%d", score);
			drawString(150, 47, oldBuffer, BLACK);
			drawString(150, 47, buffer, RED);
		}
	}
}

void erasePlayer(PLAYER* p)
{
	drawRect(p->oldRow, p->oldCol, p->height, p->width, BLACK);
}

void drawPlayer(PLAYER* p)
{
	drawRect(p->row, p->col, p->height, p->width, p->color);
	drawImage3(paddleBitmap, p->row, p->col, p->height, p->width);
}

void drawBlock(BLOCK* b)
{
	if(b->active){
		drawRect(b->row, b->col, b->height, b->width, b->color);
	}
}

void eraseBlock(BLOCK* b)
{
	if(!b->active) {
		drawRect(b->row, b->col, b->height, b->width, BLACK);
	}
}





















