# StatusScreen

The base class for intermission status screens. Any status screen used by `MAPINFO`/GameInfo must be derived from this class.

Status screens have four stages:

- `StatCount`, where the stats are counted and displayed.
- `ShowNextLoc`, where the next map is shown as "ENTERING (map name)" and in episodic maps, the world map.
- `NoState`, at the very end of this process, where the last frame is drawn and the intermission is exited.
- `LeavingIntermission`, which is used only to signify that all stages are done and the status screen has been exited.

These are provided as constants in `StatusScreen`. The starting stage is `StatCount`.

```
class StatusScreen abstract play
{
   const NG_STATSY;
   const SHOWNEXTLOCDELAY;
   const SP_STATSX;
   const SP_STATSY;
   const SP_TIMEX;
   const SP_TIMEY;
   const TITLEY;

   InterBackground BG;
   WBPlayerStruct  Plrs[MAXPLAYERS];
   WBStartStruct   WBS;

   int   AccelerateStage;
   int   BCnt;
   int   Cnt;
   int   Cnt_Deaths[MAXPLAYERS];
   int   Cnt_Frags[MAXPLAYERS];
   int   Cnt_Items[MAXPLAYERS];
   int   Cnt_Kills[MAXPLAYERS];
   int   Cnt_Par;
   int   Cnt_Pause;
   int   Cnt_Secret[MAXPLAYERS];
   int   Cnt_Time;
   int   Cnt_Total_Time;
   int   CurState;
   int   DoFrags;
   int   Me;
   int   NG_State;
   bool  NoAutoStartMap;
   bool  PlayerReady[MAXPLAYERS];
   int   Player_Deaths[MAXPLAYERS];
   bool  SNL_PointerOn;
   int   SP_State;
   float ShadowAlpha;
   int   Total_Deaths;
   int   Total_Frags;

   PatchInfo Entering;
   PatchInfo Finished;
   PatchInfo MapName;

   textureid Items;
   textureid Kills;
   textureid P_Secret;
   textureid Par;
   textureid Secret;
   textureid Sucks;
   textureid Timepic;

   string LNameTexts[2];

   int  DrawCharPatch(Font fnt, int charcode, int x, int y, int translation = Font.CR_UNTRANSLATED, bool nomove = false);
   void DrawEL();
   int  DrawLF();
   int  DrawName(int y, textureid tex, string levelname);
   int  DrawNum(Font fnt, int x, int y, int n, int digits, bool leadingzeros = true, int translation = Font.CR_UNTRANSLATED);
   int  DrawPatchText(int y, PatchInfo pinfo, string stringname);
   void DrawPercent(Font fnt, int x, int y, int p, int b, bool show_total = true, int color = Font.CR_UNTRANSLATED);
   void DrawTime(int x, int y, int t, bool no_sucks = false);

   bool AutoSkip();

   virtual void Drawer();
   virtual void End();
   virtual void Start(WBStartStruct wbs_);
   virtual void StartMusic();
   virtual void Ticker();

   protected virtual void DrawNoState();
   protected virtual void DrawShowNextLoc();
   protected virtual void DrawStats();
   protected virtual void InitNoState();
   protected virtual void InitShowNextLoc();
   protected virtual void InitStats();
   protected virtual void UpdateNoState();
   protected virtual void UpdateShowNextLoc();
   protected virtual void UpdateStats();

   protected void CheckForAccelerate();
   protected int  FragSum(int playernum);

   static int, int, int GetPlayerWidths();
   static color GetRowColor(PlayerInfo player, bool highlight);
   static void  GetSortedPlayers(in out array<int> sorted, bool teamplay);
   static void  PlaySound(sound snd);
}
```

- `NG_STATSY`

   TODO

- `SHOWNEXTLOCDELAY`

   TODO

- `SP_STATSX`

   TODO

- `SP_STATSY`

   TODO

- `SP_TIMEX`

   TODO

- `SP_TIMEY`

   TODO

- `TITLEY`

   The Y position (in 320x200 pixels) to draw the top of the "finished" and "entering" texts. Used by `DrawEL` and `DrawLF`.

- `BG`

   The `InterBackground` object for this intermission, set by `Start` with the initial `WBS` object.

- `Plrs`

   The value of `WBS.Plyr` when `Start` was called. Usually not changed, so essentially equivalent to `WBS.Plyr`.

- `WBS`

   The `WBStartStruct` passed to this class via the `Start` function.

- `AccelerateStage`

   Used to signify to the current stage that it should go quicker or be skipped entirely.

- `BCnt`

   TODO

- `Cnt`

   TODO

- `Cnt_Deaths`

   TODO

- `Cnt_Frags`

   TODO

- `Cnt_Items`

   TODO

- `Cnt_Kills`

   TODO

- `Cnt_Par`

   TODO

- `Cnt_Pause`

   TODO

- `Cnt_Secret`

   TODO

- `Cnt_Time`

   TODO

- `Cnt_Total_Time`

   TODO

- `CurState`

   The current stage the intermission is in.

- `DoFrags`

   TODO

- `Me`

   The value of `WBS.PNum` when `Start` was called. Usually not changed, so essentially equivalent to `WBS.PNum`.

- `NG_State`

   TODO

- `NoAutoStartMap`

   TODO

- `PlayerReady`

   Used in networked games to signify when each player is ready to continue to the next map. Set by `CheckForAccelerate`.

- `Player_Deaths`

   TODO

- `SNL_PointerOn`

   TODO

- `SP_State`

   Used in single-player status screens during the `StatCount` stage for indicating the current round of statistics to count up.

- `ShadowAlpha`

   TODO

- `Total_Deaths`

   TODO

- `Total_Frags`

   TODO

- `Entering`

   TODO

- `Finished`

   TODO

- `MapName`

   TODO

- `Items`

   The "ITEMS" (default `WIOSTI`) graphic.

- `Kills`

   The "KILLS" (default `WIOSTK`) graphic.

- `P_Secret`

   The "SECRET" (default `WISCRT2`) graphic.

- `Par`

   The "PAR" (default `WIPAR`) graphic.

- `Secret`

   The "SCRT" (default `WIOSTS`) graphic.

- `Sucks`

   The "SUCKS" (default `WISUCKS`) graphic.

- `Timepic`

   The "TIME" (default `WITIME`) graphic.

- `LNameTexts`

   TODO

- `DrawCharPatch`

   TODO

- `DrawEL`

   TODO

- `DrawLF`

   TODO

- `DrawName`

   TODO

- `DrawNum`

   TODO

- `DrawPatchText`

   TODO

- `DrawPercent`

   TODO

- `DrawTime`

   TODO

- `AutoSkip`

   TODO

- `Drawer`

   Called by `WI_Drawer`, which is called every frame when `GameState` is `GS_INTERMISSION`.

- `End`

   Called when the intermission should end. Default behaviour is to set `CurState` to `LeavingIntermission` and remove bots in death-match. Generally, `Level.WorldDone` should be called directly after this.

- `Start`

   Called by `WI_Start` after the `WBStartStruct` is populated, sounds are stopped and the screen blend is set to black. Sets up initial values and runs `InitStats`.

- `StartMusic`

   Called in the first tick by `Ticker` to set the intermission music.

- `Ticker`

   Called by `WI_Ticker`, which is called every game tick when `GameState` is `GS_INTERMISSION`.

- `DrawNoState`

   Called by `Drawer` when `CurState` is `NoState` or any other non-state.

- `DrawShowNextLoc`

   Called by `Drawer` when `CurState` is `ShowNextLoc` and, by default, `DrawNoState` after setting `SNL_PointerOn` to `true`.

- `DrawStats`

   Called by `Drawer` directly after drawing the animated background when `CurState` is `StatCount`.

- `InitNoState`

   Called by `UpdateShowNextLoc` to initiate the `NoState` stage.

- `InitShowNextLoc`

   Called by `UpdateStats` to initiate the `ShowNextLoc` stage.

- `InitStats`

   Called by `Start` to initiate the `StatCount` stage.

- `UpdateNoState`

   Called by `Ticker` when `CurState` is `NoState` or any other non-state. Exits the intermission by calling `End` and `Level.WorldDone` when appropriate.

- `UpdateShowNextLoc`

   Called by `Ticker` when `CurState` is `ShowNextLoc`. Runs `InitNoState` when appropriate and alternates `SNL_PointerOn`.

- `UpdateStats`

   Called by `Ticker` when `CurState` is `StatCount`. Runs `InitShowNextLoc` when appropriate.

- `CheckForAccelerate`

   Updates the values of `AccelerateStage` and `PlayerReady` according to each player's inputs.

- `FragSum`

   Returns the number of frags player `playernum` has accumulated against all currently in-game players. This is different from `WBPlayerStruct.FragCount` because it is counted dynamically, i.e. if a player leaves the count will be changed. This is only useful for game modes where frags do not count as score.

- `GetPlayerWidths`

   TODO

- `GetRowColor`

   TODO

- `GetSortedPlayers`

   TODO

- `PlaySound`

   Plays a UI sound at full volume using `S_Sound`.

<!-- EOF -->
