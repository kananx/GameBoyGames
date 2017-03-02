#include <stdio.h>
#include <stdlib.h>
#include "myLib.h"
#include "spritesample2.h"
#include "win.h"
#include "start.h"
#include "land.h"
#include "sky.h"
#include "lose.h"
#include "EnemySlain.h"
#include "LoginScreenLoop.h"
#include "Victory.h"
#include "Defeat.h"
#include "gamemusic.h"
#include "pause.h"
#include "instruction.h"

/* GAMEPLAY DESCRIPTION */
// This game is similar to League of Legends but not rly.  
// There are two players (you & the enemy).
// You have a Tower and the enemy has a Tower.
// The objective is to kill the enemy's tower (must kill enemy to kill tower) to win the game.
// The enemy shoots randomly and can kill you.
// If the enemy kills your tower before you kill the enemy's tower, you lose (even if you're not dead).
//
//EXTRA CREDIT:
// I animated all my sprites
// Some original artwork
// Paralax background added
// 

/*players*/
PLAYER player;

/*enemies*/
//PLAYER enemies[10];
PLAYER enemy;
//int enemyCount;

/*towers*/
TOWER ptower;
TOWER etower;
TOWER etower2;


BULLET bullets[10];
BULLET bullet;
int bulletCount;

BULLET ebullets[10];
BULLET ebullet;
int ebulletCount;

int time;
int nextBulletSpawn = 32;


char oldBuffer[41];
char buffer[41];

OBJ_ATTR shadowOAM[128];

#define ROWMASK 0xFF
#define COLMASK 0x1FF

int state;
unsigned int oldButtons;
unsigned int buttons;

int hOff = 0;
int hOff2 = 0;
int vOff = 0;

void update();
void initialize();
void initGame();
void initPlayer();
void initEnemy();
void initPTower();
void initETower();
void initBullets();
void initEBullets();
void movePlayer();
void start();
void lose();
void pause();
void win();
void game();
void goToGame();
void goToStart();
void goToPause();
void goToLose();
void goToWin();
void hideSprites();
void hideSprites2();
void updateOAM();
void updateBullets();
void updateEBullets();
void bulletCollision();
void ebulletCollison();
void updateBulletOAM();
void updateEBulletOAM();
void shoot();
void eshoot();
void animations();
void activateCheat();
void instruction();
void goToInstruction();

/*SOUND STUFF*/

typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
}SOUND;

SOUND soundA;
SOUND soundB;

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);
void muteSound();
void unmuteSound();
void stopSound();

void setupInterrupts();
void interruptHandler();


//states
enum {STARTSCREEN, GAMESCREEN, WINSCREEN, LOSESCREEN, PAUSESCREEN, INSTRUCTION };
enum {LEFT, RIGHT};

int main()
{
	setupSounds();
	setupInterrupts();
	
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
			case INSTRUCTION:
				instruction();
		}

		waitForVblank();
	}
	return 0;
}


void start()
{

	if(BUTTON_PRESSED(BUTTON_START)) {
		goToGame();
		initGame();
	}

	if(BUTTON_PRESSED(BUTTON_A)) {
		goToInstruction();
	}
}

void goToInstruction()
{
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(27) | COLOR256;

	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);

	REG_BG0HOFS = 0;
	REG_BG0VOFS = 0;

	loadPalette(instructionPal);
	DMANow(3, instructionTiles, &CHARBLOCKBASE[0], instructionTilesLen/2);
	DMANow(3, instructionMap, &SCREENBLOCKBASE[27], instructionMapLen/2);
	state = INSTRUCTION;

}

void instruction()
{
	if(BUTTON_PRESSED(BUTTON_START))
	{
		goToGame();
		initGame();
	}

	if(BUTTON_PRESSED(BUTTON_A))
	{
		goToStart();
	}
}

void goToGame()
{
	stopSound();
	playSoundA(gamemusic, GAMEMUSICLEN, GAMEMUSICFREQ, 1);
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

	REG_BG0CNT = BG_SIZE1 | CBB(0) | SBB(28);
	REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(25);

	loadPalette(landPal);
	DMANow(3, landTiles, &CHARBLOCKBASE[0], landTilesLen/2);
	DMANow(3, landMap, &SCREENBLOCKBASE[28], landMapLen/2);

	DMANow(3, skyTiles, &CHARBLOCKBASE[1], skyTilesLen/2);
	DMANow(3, skyMap, &SCREENBLOCKBASE[25], skyMapLen/2);
	//loadMap(skyMap, skyMapLen, 1, 27);

	hideSprites();

	DMANow(3, spritesample2Tiles, &CHARBLOCKBASE[4], spritesample2TilesLen/2);
    DMANow(3, spritesample2Pal, SPRITE_PALETTE, spritesample2PalLen/2);

	state = GAMESCREEN;
}

void goToPause()
{
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(27) | COLOR256;

	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);

	REG_BG0HOFS = 0;
	REG_BG0VOFS = 0;

	loadPalette(pausePal);
	DMANow(3, pauseTiles, &CHARBLOCKBASE[0], pauseTilesLen/2);
	DMANow(3, pauseMap, &SCREENBLOCKBASE[27], pauseMapLen/2);
	state = PAUSESCREEN;
}

void game()
{
	//code game logic here

	movePlayer();
	animations();

	if(BUTTON_PRESSED(BUTTON_A))
	{
		for (int i = 0; i < bulletCount; i++){

			BULLET* b = &bullets[i];
			if (!b->active) {
				shoot(b);
				break;
			}
		}
	}

	for (int i = 0; i < bulletCount; i++) {
		BULLET* b = &bullets[i];
		updateBullets(b);
	}

	if (!enemy.dead) {
		if(!(++time % nextBulletSpawn))
		{
			for(int i = 0; i < ebulletCount; i++)
			{
				BULLET* b = &ebullets[i];
				if(!b->active) {
					eshoot(b);
					break;
				}
			}
			nextBulletSpawn = rand()%25 + 200;
		}
	}

	for(int i = 0; i < ebulletCount; i++)
	{
		BULLET* b = &ebullets[i];
		updateEBullets(b);
	}

	etower2.col = etower2.bigCol - hOff;

	updateOAM();
	DMANow(3, shadowOAM, OAM, 128*4);

	if(BUTTON_PRESSED(BUTTON_R))
	{
		goToPause();
	}

	if(player.dead || ptower.dead)
	{
		goToLose();
	}

	if(etower.dead && etower2.dead) 
	{
		goToWin();
	}

	if(BUTTON_PRESSED(BUTTON_B))
	{
		activateCheat();
	}
}

void pause()  
{
	
	//REG_DISPCTL = MODE3 | BG2_ENABLE;
	//fillScreen3(BLUE);

	if(BUTTON_PRESSED(BUTTON_R)) {
		goToGame();

	} 
}

void win() 
{
	if(BUTTON_PRESSED(BUTTON_START)) {
		goToStart();
	}
}

void goToWin()
{
	playSoundB(Victory, VICTORYLEN, VICTORYFREQ, 0);
	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE0 | COLOR256;
	
	hOff = 0;
	vOff = 0;
	REG_BG0HOFS = hOff;
	REG_BG0VOFS = vOff;

	loadPalette(winPal);
	DMANow(3, winTiles, &CHARBLOCKBASE[0], winTilesLen/2);
	DMANow(3, winMap, &SCREENBLOCKBASE[27], winMapLen/2);
	
	state = WINSCREEN;

}

void goToStart()
{
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(27) | COLOR256;

	hideSprites();
	loadPalette(startPal);
	DMANow(3, startTiles, &CHARBLOCKBASE[0], startTilesLen/2);
	DMANow(3, startMap, &SCREENBLOCKBASE[27], startMapLen/2);

	playSoundA(LoginScreenLoop, LOGINSCREENLOOPLEN, LOGINSCREENLOOPFREQ, 1);

	state = STARTSCREEN;

}

void goToLose()
{
	playSoundB(Defeat, DEFEATLEN, DEFEATFREQ, 0);

	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4 );
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE0 | COLOR256;
	
	hOff = 0;
	vOff = 0;
	REG_BG0HOFS = hOff;
	REG_BG0VOFS = vOff;

	loadPalette(losePal);
	DMANow(3, loseTiles, &CHARBLOCKBASE[0], loseTilesLen/2);
	DMANow(3, loseMap, &SCREENBLOCKBASE[27], loseMapLen/2);
	
	state = WINSCREEN;
}

void lose()
{
	if(BUTTON_PRESSED(BUTTON_START)) {
		goToStart();
	}
}

void initialize()
{
	goToStart();
}

void initGame()
{
	initPlayer();
	initEnemy();
	initETower();
	initPTower();
	initBullets();
	initEBullets();

	time = 0;
	hOff = 9;
    vOff = 96;
}

void initPlayer()
{
	player.bigRow = 0;
	player.bigCol = 0;
	player.width = 16; //size of the tile 
	player.height = 16;
	player.row = 115; //SCREENHEIGHT - player.height;
	player.col = 40; //SCREENWIDTH/4 - player.width/2;
	player.color = BLUE;
	player.dead = 0;
	player.health = 300;
	player.aniCounter = 0;
	player.currFrame = 0;
	player.facing = RIGHT;

}

void initEnemy()
{
	enemy.bigRow = 212; //210;
	enemy.bigCol = 160;
	enemy.width = 16;
	enemy.height = 16;
	enemy.row = 0; //115; //SCREENHEIGHT - player.height;
	enemy.col = 0; //160; //SCREENWIDTH * 3 / 4 - player.width/2;
	enemy.color = RED;
	enemy.dead = 0;
	enemy.health = 200;
	enemy.facing = LEFT;

	// enemy.active = 0;
	// enemyCount = (sizeof(enemies)/sizeof(enemies[0]));

	// for (int i = 0; i < enemyCount; i++){
	// 	enemies[i] = enemy;
	// }

}

void initPTower()
{
	ptower.row = 60; //SCREENHEIGHT - ptower.height;;
	ptower.col = SCREENWIDTH/4 - ptower.width/2;
	ptower.bigRow = 0;
	ptower.bigCol = 0;
	ptower.height = 70;
	ptower.width = 40;
	ptower.health = 100;
	ptower.dead = 0;
}

void initETower()
{
	etower.row = 60; //SCREENHEIGHT - ptower.height;;
	etower.col = SCREENWIDTH*3/4 - ptower.width/2;
	etower.bigRow = 5 + vOff;//0;
	etower.bigCol = 220 - hOff;//0;
	etower.height = 70;
	etower.width = 40;
	etower.health = 100;
	etower.dead = 0;

	etower2.row = 60; //SCREENHEIGHT - ptower.height;;
	etower2.col = 360;
	etower2.bigRow = 5 + vOff;//0;
	etower2.bigCol = 360;//0;
	etower2.height = 70;
	etower2.width = 40;
	etower2.health = 100;
	etower2.dead = 0;


}	

void initBullets()
{
	bullet.row = player.row;
	bullet.col = player.col + player.width;
	bullet.bigRow = 0;
	bullet.bigCol = 0;
	bullet.height = 2;
	bullet.width = 4;
	bullet.rd = 0;
	bullet.cd = 1;
	bullet.active = 0;
	bulletCount = (sizeof(bullets)/sizeof(bullets[0]));

	for(int i = 0; i < bulletCount; i++){
		bullets[i] =  bullet;
	}
}

void initEBullets()
{
	ebullet.row = enemy.row;
	ebullet.col = enemy.col;
	ebullet.bigRow = 0;
	ebullet.bigCol = 0;
	ebullet.height = 2;
	ebullet.width = 4;
	ebullet.rd = 0;
	ebullet.cd = 1;
	ebullet.active = 0;
	ebulletCount = (sizeof(ebullets)/sizeof(ebullets[0]));

	for(int i = 0; i < ebulletCount; i++){
		ebullets[i] =  ebullet;
	}

}


void shoot(BULLET* b)
{
	b->active = 1;
	if (player.facing == RIGHT) {
		b->cd = 2;
		b->bigRow = player.bigRow + 5;
		b->bigCol = player.bigCol + player.width;
	} else if (player.facing == LEFT) {
		b->cd = -2;
		b->bigRow = player.bigRow + 5;
		b->bigCol = player.bigCol;
	}
}

void eshoot(BULLET* b)
{
	b->active = 1;
	b->bigRow = enemy.bigRow + 5;
	b->bigCol = enemy.bigCol;

}

void updateBullets(BULLET* b)
{

	if(b->active)
	{
		//incrementing going to the right of the screen
		b->bigCol = b->bigCol + b->cd;


		b->row = b->bigRow - vOff; //where the bullet is on the screen compared to the map
		b->col = b->bigCol - hOff;

		if((b->bigCol > 512 - b->width) || (b->bigCol < 0 + b->width))
		{
			b->active = 0; 
		}
		//if(b->col > 128) while(!BUTTON_HELD(BUTTON_UP));
		bulletCollision(b, &enemy, &etower);
		bulletCollision(b, &enemy, &etower2);

	}
	updateBulletOAM();
}

void updateEBullets(BULLET* b)
{
	if (b->active)
	{
		//incrementing going to the left of the screen
		b->bigCol = b->bigCol - 2;

		b->row = b->bigRow - vOff;	// ?!??!
		b->col = b->bigCol - hOff;

		if(b->col < 0 + b->width)
		{
			b->active = 0;
		}

		ebulletCollison(b, &player, &ptower);
	}
	updateEBulletOAM();
}


void bulletCollision(BULLET* b, PLAYER* p, TOWER* t)
{
	if(b->bigCol + b->width >= p->bigCol && !p->dead) //&& b->bigRow + b->height >= p->bigRow)
	{
	
		p->health = p->health - 50; //enemy loses health
		b->active = 0;
	} else if((b->bigCol <= p->bigCol + 16 && b->bigCol > p->bigCol) && !p->dead) {
		p->health = p->health - 50; //enemy loses health
		b->active = 0;
	}

	if(p->health == 0 && !p->dead) {
		p->dead = 1;
		playSoundB(EnemySlain, ENEMYSLAINLEN, ENEMYSLAINFREQ, 0);
		//b->active = 0;
	}

	if(b->bigCol + b->width >= t->bigCol && (b->bigCol <= t->bigCol + t->width) && !t->dead)
	{
		t->health = t->health - 25;
		b->active = 0;
	}

	if(t->health == 0 && !t->dead) {
		t->dead = 1;
	}
}

//enemy's bullets killing the player
void ebulletCollison(BULLET* b, PLAYER* p, TOWER* t)
{
	if((b->bigCol <= p->bigCol + 16 && b->bigCol > p->bigCol) && !p->dead)
	{
		p->health = p->health - 50; //player loses health
		b->active = 0;
	}

	if(p->health == 0 && !p->dead) {
		p->dead = 1;
	}

	if((b->bigCol <= t->bigCol + t->width && b->bigCol > t->bigCol) && !t->dead)
	{
		t->health = t->health - 10;
		b->active = 0;
	}

	if(t->health == 0 && !t->dead)
	{
		t->dead = 1;
	}
}


void movePlayer()
{
	//when moving left, if the player is to the right half of the screen or if the 
	if(BUTTON_HELD(BUTTON_LEFT)) {
		if((player.col > SCREENWIDTH/2 || hOff == 0) && player.col > 0) {
			player.col--;
		} else if (hOff > 0) {
			hOff--;
		}
		player.facing = LEFT;
	}

	if(BUTTON_HELD(BUTTON_RIGHT)) {
		if((player.col < SCREENWIDTH/2 || hOff == 512 - SCREENWIDTH) && player.bigCol < 512 - player.width) {
			player.col++;
		} else if (hOff < 512-SCREENWIDTH) {
			hOff++;
		}
		player.facing = RIGHT;
	}

	REG_BG0HOFS = hOff;
	REG_BG1HOFS = hOff2;
	hOff2 = hOff2 + 1;
	REG_BG0VOFS = vOff;

	player.bigRow = player.row + vOff;
	player.bigCol = player.col + hOff;

	enemy.row = enemy.bigRow - vOff;
	enemy.col = enemy.bigCol - hOff;

}

void animations()
{
	if(player.aniCounter % 20 == 0) 
	{
		// TODO change the frame here
		// remember that there are only 3 frames 
		if (player.currFrame == 0) {
			player.currFrame = 1;
		} else if (player.currFrame == 1) {
			player.currFrame = 2;
		} else if (player.currFrame == 2) {
			player.currFrame = 0;
		}
	}
	player.aniCounter = player.aniCounter + 1;
}

void activateCheat()
{
	enemy.health = 50;
	etower.health = 25;
	etower2.health = 25;
}

void updateOAM()
{
	// set up my sprites
	//player sprite
	shadowOAM[0].attr0 = (ROWMASK & player.row) | ATTR0_4BPP | ATTR0_SQUARE;
	if (player.facing == LEFT) {
		shadowOAM[0].attr1 = (COLMASK & player.col) | ATTR1_SIZE32 | ATTR1_HFLIP;
	} else {
		shadowOAM[0].attr1 = (COLMASK & player.col) | ATTR1_SIZE32;
	}
	shadowOAM[0].attr2 = SPRITEOFFSET16(player.currFrame*4,0);

	//enemy sprite
	if (enemy.dead) {
		shadowOAM[1].attr0 = ATTR0_HIDE;
	} else {
		shadowOAM[1].attr0 = (ROWMASK & enemy.row) | ATTR0_4BPP | ATTR0_SQUARE;
		if (enemy.facing == LEFT) {
			shadowOAM[1].attr1 = (COLMASK & enemy.col) | ATTR1_SIZE32 | ATTR1_HFLIP;
		} else {
			shadowOAM[1].attr1 = (COLMASK & enemy.col) | ATTR1_SIZE32;
		}
		
		shadowOAM[1].attr2 = (SPRITEOFFSET16(player.currFrame*4,4)) | PALBANK(2);
	}

	//player tower sprite
	if (ptower.dead) {
		shadowOAM[2].attr0 = ATTR0_HIDE;
	} else {
		shadowOAM[2].attr0 = (ROWMASK & (vOff - 15)) | ATTR0_4BPP | ATTR0_TALL;
		shadowOAM[2].attr1 = (COLMASK & (15 - hOff)) | ATTR1_SIZE64;
		shadowOAM[2].attr2 = (SPRITEOFFSET16(player.currFrame*8,8)) | PALBANK(1);
	}

	//enemy tower sprite
	if (etower.dead) {
		shadowOAM[3].attr0 = ATTR0_HIDE;
	} else {
		shadowOAM[3].attr0 = (ROWMASK & (vOff - 15)) | ATTR0_4BPP | ATTR0_TALL;
		shadowOAM[3].attr1 = (COLMASK & (220 - hOff)) | ATTR1_SIZE64;
		shadowOAM[3].attr2 = (SPRITEOFFSET16(player.currFrame*8,8)) | PALBANK(1);
	}

	if (etower2.dead || etower2.col > SCREENWIDTH) {
		shadowOAM[4].attr0 = ATTR0_HIDE;
	} else {
		shadowOAM[4].attr0 = (ROWMASK & (vOff - 15)) | ATTR0_4BPP | ATTR0_TALL;
		shadowOAM[4].attr1 = (COLMASK & etower2.col) | ATTR1_SIZE64;
		shadowOAM[4].attr2 = (SPRITEOFFSET16(player.currFrame*8,8)) | PALBANK(1);
	}
}

void updateBulletOAM()
{
	//bullet sprites
	for (int i = 0; i < bulletCount; i++)
	{
		if(bullets[i].active){
			shadowOAM[5 + i].attr0 = (ROWMASK & bullets[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[5 + i].attr1 = (COLMASK & (bullets[i].col)) | ATTR1_SIZE8;
			shadowOAM[5 + i].attr2 = SPRITEOFFSET16(0,12);
		} else {
			shadowOAM[5 + i].attr0 = ATTR0_HIDE;
		}
	}
}

void updateEBulletOAM()
{
	//enemy bullet sprites
	for (int i = 0; i < ebulletCount; i++)
	{
		if(ebullets[i].active){
			shadowOAM[15 + i].attr0 = (ROWMASK & ebullets[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[15 + i].attr1 = (COLMASK & (ebullets[i].col)) | ATTR1_SIZE8;
			shadowOAM[15 + i].attr2 = SPRITEOFFSET16(0,12);
		} else {
			shadowOAM[15 + i].attr0 = ATTR0_HIDE;
		}
	}
}

void hideSprites()
{
    int i;
    for(i = 0; i < 128; i++)
    {
         shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}





/*SOUND STUFF*/
void setupSounds()
{
    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_TO_BOTH | 
                     DSA_TIMER0 | 
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 | 
                     DSB_OUTPUT_TO_BOTH | 
                     DSB_TIMER1 | 
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency, int loops) {
        dma[1].cnt = 0;
	
        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
	
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
	
        REG_TM0CNT = 0;
	
        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;
	
        //TODO: FINISH THIS FUNCTION
        // Assign all the appropriate struct values
        soundA.data = sound;
        soundA.length = length;
        soundA.frequency = frequency;
        soundA.loops = loops;
        soundA.vbCount = 0;
        soundA.duration = ((VBLANK_FREQ*length)/frequency);
        soundA.isPlaying = 1;
         
}


void playSoundB( const unsigned char* sound, int length, int frequency, int loops) {

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
	
        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;
	
        // TODO: FINISH THIS FUNCTION
        // Assign all the appropriate struct values
        soundB.data = sound;
        soundB.length = length;
        soundB.frequency = frequency;
        soundB.loops = loops;
        soundB.vbCount = 0;
        soundB.duration = ((VBLANK_FREQ*length)/frequency);
        soundB.isPlaying = 1;

}

void pauseSound()
{
	// TODO: WRITE THIS FUNCTION
	soundA.isPlaying = 0;
	REG_TM0CNT = 0;
	soundB.isPlaying = 0;
	REG_TM1CNT = 0;

}

void unpauseSound()
{
	// TODO: WRITE THIS FUNCTION
	soundA.isPlaying = 1;
	REG_TM0CNT = TIMER_ON;
	soundB.isPlaying = 1;
	REG_TM1CNT = TIMER_ON;
}

void stopSound()
{
    // TODO: WRITE THIS FUNCTION
    dma[1].cnt = 0;
    soundA.isPlaying = 0;
    dma[2].cnt = 0;
    soundB.isPlaying = 0;
    REG_TM0CNT = 0;
    REG_TM1CNT = 0;

}

void setupInterrupts()
{
	REG_IME = 0;
	// TODO: SET UP THE INTERRUPT HANDLER HERE
	// HINT: THERE IS A REGISTER THAT NEEDS TO POINT TO A INTERRUPT FUNCTION
	// HINT: THAT INTERRUPT FUNCTION HAS TO BE CAST TO SOMETHING...
	REG_INTERRUPT = (unsigned int) interruptHandler;

	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}

void interruptHandler()
{
	REG_IME = 0;
	if(REG_IF & INT_VBLANK)
	{
		//TODO: FINISH THIS FUNCTION
		// This should be where you determine if a sound if finished or not
		if(soundA.isPlaying) {
			soundA.vbCount++;
			if(soundA.vbCount >= soundA.duration) {
				if(soundA.loops) {
					playSoundA(soundA.data, soundA.length, soundA.frequency, soundA.loops);
				} else {
					dma[1].cnt = 0;
					soundA.isPlaying = 0;
					REG_TM0CNT = 0;
				}
			}
		}

		if(soundB.isPlaying) {
			soundB.vbCount++;
			if(soundB.vbCount >= soundB.duration) {
				if(soundB.loops) {
					playSoundB(soundB.data, soundB.length, soundB.frequency, soundB.loops);
				} else {
					dma[2].cnt = 0;
					soundB.isPlaying = 0;
					REG_TM1CNT = 0;
				}
			}

		}

		REG_IF = INT_VBLANK; 
	}

	REG_IME = 1;
}
