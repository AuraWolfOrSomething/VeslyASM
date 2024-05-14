#ifndef GUARD_MINIMAP_H
#define GUARD_MINIMAP_H

// ??? GetMinimapConnectKindAt(???);
// ??? NormalizeSeaMinimapTerrain(???);
// ??? GetMinimapSeaKindAt(???);
// ??? NormalizeWaterMinimapTerrain(???);
// ??? GetMinimapWaterKindAt(???);
// ??? GetMinimapRiverKindAt(???);
// ??? GetMinimapCliffKindAt(???);
// ??? GetMinimapStairTileAt(???);
// ??? GetMinimapDoorTileAt(???);
// ??? GetMinimapBridgeKindAt(???);
// ??? GetMinimapTileAt(???);
// ??? GetMinimapTerrainCellAt(???);
// ??? GetMinimapObjectCellAt(???);
// ??? DrawMinimapInternal(???);
// ??? Minimap_Init(???);
// ??? Minimap_OnHBlank(???);
// ??? InitMinimapWindowBuffers(???);
// ??? Minimap_InitOpenAnim(???);
// ??? Minimap_OpenAnim(???);
// ??? Minimap_InitCloseAnim(???);
// ??? Minimap_CloseAnim(???);
// ??? ApplyMinimapGraphics(???);
// ??? InitMinimapFlashPalette(???);
// ??? Minimap_ApplyFlashPalette(???);
// ??? Minimap_ApplyViewportFlashColor(???);
// ??? Minimap_PutViewport(???);
// ??? Minimap_AdjustDisplay(???);
// ??? Minimap_HandleMoveInput(???);
// ??? Minimap_InitProcVars(???);
// ??? Minimap_AdjustCursorOnClose(???);
// ??? Minimap_Main(???);
void StartMinimapPlayerPhase(void);
void StartMinimapPrepPhase(ProcPtr proc);
// ??? DrawMinimap(???);

extern struct ProcCmd gProcScr_Minimap[];
extern u8 gGfx_MinimapTiles[];
extern u16 gPal_MinimapTiles[];
extern u16 gPal_08A1FFD0[];

#endif // GUARD_MINIMAP_H
