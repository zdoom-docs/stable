# Versions

<!-- vim-markdown-toc GFM -->

* [Version 3.1.0](#version-310)
* [Version 3.2.0](#version-320)
* [Version 3.2.1](#version-321)
* [Version 3.2.2](#version-322)
* [Version 3.2.3](#version-323)
* [Version 3.2.4](#version-324)
* [Version 3.2.5](#version-325)
* [Version 3.3.0](#version-330)
* [Version 3.3.1](#version-331)
* [Version 3.3.2](#version-332)
* [Version 3.4.0](#version-340)
* [Version 3.5.0](#version-350)
* [Version 3.5.1](#version-351)
* [Version 3.6.0](#version-360)
* [Version 3.7.0](#version-370)
* [Version 3.7.2](#version-372)
* [Version 3.8.0 (Legacy)](#version-380-legacy)
* [Version 3.8.1 (Legacy)](#version-381-legacy)
* [Version 3.8.2 (Legacy)](#version-382-legacy)
* [Version 4.0.0](#version-400)
* [Version 4.1.0](#version-410)
* [Version 4.1.1](#version-411)
* [Version 4.1.2](#version-412)
* [Version 4.1.3](#version-413)
* [Version 4.2.0](#version-420)

<!-- vim-markdown-toc -->

Here is a list of differences between ZScript versions.

## Version 3.1.0

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
- Added `PlayerPawn::CheckFov`.
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

## Version 3.2.0

- Added `+DYNAMICLIGHT.ADDITIVE`.
- Added `+DYNAMICLIGHT.ATTENUATE`.
- Added `+DYNAMICLIGHT.SUBTRACTIVE`.
- Added `+ZDOOMTRANS`.
- Added `Actor::A_SoundVolume`.
- Added `Actor::CameraFov`.
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
- Added `SKILLP_PLAYERRESPAWN`.
- Added `Screen::DrawLine`.
- Added `alpha2` parameter to `Actor::A_SetBlend`.
- Changed `Thinker::Tics2Seconds`' logic.

## Version 3.3.0

- Added `Actor::Acs_ScriptCall`.
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
- Added `BaseStatusBar::EHudMsgLayer`.
- Added `CHAN_LOOP`.
- Added `DynamicLight::SpotInnerAngle`.
- Added `DynamicLight::SpotOuterAngle`.
- Added `ETrace*`, `ELineTier`, `ELineTraceFlags`.
- Added `FLineTargetData`.
- Added `HudMessageBase`.
- Added `Inventory::AltHudIcon`.
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

- Made `Actor::A_SetSize`'s `radius` parameter have a default.
- Made `Side::Sector` and `Side::Linedef` be `readonly`.
- Made all `DehInfo` members `readonly`.
- Made all `State` members `readonly`.

## Version 3.3.2

- Added `Line::Activate`.
- Added `Line::RemoteActivate`.
- Added `Spac`.

## Version 3.4.0

- Added "`internal`" keyword.
- Added `Actor::OnGiveSecret`.
- Added `DTA_COLOR`.
- Added `DTA_DESATURATE`.
- Added `DTA_FLIPY`.
- Added `DTA_SRCHEIGHT`.
- Added `DTA_SRCWIDTH`.
- Added `DTA_SRCX`.
- Added `DTA_SRCY`.
- Added `LevelLocals::Vec2OffsetZ`.
- Added `LevelLocals::Vec2Offset`.
- Added `LevelLocals::Vec3Offset`.
- Added `Line::ESide`.
- Added `WorldEvent::ActivationType`.
- Changed `PlayerPawn::ResetAirSupply`'s `playgasp` default to `true`.
- Made `LevelLocals::SectorPortals` be `internal`.
- Made `Sector::Portals` be `internal`.

## Version 3.5.0

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

## Version 3.6.0

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

## Version 3.7.0

- Added "`flagdef`" keyword.
- Added `"AddShaded"` RenderStyle.
- Added `"ColorAdd"` RenderStyle.
- Added `"ColorBlend"` RenderStyle.
- Added `"Multiply"` RenderStyle.
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
- Added `Actor::bNoFrictionBounce`.
- Added `Actor::bNoFriction`.
- Added `AllClasses`.
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
- Added `FLineTraceData::TRACE_HASHITSKY`.
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
- Added `LevelLocals::CLUSTER_HUB`.
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
- Added `PlayerPawn::NUM_WEAPON_SLOTS`.
- Added `PlayerPawn::PickNewWeapon`.
- Added `PlayerPawn::PickNextWeapon`.
- Added `PlayerPawn::PickPrevWeapon`.
- Added `PlayerPawn::PickWeapon`.
- Added `PlayerPawn::PlayerFinishLevel`.
- Added `PlayerPawn::TeleportFreezeTime`.
- Added `PlayerPawn::UndoPlayerMorph`.
- Added `RadiusDamageFlags`.
- Added `SKILLP_KICKBACKFACTOR`.
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
- Added `SectorAction::SECSPAC_DAMAGE3D`.
- Added `SectorAction::SECSPAC_DAMAGECEILING`.
- Added `SectorAction::SECSPAC_DAMAGEFLOOR`.
- Added `SectorAction::SECSPAC_DEATH3D`.
- Added `SectorAction::SECSPAC_DEATHCEILING`.
- Added `SectorAction::SECSPAC_DEATHFLOOR`.
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
- Added `TRACE_HASHITSKY`.
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
- Added `alpha` parameter to `Screen::DrawLine`.
- Added `alpha` parameter to `Screen::DrawThickLine`.
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
- Made `Sector::PointInSector` be `clearscope`.
- Made `Thinker::ChangeStatNum` not be `virtual`.
- Made `Weapon::SlotNumber` be `meta`.
- Made `WeaponSlots::LocateWeapon` be `const`.

## Version 3.7.2

- Changed `Actor::A_Chase`'s argument defaults.
- Fixed multi-dimensional arrays' dimensions being backwards.
- Made `LevelLocals::ExecuteSpecial` return `int`.
- Made `ScriptUtil::PlayerAmmo` be `static`.
- Made `bool` negatable by the `-` prefix operator.

## Version 3.8.0 (Legacy)

TODO

## Version 3.8.1 (Legacy)

TODO

## Version 3.8.2 (Legacy)

TODO

## Version 4.0.0

- Added `Actor::CanTouchItem`.
- Added `Actor::GetMaxHealth`.
- Added `Actor::IsFrozen`.
- Added `COMPATF2_*`.
- Added `COMPATF_*`.
- Added `CoOpStatusScreen::DisplayFont`.
- Added `CoOpStatusScreen::FontScale`.
- Added `CoOpStatusScreen::RowHeight`.
- Added `ConversationMenu::LineHeight`.
- Added `DehInfo::MaxHealth`.
- Added `GameInfoStruct::NormForwardMove`.
- Added `GameInfoStruct::NormSideMove`.
- Added `Inventory::bUnClearable`.
- Added `LevelCompatibility::AddLineID`.
- Added `LevelCompatibility::AddSectorTag`.
- Added `LevelCompatibility::Apply`.
- Added `LevelCompatibility::ClearLineIDs`.
- Added `LevelCompatibility::ClearLineSpecial`.
- Added `LevelCompatibility::ClearSectorTags`.
- Added `LevelCompatibility::GetDefaultActor`.
- Added `LevelCompatibility::Level`.
- Added `LevelCompatibility::OffsetSectorPlane`.
- Added `LevelCompatibility::SetLineActivation`.
- Added `LevelCompatibility::SetLineFlags`.
- Added `LevelCompatibility::SetLineSectorRef`.
- Added `LevelCompatibility::SetLineSpecial`.
- Added `LevelCompatibility::SetSectorLight`.
- Added `LevelCompatibility::SetSectorSpecial`.
- Added `LevelCompatibility::SetSectorTextureID`.
- Added `LevelCompatibility::SetSectorTexture`.
- Added `LevelCompatibility::SetThingFlags`.
- Added `LevelCompatibility::SetThingSkills`.
- Added `LevelCompatibility::SetThingXY`.
- Added `LevelCompatibility::SetTingZ`.
- Added `LevelCompatibility::SetVertex`.
- Added `LevelCompatibility::SetWallTextureID`.
- Added `LevelCompatibility::SetWallTexture`.
- Added `LevelCompatibility::SetWallYScale`.
- Added `LevelLocals::CompatFlags2`.
- Added `LevelLocals::CompatFlags`.
- Added `LevelLocals::CreateActorIterator`.
- Added `LevelLocals::CreateCeiling`.
- Added `LevelLocals::CreateFloor`.
- Added `LevelLocals::CreateLineIDIterator`.
- Added `LevelLocals::CreateSectorTagIterator`.
- Added `LevelLocals::FindHealthGroup`.
- Added `LevelLocals::FindUniqueTid`.
- Added `LevelLocals::GetSkyboxPortal`.
- Added `LevelLocals::GetSpotState`.
- Added `LevelLocals::IsFrozen`.
- Added `LevelLocals::IsPointInLevel`.
- Added `LevelLocals::MakeAutoSave`.
- Added `LevelLocals::MakeScreenShot`.
- Added `LevelLocals::PickDeathmatchStart`.
- Added `LevelLocals::PickPlayerStart`.
- Added `LevelLocals::PointInSector`.
- Added `LevelLocals::ReplaceTextures`.
- Added `LevelLocals::SetFrozen`.
- Added `ListMenuItemStaticPatch::mColor`.
- Added `ListMenuItemStaticPatch::mFont`.
- Added `ListMenuItemStaticPatch::mSubstitute`.
- Added `LoadSaveMenu::BrokenSaveComment`.
- Added `LoadSaveMenu::CommentRows`.
- Added `LoadSaveMenu::FontScale`.
- Added `LoadSaveMenu::UpdateSaveComment`.
- Added `MAXPLAYERNAME`.
- Added `Menu::DrawOptionText`.
- Added `Menu::OptionColor`.
- Added `Menu::OptionFont`.
- Added `Menu::OptionHeight`.
- Added `Menu::OptionWidth`.
- Added `MusPlayingInfo`.
- Added `MusPlaying`.
- Added `NewConsoleFont`.
- Added `NewSmallFont`.
- Added `OptionMenuDescriptor::mFont`.
- Added `OptionMenuItem::DrawText`.
- Added `OptionMenuItem::DrawValue`.
- Added `PlayerInfo::GetMoveBob`.
- Added `PlayerInfo::GetStillBob`.
- Added `PlayerInfo::SendPitchLimits`.
- Added `PlayerPawn::Face`.
- Added `PlayerPawn::GetFlechetteItem`.
- Added `PlayerPawn::GetPainFlash`.
- Added `PlayerPawn::GiveDeathmatchInventory`.
- Added `PlayerPawn::MAXBOB`.
- Added `ReplacedEvent`.
- Added `SaveGameManager::SaveCommentString`.
- Added `SectorPortal::GetSkyboxPortal`.
- Added `StaticEventHandler::CheckReplacee`.
- Added `StatusScreen::DrawNumScaled`.
- Added `StatusScreen::DrawPatchOrText`.
- Added `StatusScreen::DrawPercentScaled`.
- Added `StatusScreen::DrawTextScaled`.
- Added `StatusScreen::DrawTimeFont`.
- Added `StatusScreen::EnteringPatch`.
- Added `StatusScreen::FinishedPatch`.
- Added `String::AppendCharacter`.
- Added `String::DeleteLastCharacter`.
- Added `TexMan::Localize`.
- Added `TexMan::OkForLocalization`.
- Added `TextEnterMenu::CursorSize`.
- Added `TextEnterMenu::DisplayFont`.
- Added `TextEnterMenu::OpenTextEnter`.
- Added `Thinker::Level`.
- Added `WBStartStruct::ThisName`.
- Added `Weapon::LookScale`.
- Added `desc` parameter to `ListMenuItemStaticPatch::Init`.
- Added `desc` parameter to `ListMenuItemStaticPatchCentered::Init`.
- Added `dpf` parameter to `TextEnterMenu::Init`.
- Added `flags` parameter to `Actor::GetModifiedDamage`.
- Added `flags` parameter to `Inventory::ModifyDamage`.
- Added `inflictor` parameter to `Actor::GetModifiedDamage`.
- Added `inflictor` parameter to `Inventory::ModifyDamage`.
- Added `level` parameter to `ScriptUtils::SetMarineSprite`.
- Added `level` parameter to `ScriptUtils::SetMarineWeapon`.
- Added `nomove` parameter to `StatusScreen::DrawNum`.
- Added `nomove` parameter to `StatusScreen::DrawPercent`.
- Added `OS_AnyOrAllOption`.
- Added `OS_Menu`.
- Added `OS_Query`.
- Added `OS_SearchField`.
- Added `source` parameter to `Actor::GetModifiedDamage`.
- Added `source` parameter to `Inventory::ModifyDamage`.
- Deprecated `Actor::FindUniqueTid`.
- Deprecated `ActorIterator::Create`.
- Deprecated `Ceiling::CreateCeiling`.
- Deprecated `Floor::CreateFloor`.
- Deprecated `G_PickDeathmatchStart`.
- Deprecated `G_PickPlayerStart`.
- Deprecated `GlobalFreeze`.
- Deprecated `HealthGroup::Find`.
- Deprecated `LevelLocals::Frozen`.
- Deprecated `LevelLocals::IsPointInMap`.
- Deprecated `LevelLocals::RemoveAllBots`.
- Deprecated `LineIDIterator::Create`.
- Deprecated `Menu::DrawConText`.
- Deprecated `PatchInfo::mPatch`.
- Deprecated `SaveGameManager::DrawSaveComment`.
- Deprecated `Sector::PointInSector`.
- Deprecated `SectorTagIterator::Create`.
- Deprecated `SpotState::GetSpotState`.
- Deprecated `StatusScreen::DrawPatchText`.
- Deprecated `TexMan::ReplaceTextures`.
- Deprecated `TextEnterMenu::Open`.
- Implemented compound initializers for single-dimension arrays.
- Made `GameAction` be `readonly`.
- Made `LevelLocals::ExecuteSpecial` be `play`.
- Made `LevelLocals::F1Pic` be `readonly`.
- Made `LevelLocals::GetAutomapPosition` be `ui`.
- Made `LevelLocals::GetAutomapPosition` not be `static`.
- Made `LevelLocals::GiveSecret` not be `static`.
- Made `LevelLocals::SphericalCoords` be `const`.
- Made `LevelLocals::SphericalCoords` not be `static`.
- Made `LevelLocals::StartSlideshow` not be `static`.
- Made `LevelLocals::Vec2Diff` be `const`.
- Made `LevelLocals::Vec2Diff` not be `static`.
- Made `LevelLocals::Vec2OffsetZ` be `const`.
- Made `LevelLocals::Vec2OffsetZ` not be `static`.
- Made `LevelLocals::Vec2Offset` be `const`.
- Made `LevelLocals::Vec2Offset` not be `static`.
- Made `LevelLocals::Vec3Diff` be `const`.
- Made `LevelLocals::Vec3Diff` not be `static`.
- Made `LevelLocals::Vec3Offset` be `const`.
- Made `LevelLocals::Vec3Offset` not be `static`.
- Made `LevelLocals::WorldDone` not be `static`.
- Made `PlayerMenu::AlwaysRunChanged` be `static`.
- Made `PlayerMenu::AutoaimChanged` be `static`.
- Made `PlayerMenu::ClassChanged` be `static`.
- Made `PlayerMenu::ColorChanged` be `static`.
- Made `PlayerMenu::ColorSetChanged` be `static`.
- Made `PlayerMenu::GenderChanged` be `static`.
- Made `PlayerMenu::PlayerNameChanged` be `static`.
- Made `PlayerMenu::SkinChanged` be `static`.
- Made `PlayerMenu::SwitchOnPickupChanged` be `static`.
- Made `PlayerMenu::TeamChanged` be `static`.
- Made `PlayerPawn::CalcHeight` be `virtual`.
- Made `PlayerPawn::ColorRangeEnd` be `meta`.
- Made `PlayerPawn::ColorRangeStart` be `meta`.
- Made `PlayerPawn::FlechetteType` be `class<Inventory>`.
- Made `PlayerPawn::ResetAirSupply` be `virtual`.
- Made `PlayerPawn::TweakSpeeds` be `virtual`.
- Made `SaveGameManager` be `ui`.
- Made `SaveGameNode::FileName` be `readonly`.
- Made `StatusScreen::DrawEL` be `virtual`.
- Made `StatusScreen::DrawLF` be `virtual`.
- Removed `PlayerPawn::GetMaxHealth` (as it is now an `Actor` override.)
- Removed `PlayerPawn::PlayerFlags`.
- Removed `TextEnterMenu::mSizeMode`.

## Version 4.1.0

- Added `AlternativeSmallFont`.
- Added `ConversationMenu::DisplayFont`.
- Added `ConversationMenu::DisplayHeight`.
- Added `ConversationMenu::DisplayWidth`.
- Added `ConversationMenu::FontScale`.
- Added `ConversationMenu::RefHeight`.
- Added `ConversationMenu::RefWidth`.
- Added `ConversationMenu::ReplyLineHeight`.
- Added `DTA_MONOSPACE`.
- Added `DTA_SPACING`.
- Added `DeathmatchStatusScreen::DisplayFont`.
- Added `DeathmatchStatusScreen::FontScale`.
- Added `DeathmatchStatusScreen::RowHeight`.
- Added `Font::CanPrint`.
- Added `Font::CanPrint`.
- Added `Generic_UI`.
- Added `MONO_CELLCENTER`.
- Added `MONO_CELLLEFT`.
- Added `MONO_CELLRIGHT`.
- Added `MONO_OFF`.
- Added `Menu::UpdateColorSets`.
- Added `Menu::UpdateSkinOptions`.
- Added `MessageBoxMenu::ArrowFont`.
- Added `MessageBoxMenu::DestHeight`.
- Added `MessageBoxMenu::DestWidth`.
- Added `MessageBoxMenu::Selector`.
- Added `MessageBoxMenu::TextFont`.
- Added `NewPlayerMenu`.
- Added `OptionMenu::GetIndent`.
- Added `OptionMenuItemAutoAimSlider`.
- Added `OptionMenuItemPlayerClassItem`.
- Added `OptionMenuItemPlayerColorItem`.
- Added `OptionMenuItemPlayerColorSlider`.
- Added `OptionMenuItemPlayerGenderItem`.
- Added `OptionMenuItemPlayerNameField`.
- Added `OptionMenuItemPlayerSkinItem`.
- Added `OptionMenuItemPlayerSwitchOnPickupItem`.
- Added `OptionMenuItemPlayerTeamItem`.
- Added `OriginalBigFont`.
- Added `OriginalSmallFont`.
- Added `PlayerMenuPlayerDisplay`.
- Added `String::ByteAt`.
- Added `String::CharLower`.
- Added `String::CharUpper`.
- Added `String::CodePointCount`.
- Added `String::GetNextCodePoint`.
- Added `String::MakeLower`.
- Added `String::MakeUpper`.
- Added `withmapname` parameter to `AltHud::DrawCoordinates`.
- Changed `HUDFont::Create`'s `monospaced` parameter to `EMonoSpacing` and renamed to `monospacing`.
- Deprecated `String::CharAt`.
- Deprecated `String::CharCodeAt`.
- Deprecated `String::ToLower`.
- Deprecated `String::ToUpper`.
- Made `PlayerMenu::AlwaysRunChanged` be `public`.
- Made `PlayerMenu::AutoAimChanged` be `public`.
- Made `PlayerMenu::ClassChanged` be `public`.
- Made `PlayerMenu::ColorChanged` be `public`.
- Made `PlayerMenu::ColorSetChanged` be `public`.
- Made `PlayerMenu::GenderChanged` be `public`.
- Made `PlayerMenu::PlayerNameChanged` be `public`.
- Made `PlayerMenu::SkinChanged` be `public`.
- Made `PlayerMenu::SwitchOnPickupChanged` be `public`.
- Made `PlayerMenu::TeamChanged` be `public`.
- Removed `Menu::OptionColor`.

## Version 4.1.1

- Fixed `ConversationMenu::FormatReplies` using deprecated functions.
- Fixed `ConversationMenu::FormatSpeakerMessage` using deprecated functions.
- Fixed `PatchInfo::Init` using deprecated functions.
- Fixed `PlayerPawn::GetObituary` using deprecated functions.

## Version 4.1.2

No changes.

## Version 4.1.3

- Added `PlayerInfo::SetSubtitleNumber`

## Version 4.2.0

- Added `Actor::A_AttachLightDef`.
- Added `Actor::A_AttachLight`.
- Added `Actor::A_RemoveLight`.
- Added `Actor::A_SoundPitch`.
- Added `Actor::RetargetAfterSlam`.
- Added `Array::Append`.
- Added `ConversationMenu::FontFactor`.
- Added `ConversationMenu::SpeechDisplayWidth`.
- Added `ConversationMenu::mConfineTextToBackdrop`.
- Added `ConversationMenu::mHasBackdrop`.
- Added `DoomStatusBar::DrawBarKeys`.
- Added `DoomStatusBar::DrawBarWeapons`.
- Added `DoomStatusBar::DrawFullScreenKeys`.
- Added `DynamicLight::LF_ADDITIVE`.
- Added `DynamicLight::LF_ATTENUATE`.
- Added `DynamicLight::LF_DONTLIGHTACTORS`.
- Added `DynamicLight::LF_DONTLIGHTSELF`.
- Added `DynamicLight::LF_NOSHADOWMAP`.
- Added `DynamicLight::LF_SPOT`.
- Added `DynamicLight::LF_SUBTRACTIVE`.
- Added `Font::GetDisplacement`.
- Added `Font::GetMaxAscender`.
- Added `GameInfoStruct::mStatScreenAuthorFont`.
- Added `GameInfoStruct::mStatScreenContentFont`.
- Added `LevelLocals::AuthorName`.
- Added `LevelLocals::ExitLevel`.
- Added `LevelLocals::SecretExitLevel`.
- Added `Menu::DontBlur`.
- Added `PSprite::bMirror`.
- Added `Shape2D::SetTransform`.
- Added `Shape2DTransform`.
- Added `StaticEventHandler::RenderUnderlay`.
- Added `StatusScreen::AuthorTexts`.
- Added `StatusScreen::Author`.
- Added `StatusScreen::Content`.
- Added `StatusScreen::DrawAuthor`.
- Added `WBStartStruct::NextAuthor`.
- Added `WBStartStruct::ThisAuthor`.
- Added `pitch` parameter to `Actor::A_SoundPitch`.
- Added `pitch` parameter to `Object::S_Sound`.
- Added `sound_id` parameter to `PlayerInfo::SetSubtitleNumber`.
- Added a warning for unknown `DropItem`s.

<!-- EOF -->
