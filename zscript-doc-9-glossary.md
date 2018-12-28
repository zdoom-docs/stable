Table of Contents
=================

<!-- vim-markdown-toc GFM -->

* [Glossary](#glossary)
* [Concepts](#concepts)
   * [Action Scoping](#action-scoping)
   * [Object Scoping](#object-scoping)
   * [Format String](#format-string)
   * [Sprite](#sprite)
   * [Game Tick](#game-tick)
   * [Interpolation](#interpolation)
* [Examples](#examples)
   * [Examples: Class headers](#examples-class-headers)
   * [Examples: Class definitions](#examples-class-definitions)
   * [Examples: Property definitions](#examples-property-definitions)
   * [Examples: Structure definitions](#examples-structure-definitions)
   * [Examples: Enumeration definitions](#examples-enumeration-definitions)
   * [Examples: Constant definitions](#examples-constant-definitions)
   * [Examples: Include directives](#examples-include-directives)
   * [Examples: Function argument lists](#examples-function-argument-lists)
   * [Examples: Expression statements](#examples-expression-statements)
   * [Examples: Conditional statements](#examples-conditional-statements)
   * [Examples: Switch statements](#examples-switch-statements)
   * [Examples: Control flow statements](#examples-control-flow-statements)
   * [Examples: Multi-assignment statements](#examples-multi-assignment-statements)
   * [Examples: Member declarations](#examples-member-declarations)
* [Versions](#versions)
   * [Version 3.1](#version-31)
   * [Version 3.2](#version-32)
   * [Version 3.2.1](#version-321)
   * [Version 3.2.2](#version-322)
   * [Version 3.2.3](#version-323)
   * [Version 3.2.4](#version-324)
   * [Version 3.2.5](#version-325)
   * [Version 3.3](#version-33)
   * [Version 3.3.1](#version-331)
   * [Version 3.3.2](#version-332)
   * [Version 3.4](#version-34)
   * [Version 3.5](#version-35)
   * [Version 3.5.1](#version-351)
   * [Version 3.6](#version-36)
   * [Version 3.7](#version-37)
* [Class Tree](#class-tree)
* [Structure List](#structure-list)

<!-- vim-markdown-toc -->

Glossary
========

Miscallaneous information about ZScript, including code examples and version differences go here.

Concepts
========

Action Scoping
--------------

On classes derived from Actor, states and methods can be scoped to a certain subset of uses. This is mainly to differentiate actions which take place in inventory items and weapons, and actions which take place in the actual game map, for disambiguating the `self` pointer usage. The available scopes are:

| Name      | Description                                   |
| ----      | -----------                                   |
| `actor`   | Actions are called from an actual map object. |
| `item`    | Actions are called from an inventory item.    |
| `overlay` | Actions are called from a weapon overlay.     |
| `weapon`  | Actions are called from a weapon.             |

These can be defined either in the `states` block header as-is, or in `Actor`'s `DefaultStateUsage` property with the following bit flags:

| Name          | Scope     |
| ----          | -----     |
| `SUF_ACTOR`   | `actor`   |
| `SUF_ITEM`    | `item`    |
| `SUF_OVERLAY` | `overlay` |
| `SUF_WEAPON`  | `weapon`  |

Object Scoping
--------------

Most objects are subject to object scoping, which restricts the way data can be used in certain contexts. This is to ensure that the game simulation does not get changed by the UI, for instance, or that the game simulation doesn't read from the UI and break network synchronization. In other words, it is to prevent a multitude of errors that arise when data is modified or read from the wrong places.

There are three scopes in ZScript: Play, UI, and Data (also known as "`clearscope`.") The Play scope is used for objects that are part of the game simulation and interact with the world in some way or another, while the UI scope is for objects that have no correlation with the world besides perhaps reading information from it. The Data scope is shared between the two, and must be used carefully.

Here is a chart of data access possibilities for each scope:

|                   | Data scope | Play scope | UI scope   |
| -                 | ---------- | ---------- | ---------- |
| From Data context | Read/write | Read-only  | No access  |
| From Play context | Read/write | Read/write | No access  |
| From UI context   | Read/write | Read-only  | Read/write |

Format String
-------------

A format string is a string that specifies the format of a conversion from arbitrary data to a contiguous character string. A format string contains normal characters and *conversion specifiers*. See [this page](https://en.cppreference.com/w/c/io/fprintf) for more information. Differences between C's `printf` and ZScript formats include:

- Since there's no `char` type, `int` is used for `%c`.
- `%s` also works for `name`.
- No `%n` specifier.
- An additional conversion specifier `%B` exists which converts a number to binary.
- An additional conversion specifier `%H` exists which works like `%g` but automatically selects the smallest appropriate precision.

Sprite
------

A sprite is stored in two numbers: the *sprite ID* (represented by the `spriteid` type or sometimes `int`) and the *sprite frame* (represented by an `int` or `uint8` usually.) The rotation is generally irrelevant as only the `0` (front rotation) frame is used in most contexts. The sprite frame is, unlike the file and state block representations, not a character, but an integer. The number `0` for instance represents the letter `A`, `1` to `B`, etc.

For more information on sprites and rotations, please refer to [the relevant Doom Wiki article](https://doomwiki.org/wiki/Sprite).

Game Tick
---------

The Doom engine, as long as it has existed and into every faithful-enough port of it, no matter how different from the source material, runs the game simulation in the same way:

- Input events are processed.

   Keyboard, mouse, gamepad, etc. if a local player, the demo file if watching a demo, packets over the internet in networked games.

- The game is *ticked*.

   Every 1/35th of a second that passes, a new "game tick" takes place, also referred to as *gametic*, *tick* or simply *tic*.

- The game is rendered.

   All information from the *current* game tick is rendered. This usually happens more often than the game is actually ticked. In ZDoom, Eternity Engine, and some other ports, the information is interpolated between the last and current game tick when there is extra time available to give smoother rendering.

For more information on ticks, please refer to [the relevant Doom Wiki article](https://doomwiki.org/wiki/Tic).

Interpolation
-------------

TODO

Examples
========

## Examples: Class headers

Various class headers:

```
class MyCoolObject // automatically inherits Object
class MyCoolScopedObject play // has Play scope
class MyCoolThinker : Thinker // inherits Thinker
class MyCoolActor : Actor replaces OtherActor
class MyCoolInterface abstract // can only be inherited
```

## Examples: Class definitions

Basic class definition with a member variable and member function:

```
class BasicClass
{
   int m_thing;

   void changeThing()
   {
      m_thing = 500;
   }
}
```

Alternate syntax usage:

```
class TheWholeFileIsAClassOhNo;

int m_mymember;

// end of file
```

## Examples: Property definitions

A class with some properties:

```
class MyCoolActor : Actor
{
   default
   {
      MyCoolActor.MyCoolMember 5000;
      MyCoolActor.MyCoolMemberList 501, 502;
   }

   int m_myCoolMember;
   int m_coolMember1, m_coolMember2;

   property MyCoolMember: m_myCoolMember;
   property MyCoolMemberList: m_coolMember1, m_coolMember2;
}
```

## Examples: Structure definitions

Simple structure:

```
struct MyCoolStructure
{
   int x;
   int y;
   int z;
}
```

## Examples: Enumeration definitions

Basic enumeration:

```
enum MyCoolEnum
{
   A, // has value int(0)
   B, // 1 ...
   C, // 2 ...
   D  // and 3
}
```

Less trivial example:

```
enum MyCoolerEnum : int16
{
   A = 500, // has value int16(500)
   B, // 501
   C = 200,
   D, // 201
   E, // 202
};
```

## Examples: Constant definitions

Making an integer constant from a double:

```
const MyCoolInt = int(777.7777);
```

## Examples: Include directives

Basic includes:

```
#include "zscript/MyCoolMod/MyCoolClasses.zsc"
```

## Examples: Function argument lists

With the function:

```
void fn(int one, int two, int a = 0, int b = 0);
```

One could do the following:

```
fn(4, 5);
fn(5, 6, 7);
fn(6, 7, 8, 9);
```

Or using named default arguments:

```
fn(5, 6, a: 7);
fn(6, 7, b: 8);
fn(7, 8, a: 9, b: 10);

// equivalent to:
fn(5, 6, 7);
// (no equivalent, must use above)
fn(7, 8, 9, 10);
```

## Examples: Expression statements

Some basic expressions:

```
myCoolFunction(5, 4);
m_myCoolMember = 500;
5 * 5; // does nothing of course, but valid
```

## Examples: Conditional statements

Simple conditional:

```
if(a)
   b();
```

Simple conditional, with else statement and a block:

```
if(a)
{
   b();
   c = d;
}
else
   e = f;
```

## Examples: Switch statements

A switch demonstrating fall-through and default cases:

```
switch(a)
{
case 500: Console.Printf("a is 500"); break;
case 501: Console.Printf("a is 501"); // falls through to next case
case 502: Console.Printf("a is 501 or 502"); break;
default:
   Console.Printf("not sure what a is!");
   // break is implied here
}
```

## Examples: Control flow statements

Use of `continue`:

```
for(int i = 0; i < 50; i++)
{
   if(i == 25) continue; // don't do anything on 25!

   doThing(i);
}
```

Use of `break`:

```
for(int i = 0; i < 50; i++)
{
   if(i == 25) break; // exit the loop at 25!

   doThing(i);
}
```

Use of `return` in various contexts:

```
void returnsNothing()
{
   if(m_thing != 50) return; // exit early if m_thing isn't 50.

   doThing(m_thing);
}

int returnsInt()
{
   if(m_thing == 50)
      return 50; // m_thing is 50, so return 50.

   return 0; // must have a return eventually
}

int, int returnsTwoInts()
{
   return 1, 2; // returns 1 and 2.
}
```

## Examples: Multi-assignment statements

Getting the actor out of `A_SpawnItemEx`:

```
Actor mo;
bool spawned;
[spawned, mo] = A_SpawnItemEx("MyCoolActor");
```

## Examples: Member declarations

Some basic member variables:

```
int m_myCoolInt;
int m_coolInt1, m_coolInt2, m_coolInt3;
int[10] m_coolIntArray;
private int m_coolPrivateInt;
protected meta int m_coolMetaInt;
```

Versions
========

Here is a list of differences between ZScript versions:

## Version 3.1

- Added `Actor::CheckFakeFloorTriggers`.
- Added `Actor::ORIG_FRICTION_FACTOR`.
- Added `Actor::ORIG_FRICTION`.
- Added `HarmonyStatusBar`.
- Added `LAF_OVERRIDEZ`.
- Added `LevelLocals::AllowRespawn`.
- Added `LevelLocals::IsCrouchingAllowed`.
- Added `LevelLocals::IsFreelookAllowed`.
- Added `LevelLocals::IsJumpingAllowed`.
- Added `ListMenuItemSlider::mDrawX`.
- Added `LocalViewPitch`.
- Added `PlayerInfo::Cmd`.
- Added `PlayerInfo::IsTotallyFrozen`.
- Added `PlayerInfo::Original_Cmd`.
- Added `PlayerInfo::Uncrouch`.
- Added `PlayerPawn::BestWeapon`.
- Added `PlayerPawn::Bob`.
- Added `PlayerPawn::CROUCHSPEED`.
- Added `PlayerPawn::CalcHeight`.
- Added `PlayerPawn::CheckAirSupply`.
- Added `PlayerPawn::CheckCheats`.
- Added `PlayerPawn::CheckCrouch`.
- Added `PlayerPawn::CheckDegeneration`.
- Added `PlayerPawn::CheckEnvironment`.
- Added `PlayerPawn::CheckFOV`.
- Added `PlayerPawn::CheckFrozen`.
- Added `PlayerPawn::CheckJump`.
- Added `PlayerPawn::CheckMoveUpDown`.
- Added `PlayerPawn::CheckMusicChange`.
- Added `PlayerPawn::CheckPitch`.
- Added `PlayerPawn::CheckPoison`.
- Added `PlayerPawn::CheckUndoMorph`.
- Added `PlayerPawn::CheckUse`.
- Added `PlayerPawn::CheckWeaponButtons`.
- Added `PlayerPawn::CheckWeaponChange`.
- Added `PlayerPawn::CheckWeaponFire`.
- Added `PlayerPawn::CrouchMove`.
- Added `PlayerPawn::DeathThink`.
- Added `PlayerPawn::FireWeaponAlt`.
- Added `PlayerPawn::FireWeapon`.
- Added `PlayerPawn::ForwardThrust`.
- Added `PlayerPawn::HandleMovement`.
- Added `PlayerPawn::MovePlayer`.
- Added `PlayerPawn::PlayerThink`.
- Added `PlayerPawn::TURN180_TICKS`.
- Added `PlayerPawn::TickPSprites`.
- Added `PlayerPawn::TweakSpeeds`.
- Added `SBarInfo::GetProtrusion`.
- Added `SVEFlagSpot*`.
- Added `SVELight`.
- Added `UserCmd`.
- Added `offsetz` parameter to `Actor::LineAttack`.
- Added override for `DoomStatusBar::DrawAutomapHUD`.
- Added override for `SBarInfoWrapper::GetProtrusion`.
- Made `PlayerInfo::Cls` not `readonly`.

## Version 3.2

- Added `+DYNAMICLIGHT.ADDITIVE`.
- Added `+DYNAMICLIGHT.ATTENUATE`.
- Added `+DYNAMICLIGHT.SUBTRACTIVE`.
- Added `+ZDOOMTRANS`.
- Added `Actor::A_SoundVolume`.
- Added `Actor::CameraFOV`.
- Added `Actor::CheckPortalTransition`.
- Added `Actor::FloatBobStrength`.
- Added `Actor::RenderHidden`.
- Added `Actor::RenderRequired`.
- Added `ActorRenderFeatureFlag`.
- Added `DropItem::Amount`.
- Added `FCheckPosition::PortalGroup`.
- Added `Font::CR_FIRE`.
- Added `Font::CR_ICE`.
- Added `Font::CR_SAPPHIRE`.
- Added `Font::CR_TEAL`.
- Added `Font::TEXTCOLOR_FIRE`.
- Added `Font::TEXTCOLOR_ICE`.
- Added `Font::TEXTCOLOR_SAPPHIRE`.
- Added `Font::TEXTCOLOR_TEAL`.
- Added `LevelLocals::GiveSecret`.
- Added `Shader`.
- Added `String::IndexOf`.
- Added `String::LastIndexOf`.
- Added `String::ToDouble`.
- Added `String::ToInt`.
- Added `String::ToLower`.
- Added `String::ToUpper`.
- Added `TEXTCOLOR_FIRE`.
- Added `TEXTCOLOR_ICE`.
- Added `TEXTCOLOR_SAPPHIRE`.
- Added `TEXTCOLOR_TEAL`.
- Added `Thinker::STAT_USER_MAX`.
- Added `Thinker::STAT_USER`.
- Changed `Screen::SetCameraToTexture`'s `fov` parameter to `double`.
- Fixed `BlockLinesIterator::Create*` returning the wrong type.

## Version 3.2.1

- Added `GameInfoStruct::mSliderColor`.

## Version 3.2.2

- Added `Actor::Warp`.
- Added `CVar::GetBool`.
- Added `CVar::SetBool`.
- Added `EmptyTokenType`.
- Added `LAF_ABSOFFSET`.
- Added `LAF_ABSPOSITION`.
- Added `LAF_TARGETISSOURCE`.
- Added `PlayerPawn::GetClassicFlight`.
- Added `String::Remove`.
- Added `String::Split`.
- Added `TexMan::GetName`.
- Added `Wads::CheckNumForFullName`.
- Added `Wads::FindLumpNamespace`.
- Added `Wads::FindLump`.
- Added `Wads::ReadLump`.
- Added `endIndex` parameter for `String::LastIndexOf`.
- Added `offsetforward` and `offsetside` parameters for `Actor::LineAttack`.
- Made `Array::Find` be `const`.
- Made `Array::Max` be `const`.

## Version 3.2.3

- Made `Ceiling::CreateCeiling` be `static`.

## Version 3.2.4

- Added `DMG_NO_PAIN`.

## Version 3.2.5

- Added `Actor::CheckMove`.
- Added `ECheckMoveFlags`.
- Added `LevelLocals::PixelStretch`.
- Added `LevelLocals::Vec2Diff`.
- Added `LevelLocals::Vec3Diff`.
- Added `SKILLP_PlayerRespawn`.
- Added `Screen::DrawLine`.
- Added `alpha2` parameter to `Actor::A_SetBlend`.
- Changed `Thinker::Tics2Seconds`' logic.

## Version 3.3

- Added `Actor::ACS_ScriptCall`.
- Added `Actor::Distance2DSquared`.
- Added `Actor::Distance3DSquared`.
- Added `Actor::FriendlySeeBlocks`.
- Added `Actor::GetRadiusDamage`.
- Added `Actor::LineTrace`.
- Added `Array` specialization for `Object`.
- Added `BaseStatusBar::AttachMessage`.
- Added `BaseStatusBar::DI_MIRROR`.
- Added `BaseStatusBar::DetachAllMessages`.
- Added `BaseStatusBar::DetachMessageID`.
- Added `BaseStatusBar::DetachMessage`.
- Added `BaseStatusBar::EHUDMSGLayer`.
- Added `CHAN_LOOP`.
- Added `DynamicLight::SpotInnerAngle`.
- Added `DynamicLight::SpotOuterAngle`.
- Added `ETrace*`, `ELineTier`, `ELineTraceFlags`.
- Added `FLineTargetData`.
- Added `HudMessageBase`.
- Added `Inventory::AltHUDIcon`.
- Added `LevelLocals::ChangeSky`.
- Added `LevelLocals::GetChecksum`.
- Added `LevelLocals::SkySpeed1`.
- Added `LevelLocals::SkySpeed2`.
- Added `LevelLocals::SkyTexture1`.
- Added `LevelLocals::SkyTexture2`.
- Added `LineTracer`.
- Added `Object::S_GetLength`.
- Added `OptionMenuItemCommand::mCloseOnSelect`.
- Added `OptionMenuItemLabeledSubmenu`.
- Added `OptionMenuItemOptionBase::IsGrayed`.
- Added `ReverbEdit`.
- Added `Screen::GetViewWindow`.
- Added `Sector::CeilingData`.
- Added `Sector::FloorData`.
- Added `Sector::LightingData`.
- Added `SectorEffect::GetSector`.
- Added `SpotLight* classes`.
- Added `StaticEventHandler::PostUiTick`.
- Added `StaticEventHandler::WorldLineActivated`.
- Added `StaticEventHandler::WorldLinePreActivated`.
- Added `StrifeDialogueNode::MenuClassName`.
- Added `StrifeDialogueNode::UserData`.
- Added `TraceResults`.
- Added `WorldEvent::ActivatedLine`.
- Added `WorldEvent::ShouldActivate`.
- Default parameters in overridden virtual functions are now an error.
- Made `SecPlane::HeightDiff` be `const`.
- Made `SecPlane::ZatPoint` be `clearscope`.
- Made `Side::V1` be `clearscope`.
- Made `Side::V2` be `clearscope`.
- Made `Weapon::CheckAmmo` and `Weapon::DepleteAmmo` be `virtual`.
- Renamed `DynamicLight::ELightType::SpotLight` to `DummyLight`.

## Version 3.3.1

- Made `A_SetSize`'s `radius` parameter have a default.
- Made `Side::Sector` and `Side::Linedef` be `readonly`.
- Made all `DehInfo` members `readonly`.
- Made all `State` members `readonly`.

## Version 3.3.2

- Added `Line::Activate`.
- Added `Line::RemoteActivate`.
- Added `SPAC`.

## Version 3.4

- Added "`internal`" keyword.
- Added `Actor::OnGiveSecret`.
- Added `DTA_Color`.
- Added `DTA_Desaturate`.
- Added `DTA_FlipY`.
- Added `DTA_SrcHeight`.
- Added `DTA_SrcWidth`.
- Added `DTA_SrcX`.
- Added `DTA_SrcY`.
- Added `LevelLocals::Vec2OffsetZ`.
- Added `LevelLocals::Vec2Offset`.
- Added `LevelLocals::Vec3Offset`.
- Added `Line::ESide`.
- Added `WorldEvent::ActivationType`.
- Changed `PlayerPawn::ResetAirSupply`'s `playgasp` default to `true`.
- Made `LevelLocals::SectorPortals` be `internal`.
- Made `Sector::Portals` be `internal`.

## Version 3.5

- Added `DTA_LegacyRenderStyle`.
- Added `MeansOfDeath` parameter to `Actor::Die`.
- Added `Menu::SetVideoMode`.
- Added `Screen::DrawShape`.
- Added `Shape2D`.
- Replaced `ListMenuItemPlayerDisplay::mTranslation` with `mBaseColor` and `mAddColor`.

## Version 3.5.1

- Added `String::RightIndexOf`.
- Deprecated `String::LastIndexOf`.
- Made `Actor::AbsAngle` be `clearscope`.
- Made `Actor::AngleToVector` be `clearscope`.
- Made `Actor::BobSin` be `clearscope`.
- Made `Actor::DeltaAngle` be `clearscope`.
- Made `Actor::FindState` be `clearscope`.
- Made `Actor::GetDefaultSpeed` be `clearscope`.
- Made `Actor::GetDropItems` be `clearscope`.
- Made `Actor::Normalize180` be `clearscope`.
- Made `Actor::RotateVector` be `clearscope`.

## Version 3.6

- Added `Actor::A_CheckForResurrection`.
- Added `Actor::A_RaiseSelf`.
- Added `Actor::CanRaise`.
- Added `Actor::Revive`.
- Added `DMG_EXPLOSION`.
- Added `GLTextureGLOptions`.
- Added `Inventory::OnDrop`.
- Added `LevelLocals::SphericalCoords`.
- Added `Screen::DrawThickLine`.
- Added `StaticEventHandler::CheckReplacement`.
- Added `StaticEventHandler::NewGame`.
- Added `TRF_SOLIDACTORS`, `TRF_BLOCKUSE`, and `TRF_BLOCKSELF`.
- Made `StatusScreen::End` be `virtual`.

## Version 3.7

- Added "`flagdef`" keyword.
- Added `ALF_NOWEAPONCHECK`.
- Added `Actor::AimBulletMissile`.
- Added `Actor::ApplyKickBack`.
- Added `Actor::Blocking3DFloor`.
- Added `Actor::BlockingCeiling`.
- Added `Actor::BlockingFloor`.
- Added `Actor::CanResurrect`.
- Added `Actor::CheckFor3DCeilingHit`.
- Added `Actor::CheckFor3DFloorHit`.
- Added `Actor::CheckMonsterUseSpecials`.
- Added `Actor::CheckSplash`.
- Added `Actor::DaggerAlert`.
- Added `Actor::DefMorphTicks`.
- Added `Actor::DestroyAllInventory`.
- Added `Actor::DisplayNameTag`.
- Added `Actor::DoGiveInventory`.
- Added `Actor::DoTakeInventory`.
- Added `Actor::GetAge`.
- Added `Actor::GetLevelSpawnTime`.
- Added `Actor::Grind`.
- Added `Actor::InitSpawnedItem`.
- Added `Actor::Morph`.
- Added `Actor::MorphedDeath`.
- Added `Actor::RadiusAttack`.
- Added `Actor::RailAttack`.
- Added `Actor::RaiseActor`.
- Added `Actor::RestoreRenderStyle`.
- Added `Actor::ShouldSpawn`.
- Added `Actor::SpawnLineAttackBlood`.
- Added `Actor::SpawnTime`.
- Added `Actor::Substitute`.
- Added `Actor::TriggerPainChance`.
- Added `Actor::UnMorph`.
- Added `Actor::VelIntercept`.
- Added `Actor::bBounceOnUnrippables`.
- Added `Actor::bDontBounceOnSky`.
- Added `Actor::bNOFRICTIONBOUNCE`.
- Added `Actor::bNOFRICTION`.
- Added `AllClasses`.
- Added `Alpha` parameter to `Screen::DrawLine`.
- Added `Alpha` parameter to `Screen::DrawThickLine`.
- Added `AltHud`.
- Added `AmbientSound::MarkAmbientSounds`.
- Added `AutoUseHealthInfo`.
- Added `BaseStatusBar::UpdateScreenGeometry`.
- Added `Bobbing`.
- Added `DMG_NO_ENHANCE`.
- Added `Decal::SpawnDecal`.
- Added `Destructible`.
- Added `DynamicLight::SetOffset`.
- Added `EChangeLevelFlags`.
- Added `EFinishLevelType`.
- Added `EPlayerGender`.
- Added `FLineTraceData::TRACE_HasHitSky`.
- Added `FRailParams`.
- Added `Font::GetBottomAlignOffset`.
- Added `GameInfoStruct::BerserkPic`.
- Added `GameInfoStruct::DefKickBack`.
- Added `GameInfoStruct::DefaultBloodColor`.
- Added `GameInfoStruct::DefaultDropStyle`.
- Added `GameInfoStruct::HealthPic`.
- Added `GameInfoStruct::TeleFogHeight`.
- Added `HealthGroup`.
- Added `IntermissionSequenceType`.
- Added `Inventory::PrevInv`.
- Added `Inventory::SetGiveAmount`.
- Added `Inventory::UseAll`.
- Added `Key::GetKeyTypeCount`.
- Added `Key::GetKeyType`.
- Added `LevelLocals::Cluster_Hub`.
- Added `LevelLocals::DeathSequence`.
- Added `LevelLocals::GetAutomapPosition`.
- Added `LevelLocals::IsPointInMap`.
- Added `LevelLocals::KeepFullInventory`.
- Added `LevelLocals::RemoveItems`.
- Added `LevelLocals::StartIntermission`.
- Added `Line::GetHealth`.
- Added `Line::HealthGroup`.
- Added `Line::Health`.
- Added `Line::SetHealth`.
- Added `MorphedMonster::FlagsSave`.
- Added `MorphedMonster::UndoMonsterMorph`.
- Added `NetGame`.
- Added `Object::MarkSound`.
- Added `PF_HITSKY`.
- Added `PSprite::ResetInterpolation`.
- Added `PlayerInfo::GetDeltaViewHeight`.
- Added `PlayerInfo::GetWBobSpeed`.
- Added `PlayerPawn::ActivateMorphWeapon`.
- Added `PlayerPawn::AutoUseHealth`.
- Added `PlayerPawn::AutoUseStrifeHealth`.
- Added `PlayerPawn::BobWeapon`.
- Added `PlayerPawn::BringUpWeapon`.
- Added `PlayerPawn::CheatMorph`.
- Added `PlayerPawn::CheatSetInv`.
- Added `PlayerPawn::CheatTakeWeaps`.
- Added `PlayerPawn::CurBob`.
- Added `PlayerPawn::DropWeapon`.
- Added `PlayerPawn::EndAllPowerupEffects`.
- Added `PlayerPawn::FilterCoopRespawnInventory`.
- Added `PlayerPawn::FindMostRecentWeapon`.
- Added `PlayerPawn::GetTeleportFreezeTime`.
- Added `PlayerPawn::GiveDefaultInventory`.
- Added `PlayerPawn::InitAllPowerupEffects`.
- Added `PlayerPawn::InvNext`.
- Added `PlayerPawn::InvPrev`.
- Added `PlayerPawn::MarkPlayerSounds`.
- Added `PlayerPawn::MorphPlayer`.
- Added `PlayerPawn::Num_Weapon_Slots`.
- Added `PlayerPawn::PickNewWeapon`.
- Added `PlayerPawn::PickNextWeapon`.
- Added `PlayerPawn::PickPrevWeapon`.
- Added `PlayerPawn::PickWeapon`.
- Added `PlayerPawn::PlayerFinishLevel`.
- Added `PlayerPawn::TeleportFreezeTime`.
- Added `PlayerPawn::UndoPlayerMorph`.
- Added `RadiusDamageFlags`.
- Added `SKILLP_KickBackFactor`.
- Added `ScriptUtil`.
- Added `SecActDamage3D`.
- Added `SecActDamageCeiling`.
- Added `SecActDamageFloor`.
- Added `SecActDeath3D`.
- Added `SecActDeathCeiling`.
- Added `SecActDeathFloor`.
- Added `Sector::AdditiveColors`.
- Added `Sector::GetHealth`.
- Added `Sector::HealthCeilingGroup`.
- Added `Sector::HealthCeiling`.
- Added `Sector::HealthFloorGroup`.
- Added `Sector::HealthFloor`.
- Added `Sector::SECF_NOATTACK`.
- Added `Sector::SetAdditiveColor`.
- Added `Sector::SetHealth`.
- Added `SectorAction::SECSPAC_Damage3D`.
- Added `SectorAction::SECSPAC_DamageCeiling`.
- Added `SectorAction::SECSPAC_DamageFloor`.
- Added `SectorAction::SECSPAC_Death3D`.
- Added `SectorAction::SECSPAC_DeathCeiling`.
- Added `SectorAction::SECSPAC_DeathFloor`.
- Added `SectorPart`.
- Added `Side::EnableAdditiveColor`.
- Added `Side::GetAdditiveColor`.
- Added `Side::SetAdditiveColor`.
- Added `Side::SetSpecialColor`.
- Added `Side::WallBottom`.
- Added `Side::WallTop`.
- Added `State::InStateSequence`.
- Added `StaticEventHandler::WorldLineDamaged`.
- Added `StaticEventHandler::WorldSectorDamaged`.
- Added `TRACE_HasHitSky`.
- Added `Vertex::Index`.
- Added `Weapon::CheckAddToSlots`.
- Added `Weapon::DoReadyWeaponDisableSwitch`.
- Added `Weapon::DoReadyWeaponToBob`.
- Added `Weapon::DoReadyWeaponToFire`.
- Added `Weapon::DoReadyWeaponToSwitch`.
- Added `Weapon::GetButtonStateFlags`.
- Added `Weapon::PlayUpSound`.
- Added `Weapon::PostMorphWeapon`.
- Added `Weapon::SlotPriority`.
- Added `WeaponSlots::GetWeapon`.
- Added `WeaponSlots::SetupWeaponSlots`.
- Added `WeaponSlots::SlotSize`.
- Added `WorldEvent::DamageIsRadius`.
- Added `WorldEvent::DamageLineSide`.
- Added `WorldEvent::DamageLine`.
- Added `WorldEvent::DamagePosition`.
- Added `WorldEvent::DamageSectorPart`.
- Added `WorldEvent::DamageSector`.
- Added `WorldEvent::NewDamage`.
- Changed `PlayerInfo::PremorphWeapon`'s type to `Weapon`.
- Deprecated `Actor::CheckClass`.
- Deprecated `Actor::GetAngle`.
- Deprecated `Actor::GetDistance`.
- Deprecated `Actor::GetSpriteAngle`.
- Deprecated `Actor::GetSpriteRotation`.
- Deprecated `PlayerInfo::BringUpWeapon`.
- Deprecated `PlayerInfo::DropWeapon`.
- Deprecated `PlayerInfo::MorphPlayer`.
- Deprecated `PlayerInfo::UndoPlayerMorph`.
- Deprecated `Weapon::MinAmmo1`.
- Deprecated `Weapon::MinAmmo2`.
- Deprecated `Weapon::WeaponFlags`.
- Made `Actor::A_PlaySound` be `clearscope`.
- Made `Actor::ClearInventory` be `virtual`.
- Made `Actor::GetPointer` be `clearscope`.
- Made `Actor::InStateSequence` be `static`.
- Made `Actor::MorphMonster` be `virtual`.
- Made `Actor::UseInventory` be `virtual`.
- Made `Ammo::GetParentAmmo` be `virtual`.
- Made `BaseStatusBar::ArtiFlashTick` be `clearscope`.
- Made `BaseStatusBar::FlashItem` be `clearscope`.
- Made `BaseStatusBar::ItemFlashFade` be `clearscope`.
- Made `Inventory::ModifyDropAmount` be `virtual`.
- Made `Object::ChangeStatNum` not be `virtual`.
- Made `Sector::PointInSector` be `clearscope`.
- Made `Weapon::SlotNumber` be `meta`.
- Made `WeaponSlots::LocateWeapon` be `const`.

Class Tree
==========

Here is a full tree of all classes in ZScript as of GZDoom 3.7.0. There are 1456 classes total.

```
Object
├ ActorIterator
├ AltHud
├ BaseStatusBar
│ ├ DoomStatusBar
│ │ └ HarmonyStatusBar
│ ├ HereticStatusBar
│ ├ HexenStatusBar
│ ├ SBarInfoWrapper
│ └ StrifeStatusBar
├ BlockLinesIterator
├ BlockThingsIterator
├ Bot
├ BrokenLines
├ DynamicValueInterpolator
├ HUDFont
├ HUDMessageBase
├ InterBackground
├ InventoryBarState
├ LevelCompatibility
├ LinearValueInterpolator
├ LineIdIterator
├ LineTracer
├ Menu
│ ├ ConversationMenu
│ ├ EnterKey
│ ├ GenericMenu
│ │ └ ReadThisMenu
│ ├ ListMenu
│ │ ├ LoadSaveMenu
│ │ │ ├ LoadMenu
│ │ │ └ SaveMenu
│ │ └ PlayerMenu
│ ├ MessageBoxMenu
│ ├ OptionMenu
│ │ ├ ColorpickerMenu
│ │ ├ CompatibilityMenu
│ │ ├ GameplayMenu
│ │ ├ GLTextureGLOptions
│ │ ├ JoystickConfigMenu
│ │ ├ ReverbEdit
│ │ ├ ReverbSave
│ │ ├ ReverbSelect
│ │ └ VideoModeMenu
│ └ TextEnterMenu
├ MenuDescriptor
│ ├ ListMenuDescriptor
│ └ OptionMenuDescriptor
├ MenuItemBase
│ ├ ListMenuItem
│ │ ├ ListMenuItemPlayerDisplay
│ │ ├ ListMenuItemSelectable
│ │ │ ├ ListMenuItemPatchItem
│ │ │ ├ ListMenuItemPlayerNameBox
│ │ │ ├ ListMenuItemSlider
│ │ │ ├ ListMenuItemTextItem
│ │ │ └ ListMenuItemValueText
│ │ ├ ListMenuItemStaticPatch
│ │ │ └ ListMenuItemStaticPatchCentered
│ │ └ ListMenuItemStaticText
│ │   └ ListMenuItemStaticTextCentered
│ └ OptionMenuItem
│   ├ OptionMenuFieldBase
│   │ ├ OptionMenuItemNumberField
│   │ └ OptionMenuItemTextField
│   ├ OptionMenuItemColorPicker
│   ├ OptionMenuItemControlBase
│   │ ├ OptionMenuItemControl
│   │ └ OptionMenuItemMapControl
│   ├ OptionMenuItemOptionBase
│   │ ├ OptionMenuItemInverter
│   │ ├ OptionMenuItemJoyMap
│   │ ├ OptionMenuItemOption
│   │ ├ OptionMenuItemReverbOption
│   │ └ OptionMenuItemReverbSaveSelect
│   ├ OptionMenuItemScreenResolution
│   ├ OptionMenuItemStaticText
│   ├ OptionMenuItemStaticTextSwitchable
│   ├ OptionMenuItemSubMenu
│   │ ├ OptionMenuItemCommand
│   │ │ └ OptionMenuItemSafeCommand
│   │ ├ OptionMenuItemJoyConfigMenu
│   │ ├ OptionMenuItemLabeledSubmenu
│   │ └ OptionMenuItemReverbSelect
│   └ OptionMenuSliderBase
│     ├ OptionMenuItemSlider
│     │ └ OptionMenuItemScaleSlider
│     ├ OptionMenuItemSliderReverbEditOption
│     ├ OptionMenuSliderJoyDeadZone
│     ├ OptionMenuSliderJoyScale
│     ├ OptionMenuSliderJoySensitivity
│     └ OptionMenuSliderVar
├ PointLightFlickerRandomAdditive
├ PointLightFlickerRandomAttenuated
├ PSprite
├ ScriptUtil
├ SectorTagIterator
├ SeqNode
├ Shape2D
├ SpotState
├ StaticEventHandler
│ └ EventHandler
├ StatusScreen
│ ├ CoopStatusScreen
│ ├ DeathmatchStatusScreen
│ └ DoomStatusScreen
│   └ RavenStatusScreen
├ Thinker
│ ├ Actor
│ │ ├ AlienAspClimber
│ │ ├ AlienBubbleColumn
│ │ ├ AlienCeilingBubble
│ │ ├ AlienChunkLarge
│ │ ├ AlienChunkSmall
│ │ ├ AlienFloorBubble
│ │ ├ AlienSpiderLight
│ │ ├ AmbientSound
│ │ │ └ AmbientSoundNoGravity
│ │ ├ AmmoFiller
│ │ ├ Anvil
│ │ ├ Arachnotron
│ │ │ └ StealthArachnotron
│ │ ├ ArachnotronPlasma
│ │ ├ Archvile
│ │ │ └ StealthArchvile
│ │ ├ ArchvileFire
│ │ ├ Arrow
│ │ ├ AxeBlood
│ │ ├ AxePuff
│ │ │ └ AxePuffGlow
│ │ ├ Bang4Cloud
│ │ ├ BaronBall
│ │ ├ BaronOfHell
│ │ │ ├ Flembrane
│ │ │ ├ HellKnight
│ │ │ │ └ StealthHellKnight
│ │ │ └ StealthBaron
│ │ ├ BarricadeColumn
│ │ ├ Bat
│ │ ├ Beast
│ │ ├ BeastBall
│ │ ├ BFGBall
│ │ │ └ LAZBall
│ │ ├ BFGExtra
│ │ ├ BigTree
│ │ │ └ ChexBananaTree
│ │ ├ BigTree2
│ │ ├ Bishop
│ │ ├ BishopBlur
│ │ ├ BishopFX
│ │ ├ BishopMissile
│ │ ├ BishopPainBlur
│ │ ├ BishopPuff
│ │ ├ BlastEffect
│ │ ├ BlasterPuff
│ │ ├ BlasterSmoke
│ │ ├ Blood
│ │ ├ BloodPool
│ │ ├ BloodscourgeDrop
│ │ ├ BloodSplash
│ │ ├ BloodSplashBase
│ │ ├ BloodSplatter
│ │ ├ BloodyTwitch
│ │ │ └ NonsolidTwitch
│ │ ├ BlueTorch
│ │ │ └ ChexSlimeFountain
│ │ ├ BossBrain
│ │ ├ BossEye
│ │ ├ BrainStem
│ │ ├ BrassTorch
│ │ ├ BridgeBall
│ │ ├ BulletPuff
│ │ ├ BurningBarrel
│ │ ├ BurningBowl
│ │ ├ BurningBrazier
│ │ ├ Cacodemon
│ │ │ ├ DeadCacodemon
│ │ │ └ StealthCacodemon
│ │ ├ CacodemonBall
│ │ ├ CageLight
│ │ ├ CajunBodyNode
│ │ ├ CajunTrace
│ │ ├ Candelabra
│ │ │ └ ChexGasTank
│ │ ├ Candle
│ │ ├ Candlestick
│ │ │ └ ChexChemicalFlask
│ │ ├ CavePillarBottom
│ │ ├ CavePillarTop
│ │ ├ CeilingChain
│ │ ├ CeilingTurret
│ │ ├ Centaur
│ │ │ ├ CentaurLeader
│ │ │ └ CentaurMash
│ │ ├ CentaurFX
│ │ ├ CentaurShield
│ │ ├ CentaurSword
│ │ ├ CFlameFloor
│ │ ├ ChaingunGuy
│ │ │ └ StealthChaingunGuy
│ │ ├ ChimneyStack
│ │ ├ CircleFlame
│ │ ├ ClericBoss
│ │ ├ Clink
│ │ ├ ColonGibs
│ │ ├ ColorSetter
│ │ ├ Column
│ │ │ └ ChexLandingLight
│ │ ├ CommanderKeen
│ │ ├ Computer
│ │ ├ CorpseBit
│ │ ├ CorpseBloodDrip
│ │ ├ CrossbowFX1
│ │ │ ├ CrossbowFX2
│ │ │ └ CrossbowFX3
│ │ ├ CrossbowFX4
│ │ ├ Crusader
│ │ ├ CrusaderMissile
│ │ ├ CStaffMissile
│ │ ├ CStaffPuff
│ │ ├ CustomBridge
│ │ │ ├ Bridge
│ │ │ └ ZBridge
│ │ ├ CustomSprite
│ │ ├ Cyberdemon
│ │ ├ Dart
│ │ │ └ PoisonDart
│ │ ├ DeadAcolyte
│ │ ├ DeadCrusader
│ │ ├ DeadMarine
│ │ ├ DeadPeasant
│ │ ├ DeadReaver
│ │ ├ DeadRebel
│ │ ├ DeadStick
│ │ │ └ ChexTallFlower2
│ │ ├ DeadStrifePlayer
│ │ ├ Decal
│ │ ├ Demon
│ │ │ ├ DeadDemon
│ │ │ ├ FlemoidusCycloptisCommonus
│ │ │ ├ Spectre
│ │ │ └ StealthDemon
│ │ ├ Demon1
│ │ │ ├ Demon1Mash
│ │ │ └ Demon2
│ │ │   └ Demon2Mash
│ │ ├ Demon1FX1
│ │ ├ Demon2FX1
│ │ ├ DemonChunk
│ │ │ ├ Demon1Chunk1
│ │ │ ├ Demon1Chunk2
│ │ │ ├ Demon1Chunk3
│ │ │ ├ Demon1Chunk4
│ │ │ ├ Demon1Chunk5
│ │ │ ├ Demon2Chunk1
│ │ │ ├ Demon2Chunk2
│ │ │ ├ Demon2Chunk3
│ │ │ ├ Demon2Chunk4
│ │ │ └ Demon2Chunk5
│ │ ├ Dirt1
│ │ ├ Dirt2
│ │ ├ Dirt3
│ │ ├ Dirt4
│ │ ├ Dirt5
│ │ ├ Dirt6
│ │ ├ DirtClump
│ │ ├ DoomBuilderCamera
│ │ ├ DoomImp
│ │ │ ├ ArmoredFlemoidusBipedicus
│ │ │ ├ DeadDoomImp
│ │ │ └ StealthDoomImp
│ │ ├ DoomImpBall
│ │ ├ DoomUnusedStates
│ │ ├ Dragon
│ │ ├ DragonExplosion
│ │ ├ DragonFireball
│ │ ├ DynamicLight
│ │ │ ├ PointLight
│ │ │ │ ├ PointLightAdditive
│ │ │ │ ├ PointLightAttenuated
│ │ │ │ ├ PointLightFlicker
│ │ │ │ │ ├ PointLightFlickerAdditive
│ │ │ │ │ ├ PointLightFlickerAttenuated
│ │ │ │ │ └ PointLightFlickerSubtractive
│ │ │ │ ├ PointLightFlickerRandom
│ │ │ │ │ └ PointLightFlickerRandomSubtractive
│ │ │ │ ├ PointLightPulse
│ │ │ │ │ ├ PointLightPulseAdditive
│ │ │ │ │ ├ PointLightPulseAttenuated
│ │ │ │ │ └ PointLightPulseSubtractive
│ │ │ │ ├ PointLightSubtractive
│ │ │ │ ├ SectorPointLight
│ │ │ │ │ ├ SectorPointLightAdditive
│ │ │ │ │ ├ SectorPointLightAttenuated
│ │ │ │ │ └ SectorPointLightSubtractive
│ │ │ │ └ SVELight
│ │ │ │   ├ SVELight7958
│ │ │ │   ├ SVELight7959
│ │ │ │   ├ SVELight7960
│ │ │ │   ├ SVELight7961
│ │ │ │   ├ SVELight7962
│ │ │ │   ├ SVELight7964
│ │ │ │   ├ SVELight7965
│ │ │ │   ├ SVELight7971
│ │ │ │   ├ SVELight7972
│ │ │ │   ├ SVELight7973
│ │ │ │   └ SVELight7974
│ │ │ ├ SpotLight
│ │ │ │ ├ SectorSpotLight
│ │ │ │ │ ├ SectorSpotLightAdditive
│ │ │ │ │ ├ SectorSpotLightAttenuated
│ │ │ │ │ └ SectorSpotLightSubtractive
│ │ │ │ ├ SpotLightAdditive
│ │ │ │ ├ SpotLightAttenuated
│ │ │ │ ├ SpotLightFlicker
│ │ │ │ │ ├ SpotLightFlickerAdditive
│ │ │ │ │ ├ SpotLightFlickerAttenuated
│ │ │ │ │ └ SpotLightFlickerSubtractive
│ │ │ │ ├ SpotLightFlickerRandom
│ │ │ │ │ ├ SpotLightFlickerRandomAdditive
│ │ │ │ │ ├ SpotLightFlickerRandomAttenuated
│ │ │ │ │ └ SpotLightFlickerRandomSubtractive
│ │ │ │ ├ SpotLightPulse
│ │ │ │ │ ├ SpotLightPulseAdditive
│ │ │ │ │ ├ SpotLightPulseAttenuated
│ │ │ │ │ └ SpotLightPulseSubtractive
│ │ │ │ └ SpotLightSubtractive
│ │ │ └ VavoomLight
│ │ │   ├ VavoomLightColor
│ │ │   └ VavoomLightWhite
│ │ ├ ElectricBolt
│ │ ├ EntityNest
│ │ ├ EntityPod
│ │ ├ Ettin
│ │ │ └ EttinMash
│ │ ├ EttinMace
│ │ ├ EvilEye
│ │ │ └ ChexChemicalBurner
│ │ ├ ExplosiveBarrel
│ │ ├ ExplosiveBarrel2
│ │ ├ FadeSetter
│ │ ├ FastProjectile
│ │ │ ├ BlasterFX1
│ │ │ ├ CFlameMissile
│ │ │ └ MageWandMissile
│ │ ├ FatShot
│ │ ├ Fatso
│ │ │ └ StealthFatso
│ │ ├ Feather
│ │ ├ FighterBoss
│ │ ├ FireBall
│ │ ├ FireBomb
│ │ ├ FireDemon
│ │ ├ FireDemonMissile
│ │ ├ FireDemonRock1
│ │ │ ├ FireDemonRock2
│ │ │ ├ FireDemonRock3
│ │ │ ├ FireDemonRock4
│ │ │ └ FireDemonRock5
│ │ ├ FireDemonSplotch1
│ │ │ └ FireDemonSplotch2
│ │ ├ FireDroplet
│ │ ├ FireThing
│ │ ├ FlameLargeTemp
│ │ ├ FlameMissile
│ │ │ └ FastFlameMissile
│ │ ├ FlamePuff
│ │ │ └ FlamePuff2
│ │ ├ FlameSmallTemp
│ │ ├ FloatingSkull
│ │ ├ FogPatchSmall
│ │ │ └ FogPatchMedium
│ │ │   └ FogPatchLarge
│ │ ├ FogSpawner
│ │ ├ ForceFieldGuard
│ │ ├ FrostMissile
│ │ │ └ IceShard
│ │ ├ FSwordFlame
│ │ ├ FSwordMissile
│ │ ├ GauntletPuff1
│ │ │ └ GauntletPuff2
│ │ ├ GibbedMarine
│ │ │ └ GibbedMarineExtra
│ │ ├ GlassJunk
│ │ ├ GlassShard
│ │ │ ├ SGShard0
│ │ │ ├ SGShard1
│ │ │ ├ SGShard2
│ │ │ ├ SGShard3
│ │ │ ├ SGShard4
│ │ │ ├ SGShard5
│ │ │ ├ SGShard6
│ │ │ ├ SGShard7
│ │ │ ├ SGShard8
│ │ │ └ SGShard9
│ │ ├ GoldWandFX1
│ │ │ ├ GoldWandFX2
│ │ │ └ GoldWandPuff2
│ │ ├ GoldWandPuff1
│ │ ├ GreenTorch
│ │ │ └ ChexCivilian1
│ │ ├ Grenade
│ │ ├ GrenadeSmokeTrail
│ │ ├ HammerMissile
│ │ ├ HammerPuff
│ │ ├ HangBNoBrain
│ │ ├ HangNoGuts
│ │ ├ HangTLookingDown
│ │ ├ HangTLookingUp
│ │ ├ HangTNoBrain
│ │ ├ HangTSkull
│ │ ├ HateTarget
│ │ ├ HeadCandles
│ │ ├ HeadFX1
│ │ ├ HeadFX2
│ │ ├ HeadFX3
│ │ ├ HeadOnAStick
│ │ ├ HeadsOnAStick
│ │ │ └ ChexTallFlower
│ │ ├ HeartColumn
│ │ ├ HeartsInTank
│ │ ├ HEGrenade
│ │ ├ Heresiarch
│ │ ├ HereticImp
│ │ │ └ HereticImpLeader
│ │ ├ HereticImpBall
│ │ ├ HereticImpChunk1
│ │ ├ HereticImpChunk2
│ │ ├ HolyMissile
│ │ ├ HolyMissilePuff
│ │ ├ HolyPuff
│ │ ├ HolySpirit
│ │ ├ HolyTail
│ │ │ └ HolyTailTrail
│ │ ├ HornRodFX1
│ │ ├ HornRodFX2
│ │ ├ HugeTorch
│ │ ├ HWaterDrip
│ │ ├ IceChunk
│ │ ├ IceFXPuff
│ │ ├ IceGuy
│ │ ├ IceGuyBit
│ │ ├ IceGuyFX
│ │ ├ IceGuyFX2
│ │ ├ IceGuyWisp1
│ │ │ └ IceGuyWisp2
│ │ ├ Inquisitor
│ │ ├ InquisitorArm
│ │ ├ InquisitorShot
│ │ ├ InterpolationPoint
│ │ ├ InterpolationSpecial
│ │ ├ Inventory
│ │ │ ├ Ammo
│ │ │ │ ├ Cell
│ │ │ │ │ ├ CellPack
│ │ │ │ │ ├ PhasingZorch
│ │ │ │ │ └ PhasingZorchPack
│ │ │ │ ├ Clip
│ │ │ │ │ ├ ClipBox
│ │ │ │ │ ├ MiniZorchPack
│ │ │ │ │ └ MiniZorchRecharge
│ │ │ │ ├ ClipOfBullets
│ │ │ │ │ └ BoxOfBullets
│ │ │ │ ├ ElectricBolts
│ │ │ │ ├ EnergyPod
│ │ │ │ │ └ EnergyPack
│ │ │ │ ├ HEGrenadeRounds
│ │ │ │ ├ Mana1
│ │ │ │ ├ Mana2
│ │ │ │ ├ MiniMissiles
│ │ │ │ │ └ CrateOfMissiles
│ │ │ │ ├ PhosphorusGrenadeRounds
│ │ │ │ ├ PoisonBolts
│ │ │ │ ├ RocketAmmo
│ │ │ │ │ ├ PropulsorZorch
│ │ │ │ │ ├ PropulsorZorchPack
│ │ │ │ │ └ RocketBox
│ │ │ │ └ Shell
│ │ │ │   ├ LargeZorchPack
│ │ │ │   ├ LargeZorchRecharge
│ │ │ │   └ ShellBox
│ │ │ ├ Armor
│ │ │ │ ├ BasicArmor
│ │ │ │ ├ BasicArmorBonus
│ │ │ │ │ └ ArmorBonus
│ │ │ │ │   └ SlimeRepellent
│ │ │ │ ├ BasicArmorPickup
│ │ │ │ │ ├ BlueArmor
│ │ │ │ │ │ ├ BlueArmorForMegasphere
│ │ │ │ │ │ └ SuperChexArmor
│ │ │ │ │ ├ GreenArmor
│ │ │ │ │ │ └ ChexArmor
│ │ │ │ │ ├ LeatherArmor
│ │ │ │ │ └ MetalArmor
│ │ │ │ └ HexenArmor
│ │ │ │   ├ AmuletOfWarding
│ │ │ │   ├ FalconShield
│ │ │ │   ├ MeshArmor
│ │ │ │   └ PlatinumHelm
│ │ │ ├ ArtiBoostArmor
│ │ │ ├ ArtiDarkServant
│ │ │ ├ ArtiHealingRadius
│ │ │ ├ ArtiPoisonBag
│ │ │ │ ├ ArtiPoisonBag1
│ │ │ │ ├ ArtiPoisonBag2
│ │ │ │ ├ ArtiPoisonBag3
│ │ │ │ ├ ArtiPoisonBagGiver
│ │ │ │ └ ArtiPoisonBagShooter
│ │ │ ├ ArtiTeleport
│ │ │ ├ ArtiTeleportOther
│ │ │ ├ BackpackItem
│ │ │ │ ├ AmmoSatchel
│ │ │ │ └ Backpack
│ │ │ │   └ Zorchpack
│ │ │ ├ BeldinsRing
│ │ │ ├ BrokenPowerCoupling
│ │ │ ├ Coin
│ │ │ │ ├ Gold10
│ │ │ │ ├ Gold25
│ │ │ │ ├ Gold300
│ │ │ │ └ Gold50
│ │ │ ├ Communicator
│ │ │ ├ DegninOre
│ │ │ ├ DehackedPickup
│ │ │ ├ DummyStrifeItem
│ │ │ │ ├ AmmoFillup
│ │ │ │ ├ CloseDoor222
│ │ │ │ ├ HealthFillup
│ │ │ │ ├ OpenDoor222
│ │ │ │ ├ OpenDoor224
│ │ │ │ ├ RaiseAlarm
│ │ │ │ ├ SlideshowStarter
│ │ │ │ ├ SVEOpenDoor225
│ │ │ │ ├ UpgradeAccuracy
│ │ │ │ └ UpgradeStamina
│ │ │ ├ Ear
│ │ │ ├ FakeInventory
│ │ │ ├ FlameThrowerParts
│ │ │ ├ GuardUniform
│ │ │ ├ GunTraining
│ │ │ ├ Health
│ │ │ │ ├ CrystalVial
│ │ │ │ ├ HealthBonus
│ │ │ │ │ └ GlassOfWater
│ │ │ │ ├ MaxHealth
│ │ │ │ ├ Medikit
│ │ │ │ │ └ BowlOfVegetables
│ │ │ │ ├ MegasphereHealth
│ │ │ │ ├ Soulsphere
│ │ │ │ │ └ SuperchargeBreakfast
│ │ │ │ └ Stimpack
│ │ │ │   └ BowlOfFruit
│ │ │ ├ HealthPickup
│ │ │ │ ├ ArtiHealth
│ │ │ │ ├ ArtiSuperHealth
│ │ │ │ ├ MedicalKit
│ │ │ │ ├ MedPatch
│ │ │ │ └ SurgeryKit
│ │ │ ├ HealthTraining
│ │ │ ├ Info
│ │ │ ├ InterrogatorReport
│ │ │ ├ Key
│ │ │ │ ├ DoomKey
│ │ │ │ │ ├ BlueCard
│ │ │ │ │ │ └ ChexBlueCard
│ │ │ │ │ ├ BlueSkull
│ │ │ │ │ ├ RedCard
│ │ │ │ │ │ └ ChexRedCard
│ │ │ │ │ ├ RedSkull
│ │ │ │ │ ├ YellowCard
│ │ │ │ │ │ └ ChexYellowCard
│ │ │ │ │ └ YellowSkull
│ │ │ │ ├ HexenKey
│ │ │ │ │ ├ KeyAxe
│ │ │ │ │ ├ KeyCastle
│ │ │ │ │ ├ KeyCave
│ │ │ │ │ ├ KeyDungeon
│ │ │ │ │ ├ KeyEmerald
│ │ │ │ │ ├ KeyFire
│ │ │ │ │ ├ KeyHorn
│ │ │ │ │ ├ KeyRusted
│ │ │ │ │ ├ KeySilver
│ │ │ │ │ ├ KeySteel
│ │ │ │ │ └ KeySwamp
│ │ │ │ ├ PrisonPass
│ │ │ │ └ StrifeKey
│ │ │ │   ├ BaseKey
│ │ │ │   ├ BlueCrystalKey
│ │ │ │   ├ BrassKey
│ │ │ │   ├ CatacombKey
│ │ │ │   ├ ChapelKey
│ │ │ │   ├ CoreKey
│ │ │ │   ├ FactoryKey
│ │ │ │   ├ GoldKey
│ │ │ │   ├ GovsKey
│ │ │ │   ├ IDBadge
│ │ │ │   ├ IDCard
│ │ │ │   ├ MaulerKey
│ │ │ │   ├ MilitaryID
│ │ │ │   ├ MineKey
│ │ │ │   ├ NewKey5
│ │ │ │   ├ OracleKey
│ │ │ │   ├ OrderKey
│ │ │ │   ├ Passcard
│ │ │ │   ├ Power1Key
│ │ │ │   ├ Power2Key
│ │ │ │   ├ Power3Key
│ │ │ │   ├ PrisonKey
│ │ │ │   ├ RedCrystalKey
│ │ │ │   ├ SecurityKey
│ │ │ │   ├ SeveredHand
│ │ │ │   ├ SilverKey
│ │ │ │   └ WarehouseKey
│ │ │ ├ MapRevealer
│ │ │ │ ├ Allmap
│ │ │ │ │ └ ComputerAreaMap
│ │ │ │ └ StrifeMap
│ │ │ ├ OfferingChalice
│ │ │ ├ OfficersUniform
│ │ │ ├ OraclePass
│ │ │ ├ Powerup
│ │ │ │ ├ PowerBuddha
│ │ │ │ ├ PowerDamage
│ │ │ │ ├ PowerDoubleFiringSpeed
│ │ │ │ ├ PowerDrain
│ │ │ │ ├ PowerFlight
│ │ │ │ ├ PowerFrightener
│ │ │ │ ├ PowerHighJump
│ │ │ │ ├ PowerInfiniteAmmo
│ │ │ │ ├ PowerInvisibility
│ │ │ │ │ ├ PowerGhost
│ │ │ │ │ └ PowerShadow
│ │ │ │ ├ PowerInvulnerable
│ │ │ │ ├ PowerIronFeet
│ │ │ │ │ └ PowerMask
│ │ │ │ ├ PowerLightAmp
│ │ │ │ │ └ PowerTorch
│ │ │ │ ├ PowerMinotaur
│ │ │ │ ├ PowerMorph
│ │ │ │ ├ PowerProtection
│ │ │ │ ├ PowerReflection
│ │ │ │ ├ PowerRegeneration
│ │ │ │ ├ PowerScanner
│ │ │ │ ├ PowerSpeed
│ │ │ │ ├ PowerStrength
│ │ │ │ ├ PowerTargeter
│ │ │ │ ├ PowerTimeFreezer
│ │ │ │ └ PowerWeaponLevel2
│ │ │ ├ PowerupGiver
│ │ │ │ ├ ArtiFly
│ │ │ │ ├ ArtiInvulnerability
│ │ │ │ ├ ArtiInvulnerability2
│ │ │ │ ├ ArtiSpeedBoots
│ │ │ │ ├ ArtiTorch
│ │ │ │ ├ BlurSphere
│ │ │ │ ├ EnvironmentalSuit
│ │ │ │ ├ Infrared
│ │ │ │ ├ InvulnerabilitySphere
│ │ │ │ ├ RadSuit
│ │ │ │ │ └ SlimeProofSuit
│ │ │ │ ├ Scanner
│ │ │ │ ├ ShadowArmor
│ │ │ │ └ Targeter
│ │ │ ├ ProgLevelEnder
│ │ │ ├ PuzzleItem
│ │ │ │ ├ PuzzBook1
│ │ │ │ ├ PuzzBook2
│ │ │ │ ├ PuzzCWeapon
│ │ │ │ ├ PuzzFlameMask
│ │ │ │ ├ PuzzFWeapon
│ │ │ │ ├ PuzzGear1
│ │ │ │ ├ PuzzGear2
│ │ │ │ ├ PuzzGear3
│ │ │ │ ├ PuzzGear4
│ │ │ │ ├ PuzzGemBig
│ │ │ │ ├ PuzzGemBlue1
│ │ │ │ ├ PuzzGemBlue2
│ │ │ │ ├ PuzzGemGreen1
│ │ │ │ ├ PuzzGemGreen2
│ │ │ │ ├ PuzzGemRed
│ │ │ │ ├ PuzzMWeapon
│ │ │ │ └ PuzzSkull
│ │ │ ├ QuestItem
│ │ │ │ ├ QuestItem1
│ │ │ │ ├ QuestItem10
│ │ │ │ ├ QuestItem11
│ │ │ │ ├ QuestItem12
│ │ │ │ ├ QuestItem13
│ │ │ │ ├ QuestItem14
│ │ │ │ ├ QuestItem15
│ │ │ │ ├ QuestItem16
│ │ │ │ ├ QuestItem17
│ │ │ │ ├ QuestItem18
│ │ │ │ ├ QuestItem19
│ │ │ │ ├ QuestItem2
│ │ │ │ ├ QuestItem20
│ │ │ │ ├ QuestItem21
│ │ │ │ ├ QuestItem22
│ │ │ │ ├ QuestItem23
│ │ │ │ ├ QuestItem24
│ │ │ │ ├ QuestItem25
│ │ │ │ ├ QuestItem26
│ │ │ │ ├ QuestItem27
│ │ │ │ ├ QuestItem28
│ │ │ │ ├ QuestItem29
│ │ │ │ ├ QuestItem3
│ │ │ │ ├ QuestItem30
│ │ │ │ ├ QuestItem31
│ │ │ │ ├ QuestItem4
│ │ │ │ ├ QuestItem5
│ │ │ │ ├ QuestItem6
│ │ │ │ ├ QuestItem7
│ │ │ │ ├ QuestItem8
│ │ │ │ └ QuestItem9
│ │ │ ├ RainTracker
│ │ │ ├ ScoreItem
│ │ │ │ ├ EvilSceptre
│ │ │ │ └ UnholyBible
│ │ │ ├ StateProvider
│ │ │ │ ├ CustomInventory
│ │ │ │ │ ├ ArtiBlastRadius
│ │ │ │ │ ├ ArtiBoostMana
│ │ │ │ │ ├ ArtiEgg
│ │ │ │ │ ├ ArtiPork
│ │ │ │ │ ├ Berserk
│ │ │ │ │ ├ Mana3
│ │ │ │ │ └ Megasphere
│ │ │ │ └ Weapon
│ │ │ │   ├ Beak
│ │ │ │   │ └ BeakPowered
│ │ │ │   ├ Chainsaw
│ │ │ │   │ └ SuperBootspork
│ │ │ │   ├ ClericWeapon
│ │ │ │   │ ├ CWeapFlame
│ │ │ │   │ ├ CWeapMace
│ │ │ │   │ ├ CWeapStaff
│ │ │ │   │ └ CWeapWraithverge
│ │ │ │   ├ DoomWeapon
│ │ │ │   │ ├ BFG9000
│ │ │ │   │ │ └ LAZDevice
│ │ │ │   │ ├ Chaingun
│ │ │ │   │ │ └ RapidZorcher
│ │ │ │   │ ├ Pistol
│ │ │ │   │ │ └ MiniZorcher
│ │ │ │   │ ├ PlasmaRifle
│ │ │ │   │ │ └ PhasingZorcher
│ │ │ │   │ ├ RocketLauncher
│ │ │ │   │ │ └ ZorchPropulsor
│ │ │ │   │ ├ Shotgun
│ │ │ │   │ │ └ LargeZorcher
│ │ │ │   │ └ SuperShotgun
│ │ │ │   │   └ SuperLargeZorcher
│ │ │ │   ├ FighterWeapon
│ │ │ │   │ ├ FWeapAxe
│ │ │ │   │ ├ FWeapFist
│ │ │ │   │ ├ FWeapHammer
│ │ │ │   │ └ FWeapQuietus
│ │ │ │   ├ Fist
│ │ │ │   │ └ Bootspoon
│ │ │ │   ├ Gauntlets
│ │ │ │   │ └ GauntletsPowered
│ │ │ │   ├ HereticWeapon
│ │ │ │   │ ├ Blaster
│ │ │ │   │ │ └ BlasterPowered
│ │ │ │   │ ├ Crossbow
│ │ │ │   │ │ └ CrossbowPowered
│ │ │ │   │ ├ GoldWand
│ │ │ │   │ │ └ GoldWandPowered
│ │ │ │   │ ├ Mace
│ │ │ │   │ │ └ MacePowered
│ │ │ │   │ ├ SkullRod
│ │ │ │   │ │ └ SkullRodPowered
│ │ │ │   │ └ Staff
│ │ │ │   │   └ StaffPowered
│ │ │ │   ├ MageWeapon
│ │ │ │   │ ├ MWeapBloodscourge
│ │ │ │   │ ├ MWeapFrost
│ │ │ │   │ ├ MWeapLightning
│ │ │ │   │ └ MWeapWand
│ │ │ │   ├ PhoenixRod
│ │ │ │   │ └ PhoenixRodPowered
│ │ │ │   ├ Sigil
│ │ │ │   │ ├ Sigil1
│ │ │ │   │ ├ Sigil2
│ │ │ │   │ ├ Sigil3
│ │ │ │   │ ├ Sigil4
│ │ │ │   │ └ Sigil5
│ │ │ │   ├ Snout
│ │ │ │   ├ StrifeWeapon
│ │ │ │   │ ├ AssaultGun
│ │ │ │   │ ├ FlameThrower
│ │ │ │   │ ├ Mauler
│ │ │ │   │ │ └ Mauler2
│ │ │ │   │ ├ MiniMissileLauncher
│ │ │ │   │ ├ PunchDagger
│ │ │ │   │ ├ StrifeCrossbow
│ │ │ │   │ │ └ StrifeCrossbow2
│ │ │ │   │ └ StrifeGrenadeLauncher
│ │ │ │   │   └ StrifeGrenadeLauncher2
│ │ │ │   └ WeaponGiver
│ │ │ │     └ AssaultGunStanding
│ │ │ ├ SVEBlueChalice
│ │ │ ├ SVEFlagSpotBlue
│ │ │ ├ SVEFlagSpotRed
│ │ │ ├ SVETalismanPowerup
│ │ │ ├ SVETalismanRed
│ │ │ │ ├ SVETalismanBlue
│ │ │ │ └ SVETalismanGreen
│ │ │ ├ TeleporterBeacon
│ │ │ ├ WeaponHolder
│ │ │ └ WeaponPiece
│ │ │   ├ ClericWeaponPiece
│ │ │   │ ├ CWeaponPiece1
│ │ │   │ ├ CWeaponPiece2
│ │ │   │ └ CWeaponPiece3
│ │ │   ├ FighterWeaponPiece
│ │ │   │ ├ FWeaponPiece1
│ │ │   │ ├ FWeaponPiece2
│ │ │   │ └ FWeaponPiece3
│ │ │   └ MageWeaponPiece
│ │ │     ├ MWeaponPiece1
│ │ │     ├ MWeaponPiece2
│ │ │     └ MWeaponPiece3
│ │ ├ InvisibleBridge
│ │ │ ├ InvisibleBridge16
│ │ │ ├ InvisibleBridge32
│ │ │ └ InvisibleBridge8
│ │ ├ Ironlich
│ │ ├ ItemFog
│ │ ├ KlaxonWarningLight
│ │ ├ KneelingGuy
│ │ ├ Knight
│ │ │ └ KnightGhost
│ │ ├ KnightAxe
│ │ │ └ RedAxe
│ │ ├ Korax
│ │ ├ KoraxBolt
│ │ ├ KoraxSpirit
│ │ ├ LargeTorch
│ │ ├ LavaSmoke
│ │ ├ LavaSplash
│ │ ├ Leaf1
│ │ │ └ Leaf2
│ │ ├ LeafSpawner
│ │ ├ LightBrownFluorescent
│ │ ├ LightGlobe
│ │ ├ LightGoldFluorescent
│ │ ├ Lightning
│ │ │ └ LightningCeiling
│ │ │   └ LightningFloor
│ │ ├ LightningZap
│ │ ├ LightSilverFluorescent
│ │ ├ LittleFly
│ │ ├ LiveStick
│ │ ├ Loremaster
│ │ ├ LoreShot
│ │ ├ LoreShot2
│ │ ├ LostSoul
│ │ │ ├ BetaSkull
│ │ │ ├ ChexSoul
│ │ │ └ DeadLostSoul
│ │ ├ MaceFX1
│ │ │ ├ MaceFX2
│ │ │ └ MaceFX3
│ │ ├ MaceFX4
│ │ ├ Macil1
│ │ │ └ Macil2
│ │ ├ MageBoss
│ │ ├ MageStaffFX2
│ │ ├ MageWandSmoke
│ │ ├ MapMarker
│ │ ├ MapSpot
│ │ │ ├ FS_Mapspot
│ │ │ └ MapSpotGravity
│ │ ├ MaulerPuff
│ │ ├ MaulerTorpedo
│ │ ├ MaulerTorpedoWave
│ │ ├ MBFHelperDog
│ │ ├ Meat
│ │ │ └ Junk
│ │ ├ Meat2
│ │ │ └ NonsolidMeat2
│ │ ├ Meat3
│ │ │ └ NonsolidMeat3
│ │ ├ Meat4
│ │ │ └ NonsolidMeat4
│ │ ├ Meat5
│ │ │ └ NonsolidMeat5
│ │ ├ MediumTorch
│ │ ├ Merchant
│ │ │ ├ Armorer
│ │ │ ├ BarKeep
│ │ │ ├ Medic
│ │ │ └ WeaponSmith
│ │ ├ MetalPot
│ │ ├ MiniMissile
│ │ ├ Minotaur
│ │ │ └ MinotaurFriend
│ │ ├ MinotaurFX1
│ │ │ └ MinotaurFX2
│ │ │   └ MinotaurFX3
│ │ ├ MinotaurSmoke
│ │ ├ MinotaurSmokeExit
│ │ ├ MorphedMonster
│ │ │ ├ Chicken
│ │ │ └ Pig
│ │ ├ MorphProjectile
│ │ │ ├ EggFX
│ │ │ └ PorkFX
│ │ ├ Mug
│ │ ├ Mummy
│ │ │ ├ MummyGhost
│ │ │ └ MummyLeader
│ │ │   └ MummyLeaderGhost
│ │ ├ MummyFX1
│ │ ├ MummySoul
│ │ ├ Oracle
│ │ ├ OutsideLamp
│ │ ├ PainElemental
│ │ ├ PalmTree
│ │ ├ ParticleFountain
│ │ │ ├ BlackParticleFountain
│ │ │ ├ BlueParticleFountain
│ │ │ ├ GreenParticleFountain
│ │ │ ├ PurpleParticleFountain
│ │ │ ├ RedParticleFountain
│ │ │ ├ WhiteParticleFountain
│ │ │ └ YellowParticleFountain
│ │ ├ PathFollower
│ │ │ ├ ActorMover
│ │ │ └ MovingCamera
│ │ ├ PatrolPoint
│ │ ├ PatrolSpecial
│ │ ├ PhoenixFX1
│ │ ├ PhoenixFX2
│ │ ├ PhoenixPuff
│ │ ├ PhosphorousFire
│ │ ├ PhosphorousGrenade
│ │ ├ PickupFlash
│ │ ├ PileOfGuts
│ │ ├ PillarAlienPower
│ │ ├ PillarAztec
│ │ ├ PillarAztecDamaged
│ │ ├ PillarAztecRuined
│ │ ├ PillarHugeTech
│ │ ├ PillarTechno
│ │ ├ Piston
│ │ ├ Pitcher
│ │ ├ PlasmaBall
│ │ │ ├ PhaseZorchMissile
│ │ │ └ PlasmaBall1
│ │ │   └ PlasmaBall2
│ │ ├ PlayerPawn
│ │ │ ├ ChickenPlayer
│ │ │ ├ ClericPlayer
│ │ │ ├ DoomPlayer
│ │ │ │ └ ChexPlayer
│ │ │ ├ FighterPlayer
│ │ │ ├ HereticPlayer
│ │ │ ├ MagePlayer
│ │ │ ├ PigPlayer
│ │ │ ├ PlayerChunk
│ │ │ │ ├ BloodyFighterSkull
│ │ │ │ ├ BloodySkull
│ │ │ │ └ IceChunkHead
│ │ │ └ StrifePlayer
│ │ ├ PlayerSpeedTrail
│ │ ├ Pod
│ │ ├ PodGenerator
│ │ ├ PodGoo
│ │ ├ PointPuller
│ │ ├ PointPusher
│ │ ├ PoisonBag
│ │ │ └ ZPoisonShroom
│ │ ├ PoisonBolt
│ │ ├ PoisonCloud
│ │ ├ PoleLantern
│ │ ├ Pot
│ │ ├ PottedTree
│ │ ├ Pottery1
│ │ │ ├ Pottery2
│ │ │ └ Pottery3
│ │ ├ PotteryBit
│ │ ├ PowerCoupling
│ │ ├ PowerCrystal
│ │ ├ Programmer
│ │ ├ ProgrammerBase
│ │ ├ ProjectileBlade
│ │ ├ Puffy
│ │ ├ PunchPuff
│ │ ├ QuietusDrop
│ │ ├ RainPillar
│ │ ├ RandomSpawner
│ │ ├ RatBuddy
│ │ ├ RealGibs
│ │ │ └ Gibs
│ │ ├ Reaver
│ │ ├ RebelBoots
│ │ ├ RebelHelmet
│ │ ├ RebelShirt
│ │ ├ RedTorch
│ │ ├ Revenant
│ │ │ └ StealthRevenant
│ │ ├ RevenantTracer
│ │ ├ RevenantTracerSmoke
│ │ ├ Ripper
│ │ ├ RipperBall
│ │ ├ Rock1
│ │ ├ Rock2
│ │ ├ Rock3
│ │ ├ Rocket
│ │ │ └ PropulsorMissile
│ │ ├ RocketSmokeTrail
│ │ ├ RocketTrail
│ │ ├ Rubble1
│ │ ├ Rubble2
│ │ ├ Rubble3
│ │ ├ Rubble4
│ │ ├ Rubble5
│ │ ├ Rubble6
│ │ ├ Rubble7
│ │ ├ Rubble8
│ │ ├ SacrificedGuy
│ │ ├ ScriptedMarine
│ │ │ ├ MarineBFG
│ │ │ ├ MarineChaingun
│ │ │ ├ MarineChainsaw
│ │ │ ├ MarineFist
│ │ │ │ ├ MarineBerserk
│ │ │ │ └ MarineRocket
│ │ │ ├ MarinePistol
│ │ │ ├ MarinePlasma
│ │ │ ├ MarineRailgun
│ │ │ ├ MarineShotgun
│ │ │ └ MarineSSG
│ │ ├ SecretTrigger
│ │ ├ SectorAction
│ │ │ ├ MusicChanger
│ │ │ ├ SecActDamage3D
│ │ │ ├ SecActDamageCeiling
│ │ │ ├ SecActDamageFloor
│ │ │ ├ SecActDeath3D
│ │ │ ├ SecActDeathCeiling
│ │ │ ├ SecActDeathFloor
│ │ │ ├ SecActEnter
│ │ │ ├ SecActExit
│ │ │ ├ SecActEyesAboveC
│ │ │ ├ SecActEyesBelowC
│ │ │ ├ SecActEyesDive
│ │ │ ├ SecActEyesSurface
│ │ │ ├ SecActHitCeil
│ │ │ ├ SecActHitFakeFloor
│ │ │ ├ SecActHitFloor
│ │ │ ├ SecActUse
│ │ │ └ SecActUseWall
│ │ ├ SectorFlagSetter
│ │ ├ SectorSilencer
│ │ ├ SecurityCamera
│ │ │ └ AimingCamera
│ │ ├ Sentinel
│ │ ├ SentinelFX1
│ │ │ └ SentinelFX2
│ │ ├ Serpent
│ │ │ └ SerpentLeader
│ │ ├ SerpentFX
│ │ ├ SerpentGib1
│ │ │ ├ SerpentGib2
│ │ │ └ SerpentGib3
│ │ ├ SerpentHead
│ │ ├ ShortBlueTorch
│ │ │ └ ChexLightColumn
│ │ ├ ShortBush
│ │ ├ ShortGreenColumn
│ │ │ └ ChexSubmergedPlant
│ │ ├ ShortGreenTorch
│ │ │ └ ChexCivilian2
│ │ ├ ShortRedColumn
│ │ │ └ ChexMineCart
│ │ ├ ShortRedTorch
│ │ │ └ ChexCivilian3
│ │ ├ ShotgunGuy
│ │ │ ├ DeadShotgunGuy
│ │ │ ├ FlemoidusBipedicus
│ │ │ └ StealthShotgunGuy
│ │ ├ SigilBanner
│ │ ├ SkullColumn
│ │ │ └ ChexFlagOnPole
│ │ ├ SkyPicker
│ │ ├ SkyViewpoint
│ │ │ ├ SkyCamCompat
│ │ │ └ StackPoint
│ │ │   ├ LowerStackLookOnly
│ │ │   └ UpperStackLookOnly
│ │ ├ SlimeChunk
│ │ ├ SlimeSplash
│ │ ├ SludgeChunk
│ │ ├ SludgeSplash
│ │ ├ SmallBloodPool
│ │ ├ SmallTorchLit
│ │ ├ SmallTorchUnlit
│ │ ├ Snake
│ │ ├ SnakeProjA
│ │ │ └ SnakeProjB
│ │ ├ SnoutPuff
│ │ ├ SorcBall
│ │ │ ├ SorcBall1
│ │ │ ├ SorcBall2
│ │ │ └ SorcBall3
│ │ ├ Sorcerer1
│ │ ├ Sorcerer2
│ │ ├ Sorcerer2FX1
│ │ ├ Sorcerer2FX2
│ │ ├ Sorcerer2FXSpark
│ │ ├ Sorcerer2Telefade
│ │ ├ SorcererFX1
│ │ ├ SorcFX1
│ │ ├ SorcFX2
│ │ │ └ SorcFX2T1
│ │ ├ SorcFX3
│ │ ├ SorcFX3Explosion
│ │ ├ SorcFX4
│ │ ├ SorcSpark1
│ │ ├ SoundEnvironment
│ │ ├ SoundSequence
│ │ │ ├ HereticSoundSequence1
│ │ │ ├ HereticSoundSequence10
│ │ │ ├ HereticSoundSequence2
│ │ │ ├ HereticSoundSequence3
│ │ │ ├ HereticSoundSequence4
│ │ │ ├ HereticSoundSequence5
│ │ │ ├ HereticSoundSequence6
│ │ │ ├ HereticSoundSequence7
│ │ │ ├ HereticSoundSequence8
│ │ │ └ HereticSoundSequence9
│ │ ├ SoundSequenceSlot
│ │ ├ SoundWaterfall
│ │ ├ SoundWind
│ │ │ └ SoundWindHexen
│ │ ├ Spark
│ │ ├ SpawnFire
│ │ ├ SpawnShot
│ │ ├ SpecialSpot
│ │ │ ├ BossSpot
│ │ │ ├ BossTarget
│ │ │ └ MaceSpawner
│ │ ├ SpectralLightningBase
│ │ │ ├ SpectralLightningBall1
│ │ │ │ └ SpectralLightningBall2
│ │ │ ├ SpectralLightningDeath1
│ │ │ │ ├ SpectralLightningBigV1
│ │ │ │ │ └ SpectralLightningBigV2
│ │ │ │ └ SpectralLightningSpot
│ │ │ ├ SpectralLightningDeath2
│ │ │ │ └ SpectralLightningBigBall1
│ │ │ │   └ SpectralLightningBigBall2
│ │ │ ├ SpectralLightningDeathShort
│ │ │ │ └ SpectralLightningV1
│ │ │ │   └ SpectralLightningV2
│ │ │ └ SpectralLightningH1
│ │ │   ├ SpectralLightningH2
│ │ │   └ SpectralLightningH3
│ │ ├ SpectralLightningHTail
│ │ ├ SpectralMonster
│ │ │ ├ AlienSpectre1
│ │ │ │ ├ AlienSpectre2
│ │ │ │ ├ AlienSpectre3
│ │ │ │ ├ AlienSpectre4
│ │ │ │ └ AlienSpectre5
│ │ │ ├ EntityBoss
│ │ │ └ EntitySecond
│ │ ├ SpiderMastermind
│ │ ├ SRock1
│ │ ├ SRock2
│ │ ├ SRock3
│ │ ├ SRock4
│ │ ├ SStalactiteBig
│ │ ├ SStalactiteSmall
│ │ ├ SStalagmiteBig
│ │ ├ SStalagmiteSmall
│ │ ├ StaffPuff
│ │ │ └ BeakPuff
│ │ ├ StaffPuff2
│ │ ├ Stalagmite
│ │ ├ Stalagtite
│ │ │ └ ChexAppleTree
│ │ ├ Stalker
│ │ ├ Statue
│ │ ├ StatueRuined
│ │ ├ StickInWater
│ │ ├ Stool
│ │ ├ StrifeBishop
│ │ ├ StrifeBurningBarrel
│ │ ├ StrifeCandelabra
│ │ ├ StrifeHumanoid
│ │ │ ├ Acolyte
│ │ │ │ ├ AcolyteBlue
│ │ │ │ ├ AcolyteDGreen
│ │ │ │ ├ AcolyteGold
│ │ │ │ ├ AcolyteGray
│ │ │ │ ├ AcolyteLGreen
│ │ │ │ ├ AcolyteRed
│ │ │ │ ├ AcolyteRust
│ │ │ │ ├ AcolyteShadow
│ │ │ │ ├ AcolyteTan
│ │ │ │ └ AcolyteToBe
│ │ │ ├ Beggar
│ │ │ │ ├ Beggar1
│ │ │ │ ├ Beggar2
│ │ │ │ ├ Beggar3
│ │ │ │ ├ Beggar4
│ │ │ │ └ Beggar5
│ │ │ ├ Peasant
│ │ │ │ ├ Peasant1
│ │ │ │ ├ Peasant10
│ │ │ │ ├ Peasant11
│ │ │ │ ├ Peasant12
│ │ │ │ ├ Peasant13
│ │ │ │ ├ Peasant14
│ │ │ │ ├ Peasant15
│ │ │ │ ├ Peasant16
│ │ │ │ ├ Peasant17
│ │ │ │ ├ Peasant18
│ │ │ │ ├ Peasant19
│ │ │ │ ├ Peasant2
│ │ │ │ ├ Peasant20
│ │ │ │ ├ Peasant21
│ │ │ │ ├ Peasant22
│ │ │ │ ├ Peasant3
│ │ │ │ ├ Peasant4
│ │ │ │ ├ Peasant5
│ │ │ │ ├ Peasant6
│ │ │ │ ├ Peasant7
│ │ │ │ ├ Peasant8
│ │ │ │ └ Peasant9
│ │ │ ├ Rebel
│ │ │ │ ├ Rebel1
│ │ │ │ ├ Rebel2
│ │ │ │ ├ Rebel3
│ │ │ │ ├ Rebel4
│ │ │ │ ├ Rebel5
│ │ │ │ └ Rebel6
│ │ │ └ Zombie
│ │ ├ StrifePuff
│ │ │ ├ MiniMissilePuff
│ │ │ └ StrifeSpark
│ │ ├ SummoningDoll
│ │ ├ SurgeryCrab
│ │ ├ SVEOreSpawner
│ │ ├ SwitchableDecoration
│ │ │ ├ BatSpawner
│ │ │ ├ FlameLarge
│ │ │ │ └ FlameLarge2
│ │ │ ├ FlameSmall
│ │ │ │ └ FlameSmall2
│ │ │ ├ SwitchingDecoration
│ │ │ │ ├ ZGemPedestal
│ │ │ │ └ ZWingedStatueNoSkull
│ │ │ ├ ZCauldron
│ │ │ │ └ ZCauldronUnlit
│ │ │ ├ ZFireBull
│ │ │ │ └ ZFireBullUnlit
│ │ │ ├ ZTwinedTorch
│ │ │ │ └ ZTwinedTorchUnlit
│ │ │ └ ZWallTorch
│ │ │   └ ZWallTorchUnlit
│ │ ├ TableShit1
│ │ ├ TableShit10
│ │ ├ TableShit2
│ │ ├ TableShit3
│ │ ├ TableShit4
│ │ ├ TableShit5
│ │ ├ TableShit6
│ │ ├ TableShit7
│ │ ├ TableShit8
│ │ ├ TableShit9
│ │ ├ TallBush
│ │ ├ TallGreenColumn
│ │ │ └ ChexCavernStalagmite
│ │ ├ TallRedColumn
│ │ │ └ ChexCavernColumn
│ │ ├ Tank1
│ │ ├ Tank2
│ │ ├ Tank3
│ │ ├ Tank4
│ │ ├ Tank5
│ │ ├ Tank6
│ │ ├ TargetPractice
│ │ ├ TechLamp
│ │ ├ TechLamp2
│ │ ├ TechLampBrass
│ │ ├ TechLampSilver
│ │ ├ TechPillar
│ │ │ └ ChexSpaceship
│ │ ├ TeleGlitter1
│ │ │ └ TeleGlitter2
│ │ ├ TeleGlitterGenerator1
│ │ ├ TeleGlitterGenerator2
│ │ ├ TeleportDest
│ │ │ └ TeleportDest2
│ │ │   └ TeleportDest3
│ │ ├ TeleportFog
│ │ ├ TeleportSwirl
│ │ ├ TeleSmoke
│ │ ├ TelOtherFX1
│ │ │ ├ TelOtherFX2
│ │ │ ├ TelOtherFX3
│ │ │ ├ TelOtherFX4
│ │ │ └ TelOtherFX5
│ │ ├ Templar
│ │ ├ ThrowingBomb
│ │ ├ ThrustFloor
│ │ │ ├ ThrustFloorDown
│ │ │ └ ThrustFloorUp
│ │ ├ TorchTree
│ │ │ └ ChexOrangeTree
│ │ ├ Tray
│ │ ├ TreeDestructible
│ │ ├ TreeStub
│ │ ├ Tub
│ │ ├ Unknown
│ │ │ └ SpeakerIcon
│ │ ├ Volcano
│ │ ├ VolcanoBlast
│ │ ├ VolcanoTBlast
│ │ ├ WaterBottle
│ │ ├ WaterDrip
│ │ ├ WaterDropOnFloor
│ │ ├ WaterfallSplash
│ │ ├ WaterFountain
│ │ ├ WaterSplash
│ │ ├ WaterSplashBase
│ │ ├ WaterZone
│ │ ├ Whirlwind
│ │ ├ Wizard
│ │ ├ WizardFX1
│ │ ├ WolfensteinSS
│ │ ├ WoodenBarrel
│ │ ├ Wraith
│ │ │ └ WraithBuried
│ │ ├ WraithFX1
│ │ ├ WraithFX2
│ │ ├ WraithFX3
│ │ ├ WraithFX4
│ │ │ └ WraithFX5
│ │ ├ WraithvergeDrop
│ │ ├ ZArmorChunk
│ │ ├ ZBannerTattered
│ │ ├ ZBarrel
│ │ ├ ZBell
│ │ ├ ZBlueCandle
│ │ ├ ZBucket
│ │ ├ ZCandle
│ │ ├ ZChainBit32
│ │ ├ ZChainBit64
│ │ ├ ZChainEndHeart
│ │ ├ ZChainEndHook1
│ │ ├ ZChainEndHook2
│ │ ├ ZChainEndSkull
│ │ ├ ZChainEndSpike
│ │ ├ ZChandelier
│ │ ├ ZChandelierUnlit
│ │ ├ ZCorpseHanging
│ │ ├ ZCorpseKabob
│ │ ├ ZCorpseLynched
│ │ ├ ZCorpseLynchedNoHeart
│ │ ├ ZCorpseSitting
│ │ ├ ZCorpseSleeping
│ │ ├ ZIronMaiden
│ │ ├ ZLog
│ │ ├ ZMossCeiling1
│ │ ├ ZMossCeiling2
│ │ ├ ZombieMan
│ │ │ ├ DeadZombieMan
│ │ │ ├ FlemoidusCommonus
│ │ │ └ StealthZombieMan
│ │ ├ ZombieSpawner
│ │ ├ ZRock1
│ │ ├ ZRock2
│ │ ├ ZRock3
│ │ ├ ZRock4
│ │ ├ ZRockBlack
│ │ ├ ZRockBrown1
│ │ ├ ZRockBrown2
│ │ ├ ZRubble1
│ │ ├ ZRubble2
│ │ ├ ZRubble3
│ │ ├ ZShroomLarge1
│ │ ├ ZShroomLarge2
│ │ ├ ZShroomLarge3
│ │ ├ ZShroomSmall1
│ │ ├ ZShroomSmall2
│ │ ├ ZShroomSmall3
│ │ ├ ZShroomSmall4
│ │ ├ ZShroomSmall5
│ │ ├ ZShrub1
│ │ ├ ZShrub2
│ │ ├ ZStalactiteIceLarge
│ │ ├ ZStalactiteIceMedium
│ │ ├ ZStalactiteIceSmall
│ │ ├ ZStalactiteIceTiny
│ │ ├ ZStalactiteLarge
│ │ ├ ZStalactiteMedium
│ │ ├ ZStalactiteSmall
│ │ ├ ZStalagmiteIceLarge
│ │ ├ ZStalagmiteIceMedium
│ │ ├ ZStalagmiteIceSmall
│ │ ├ ZStalagmiteIceTiny
│ │ ├ ZStalagmiteLarge
│ │ ├ ZStalagmiteMedium
│ │ ├ ZStalagmitePillar
│ │ ├ ZStalagmiteSmall
│ │ ├ ZStatueGargoyleBlueShort
│ │ ├ ZStatueGargoyleBlueTall
│ │ ├ ZStatueGargoyleDarkRedShort
│ │ ├ ZStatueGargoyleDarkRedTall
│ │ ├ ZStatueGargoyleGreenShort
│ │ ├ ZStatueGargoyleGreenTall
│ │ ├ ZStatueGargoyleRedShort
│ │ ├ ZStatueGargoyleRedTall
│ │ ├ ZStatueGargoyleRustShort
│ │ ├ ZStatueGargoyleRustTall
│ │ ├ ZStatueGargoyleStripeTall
│ │ ├ ZStatueGargoyleTanShort
│ │ ├ ZStatueGargoyleTanTall
│ │ ├ ZStumpBare
│ │ ├ ZStumpBurned
│ │ ├ ZStumpSwamp1
│ │ ├ ZStumpSwamp2
│ │ ├ ZSuitOfArmor
│ │ ├ ZSwampVine
│ │ ├ ZTombstoneBigCross
│ │ ├ ZTombstoneBrianP
│ │ ├ ZTombstoneBrianR
│ │ ├ ZTombstoneCrossCircle
│ │ ├ ZTombstoneRIP
│ │ ├ ZTombstoneShane
│ │ ├ ZTombstoneSmallCross
│ │ ├ ZTree
│ │ ├ ZTreeDead
│ │ ├ ZTreeGnarled1
│ │ ├ ZTreeGnarled2
│ │ ├ ZTreeLarge1
│ │ ├ ZTreeLarge2
│ │ ├ ZTreeSwamp120
│ │ ├ ZTreeSwamp150
│ │ ├ ZVasePillar
│ │ ├ ZWingedStatue
│ │ └ ZXmasTree
│ └ SectorEffect
│   ├ Lighting
│   └ Mover
│     ├ MovingCeiling
│     │ └ Ceiling
│     └ MovingFloor
│       └ Floor
└ ThinkerIterator
```

Structure List
==============

Here is a full list of all structures in ZScript as of GZDoom 3.7.0. There are 74 structures total. Note that some of these are merely implementation details and should not be used in code.

```
Struct
├ AutoUseHealthInfo
├ Console
├ ConsoleEvent
├ CVar
├ DamageTypeDefinition
├ DehInfo
├ Destructible
├ DropItem
├ DynArray_F32
├ DynArray_F64
├ DynArray_I16
├ DynArray_I32
├ DynArray_I8
├ DynArray_Obj
├ DynArray_Ptr
├ DynArray_String
├ F3DFloor
├ FCheckPosition
├ FColormap
├ FLineTraceData
├ Font
├ FOptionMenuSettings
├ FRailParams
├ FStateParamInfo
├ FTranslatedLineTarget
├ GameInfoStruct
├ GIFont
├ HealthGroup
├ InputEvent
├ JoystickConfig
├ KeyBindings
├ LevelLocals
├ Line
├ LinkContext
├ LookExParams
├ MugShot
├ OptionValues
├ PatchInfo
├ PlayerClass
├ PlayerEvent
├ PlayerInfo
├ PlayerSkin
├ RenderEvent
├ ReplaceEvent
├ SavegameManager
├ SaveGameNode
├ SBarInfo
├ Screen
├ SecPlane
├ SecSpecial
├ Sector
├ SectorPortal
├ Shader
├ Side
├ State
├ StrifeDialogueNode
├ StrifeDialogueReply
├ StringStruct
├ StringTable
├ Team
├ TerrainDef
├ TexMan
├ TraceResults
├ Translation
├ UiEvent
├ UserCmd
├ Vertex
├ VisStyle
├ Wads
├ WBPlayerStruct
├ WBStartStruct
├ WeaponSlots
├ WorldEvent
└ _
```

<!-- EOF -->
