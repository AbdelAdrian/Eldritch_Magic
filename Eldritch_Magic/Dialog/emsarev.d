// Upgrades Sarevok's Sowrd of Chaos +4 (Ascension) to +5
EXTEND_BOTTOM BOTSMITH 4
  IF ~PartyHasItem("finsarev")~ THEN GOTO chaos // Sarevok's Sword of Chaos +5
END

APPEND BOTSMITH              

  IF ~~ THEN BEGIN chaos SAY @209
    IF ~!PartyHasItem("misc72")
        !PartyHasItem("misc73")~ THEN GOTO need_chaos
    IF ~PartyHasItem("misc72")
        PartyHasItem("misc73")~ THEN GOTO chaos_want
  END

  IF ~~ THEN BEGIN need_chaos SAY @210
    COPY_TRANS BOTSMITH 4
  END

  IF ~~ THEN BEGIN chaos_want SAY @2100
    IF ~PartyGoldLT(10000)~ THEN REPLY #66908 GOTO 10
    IF ~PartyGoldGT(9999)~ THEN REPLY #66909 DO ~TakePartyGold(10000)
                                                 TakePartyItemNum("finsarev",1)
                                                 DestroyItem("finsarev")
                                                 TakePartyItemNum("misc72",1)
                                                 DestroyItem("misc72")
                                                 TakePartyItemNum("misc73",1)
                                                 DestroyItem("misc73")
                                                 DestroyGold(10000)
                                                 CreateItem("emsarev",1)
                                                 GiveItemCreate("emsarev",player1,0,0,0)~ GOTO 11
    IF ~~ THEN REPLY #66910 GOTO chaos_stall
  END

  IF ~~ THEN BEGIN chaos_stall SAY @212
    COPY_TRANS BOTSMITH 4
  END

END                                            
