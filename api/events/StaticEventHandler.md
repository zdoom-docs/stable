# StaticEventHandler

Static event handlers handle events on a per-instance level. This means that
they are registered when you start GZDoom, and un-register when you exit
GZDoom. This is unlike `EventHandler`, which registers when a new game is
started, and un-registers when it ends. Care should be taken to make sure that
variables kept in a static event handler don't interact with the game directly,
or it will act **non-deterministically** and cause a desync.

All of the virtual functions on `StaticEventHandler` have empty implementations
by default, so you only need to override the events your event handler needs to
override.

Differences in virtual function behaviour are listed in the `EventHandler`
documentation.

```
class StaticEventHandler : Object play
{
   clearscope static StaticEventHandler Find(class<StaticEventHandler> type);

   virtual void OnRegister();
   virtual void OnUnregister();

   virtual void WorldLoaded(WorldEvent e);
   virtual void WorldUnloaded(WorldEvent e);
   virtual void WorldThingSpawned(WorldEvent e);
   virtual void WorldThingDied(WorldEvent e);
   virtual void WorldThingRevived(WorldEvent e);
   virtual void WorldThingDamaged(WorldEvent e);
   virtual void WorldThingDestroyed(WorldEvent e);
   virtual void WorldLinePreActivated(WorldEvent e);
   virtual void WorldLineActivated(WorldEvent e);
   virtual void WorldSectorDamaged(WorldEvent e);
   virtual void WorldLineDamaged(WorldEvent e);
   virtual void WorldLightning(WorldEvent e);
   virtual void WorldTick();

   virtual ui void RenderOverlay(RenderEvent e);

   virtual void PlayerEntered(PlayerEvent e);
   virtual void PlayerRespawned(PlayerEvent e);
   virtual void PlayerDied(PlayerEvent e);
   virtual void PlayerDisconnected(PlayerEvent e);

   virtual ui bool UiProcess(UiEvent e);
   virtual ui void UiTick();
   virtual ui void PostUiTick();

   virtual ui bool InputProcess(InputEvent e);

   virtual ui void ConsoleProcess(ConsoleEvent e);
   virtual void NetworkProcess(ConsoleEvent e);

   virtual void CheckReplacement(ReplaceEvent e);

   virtual void NewGame();

   void SetOrder(int order);

   readonly int Order;
   bool IsUiProcessor;
   bool RequireMouse;
}
```

### `Find`

Finds and returns the `StaticEventHandler` type `type` if it is registered, or
`null` if it does not exist.

### `OnRegister`

Called when this type is registered. This is where you should set `Order`,
`IsUiProcessor` and `RequireMouse`.

### `OnUnregister`

Called when this type is un-registered. With `StaticEventHandler`s this is
called when the engine shuts down, so it isn't particularly useful.

### `WorldLoaded`

Called directly after the status bar is attached to the player and after
`REOPEN` ACS scripts are called, just before the display is flushed and
auto-save is done.

### `WorldUnloaded`

Called directly after `UNLOADING` ACS scripts, just before the level is
changed.

### `WorldThingSpawned`

Called directly after an actor's `PostBeginPlay` function.

### `WorldThingDied`

Called after `MorphedDeath`, inventory items have called `OwnerDied`, and the
target is set to the damage source, just before `KILL` ACS scripts are called
and the rest of the death handling is done.

### `WorldThingRevived`

Called when an actor is revived, after everything is finished.

### `WorldThingDamaged`

Called directly before `Die`, or directly after after `DamageMobj` finishes.

### `WorldThingDestroyed`

Called at the beginning of an actor's `OnDestroy` function.

### `WorldLinePreActivated`

Called directly after a line is tested for activation, before any other
activation specials are called (such as checking for keys, executing the line
special, etc.)

### `WorldLineActivated`

Called directly after a line's special is executed, if it succeeded, before any
other handling (such as changing a switch's texture) is completed.

### `WorldSectorDamaged`

Called when a sector is damaged if it has any health groups, before any other
handling is done.

### `WorldLineDamaged`

Called when a line is damaged if it has any health groups, before any other
handling is done.

### `WorldLightning`

Called when lightning strikes, directly after the sound is played, just before
`LIGHTNING` ACS scripts are called.

### `WorldTick`

Called on every world tick, after interpolators are updated, world freeze is
updated, sight counters are reset, particles have run their thinkers, and
players have run their thinkers, just before the status bar is ticked, the
level ticks, thinkers are ticked, and the level time is updated. This is not
called when the game is paused, and its execution is entirely deterministic
regardless of how this event handler is applied.

### `RenderOverlay`

Despite the name, this is actually run on the status bar, specifically in
`BaseStatusBar::DrawTopStuff`. It is run after `HudMessage`s are drawn and
power-ups are drawn, just before ゴゴゴ「The Log」ゴゴゴ is drawn. You may use
`Screen` functions in this function.

### `PlayerEntered`

Called during level load when each player enters the game, after the camera is
set but just before `RETURN` ACS scripts are called.

### `PlayerRespawned`

Called when a player spawns, directly after the teleport fog is spanwed and
just before `RESPAWN` ACS scripts are called. Also called similarly at the end
of the `Respawn` function, for example when the `resurrect` cheat is used.

### `PlayerDied`

Called after `WorldThingDied` and `GetDeathHeight`, and after the actor's thing
special is activated, when the obituary has been displayed, just before `DEATH`
ACS scripts have been called.

### `PlayerDisconnected`

Called when a bot is removed and when a player disconnects from the game, just
before `DISCONNECT` ACS scripts are called.

### `UiProcess`

Called only if `IsUiProcessor` is `true`. Called when a GUI event is dispatched
by the engine, for example when the UI is active and the player has pressed a
key or moved the mouse. Mouse movements will only be captured if `RequireMouse`
is `true`. Because this interacts directly with the OS it is not part of the
game simulation, therefore has `ui` scope and must dispatch commands to the
game as networked events. If the return value is `true`, the function will
block any further handlers from processing this event, essentially "eating"
it. If the return value is `false`, other handlers will continue to be called
as normal.

### `UiTick`

Despite what it may seem, this function is actually called deterministically
within the game loop, just before the level is ticked and after the player's
network commands are created. Albeit this, it is `ui` scope, so it should be
used to process UI code.

### `PostUiTick`

Similar to `UiTick`, this is also deterministic, but called after all other
tickers.

### `InputProcess`

The same as `UiProcess`, but this is only called when inputs are being directed
to the game, rather than to the GUI. All of the same restrictions apply to this
as they do to `UiProcess`, and the return value acts the same.

### `ConsoleProcess`

Called when network events which have no player activator are received.

### `NetworkProcess`

Called when network events which have a player activator are received.

### `CheckReplacement`

Called during actor replacement, after skill replacement is done, but before
any other replacement (such as actor replacements done in ZScript actor
definitions.)

### `NewGame`

Called on a new game, directly after level data is reset and right before the
level is set up.

### `SetOrder`

Sets the ordering of this event handler, which can be read from `Order`.

### `Order`

The arbitrary ordering of this event handler relative to other ones. Event
handlers with lower ordering numbers have their functions executed first. You
can set this variable with `SetOrder`.

### `IsUiProcessor`

If `true`, GUI events will be sent to this event handler through `UiProcess`.
This is mainly for optimization purposes.

### `RequireMouse`

If `true`, mouse events will be sent to this event handler through
`InputProcess` and/or `UiProcess`. This is mainly for optimization purposes.

<!-- EOF -->
