# Line

Also known as a "linedef." A line segment with two sides and two vertices.

```
struct Line play
{
   readonly Sector  BackSector, FrontSector;
   readonly double  BBox[4];
   readonly vector2 Delta;
   readonly Side    Sidedef[2];
   readonly Vertex  V1, V2;

   readonly uint PortalIndex;
   readonly uint PortalTransferred;

   double Alpha;
   uint   Flags;
   int    ValidCount;

   uint Activation;
   int  Args[5];
   int  LockNumber;
   int  Special;

   int Index();

   bool Activate(Actor activator, int side, int type);
   bool RemoteActivate(Actor activator, int side, int type, vector3 pos);

   Line GetPortalDestination();
   bool IsLinePortal();
   bool IsVisualPortal();

   double GetUDMFFloat(name nm);
   int    GetUDMFInt(name nm);
   string GetUDMFString(name nm);
}
```

- `BackSector`, `FrontSector`

   The sector of the front and back sides of this line.

- `BBox`

   The top, bottom, left and right of the line, respective to array index.

- `Delta`

   Equivalent to `V2 - V1`.

- `V1`, `V2`

   Returns the start and end points of this line segment, respectively.

- `Sidedef`

   The front and back sides of this line, 0 and 1 respectively. The aliases `Line.Front` and `Line.Back` are provided as well.

- `PortalIndex`

   TODO

- `PortalTransferred`

   TODO

- `Alpha`

   Alpha of the middle texture on both sides.

- `Flags`

   Any combination of the following bit flags:

   | Name                     | Description                                                                       |
   | ----                     | -----------                                                                       |
   | `ML_3DMIDTEX_IMPASS`     | Middle texture will collide with projectiles and allow them to pass through.      |
   | `ML_3DMIDTEX`            | Middle texture can be collided with and walked on as if it were a thin sector.    |
   | `ML_ADDTRANS`            | Middle textures are drawn with additive translucency on both sides.               |
   | `ML_BLOCKEVERYTHING`     | Line blocks everything.                                                           |
   | `ML_BLOCKHITSCAN`        | Line blocks hit scan attacks.                                                     |
   | `ML_BLOCKING`            | Line is solid and blocks everything but projectiles and hit scan attacks.         |
   | `ML_BLOCKMONSTERS`       | Line blocks non-flying monsters.                                                  |
   | `ML_BLOCKPROJECTILE`     | Line blocks projectiles.                                                          |
   | `ML_BLOCKSIGHT`          | Line blocks line of sight.                                                        |
   | `ML_BLOCKUSE`            | Line blocks use actions.                                                          |
   | `ML_BLOCK_FLOATERS`      | Line blocks flying monsters.                                                      |
   | `ML_BLOCK_PLAYERS`       | Line blocks players.                                                              |
   | `ML_CHECKSWITCHRANGE`    | Checks the activator's vertical position as well as horizontal before activating. |
   | `ML_CLIP_MIDTEX`         | Applies `WALLF_CLIP_MIDTEX` to both sides.                                        |
   | `ML_DONTDRAW`            | Never shown on the auto-map.                                                      |
   | `ML_DONTPEGBOTTOM`       | Lower texture is unpegged on both sides.                                          |
   | `ML_DONTPEGTOP`          | Upper texture is unpegged on both sides.                                          |
   | `ML_FIRSTSIDEONLY`       | Special can only be activated from the front side.                                |
   | `ML_MAPPED`              | Always shown on the auto-map.                                                     |
   | `ML_MONSTERSCANACTIVATE` | Monsters may activate this line.                                                  |
   | `ML_RAILING`             | Line is a railing that can be jumped over.                                        |
   | `ML_REPEAT_SPECIAL`      | Special may be activated multiple times.                                          |
   | `ML_SECRET`              | Line will be shown as one-sided on the auto-map.                                  |
   | `ML_SOUNDBLOCK`          | Blocks sound propagation after two lines with this flag.                          |
   | `ML_TWOSIDED`            | Line has a back side.                                                             |
   | `ML_WRAP_MIDTEX`         | Applies `WALLF_WRAP_MIDTEX` to both sides.                                        |
   | `ML_ZONEBOUNDARY`        | Reverb zone boundary.                                                             |

- `ValidCount`

   Don't use this.

- `Activation`

   TODO

- `Args`

   Arguments of the line's special action.

- `LockNumber`

   TODO

- `Special`

   Number of the special action to be executed when this line is activated.

- `Index`

   Returns the index of this line.

- `Activate`

   TODO

- `RemoteActivate`

   TODO

- `GetPortalDestination`

   TODO

- `IsLinePortal`

   TODO

- `IsVisualPortal`

   TODO

- `GetUDMFFloat`, `GetUDMFInt`, `GetUDMFString`

   Gets a named UDMF property attached to this linedef.

<!-- EOF -->
