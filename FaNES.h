typedef unsigned char uchar;
typedef unsigned int uint;

#define TRUE 	1
#define FALSE 	0
#define NULL	0

void fastcall copy(void *destination, void *source, uint length);

#define PALETTE_BACKGROUND_1    0
#define PALETTE_BACKGROUND_2    0x04
#define PALETTE_BACKGROUND_3    0x08
#define PALETTE_BACKGROUND_4    0x0B
#define PALETTE_SPRITE_1        0x10
#define PALETTE_SPRITE_2        0x14
#define PALETTE_SPRITE_3        0x18
#define PALETTE_SPRITE_4        0x1B

void fastcall setPalette(const uchar *data);
void fastcall setPaletteBackground(const uchar *data);
void fastcall setPaletteColor(uchar index, uchar color);
void fastcall setPaletteSprites(const uchar *data);

uchar fastcall newSprite(uchar x, uchar y, uchar charaster, uchar attributes, uchar spriteID);
uchar fastcall setSpritePosition(uchar x, uchar y, uchar spriteID);

void fastcall onGraphics(void);

void fastcall waitFrame(void);

#define NAMETABLE_A_POSITION(x, y) 	(0x2000 | ((y << 5) | x))
#define NAMETABLE_B_POSITION(x, y) 	(0x2400 | ((y << 5) | x))
#define NAMETABLE_C_POSITION(x, y) 	(0x2800 | ((y << 5) | x))
#define NAMETABLE_D_POSITION(x, y) 	(0x2C00 | ((y << 5) | x))

void fastcall printNametableString(uint coordinates, uchar *string);
