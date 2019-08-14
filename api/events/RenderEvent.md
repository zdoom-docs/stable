# RenderEvent

The information for a `RenderOverlay` event.

```
struct RenderEvent
{
	readonly vector3 ViewPos;
	readonly double ViewAngle;
	readonly double ViewPitch;
	readonly double ViewRoll;
	readonly double FracTic;
	readonly Actor Camera;
}
```

### `ViewPos`

The position at which the camera is at.

### `ViewAngle`

The yaw angle of the camera.

### `ViewPitch`

The pitch angle of the camera.

### `ViewRoll`

The roll angle of the camera.

### `FracTic`

A value between 0 and 1 (exclusive) representing the time between the last game
tick and the next game tick. This is most useful for interpolation, and you can
add it to the current game tick to get the real time at which this event has
been called. Precision is not specified.

### `Camera`

The actor which is acting as the camera for the player's view.

<!-- EOF -->
