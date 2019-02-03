# Math

TODO

```
Type   Abs(Type n);
double ATan2(double y, double x);
uint   BAM(double angle);
Type   Clamp(Type n, Type minimum, Type maximum);
Type   Max(Type n, Type maximum);
Type   Min(Type n, Type minimum);
double VectorAngle(double x, double y);
```

- `Abs`

   Returns `|n|` (absolute of `n`.)

- `ATan2`

   Computes the arctangent of `y / x` using the arguments' signs to determine
   the correct quadrant.

- `BAM`

   Returns a byte angle of `angle` (`degrees * (0x40000000 / 90.0)`.)

- `Clamp`

   Returns `n` if `n` is more than `minimum` and less than `maximum`, or either
   of those values if it is not.

- `Max`

   Returns `n` if `n` is less than `maximum`, or `maximum`.

- `Min`

   Returns `n` if `n` is more than `minimum`, or `minimum`.

- `VectorAngle`

   Same as `ATan2`, but with arguments reversed.

<!-- EOF -->
