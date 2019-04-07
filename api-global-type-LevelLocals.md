# LevelLocals

Most map-relative data is stored in this structure.

```
struct LevelLocals
{
   // Map data
   array<Line>   Lines;
   array<Sector> Sectors;
   array<Side>   Sides;

   internal array<SectorPortal> SectorPortals;
   readonly array<Vertex>       Vertexes;

   // Stats
   int Found_Items;
   int Found_Secrets;
   int Killed_Monsters;
   int Total_Items;
   int Total_Monsters;
   int Total_Secrets;

   // Time
   readonly int MapTime;
   readonly int ParTime;
   readonly int StartTime;
   readonly int SuckTime;
   readonly int Time;
   readonly int TotalTime;

   // Map sequencing
   readonly int    Cluster;
   readonly int    ClusterFlags;
   readonly string LevelName;
   readonly int    LevelNum;
   readonly string MapName;

   string NextMap;
   string NextSecretMap;

   readonly int MapType;

   // Music
   readonly string Music;
   readonly int    MusicOrder;

   // Sky
   readonly textureid SkyTexture1;
   readonly textureid SkyTexture2;

   float SkySpeed1;
   float SkySpeed2;

   // Physics
   play double AirControl
   play double AirFriction;
   play int    AirSupply;
   play double Gravity;

   readonly int CompatFlags;
   readonly int CompatFlags2;

   // State
   bool AllMap;
   deprecated("3.8") bool Frozen;

   // Static info
   name DeathSequence;

   readonly bool   ActOwnSpecial;
   readonly bool   AllowRespawn;
   readonly bool   CheckSwitchRange;
   readonly string F1Pic;
   readonly int    FogDensity;
   readonly bool   Infinite_Flight;
   readonly bool   KeepFullInventory;
   readonly bool   MissilesActivateImpact;
   readonly bool   MonsterFallingDamage;
   readonly bool   MonstersTelefrag;
   readonly bool   NoInventoryBar;
   readonly bool   NoMonsters;
   readonly bool   No_Dlg_Freeze;
   readonly int    OutsideFogDensity;
   readonly float  PixelStretch;
   readonly bool   PolyGrind;
   readonly bool   RemoveItems;
   readonly int    SkyFog;
   readonly bool   SndSeqTotalCtrl;
   readonly double TeamDamage;

   double GetUDMFFloat(int type, int index, name key);
   int    GetUDMFInt(int type, int index, name key);
   string GetUDMFString(int type, int index, name key);

   play int ExecuteSpecial(int special, Actor activator, Line linedef, bool lineside, int arg1 = 0, int arg2 = 0, int arg3 = 0, int arg4 = 0, int arg5 = 0);

   void   ChangeSky(textureid sky1, textureid sky2);
   string FormatMapName(int mapnamecolor);
   string GetChecksum() const;
   void   SetInterMusic(string nextmap);
   void   StartIntermission(name type, int state) const;
   string TimeFormatted(bool totals = false);

   bool IsCrouchingAllowed() const;
   bool IsFreelookAllowed() const;
   bool IsJumpingAllowed() const;

   void GiveSecret(Actor activator, bool printmsg = true, bool playsound = true);
   void StartSlideshow(name whichone = 'none');
   void WorldDone();

   static void MakeScreenShot();
   static void MakeAutoSave();

   deprecated("3.8") static void RemoveAllBots(bool fromlist);

   ui vector2 GetAutomapPosition();

   play SpotState GetSpotState(bool create = true);
   int FindUniqueTid(int start = 0, int limit = 0);
   uint GetSkyboxPortal(Actor actor);
   void ReplaceTextures(string from, string to, int flags);
   clearscope HealthGroup FindHealthGroup(int id);
   vector3, int PickDeathmatchStart();
   vector3, int PickPlayerStart(int pnum, int flags = 0);
   int IsFrozen() const;
   void SetFrozen(bool on);

   clearscope bool IsPointInLevel(vector3 p) const;
   clearscope Sector PointInSector(vector2 p) const;
   deprecated("3.8") static clearscope bool IsPointInMap(vector3 p);

   clearscope vector3 SphericalCoords(vector3 viewpoint, vector3 targetPos, vector2 viewAngles = (0, 0), bool absolute = false) const;
   clearscope vector2 Vec2Diff(vector2 v1, vector2 v2) const;
   clearscope vector2 Vec2Offset(vector2 pos, vector2 dir, bool absolute = false) const;
   clearscope vector3 Vec2OffsetZ(vector2 pos, vector2 dir, double atz, bool absolute = false) const;
   clearscope vector3 Vec3Diff(vector3 v1, vector3 v2) const;
   clearscope vector3 Vec3Offset(vector3 pos, vector3 dir, bool absolute = false) const;

   SectorTagIterator CreateSectorTagIterator(int tag, Line defline = null);
   LineIDIterator CreateLineIDIterator(int tag);
   ActorIterator CreateActorIterator(int tid, class<Actor> type = "Actor");

   play bool CreateCeiling(Sector sec, int type, Line ln, double speed, double speed2, double height = 0, int crush = -1, int silent = 0, int change = 0, int crushmode = 0);
   play bool CreateFloor(Sector sec, int type, Line ln, double speed, double speed2, double height = 0, int crush = -1, int silent = 0, int change = 0, bool crushmode = false, bool hereticlower = false);
}
```

TODO

- `ClusterFlags`

   Flags for this cluster. May contain any of the following bit flags:

   | Name                | Description                      |
   | ----                | -----------                      |
   | `Level.CLUSTER_HUB` | This cluster uses hub behaviour. |

<!-- EOF -->
