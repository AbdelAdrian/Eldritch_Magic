APPEND ~SAREV25J~

IF ~Global("SarevokHasSword","LOCALS",1)~ THEN a25
  SAY @2750
  IF ~~ THEN DO ~SetGlobal("SarevokHasSword","LOCALS",2)~ + a26
END

IF ~~ THEN a26
  SAY @2760
  IF ~~ THEN DO ~DestroyItem("sw2h16") GiveItemCreate("finsarev",Myself,0,0,0)~ EXIT
END

END
