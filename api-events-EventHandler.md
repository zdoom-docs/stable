# EventHandler

Event handlers handle events on a per-game or per-map level. This means that
they are registered when you start a new game or map, and un-register when you
finish the game or map. This is unlike `StaticEventHandler`, which registers
when the engine is started, and un-registers when it exits.

All of the virtual functions on `EventHandler` have empty implementations by
default, so you only need to override the events your event handler needs to
override.

See `StaticEventHandler` for more information on the events that can be
overridden on this type.

```
class EventHandler : StaticEventHandler
{
   clearscope static StaticEventHandler Find(class<StaticEventHandler> type);
   clearscope static void SendNetworkEvent(string name, int arg1 = 0, int arg2 = 0, int arg3 = 0);
}
```

- `Find`

   Finds and returns the `StaticEventHandler` type `type` if it is registered,
   or `null` if it does not exist. It should be noted that this is exactly the
   same as `StaticEventHandler`'s, and does not actually check for
   `EventHandlers`, although due to inheritance will return them correctly.

- `SendNetworkEvent`

   Sends a network event with no activator.

<!-- EOF -->
