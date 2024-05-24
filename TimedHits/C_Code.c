//#define AlwaysWork

#include "C_Code.h" // headers 
#define PUREFUNC __attribute__((pure))
int Mod(int a, int b) PUREFUNC;
typedef struct {
    /* 00 */ PROC_HEADER;
	struct Anim* anim; 
	int timer; 
	int timer2; 
	struct BattleHit* currentRound;
	struct BattleUnit* active_bunit;
	struct BattleUnit* opp_bunit;
	u8 hitEarly; 
	u8 hitOnTime; 
	u8 roundId; 
	u8 adjustedDmg; 
	u8 broke; 
	u8 loadedImg;
	u8 side; 
} TimedHitsProc;
void LoopTimedHitsProc(TimedHitsProc* proc);
const struct ProcCmd TimedHitsProcCmd[] =
{
	PROC_NAME("TimedHitsProcName"), 
    PROC_YIELD,
	PROC_REPEAT(LoopTimedHitsProc), 
    PROC_END,
};
extern void* Press_A_Image; 
extern void* BattleStar; 
extern u16 gPal_Press_A_Image[];
extern u16 gPal_BattleStar[];
extern struct KeyStatusBuffer sKeyStatusBuffer; // 2024C78
void StartTimedHitsProc(void) { 
	TimedHitsProc* proc; 
	proc = Proc_Find(TimedHitsProcCmd); 
	if (!proc) { 
	proc = Proc_Start(TimedHitsProcCmd, (void*)3); 
	} 
	proc->anim = NULL; 
	proc->broke = false; 
	proc->roundId = 0; 
	proc->timer = 0; 
	proc->timer2 = 0; 
	proc->hitEarly = false; 
	proc->hitOnTime = false; 
	proc->adjustedDmg = false;
	proc->loadedImg = false;
	proc->side = 0xFF; 
	proc->currentRound = NULL; 
	proc->active_bunit = NULL; 
	proc->opp_bunit = NULL; 
} 

extern struct BattleHit* GetCurrentRound(int roundID); 
extern s16 GetAnimRoundType(struct Anim * anim);
extern const int EnemiesCanDoBonusDamage; 
void SetCurrentAnimInProc(struct Anim* anim) { 
	TimedHitsProc* proc; 
	proc = Proc_Find(TimedHitsProcCmd); 
	proc->anim = anim; 
	proc->timer = 0; 
	//asm("mov r11, r11"); 
	proc->broke = false; 
	//proc->roundId++; 
	proc->roundId = anim->nextRoundId-1; 
	proc->timer = 0; 
	proc->hitEarly = false; 
	proc->hitOnTime = false; 
	proc->adjustedDmg = false;
	proc->loadedImg = false; // reload after each round 
	proc->currentRound = GetCurrentRound(proc->roundId); 
	proc->side = GetAnimPosition(anim) ^ 1; 
} 


void DoStuffIfHit(TimedHitsProc* proc, struct ProcEkrBattle* battleProc, struct ProcEfxHPBar* HpProc, struct BattleHit* round);
void AdjustDamageByPercent(TimedHitsProc* proc, struct ProcEfxHPBar* HpProc, struct BattleUnit* active_bunit, struct BattleUnit* opp_bunit, struct BattleHit* round, int percent);
void AdjustDamageWithGetter(TimedHitsProc* proc, struct ProcEfxHPBar* HpProc, struct BattleUnit* active_bunit, struct BattleUnit* opp_bunit, struct BattleHit* round);
void CheckForDeath(TimedHitsProc* proc, struct ProcEfxHPBar* HpProc, struct BattleUnit* active_bunit, struct BattleUnit* opp_bunit, struct BattleHit* round, int hp); 

const u16 sSprite_HitInput[] = {
    1, // number of entries below (each entry has 3 lines) 
    0x0002, 
	0x4000, 
	0x01ca // tile number 
};
const u16 sSprite_MissedInput[] = {
    1,
    0x0000, 
	0x4000, 
	0x01cc // tile number 
};
const u16 sSprite_PressInput[] = {
    1,
    OAM0_SHAPE_64x32, 
	OAM1_SIZE_64x32, 
	OAM2_CHR(0x0100) // tile number 
};
const u16 sSprite_Star[] = {
    1,
    OAM0_SHAPE_16x16, 
	OAM1_SIZE_16x16, 
	OAM2_CHR(0x0108) // tile number 
};
void BreakOnce(TimedHitsProc* proc) { 
	if (proc->broke) { return; } 
	proc->broke = true; 
	asm("mov r11, r11");
} 

void LoopTimedHitsProc(TimedHitsProc* proc) { 
	if (!proc->anim) { return; } 
	  
	struct ProcEkrBattle* battleProc = gpProcEkrBattle; 
	struct Anim* anim1 = proc->anim; 
	if (battleProc) { anim1 = battleProc->anim; } 
	else { return; } 
	struct Anim* anim2 = GetAnimAnotherSide(anim1);
	if (!anim2) { return; } 
	
	proc->timer++;
	proc->timer2++;
	struct BattleHit* currentRound = proc->currentRound; 
	struct ProcEfxHPBar* HpProc = Proc_Find(ProcScr_efxHPBar); 
	DoStuffIfHit(proc, battleProc, HpProc, currentRound); 
} 

int HitNow(TimedHitsProc* proc) { 
	return EkrEfxIsUnitHittedNow(proc->side);
} 
int PressedSpecificKeys(TimedHitsProc* proc, u32 keys) { 
	return (keys & A_BUTTON); 
} 

void DoStuffIfHit(TimedHitsProc* proc, struct ProcEkrBattle* battleProc, struct ProcEfxHPBar* HpProc, struct BattleHit* round) { 
	u32 keys = sKeyStatusBuffer.newKeys | sKeyStatusBuffer.heldKeys; 
	int side = proc->side; 
	int x = 12 * 8; 
	int y =  5 * 8;
	struct BattleUnit* active_bunit = gpEkrBattleUnitLeft; 
	struct BattleUnit* opp_bunit = gpEkrBattleUnitRight; 
	if (!side) { 
		active_bunit = gpEkrBattleUnitRight; 
		opp_bunit = gpEkrBattleUnitLeft;
	} 
	proc->active_bunit = active_bunit; 
	proc->opp_bunit = opp_bunit; 
	int hitTime = HitNow(proc); 
	if (hitTime) { 

		//if (!EnemiesCanDoBonusDamage && (UNIT_FACTION(&active_bunit->unit) == FACTION_RED)) { return; } 
		if (!proc->loadedImg) {
			proc->timer2 = 0; 
			Copy2dChr(&Press_A_Image, (void*)0x06012000, 8, 4);
			Copy2dChr(&BattleStar, (void*)0x06012100, 2, 2);
			proc->loadedImg = true;
		}
		x = x+((side)*4*8);
		if (PressedSpecificKeys(proc, keys)) { 
			proc->hitOnTime = true; 
		} 
		
		#ifdef AlwaysWork
		if (!proc->adjustedDmg) { 
			proc->adjustedDmg = true; 
			//PlaySFX(int songid, int volume, int locate, int type)
			PlaySFX(0x13e, 0x100, 120, 1); // locate is side for stereo? 
			AdjustDamageWithGetter(proc, HpProc, active_bunit, opp_bunit, round); 
		} 
		#endif 
		#ifndef AlwaysWork
		if (proc->hitOnTime && (!proc->hitEarly)) { 
		#endif 
			//int clock = GetGameClock(); // proc->timer; 
			int clock = proc->timer2; 
			//ApplyPalettes(gPal_BattleStar, 14+16, 0x10);
			int oam2 = OAM2_PAL(14) | OAM2_LAYER(0); //OAM2_CHR(0);
			x += Mod(clock, 8) >> 1; 
			y -= clock; 
			//if (y < 40) { y = 40; } 
			PutSprite(2, OAM1_X(x + 0x200), OAM0_Y(y + 0x100), sSprite_Star, oam2); 

			#ifndef AlwaysWork 
			if (!proc->adjustedDmg) { 
			proc->adjustedDmg = true; 
			//PlaySFX(int songid, int volume, int locate, int type)
			PlaySFX(0x13e, 0x100, 120, 1); // locate is side for stereo? 
			AdjustDamageWithGetter(proc, HpProc, active_bunit, opp_bunit, round); 
			} 
			#endif 
		#ifndef AlwaysWork
		} 
		else if (!proc->hitEarly) { 
			//ApplyPalettes(gPal_Press_A_Image, 14+16, 0x10);
			int oam2 = OAM2_PAL(14) | OAM2_LAYER(0); //OAM2_CHR(0);
			PutSprite(2, OAM1_X(x + 0x200), OAM0_Y(y + 0x100), sSprite_PressInput, oam2); 
		} 
		#endif 
		// kill off enemies for adjusted rounds if a timed hit was done previously 
		if (!proc->adjustedDmg) {
		CheckForDeath(proc, HpProc, active_bunit, opp_bunit, round, (-1)); 
		}
	} 
	else { 
		if (proc->timer < 10) { proc->hitEarly = false; } // 10 frames after hitting where it's okay to have A held down 
		else if (PressedSpecificKeys(proc, keys)) { 
			if (!proc->hitEarly) { 
				PlaySFX(0x13d, 0x100, 120, 1); 
			}
			proc->hitEarly = true; 
		} 
		
	}


} 

extern const int BonusDamagePercent; 
extern const int ReducedDamagePercent; 
int GetDefaultDamagePercent(struct BattleUnit* active_bunit, struct BattleUnit* opp_bunit) { 
	if (UNIT_FACTION(&active_bunit->unit) == FACTION_RED) { return ReducedDamagePercent; } 
	return BonusDamagePercent; 
} 
int GetDamagePercent(struct BattleUnit* active_bunit, struct BattleUnit* opp_bunit) { 
	// add more unique cases here 
	return GetDefaultDamagePercent(active_bunit, opp_bunit); 
} 

void AdjustAllRounds(int id, int damage) { 
	int hp;
	for (int i = id; i < 22; i += 2) {
		hp = gEfxHpLut[i]; 
		if (hp == 0xffff) { break; }
		if (damage < 0) { hp += damage; if (hp > 0) { gEfxHpLut[i] = hp; } else { gEfxHpLut[i] = 0; } }
		else if (hp >= damage) { gEfxHpLut[i] -= damage; }
		else { gEfxHpLut[i] = 0; }
		
	}
}

extern s16 gEfxHpLutOff[]; // 203e152 B gEfxHpLutOff

void AdjustDamageWithGetter(TimedHitsProc* proc, struct ProcEfxHPBar* HpProc, struct BattleUnit* active_bunit, struct BattleUnit* opp_bunit, struct BattleHit* round) { 
	AdjustDamageByPercent(proc, HpProc, active_bunit, opp_bunit, round, GetDamagePercent(active_bunit, opp_bunit)); 
} 

void CheckForDeath(TimedHitsProc* proc, struct ProcEfxHPBar* HpProc, struct BattleUnit* active_bunit, struct BattleUnit* opp_bunit, struct BattleHit* round, int hp) { 
	int side = proc->side; 
	//asm("mov r11, r11");
	//int damage = (round->hpChange * percent) / 100; 
	int id = (gEfxHpLutOff[side] * 2) + (side);
	if (hp < 0) { hp = GetEfxHp(id) - round->hpChange; } // + round->hpChange; 
	if (hp <= 0) { // they are dead 
		hp = 0; 
		asm("mov r11, r11"); 
		//gEkrGaugeHp[side] += damage;
		//damage = opp_bunit->unit.curHP; //HpProc->post; 
		//round->hpChange = hp; // used by Huichelaar's banim numbers 
		opp_bunit->unit.curHP = 0; 
		HpProc->post = 0; 
		 
		//gEkrGaugeHp[side ^ 1] = round->hpChange;
		
		//gEkrGaugeHp[side ^ 1] = 22;//+= damage;
		HpProc->death = true; 

		//gpProcEkrBattle->end = true; // does nothing 
		//gEkrBattleEndFlag = true; // immediately ends without waiting for anything 
		//NewEkrbattleending(); // crashes 
		proc->anim->nextRoundId = 8; // seems to work for now see GetAnimNextRoundType
		GetAnimAnotherSide(proc->anim)->nextRoundId = 8; 

		//gBanimDoneFlag[0] = true; 
		//gBanimDoneFlag[1] = true; // doesn't stop the counter attack 
		round->info |= BATTLE_HIT_INFO_FINISHES | BATTLE_HIT_INFO_KILLS_TARGET | BATTLE_HIT_INFO_END; 
	} 
}

void AdjustDamageByPercent(TimedHitsProc* proc, struct ProcEfxHPBar* HpProc, struct BattleUnit* active_bunit, struct BattleUnit* opp_bunit, struct BattleHit* round, int percent) { 
	//if (!HpProc->post) { return; } 
	int side = proc->side; 
	//asm("mov r11, r11");
	//int damage = (round->hpChange * percent) / 100; 
	int id = (gEfxHpLutOff[side] * 2) + (side);
	int hp = GetEfxHp(id); // + round->hpChange; 
	if (!hp) { return; } 
	if (hp == 0xFFFF) { return; } 
	
	int damage = (round->hpChange * percent) / 100; 
	//asm("mov r11, r11");
	if (damage > round->hpChange) { 
		damage -= round->hpChange; 
		hp -= damage; 
		HpProc->post -= damage;
		opp_bunit->unit.curHP -= damage; 
		round->hpChange += damage; // used by Huichelaar's banim numbers 
	} 
	else { 
		damage = round->hpChange - damage; 
		hp += damage; 
		HpProc->post += damage;
		opp_bunit->unit.curHP += damage; 
		round->hpChange -= damage; // used by Huichelaar's banim numbers 
		damage = 0 - damage;
		
	} 
	AdjustAllRounds(id, damage);
	
	if (hp < 0) { hp = 0; } 
	CheckForDeath(proc, HpProc, active_bunit, opp_bunit, round, hp); 
	//return;
	//damage -= round->hpChange; // damage is -5 
	//int hp = opp_bunit->unit.curHP - damage;
	//hp = gEkrGaugeHp[side] - hp; 

	//if (hp > 80) { asm("mov r11, r11"); } 
	//asm("mov r11, r11"); 
	//if (damage < 0) { hp += ABS(damage); } 
	//else { hp -= damage; }
	//damage = damage - round->hpChange; 
	//hp -= (damage); 
	//hp = HpProc->pre - hp; 

	
} 


