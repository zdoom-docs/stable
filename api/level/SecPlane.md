# SecPlane

TODO

```
struct SecPlane play
{
   double  D;
   double  NegiC;
   vector3 Normal;

   void   ChangeHeight(double hdiff);
   double GetChangedHeight(double hdiff) const;
   double HeightDiff(double oldd, double newd = 0.0) const;
   bool   IsEqual(SecPlane other) const;
   bool   IsSlope() const;
   int    PointOnSide(vector3 pos) const;
   double PointToDist(vector2 xy, double z) const;
   double ZAtPointDist(vector2 v, double dist) const;

   clearscope double ZAtPoint(vector2 v) const;
}
```

### `D`

TODO

### `NegiC`

TODO

### `Normal`

TODO

### `ChangeHeight`

TODO

### `GetChangedHeight`

TODO

### `HeightDiff`

TODO

### `IsEqual`

TODO

### `IsSlope`

TODO

### `PointOnSide`

TODO

### `PointToDist`

TODO

### `ZAtPointDist`

TODO

### `ZAtPoint`

TODO

<!-- EOF -->
