
//{{BLOCK(instruction)

//======================================================================
//
//	instruction, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 271 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 17344 + 2048 = 19904
//
//	Time-stamp: 2016-12-13, 22:29:22
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTION_H
#define GRIT_INSTRUCTION_H

#define instructionTilesLen 17344
extern const unsigned short instructionTiles[8672];

#define instructionMapLen 2048
extern const unsigned short instructionMap[1024];

#define instructionPalLen 512
extern const unsigned short instructionPal[256];

#endif // GRIT_INSTRUCTION_H

//}}BLOCK(instruction)
