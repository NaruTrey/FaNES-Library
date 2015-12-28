typedef unsigned char uchar;
typedef unsigned int uint;

#define TRUE    1
#define FALSE   0
#define NULL    0

#define MSB(x)  (x >> 8)
#define LSB(x)  (x & 0xFF)

#define UPDATE_NAMETABLE_HORIZONTAL     0x40
#define UPDATE_NAMETABLE_VERTICAL       0x80
#define UPDATE_NAMETABLE_END            0xFF

#define NAMETABLE_A     0x2000
#define NAMETABLE_B     0x2400
#define NAMETABLE_C     0x2800
#define NAMETABLE_D     0x2c00

#define ACTIVE_NAMETABLE_A      0
#define ACTIVE_NAMETABLE_B      1
#define ACTIVE_NAMETABLE_C      2
#define ACTIVE_NAMETABLE_D      3

#define PAD_PORT_PLAYER_1   0
#define PAD_PORT_PLAYER_2   1
#define PAD_BUTTON_A        0x01
#define PAD_BUTTON_B        0x02
#define PAD_BUTTON_SELECT   0x04
#define PAD_BUTTON_START    0x08
#define PAD_BUTTON_UP       0x10
#define PAD_BUTTON_DOWN     0x20
#define PAD_BUTTON_LEFT     0x40
#define PAD_BUTTON_RIGHT    0x80

#define PALETTE_BACKGROUND_1    0
#define PALETTE_BACKGROUND_2    0x04
#define PALETTE_BACKGROUND_3    0x08
#define PALETTE_BACKGROUND_4    0x0B
#define PALETTE_SPRITE_1        0x10
#define PALETTE_SPRITE_2        0x14
#define PALETTE_SPRITE_3        0x18
#define PALETTE_SPRITE_4        0x1B

#define METASPRITE_END  128

#define NAMETABLE_A_POSITION(x, y)  (0x2000 | ((y << 5) | x))
#define NAMETABLE_B_POSITION(x, y)  (0x2400 | ((y << 5) | x))
#define NAMETABLE_C_POSITION(x, y)  (0x2800 | ((y << 5) | x))
#define NAMETABLE_D_POSITION(x, y)  (0x2C00 | ((y << 5) | x))

extern uchar _frameCounter;
#pragma zpsym("_frameCounter");

void __fastcall__ setFunctionEventSprite0Hit(void *function);

void __fastcall__ setSpritesBank(uchar bank);

void __fastcall__ copy(void *destination, void *source, uint length);

void __fastcall__ printNametableString(uint coordinates, uchar *string);
void __fastcall__ setNametableActive(uchar nametable);
void __fastcall__ updateNametable(uchar *buffer);
void __fastcall__ unpackNametableRLE(const uchar *data, uint nametable);

uchar __fastcall__ padPool(uchar port);
uchar __fastcall__ padPush(uchar port);

void __fastcall__ setPalette(const uchar *data);
void __fastcall__ setPaletteBright(uchar level);
void __fastcall__ setPaletteBackground(const uchar *data);
void __fastcall__ setPaletteBackgroundBright(uchar level);
void __fastcall__ setPaletteColor(uchar index, uchar color);
void __fastcall__ setPaletteSprites(const uchar *data);
void __fastcall__ setPaletteSpritesBright(uchar level);

uchar __fastcall__ getRandomUchar(void);

void __fastcall__ setBackgroundScroll(uchar x, uchar y);
void __fastcall__ setBackgroundScrollX(uchar x);
void __fastcall__ setBackgroundScrollY(uchar y);
void __fastcall__ setBackgroundScrollI(uint x, uint y);
void __fastcall__ setBackgroundScrollIX(uint x);
void __fastcall__ setBackgroundScrollIY(uint y);
void __fastcall__ setBackgroundScrollForce(uchar x, uchar y);
void __fastcall__ setBackgroundScrollForceI(uint x, uint y);
void __fastcall__ setBackgroundScrollEventSprite0Hit(uchar x, uchar y);
void __fastcall__ setBackgroundScrollEventSprite0HitI(uint x, uint y);

uchar __fastcall__ newSprite(uchar x, uchar y, uchar charaster, uchar attributes, uchar spriteID);
uchar __fastcall__ setSpritePosition(uchar x, uchar y, uchar spriteID);

uchar __fastcall__ newMetasprite(uchar x, uchar y, uchar spriteID, const uchar *data);
uchar __fastcall__ setMetaspritePosition(uchar x, uchar y, uchar spriteID, const uchar *data);

void __fastcall__ offGraphics(void);
void __fastcall__ onGraphics(void);

void __fastcall__ waitFrame(void);
