
//{{BLOCK(land)

//======================================================================
//
//	land, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 164 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 5248 + 4096 = 9856
//
//	Time-stamp: 2016-12-06, 17:25:33
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LAND_H
#define GRIT_LAND_H

#define landTilesLen 5248
extern const unsigned short landTiles[2624];

#define landMapLen 4096
extern const unsigned short landMap[2048];

#define landPalLen 512
extern const unsigned short landPal[256];

#endif // GRIT_LAND_H

//}}BLOCK(land)
