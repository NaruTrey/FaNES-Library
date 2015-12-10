typedef unsigned char uchar;
typedef unsigned int uint;

#define TRUE 	1
#define FALSE 	0
#define NULL	0

#define MSB(x)  (x >> 8)
#define LSB(x)  (x & 0xFF)


void fastcall setSpritesBank(uchar bank);

void fastcall copy(void *destination, void *source, uint length);

#define UPDATE_NAMETABLE_HORIZONTAL		0x40
#define UPDATE_NAMETABLE_VERTICAL		0x80
#define UPDATE_NAMETABLE_END		    0xFF

void fastcall updateNametable(uchar *buffer);

#define PAD_PORT_PLAYER_1   0
#define PAD_PORT_PLAYER_2	1
#define PAD_BUTTON_A		0x01
#define PAD_BUTTON_B		0x02
#define PAD_BUTTON_SELECT	0x04
#define PAD_BUTTON_START	0x08
#define PAD_BUTTON_UP		0x10
#define PAD_BUTTON_DOWN		0x20
#define PAD_BUTTON_LEFT		0x40
#define PAD_BUTTON_RIGHT	0x80

uchar fastcall padPool(uchar port);

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

#define METASPRITE_END  128

uchar fastcall newMetasprite(uchar x, uchar y, uchar spriteID, const uchar *data);
uchar fastcall setMetaspritePosition(uchar x, uchar y, uchar spriteID, const uchar *data);

void fastcall onGraphics(void);

extern uchar _frameCounter;
#pragma zpsym("_frameCounter");

void fastcall waitFrame(void);

#define NAMETABLE_A_POSITION(x, y) 	(0x2000 | ((y << 5) | x))
#define NAMETABLE_B_POSITION(x, y) 	(0x2400 | ((y << 5) | x))
#define NAMETABLE_C_POSITION(x, y) 	(0x2800 | ((y << 5) | x))
#define NAMETABLE_D_POSITION(x, y) 	(0x2C00 | ((y << 5) | x))

void fastcall printNametableString(uint coordinates, uchar *string);
