
#include "Tps.h"

enum { BITS_PER_PARTY_ID = 4 };

#define PARTY_ID(party) (party & ((1 << (BITS_PER_PARTY_ID-1))-1)) // & 0x7 
#define PARTY_RM(party) (party & ((1 << (BITS_PER_PARTY_ID-1)))) // & 0x8


int TpsGetPartyRawByPid(int pid)
{
    static int const mask = (1 << BITS_PER_PARTY_ID) - 1;

    int const slot = pid / (8 / BITS_PER_PARTY_ID);
    int const shift = (pid % (8 / BITS_PER_PARTY_ID)) * BITS_PER_PARTY_ID;

    return (g_tps_party_array[slot] >> shift) & mask;
}

void TpsSetPartyRawForPid(int pid, int party)
{
    static int const mask = (1 << BITS_PER_PARTY_ID) - 1;

    int const slot = pid / (8 / BITS_PER_PARTY_ID);
    int const shift = (pid % (8 / BITS_PER_PARTY_ID)) * BITS_PER_PARTY_ID;

	g_tps_party_array[slot] &= ~(mask << shift);
    g_tps_party_array[slot] |= (party & mask) << shift;
}

int TpsGetPartyByPid(int pid)
{
    return PARTY_ID(TpsGetPartyRawByPid(pid));
}

void TpsSetPartyByPid(int pid, int party)
{
    static int const mask = (1 << (BITS_PER_PARTY_ID-1)) - 1;

    int val = TpsGetPartyRawByPid(pid);

    val &= ~mask;
    val |= party & mask;

    TpsSetPartyRawForPid(pid, val);
}



int TpsIsDisabledByPid(int pid)
{
    return !!(TpsGetPartyRawByPid(pid) & (1 << (BITS_PER_PARTY_ID-1)));
} // !! is 0 if 0, 1 if anything but 0 

void TpsSetDisabledByPid(int pid, int disabled)
{
    int val = TpsGetPartyRawByPid(pid);

    val &= ~(1 << (BITS_PER_PARTY_ID-1));
    val |= (!!disabled) << (BITS_PER_PARTY_ID-1); 

    TpsSetPartyRawForPid(pid, val);
}



void TpsRefreshUnitAwayBits(void)
{
    for (int i = 1; i < 0x40; ++i)
    {
        struct Unit* const unit = GetUnit(i);

        if (!unit || !unit->pCharacterData)
            continue;

        if (unit->state & US_DEAD)
            continue;

        if (unit->pCharacterData->number >= TPS_MAX_PID)
            continue;

        int const party = TpsGetPartyRawByPid(unit->pCharacterData->number);

		// party & 0x8 || party & 0x7 
        if (PARTY_RM(party) || PARTY_ID(party) != *g_tps_current_party)
        {
            // Unit is disabled
            unit->state |= US_NOT_DEPLOYED | US_HIDDEN | US_BIT16 | US_BIT26;
        }
        else
        {
            // Unit is enabled
            unit->state &= ~(US_NOT_DEPLOYED | US_HIDDEN | US_BIT16 | US_BIT26);
        }
    }
}
