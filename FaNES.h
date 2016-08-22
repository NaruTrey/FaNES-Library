typedef unsigned char uchar;
typedef unsigned int uint;

#define TRUE    1
#define FALSE   0
#define NULL    0

#define MSB(x)  (x >> 8)
#define LSB(x)  (x & 0xFF)

#define NAMETABLE_UPDATE_HORIZONTAL     0x40
#define NAMETABLE_UPDATE_VERTICAL       0x80
#define NAMETABLE_UPDATE_END            0xFF

#define NAMETABLE_A     0x2000
#define NAMETABLE_B     0x2400
#define NAMETABLE_C     0x2800
#define NAMETABLE_D     0x2c00

#define NAMETABLE_ACTIVE_A      0
#define NAMETABLE_ACTIVE_B      1
#define NAMETABLE_ACTIVE_C      2
#define NAMETABLE_ACTIVE_D      3

#define PAD_PORT_1          0
#define PAD_PORT_2          1

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

#define NAMETABLE_A_POSITION(x, y)  (NAMETABLE_A | ((y << 5) | x))
#define NAMETABLE_B_POSITION(x, y)  (NAMETABLE_B | ((y << 5) | x))
#define NAMETABLE_C_POSITION(x, y)  (NAMETABLE_C | ((y << 5) | x))
#define NAMETABLE_D_POSITION(x, y)  (NAMETABLE_D | ((y << 5) | x))

#define SPRITES_BANK_A      0
#define SPRITES_BANK_B      8
#define BACKGROUND_BANK_A   0
#define BACKGROUND_BANK_B   16

#define SPRITES_SIZE_8x8     0
#define SPRITES_SIZE_8x16    32

extern uchar _frameCounter;
#pragma zpsym("_frameCounter");

void __fastcall__ setFunctionEventSprite0Hit(void *function);

void __fastcall__ setBankBackground(uchar bank);
void __fastcall__ setBankSprites(uchar bank);

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

void __fastcall__ startDebugTimer0(void);
void __fastcall__ startDebugTimer1(void);
void __fastcall__ startDebugTimer2(void);
void __fastcall__ startDebugTimer3(void);
void __fastcall__ startDebugTimer4(void);
void __fastcall__ startDebugTimer5(void);
void __fastcall__ startDebugTimer6(void);
void __fastcall__ startDebugTimer7(void);
void __fastcall__ startDebugTimer8(void);
void __fastcall__ startDebugTimer9(void);
void __fastcall__ startDebugTimerA(void);
void __fastcall__ startDebugTimerB(void);
void __fastcall__ startDebugTimerC(void);
void __fastcall__ startDebugTimerD(void);
void __fastcall__ startDebugTimerE(void);
void __fastcall__ startDebugTimerF(void);
void __fastcall__ stopDebugTimer0(void);
void __fastcall__ stopDebugTimer1(void);
void __fastcall__ stopDebugTimer2(void);
void __fastcall__ stopDebugTimer3(void);
void __fastcall__ stopDebugTimer4(void);
void __fastcall__ stopDebugTimer5(void);
void __fastcall__ stopDebugTimer6(void);
void __fastcall__ stopDebugTimer7(void);
void __fastcall__ stopDebugTimer8(void);
void __fastcall__ stopDebugTimer9(void);
void __fastcall__ stopDebugTimerA(void);
void __fastcall__ stopDebugTimerB(void);
void __fastcall__ stopDebugTimerC(void);
void __fastcall__ stopDebugTimerD(void);
void __fastcall__ stopDebugTimerE(void);
void __fastcall__ stopDebugTimerF(void);

uchar __fastcall__ newSprite(uchar x, uchar y, uchar character, uchar attributes, uchar spriteID);
uchar __fastcall__ setSpritePosition(uchar x, uchar y, uchar spriteID);

void __fastcall__ setSpritesSize(uchar size);

uchar __fastcall__ newMetasprite(uchar x, uchar y, uchar spriteID, const uchar *data);
uchar __fastcall__ setMetaspritePosition(uchar x, uchar y, uchar spriteID, const uchar *data);

void __fastcall__ offGraphics(void);
void __fastcall__ onGraphics(void);

void __fastcall__ waitFrame(void);
