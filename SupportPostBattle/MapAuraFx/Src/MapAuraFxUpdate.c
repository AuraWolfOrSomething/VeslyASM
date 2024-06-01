#include "MapAuraFxUpdate.h"

enum {
	// Constants

	FX_TILE_ROOT = 0x280,
	FX_PALETTE_ROOT = 5,
};

struct MapAuraFxProc
{
	PROC_HEADER;

	/* 2C */ unsigned blend;
	/* 30 */ int vSpeed;
	/* 32 */ int elapsedTime;
};

static void MapAuraFx_OnInit(struct MapAuraFxProc* proc);
static void MapAuraFx_OnLoop(struct MapAuraFxProc* proc);
static void MapAuraFx_OnEnd(struct MapAuraFxProc* proc);

static const struct ProcInstruction sProc_MapAuraFx[] = {
	PROC_SET_NAME("Map Aura Fx"),

	PROC_SET_DESTRUCTOR(MapAuraFx_OnEnd),
	PROC_CALL_ROUTINE(MapAuraFx_OnInit),

	PROC_LOOP_ROUTINE(MapAuraFx_OnLoop),
	PROC_YIELD,

	PROC_END
};

struct MapAuraFxUnitProc
{
	PROC_HEADER;

	/* 2C */ struct Unit* pUnit;
};

static void MapAuraFx_Unit_OnInit(struct MapAuraFxUnitProc* proc);
static void MapAuraFx_Unit_OnLoop(struct MapAuraFxUnitProc* proc);
static void MapAuraFx_Unit_OnEnd(struct MapAuraFxUnitProc* proc);

static const struct ProcInstruction sProc_MapAuraFx_Unit[] = {
	PROC_SET_NAME("Map Aura Fx Unit"),

	PROC_SLEEP(0),

	PROC_CALL_ROUTINE(MapAuraFx_Unit_OnInit),
	PROC_SET_DESTRUCTOR(MapAuraFx_Unit_OnEnd),

	PROC_LOOP_ROUTINE(MapAuraFx_Unit_OnLoop),

	PROC_END
};

static void UnpackGraphics(void)
{
	static const void* const gfx = (const void* const) (0x08A032AC);
	static const u16*  const pal = (const u16*  const) (0x08A03334);
	static const u16*  const tsa = (const u16*  const) (0x08A03354);

	static const unsigned TILEMAP_BASE = (FX_PALETTE_ROOT << 12) | FX_TILE_ROOT;

	Decompress(gfx, (void*) (VRAM + FX_TILE_ROOT * 0x20));
	CopyToPaletteBuffer(pal, FX_PALETTE_ROOT * 0x20, 0x20);

	BgMap_ApplyTsa(gBg2MapBuffer, tsa, TILEMAP_BASE);

	// This is probably not the most efficient way of doing this but whatever

	for (unsigned ix = 1; ix < 16; ++ix)
		BgMapCopyRect(gBg2MapBuffer, BG_LOCATED_TILE(gBg2MapBuffer, ix*2, 0), 2, 4);

	for (unsigned iy = 1; iy < 8; ++iy)
		BgMapCopyRect(gBg2MapBuffer, BG_LOCATED_TILE(gBg2MapBuffer, 0, iy*4), 32, 4);

    EnablePaletteSync();
	EnableBgSyncByIndex(2);
}

static void InitSpecialEffects(void)
{
    //DISPCNT works when 00 9F. This code should do exactly that.
	gLCDIOBuffer.dispControl.enableWin0 = FALSE;
	gLCDIOBuffer.dispControl.enableWin1 = FALSE;
	gLCDIOBuffer.dispControl.enableObjWin = TRUE;

    //idk the exact values for WININ tbh but this works
    //3C 20 works
    gLCDIOBuffer.winControl.win0_enableBg0 = FALSE;
    gLCDIOBuffer.winControl.win0_enableBg1 = FALSE;
    gLCDIOBuffer.winControl.win0_enableBg2 = TRUE;
    gLCDIOBuffer.winControl.win0_enableBg3 = TRUE;
    gLCDIOBuffer.winControl.win0_enableObj = TRUE;
    gLCDIOBuffer.winControl.win0_enableBlend = TRUE;

    gLCDIOBuffer.winControl.win1_enableBg0 = FALSE;
    gLCDIOBuffer.winControl.win1_enableBg1 = FALSE;
    gLCDIOBuffer.winControl.win1_enableBg2 = FALSE;
    gLCDIOBuffer.winControl.win1_enableBg3 = FALSE;
    gLCDIOBuffer.winControl.win1_enableObj = FALSE;
    gLCDIOBuffer.winControl.win1_enableBlend = TRUE;

    //WINOUT must be configured this way
    //1B 3F
	gLCDIOBuffer.winControl.wout_enableBg0 = TRUE;
	gLCDIOBuffer.winControl.wout_enableBg1 = TRUE;
	gLCDIOBuffer.winControl.wout_enableBg2 = FALSE;
	gLCDIOBuffer.winControl.wout_enableBg3 = TRUE;
	gLCDIOBuffer.winControl.wout_enableObj = TRUE;
	gLCDIOBuffer.winControl.wout_enableBlend = FALSE;

	gLCDIOBuffer.winControl.wobj_enableBg0 = TRUE;
	gLCDIOBuffer.winControl.wobj_enableBg1 = TRUE;
	gLCDIOBuffer.winControl.wobj_enableBg2 = TRUE;
	gLCDIOBuffer.winControl.wobj_enableBg3 = TRUE;
	gLCDIOBuffer.winControl.wobj_enableObj = TRUE;
	gLCDIOBuffer.winControl.wobj_enableBlend = TRUE;

    //bgControl[2] = 00 0E 00 00
	gLCDIOBuffer.bgControl[2].priority = 0;
    gLCDIOBuffer.bgControl[2].tileBaseBlock = 0;
    
    //BLDCNT 44 30 00 00
    //blendCoeffA = 10; B = 10
	SetColorEffectsFirstTarget(FALSE, FALSE, TRUE,  FALSE, FALSE);
	SetColorEffectsSecondTarget(FALSE, FALSE, FALSE, FALSE, TRUE);
}

static void MapAuraFx_OnInit(struct MapAuraFxProc* proc)
{
	UnpackGraphics();
	InitSpecialEffects();

	proc->vSpeed = 8;
	proc->blend  = 4;
	proc->elapsedTime  = 0;

	// Calling this once to perhaps avoid flickering?
	// (I didn't notice any flickering without it but just in case)
	MapAuraFx_OnLoop(proc);
	proc->elapsedTime  = 0;
}

static void MapAuraFx_OnLoop(struct MapAuraFxProc* proc)
{
    proc->elapsedTime++;
    if(proc->elapsedTime > 32) {BreakProcLoop(proc);}
    unsigned newBlend = proc->blend + 1;
    if(newBlend >= 16) {newBlend = (32 - newBlend);}
    else if(newBlend < 8) {newBlend = proc->blend + 2;}
    else {newBlend = 16;}
    proc->blend = newBlend;
	SetBgPosition(2, 0, (proc->vSpeed * GetGameClock() / 32) % 32);
	SetColorEffectsParameters(1, proc->blend, 16, 0);
}

static void MapAuraFx_OnEnd(struct MapAuraFxProc* proc)
{
	gLCDIOBuffer.dispControl.enableWin0 = FALSE;
	gLCDIOBuffer.dispControl.enableWin1 = FALSE;
	gLCDIOBuffer.dispControl.enableObjWin = FALSE;

	FillBgMap(gBg2MapBuffer, 0);
	EnableBgSyncByIndex(2);
    EndEachProc(sProc_MapAuraFx_Unit);
}

static void MapAuraFx_Unit_OnInit(struct MapAuraFxUnitProc* proc)
{
	// Hide SMS, as we are going to display it manually
	HideUnitSMS(proc->pUnit);

	// Display it once
	MapAuraFx_Unit_OnLoop(proc);
}

static void MapAuraFx_Unit_OnLoop(struct MapAuraFxUnitProc* proc)
{
	// TODO: add to libgbafe
	static const void(*SMS_DisplayWindowBlended)(int, int, int, int, struct Unit*)
		= (void(*)(int node, int x, int y, int info, struct Unit* unit))(0x08028014+1);

	// Display semi-transparent map sprite + obj window map sprite

	SMS_DisplayWindowBlended(
		11,
		proc->pUnit->xPos * 16 - gGameState.cameraRealPos.x,
		proc->pUnit->yPos * 16 - gGameState.cameraRealPos.y,
		(proc->pUnit->pMapSpriteHandle->oam2Base &~ 0x3FF) | (2 << 10), // priority 2
		proc->pUnit
	);
}

static void MapAuraFx_Unit_OnEnd(struct MapAuraFxUnitProc* proc)
{
	// Restore SMS
	ShowUnitSMS(proc->pUnit);
}

/*
 * ====================
 * = PUBLIC FUNCTIONS =
 * ====================
 */

void StartMapAuraFx(void)
{
	ProcStart(sProc_MapAuraFx, ROOT_PROC_3);
}

void EndMapAuraFx(void)
{
	EndEachProc(sProc_MapAuraFx);
}

int IsMapAuraFxActive(void)
{
	return ProcFind(sProc_MapAuraFx) ? TRUE : FALSE;
}

void SetMapAuraFxSpeed(int speed)
{
	struct MapAuraFxProc* proc = (struct MapAuraFxProc*) ProcFind(sProc_MapAuraFx);

	if (proc)
	{
		proc->vSpeed = speed;
	}
}

void SetMapAuraFxBlend(unsigned blend)
{
	struct MapAuraFxProc* proc = (struct MapAuraFxProc*) ProcFind(sProc_MapAuraFx);

	if (proc)
	{
		proc->blend = blend;
	}
}

void SetMapAuraFxPalette(const u16 palette[])
{
	struct MapAuraFxProc* proc = (struct MapAuraFxProc*) ProcFind(sProc_MapAuraFx);

	if (proc)
	{
		CopyToPaletteBuffer(palette, FX_PALETTE_ROOT * 0x20, 0x20);
        EnablePaletteSync();
	}
}

void AddMapAuraFxUnit(struct Unit* unit)
{
	if (UNIT_IS_VALID(unit) && unit->pMapSpriteHandle)
	{
		struct MapAuraFxProc* parent = ProcFind(sProc_MapAuraFx);

		if (parent)
		{
			struct MapAuraFxUnitProc* unitProc =
				(struct MapAuraFxUnitProc*) ProcStart(sProc_MapAuraFx_Unit, parent);

			unitProc->pUnit = unit;
			parent->elapsedTime  = 0;
		}
	}
}

#if MAP_AURA_FX_EXAMPLE

// A trivial example
// Use as menu command switch in/out callbacks

int CommandSwitchIn(void)
{
	StartMapAuraFx();

	for (unsigned i = 1; i < 10; ++i)
	{
		AddMapAuraFxUnit(GetUnit(i));
	}

	return ME_NONE;
}

int CommandSwitchOut(void)
{
	EndMapAuraFx();

	return ME_NONE;
}

#endif

