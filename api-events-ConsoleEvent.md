# ConsoleEvent

The information for a `ConsoleProcess` or `NetworkProcess` event.

```
struct ConsoleEvent
{
   readonly int Player;
   readonly string Name;
   readonly int Args[3];
   readonly bool IsManual;
}
```

- `Player`

   The player who created this event, or `-1` if there was no activator. This
   will always be positive for `NetworkProcess` events and always `-1` for
   `ConsoleProcess` events.

- `Name`

   The name as provided to `SendNetworkEvent`. Use this to distinguish between
   event types. It is favorable to prefix names with the name of your mod or
   game so that it will not potentially conflict with other mods.

- `Args`

   The arguments as provided to `SendNetworkEvent`.

- `IsManual`

   `true` if this event was created manually, for instance through a console
   command.

<!-- EOF -->
