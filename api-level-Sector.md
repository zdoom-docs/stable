# Sector

TODO

```
struct Sector play
{
   readonly FColormap ColorMap;
   readonly color     SpecialColors[5];

   Actor SoundTarget;

   int16 Special;
   int16 LightLevel;
   int16 SeqType;

   int  Sky;
   name SeqName;

   readonly vector2 CenterSpot;

   int   ValidCount;
   Actor ThingList;

   double Friction, MoveFactor;
   int TerrainNum[2];

   SectorEffect FloorData;
   SectorEffect CeilingData;
   SectorEffect LightingData;

   uint8 SoundTraversed;
   int8  StairLock;
   int   PrevSec;
   int   NextSec;

   readonly array<Line> Lines;

   readonly SecPlane FloorPlane;
   readonly SecPlane CeilingPlane;

   readonly Sector HeightSec;

   uint BottomMap, MidMap, TopMap;

   double Gravity;
   name   DamageType;
   int    DamageAmount;
   int16  DamageInterval;
   int16  LeakyDamage;

   readonly uint16 ZoneNumber;

   uint   Flags;
   uint16 MoreFlags;

   SectorAction SecActTarget;

   internal uint Portals[2];
   readonly int  PortalGroup;

   readonly int SectorNum;

   int Index();

   double, Sector, F3DFloor NextHighestCeilingAt(double x, double y, double bottomz, double topz, int flags = 0);
   double, Sector, F3DFloor NextLowestFloorAt(double x, double y, double z, int flags = 0, double steph = 0);

   void RemoveForceField();

   static Sector PointInSector(vector2 pt);

   bool   PlaneMoving(int pos);
   int    GetFloorLight();
   int    GetCeilingLight();
   Sector GetHeightSec();
   void   TransferSpecial(Sector model);
   void   GetSpecial(out SecSpecial spec);
   void   SetSpecial(SecSpecial spec);
   int    GetTerrain(int pos);
   void   CheckPortalPlane(int plane);

   double, Sector HighestCeilingAt(vector2 a);
   double, Sector LowestFloorAt(vector2 a);
   double, double GetFriction(int plane);

   void   SetXOffset(int pos, double o);
   void   AddXOffset(int pos, double o);
   double GetXOffset(int pos);
   void   SetYOffset(int pos, double o);
   void   AddYOffset(int pos, double o);
   double GetYOffset(int pos, bool addbase = true);
   void   SetXScale(int pos, double o);
   double GetXScale(int pos);
   void   SetYScale(int pos, double o);
   double GetYScale(int pos);
   void   SetAngle(int pos, double o);
   double GetAngle(int pos, bool addbase = true);
   void   SetBase(int pos, double y, double o);
   void   SetAlpha(int pos, double o);
   double GetAlpha(int pos);
   int    GetFlags(int pos);
   int    GetVisFlags(int pos);
   void   ChangeFlags(int pos, int and, int or);
   int    GetPlaneLight(int pos);
   void   SetPlaneLight(int pos, int level);
   void   SetColor(color c, int desat = 0);
   void   SetFade(color c);
   void   SetFogDensity(int dens);
   double GetGlowHeight(int pos);
   color  GetGlowColor(int pos);
   void   SetGlowHeight(int pos, double height);
   void   SetGlowColor(int pos, color color);
   void   SetSpecialColor(int pos, color color);

   textureid GetTexture(int pos);
   void      SetTexture(int pos, textureid tex, bool floorclip = true);
   double    GetPlaneTexZ(int pos);
   void      SetPlaneTexZ(int pos, double val, bool dirtify = false);
   void      ChangeLightLevel(int newval);
   void      SetLightLevel(int newval);
   int       GetLightLevel();
   void      AdjustFloorClip();
   bool      IsLinked(Sector other, bool ceiling);

   bool    PortalBlocksView(int plane);
   bool    PortalBlocksSight(int plane);
   bool    PortalBlocksMovement(int plane);
   bool    PortalBlocksSound(int plane);
   bool    PortalIsLinked(int plane);
   void    ClearPortal(int plane);
   double  GetPortalPlaneZ(int plane);
   vector2 GetPortalDisplacement(int plane);
   int     GetPortalType(int plane);
   int     GetOppositePortalGroup(int plane);
   double  CenterFloor();
   double  CenterCeiling();
   bool    TriggerSectorActions(Actor thing, int activation);

   int MoveFloor(double speed, double dest, int crush, int direction, bool hexencrush, bool instant = false);
   int MoveCeiling(double speed, double dest, int crush, int direction, bool hexencrush);

   Sector NextSpecialSector(int type, Sector prev);

   double, Vertex FindLowestFloorSurrounding();
   double, Vertex FindHighestFloorSurrounding();
   double, Vertex FindNextHighestFloor();
   double, Vertex FindNextLowestFloor();
   double, Vertex FindLowestCeilingSurrounding();
   double, Vertex FindHighestCeilingSurrounding();
   double, Vertex FindNextLowestCeiling();
   double, Vertex FindNextHighestCeiling();

   double FindShortestTextureAround();
   double FindShortestUpperAround();
   Sector FindModelFloorSector(double floordestheight);
   Sector FindModelCeilingSector(double floordestheight);
   int    FindMinSurroundingLight(int max);

   double, Vertex FindLowestCeilingPoint();
   double, Vertex FindHighestFloorPoint();

   void SetEnvironment(string env);
   void SetEnvironmentID(int envnum);

   SeqNode StartSoundSequenceID(int chan, int sequence, int type, int modenum, bool nostop = false);
   SeqNode StartSoundSequence(int chan, name seqname, int modenum);
   SeqNode CheckSoundSequence(int chan);
   void StopSoundSequence(int chan);
   bool IsMakingLoopingSound();

   bool IsSecret();
   bool WasSecret();
   void ClearSecret();

   double GetUDMFFloat(name nm);
   int    GetUDMFInt(name nm);
   string GetUDMFString(name nm);
}
```

- `ColorMap`

   TODO

- `SpecialColors`

   TODO

- `SoundTarget`

   TODO

- `Special`

   TODO

- `LightLevel`

   TODO

- `SeqType`

   TODO

- `Sky`

   TODO

- `SeqName`

   TODO

- `CenterSpot`

   TODO

- `ValidCount`

   TODO

- `ThingList`

   TODO

- `Friction`

   TODO

- `MoveFactor`

   TODO

- `TerrainNum`

   TODO

- `FloorData`

   TODO

- `CeilingData`

   TODO

- `LightingData`

   TODO

- `SoundTraversed`

   TODO

- `StairLock`

   TODO

- `PrevSec`

   TODO

- `NextSec`

   TODO

- `Lines`

   TODO

- `FloorPlane`

   TODO

- `CeilingPlane`

   TODO

- `HeightSec`

   TODO

- `BottomMap`

   TODO

- `MidMap`

   TODO

- `TopMap`

   TODO

- `Gravity`

   TODO

- `DamageType`

   TODO

- `DamageAmount`

   TODO

- `DamageInterval`

   TODO

- `LeakyDamage`

   TODO

- `ZoneNumber`

   TODO

- `Flags`

   TODO

- `MoreFlags`

   TODO

- `SecActTarget`

   TODO

- `Portals`

   TODO

- `PortalGroup`

   TODO

- `SectorNum`

   TODO

- `Index`

   TODO

- `NextHighestCeilingAt`

   TODO

- `NextLowestFloorAt`

   TODO

- `RemoveForceField`

   TODO

- `PointInSector`

   TODO

- `PlaneMoving`

   TODO

- `GetFloorLight`

   TODO

- `GetCeilingLight`

   TODO

- `GetHeightSec`

   TODO

- `TransferSpecial`

   TODO

- `GetSpecial`

   TODO

- `SetSpecial`

   TODO

- `GetTerrain`

   TODO

- `CheckPortalPlane`

   TODO

- `HighestCeilingAt`

   TODO

- `LowestFloorAt`

   TODO

- `GetFriction`

   TODO

- `SetXOffset`

   TODO

- `AddXOffset`

   TODO

- `GetXOffset`

   TODO

- `SetYOffset`

   TODO

- `AddYOffset`

   TODO

- `GetYOffset`

   TODO

- `SetXScale`

   TODO

- `GetXScale`

   TODO

- `SetYScale`

   TODO

- `GetYScale`

   TODO

- `SetAngle`

   TODO

- `GetAngle`

   TODO

- `SetBase`

   TODO

- `SetAlpha`

   TODO

- `GetAlpha`

   TODO

- `GetFlags`

   TODO

- `GetVisFlags`

   TODO

- `ChangeFlags`

   TODO

- `GetPlaneLight`

   TODO

- `SetPlaneLight`

   TODO

- `SetColor`

   TODO

- `SetFade`

   TODO

- `SetFogDensity`

   TODO

- `GetGlowHeight`

   TODO

- `GetGlowColor`

   TODO

- `SetGlowHeight`

   TODO

- `SetGlowColor`

   TODO

- `SetSpecialColor`

   TODO

- `GetTexture`

   TODO

- `SetTexture`

   TODO

- `GetPlaneTexZ`

   TODO

- `SetPlaneTexZ`

   TODO

- `ChangeLightLevel`

   TODO

- `SetLightLevel`

   TODO

- `GetLightLevel`

   TODO

- `AdjustFloorClip`

   TODO

- `IsLinked`

   TODO

- `PortalBlocksView`

   TODO

- `PortalBlocksSight`

   TODO

- `PortalBlocksMovement`

   TODO

- `PortalBlocksSound`

   TODO

- `PortalIsLinked`

   TODO

- `ClearPortal`

   TODO

- `GetPortalPlaneZ`

   TODO

- `GetPortalDisplacement`

   TODO

- `GetPortalType`

   TODO

- `GetOppositePortalGroup`

   TODO

- `CenterFloor`

   TODO

- `CenterCeiling`

   TODO

- `TriggerSectorActions`

   TODO

- `MoveFloor`

   TODO

- `MoveCeiling`

   TODO

- `NextSpecialSector`

   TODO

- `FindLowestFloorSurrounding`

   TODO

- `FindHighestFloorSurrounding`

   TODO

- `FindNextHighestFloor`

   TODO

- `FindNextLowestFloor`

   TODO

- `FindLowestCeilingSurrounding`

   TODO

- `FindHighestCeilingSurrounding`

   TODO

- `FindNextLowestCeiling`

   TODO

- `FindNextHighestCeiling`

   TODO

- `FindShortestTextureAround`

   TODO

- `FindShortestUpperAround`

   TODO

- `FindModelFloorSector`

   TODO

- `FindModelCeilingSector`

   TODO

- `FindMinSurroundingLight`

   TODO

- `FindLowestCeilingPoint`

   TODO

- `FindHighestFloorPoint`

   TODO

- `SetEnvironment`

   TODO

- `SetEnvironmentID`

   TODO

- `StartSoundSequenceID`

   TODO

- `StartSoundSequence`

   TODO

- `CheckSoundSequence`

   TODO

- `StopSoundSequence`

   TODO

- `IsMakingLoopingSound`

   TODO

- `IsSecret`

   TODO

- `WasSecret`

   TODO

- `ClearSecret`

   TODO

- `GetUDMFFloat`

   TODO

- `GetUDMFInt`

   TODO

- `GetUDMFString`

   TODO

<!-- EOF -->
