# Sector

TODO

```
struct Sector play
{
   readonly color[5]  AdditiveColors;
   readonly FColormap ColorMap;
   readonly color[5]  SpecialColors;

   Actor SoundTarget;

   int16 LightLevel;
   int16 SeqType;
   int16 Special;

   name SeqName;
   int  Sky;

   readonly vector2 CenterSpot;

   Actor ThingList;
   int   ValidCount;

   double Friction;
   double MoveFactor;
   int    TerrainNum[2];

   SectorEffect CeilingData;
   SectorEffect FloorData;
   SectorEffect LightingData;

   int   NextSec;
   int   PrevSec;
   uint8 SoundTraversed;
   int8  StairLock;

   readonly array<Line> Lines;

   readonly SecPlane CeilingPlane;
   readonly SecPlane FloorPlane;

   readonly Sector HeightSec;

   uint BottomMap;
   uint MidMap;
   uint TopMap;

   int    DamageAmount;
   int16  DamageInterval;
   name   DamageType;
   double Gravity;
   int16  LeakyDamage;

   readonly uint16 ZoneNumber;

   readonly int HealthCeiling;
   readonly int HealthCeilingGroup;
   readonly int HealthFloor;
   readonly int HealthFloorGroup;

   uint   Flags;
   uint16 MoreFlags;

   SectorAction SecActTarget;

   readonly int     PortalGroup;
   internal uint[2] Portals;

   readonly int SectorNum;

   int Index();

   double, Sector, F3DFloor NextHighestCeilingAt(double x, double y, double bottomz, double topz, int flags = 0);
   double, Sector, F3DFloor NextLowestFloorAt(double x, double y, double z, int flags = 0, double steph = 0);

   void RemoveForceField();

   static clearscope Sector PointInSector(vector2 pt);

   void   CheckPortalPlane(int plane);
   int    GetCeilingLight();
   int    GetFloorLight();
   Sector GetHeightSec();
   void   GetSpecial(out SecSpecial spec);
   int    GetTerrain(int pos);
   bool   PlaneMoving(int pos);
   void   SetSpecial(SecSpecial spec);
   void   TransferSpecial(Sector model);

   double, double GetFriction(int plane);
   double, Sector HighestCeilingAt(vector2 a);
   double, Sector LowestFloorAt(vector2 a);

   void   AddXOffset(int pos, double o);
   void   AddYOffset(int pos, double o);
   void   ChangeFlags(int pos, int and, int or);
   double GetAlpha(int pos);
   double GetAngle(int pos, bool addbase = true);
   int    GetFlags(int pos);
   color  GetGlowColor(int pos);
   double GetGlowHeight(int pos);
   int    GetPlaneLight(int pos);
   int    GetVisFlags(int pos);
   double GetXOffset(int pos);
   double GetXScale(int pos);
   double GetYOffset(int pos, bool addbase = true);
   double GetYScale(int pos);
   void   SetAdditiveColor(int pos, color cr);
   void   SetAlpha(int pos, double o);
   void   SetAngle(int pos, double o);
   void   SetBase(int pos, double y, double o);
   void   SetColor(color c, int desat = 0);
   void   SetFade(color c);
   void   SetFogDensity(int dens);
   void   SetGlowColor(int pos, color color);
   void   SetGlowHeight(int pos, double height);
   void   SetPlaneLight(int pos, int level);
   void   SetSpecialColor(int pos, color color);
   void   SetXOffset(int pos, double o);
   void   SetXScale(int pos, double o);
   void   SetYOffset(int pos, double o);
   void   SetYScale(int pos, double o);

   void      AdjustFloorClip();
   void      ChangeLightLevel(int newval);
   int       GetLightLevel();
   double    GetPlaneTexZ(int pos);
   textureid GetTexture(int pos);
   bool      IsLinked(Sector other, bool ceiling);
   void      SetLightLevel(int newval);
   void      SetPlaneTexZ(int pos, double val, bool dirtify = false);
   void      SetTexture(int pos, textureid tex, bool floorclip = true);

   double  CenterCeiling();
   double  CenterFloor();
   void    ClearPortal(int plane);
   int     GetOppositePortalGroup(int plane);
   vector2 GetPortalDisplacement(int plane);
   double  GetPortalPlaneZ(int plane);
   int     GetPortalType(int plane);
   bool    PortalBlocksMovement(int plane);
   bool    PortalBlocksSight(int plane);
   bool    PortalBlocksSound(int plane);
   bool    PortalBlocksView(int plane);
   bool    PortalIsLinked(int plane);
   bool    TriggerSectorActions(Actor thing, int activation);

   int MoveCeiling(double speed, double dest, int crush, int direction, bool hexencrush);
   int MoveFloor(double speed, double dest, int crush, int direction, bool hexencrush, bool instant = false);

   Sector NextSpecialSector(int type, Sector prev);

   double, Vertex FindHighestCeilingSurrounding();
   double, Vertex FindHighestFloorPoint();
   double, Vertex FindHighestFloorSurrounding();
   double, Vertex FindLowestCeilingPoint();
   double, Vertex FindLowestCeilingSurrounding();
   double, Vertex FindLowestFloorSurrounding();
   double, Vertex FindNextHighestCeiling();
   double, Vertex FindNextHighestFloor();
   double, Vertex FindNextLowestCeiling();
   double, Vertex FindNextLowestFloor();

   int    FindMinSurroundingLight(int max);
   Sector FindModelCeilingSector(double floordestheight);
   Sector FindModelFloorSector(double floordestheight);
   double FindShortestTextureAround();
   double FindShortestUpperAround();

   void SetEnvironment(string env);
   void SetEnvironmentID(int envnum);

   SeqNode CheckSoundSequence(int chan);
   bool    IsMakingLoopingSound();
   SeqNode StartSoundSequence(int chan, name seqname, int modenum);
   SeqNode StartSoundSequenceID(int chan, int sequence, int type, int modenum, bool nostop = false);
   void    StopSoundSequence(int chan);

   void ClearSecret();
   bool IsSecret();
   bool WasSecret();

   clearscope int GetHealth(SectorPart part);
   void           SetHealth(SectorPart part, int newhealth);

   double GetUdmfFloat(name nm);
   int    GetUdmfInt(name nm);
   string GetUdmfString(name nm);
}
```

TODO

<!-- EOF -->
