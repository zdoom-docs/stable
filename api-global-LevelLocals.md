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

   // State
   bool AllMap;
   bool Frozen;

   // Static info
   name   DeathSequence;
   string F1Pic;

   readonly bool   ActOwnSpecial;
   readonly bool   AllowRespawn;
   readonly bool   CheckSwitchRange;
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

   bool ExecuteSpecial(int special, Actor activator, Line linedef, bool lineside, int arg1 = 0, int arg2 = 0, int arg3 = 0, int arg4 = 0, int arg5 = 0);

   void   ChangeSky(textureid sky1, textureid sky2);
   string FormatMapName(int mapnamecolor);
   string GetChecksum() const;
   void   SetInterMusic(string nextmap);
   void   StartIntermission(name type, int state) const;
   string TimeFormatted(bool totals = false);

   bool IsCrouchingAllowed() const;
   bool IsFreelookAllowed() const;
   bool IsJumpingAllowed() const;

   static void GiveSecret(Actor activator, bool printmsg = true, bool playsound = true);
   static void RemoveAllBots(bool fromlist);
   static void StartSlideshow(name whichone = 'none');
   static void WorldDone();

   static vector2 GetAutomapPosition();

   static clearscope bool IsPointInMap(vector3 p);

   static clearscope vector3 SphericalCoords(vector3 viewpoint, vector3 targetPos, vector2 viewAngles = (0, 0), bool absolute = false);
   static clearscope vector2 Vec2Diff(vector2 v1, vector2 v2);
   static clearscope vector2 Vec2Offset(vector2 pos, vector2 dir, bool absolute = false);
   static clearscope vector3 Vec2OffsetZ(vector2 pos, vector2 dir, double atz, bool absolute = false);
   static clearscope vector3 Vec3Diff(vector3 v1, vector3 v2);
   static clearscope vector3 Vec3Offset(vector3 pos, vector3 dir, bool absolute = false);
}
```
- `Lines`

   TODO

- `Sectors`

   TODO

- `Sides`

   TODO

- `SectorPortals`

   TODO

- `Vertexes`

   TODO

- `Found_Items`

   TODO

- `Found_Secrets`

   TODO

- `Killed_Monsters`

   TODO

- `Total_Items`

   TODO

- `Total_Monsters`

   TODO

- `Total_Secrets`

   TODO

- `MapTime`

   TODO

- `ParTime`

   TODO

- `StartTime`

   TODO

- `SuckTime`

   TODO

- `Time`

   TODO

- `TotalTime`

   TODO

- `Cluster`

   TODO

- `ClusterFlags`

   Flags for this cluster. May contain any of the following bit flags:

   | Name                | Description                      |
   | ----                | -----------                      |
   | `Level.CLUSTER_HUB` | This cluster uses hub behaviour. |

- `LevelName`

   TODO

- `LevelNum`

   TODO

- `MapName`

   TODO

- `NextMap`

   TODO

- `NextSecretMap`

   TODO

- `MapType`

   TODO

- `Music`

   TODO

- `MusicOrder`

   TODO

- `SkyTexture1`

   TODO

- `SkyTexture2`

   TODO

- `SkySpeed1`

   TODO

- `SkySpeed2`

   TODO

- `AirControl`

   TODO

- `AirSupply`

   TODO

- `Gravity`

   TODO

- `AllMap`

   TODO

- `Frozen`

   TODO

- `DeathSequence`

   TODO

- `F1Pic`

   TODO

- `ActOwnSpecial`

   TODO

- `AllowRespawn`

   TODO

- `CheckSwitchRange`

   TODO

- `FogDensity`

   TODO

- `Infinite_Flight`

   TODO

- `KeepFullInventory`

   TODO

- `MissilesActivateImpact`

   TODO

- `MonsterFallingDamage`

   TODO

- `MonstersTelefrag`

   TODO

- `NoInventoryBar`

   TODO

- `NoMonsters`

   TODO

- `No_Dlg_Freeze`

   TODO

- `OutsideFogDensity`

   TODO

- `PixelStretch`

   TODO

- `PolyGrind`

   TODO

- `RemoveItems`

   TODO

- `SkyFog`

   TODO

- `SndSeqTotalCtrl`

   TODO

- `TeamDamage`

   TODO

- `GetUDMFFloat`

   TODO

- `GetUDMFInt`

   TODO

- `GetUDMFString`

   TODO

- `ExecuteSpecial`

   TODO

- `ChangeSky`

   TODO

- `FormatMapName`

   TODO

- `GetChecksum`

   TODO

- `SetInterMusic`

   TODO

- `StartIntermission`

   TODO

- `TimeFormatted`

   TODO

- `IsCrouchingAllowed`

   TODO

- `IsFreelookAllowed`

   TODO

- `IsJumpingAllowed`

   TODO

- `GiveSecret`

   TODO

- `RemoveAllBots`

   TODO

- `StartSlideshow`

   TODO

- `WorldDone`

   TODO

- `GetAutomapPosition`

   TODO

- `IsPointInMap`

   TODO

- `SphericalCoords`

   TODO

- `Vec2Diff`

   TODO

- `Vec2Offset`

   TODO

- `Vec2OffsetZ`

   TODO

- `Vec3Diff`

   TODO

- `Vec3Offset`

   TODO

<!-- EOF -->
