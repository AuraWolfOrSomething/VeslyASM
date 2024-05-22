#include "C_Code.h" // headers 

typedef struct {
    /* 00 */ PROC_HEADER;
	int timer; 
	u8 hitEarly; 
	u8 hitOnTime; 
	u8 side; 
	u8 didBonusDmg; 
} SomeProc;
void LoopSomeProc(SomeProc* proc);
const struct ProcCmd SomeProcCmd[] =
{
	PROC_NAME("SomeProcName"), 
    PROC_YIELD,
	PROC_REPEAT(LoopSomeProc), 
    PROC_END,
};

extern struct KeyStatusBuffer sKeyStatusBuffer; // 2024C78
void SomeC_Code(void) { 
	SomeProc* proc; 
	proc = Proc_Find(SomeProcCmd); 
	if (!proc) { 
	proc = Proc_Start(SomeProcCmd, (void*)3); 
	} 
	proc->side = 0xFF; 
	proc->timer = 0; 
	proc->hitEarly = false; 
	proc->hitOnTime = false; 
	proc->didBonusDmg = false;
	// load graphics into obj vram here 
	//LoadObjUIGfx(); // usually already loaded anyway 
	
	

} 

//extern u16 EkrEfxIsUnitHittedNow(int pos); // 80522f4
//extern u16 gEkrHitEfxBool; // 0x2017780  [0x2017780..0x2017783]!!
// UpdateBanimFrame occurs once at start of battle 80599e8
// ekrGaugeMain 0x8051284 is called every frame 
//gpProcEkrGauge

// ekrBattle has anim* in +0x5C, as does efxHPBarColorChange 
// efxStatusUnit exists twice and has both anim* in respective +0x5C 

const u16 sSprite_HitInput[] = {
    1,
    0x0002, 
	0x4000, 
	0x01ca // tile number 
};
const u16 sSprite_MissedInput[] = {
    1,
    0x0002, 
	0x4000, 
	0x01cc // tile number 
};
extern const int EnemiesCanDoBonusDamage; 
extern struct BattleHit* GetCurrentRound(int roundID); 
void DoStuffIfHit(SomeProc* proc, struct ProcEkrBattle* battleProc, struct ProcEfxHPBar* HpProc, struct BattleHit* round, struct Anim* anim, struct Anim* anim2, u32 keys, int x, int y, int side);
void LoopSomeProc(SomeProc* proc) { 
	proc->timer++; 
	u32 keys = sKeyStatusBuffer.newKeys | sKeyStatusBuffer.heldKeys; 
	int x = 0; 
	int y = 0; 
	struct ProcEkrBattle* battleProc = gpProcEkrBattle; 
	struct Anim* anim = NULL; 
	if (battleProc) { anim = battleProc->anim; } 
	else { return; } 
	struct Anim* anim2 = GetAnimAnotherSide(anim);
	if (!anim2) { return; } 
	//asm("mov r11, r11"); 
	int nextRoundId = anim->nextRoundId > anim2->nextRoundId ? anim->nextRoundId : anim2->nextRoundId; 
	struct BattleHit* currentRound = GetCurrentRound(nextRoundId-1); 
	// if (!Proc_Find(updatebanimframe proc)) { Proc_Break(proc); } 
	struct ProcEfxHPBar* HpProc = Proc_Find(ProcScr_efxHPBar); 
	int side = 1 ^ gEkrInitialPosition[(nextRoundId-1)&1]; 
	if (proc->side != side) { proc->side = side; proc->timer = 0; proc->didBonusDmg = false; EndEmitStars(); } 
	if (!EnemiesCanDoBonusDamage && side) { return; } 
	DoStuffIfHit(proc, battleProc, HpProc, currentRound, anim, anim2, keys, x+((1^side)*12*8), y, side); 




} 

void ApplyBonusDamage(struct ProcEfxHPBar* HpProc, int side, struct BattleHit* round, struct Anim* anim, struct Anim* anim2); 
void DoStuffIfHit(SomeProc* proc, struct ProcEkrBattle* battleProc, struct ProcEfxHPBar* HpProc, struct BattleHit* round, struct Anim* anim, struct Anim* anim2, u32 keys, int x, int y, int side) { 
	
	//int side = 1 ^ battleProc->side; // we want to affect the opposite side 
	int hitTime = EkrEfxIsUnitHittedNow(side); 
	if (hitTime) { 
		
		if (!proc->didBonusDmg) { 
			proc->didBonusDmg = true; 
			StartEmitStarsAnim(proc, 11*8, 7*8, 12, 12);
			ApplyBonusDamage(HpProc, side, round, anim, anim2); 
		} 
		//if (proc->hitEarly) { 
			//PutSprite(int layer, int x, int y, const u16* object, int oam2) // oam2 is palette & other stuff 
			//PutSprite(2, x, y, sSprite_MissedInput, 0); return; 
		//} 
		if (keys & A_BUTTON) { 
			proc->hitOnTime = true; 
		} 
		if (proc->hitOnTime && (!proc->hitEarly)) { 
			PutSprite(2, x, y, sSprite_HitInput, 0);
		} 
	} 
	else { 
		if (keys & A_BUTTON) { proc->hitEarly = true; } 
		if (proc->timer < 10) { proc->hitEarly = false; } // 10 frames after hitting where it's okay to have A held down 
	}


} 

extern const int BonusDamage; 
void ApplyBonusDamage(struct ProcEfxHPBar* HpProc, int side, struct BattleHit* round, struct Anim* anim, struct Anim* anim2) { 
	struct BattleUnit* bunit = NULL; 
	if (gEkrInitialPosition[side] == 0) { // actor is on the left 
		bunit = &gBattleActor; 
	} 
	else { bunit = &gBattleTarget; } 
	int damage = BonusDamage; 
	//gBattleHitArray[0].attributes |= BATTLE_HIT_ATTR_SILENCER; // might need to end battle early? 
	if (HpProc->post <= damage) { damage = HpProc->post; HpProc->post = 0; HpProc->death = true; } 
	else { HpProc->post -= damage; } 
	round->hpChange += damage; // used by Huichelaar's banim numbers 
	if (bunit->unit.curHP <= damage) { // they are dead 
		//asm("mov r11, r11"); 
		//gpProcEkrBattle->end = true; // does nothing 
		//gEkrBattleEndFlag = true; // immediately ends without waiting for anything 
		//NewEkrbattleending(); // crashes 
		anim->nextRoundId = 8; // seems to work for now see GetAnimNextRoundType
		anim2->nextRoundId = 8; 
		//gBanimDoneFlag[0] = true; 
		//gBanimDoneFlag[1] = true; // doesn't stop the counter attack 
		
		bunit->unit.curHP = 0; 
		round->info |= BATTLE_HIT_INFO_FINISHES | BATTLE_HIT_INFO_KILLS_TARGET | BATTLE_HIT_INFO_END; 
	} 
	else { bunit->unit.curHP -= damage; } 

	
	
} 


