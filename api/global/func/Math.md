# Math

These are all of the math functions provided to ZScript. These are available in
all contexts. Note that all angles are in degrees.

```
Type   Abs(Type n);
double ACos(double n);
double ASin(double n);
double ATan(double n);
double ATan2(double y, double x);
uint   BAM(double angle);
double Ceil(double n);
Type   Clamp(Type n, Type minimum, Type maximum);
double Cos(double n);
double CosH(double n);
double Exp(double n);
double Floor(double n);
double Log(double n);
double Log10(double n);
Type   Max(Type n, Type maximum);
Type   Min(Type n, Type minimum);
double Sin(double n);
double SinH(double n);
double Sqrt(double n);
double Tan(double n);
double TanH(double n);
double VectorAngle(double x, double y);
```

### `Abs`

Returns `|n|` (absolute of `n`.)

### `ACos`

Returns the arc-cosine of `n`.

### `ASin`

Returns the arc-sine of `n`.

### `ATan`

Returns the arc-tangent of `n`.

### `ATan2`

Returns the arc-tangent of `y / x` using the arguments' signs to determine the
correct quadrant.

### `BAM`

Returns a byte angle of `angle` (`degrees * (0x40000000 / 90.0)`.)

### `Ceil`

Returns the integral portion of `n`, rounded up.

### `Clamp`

Returns `n` if `n` is more than `minimum` and less than `maximum`, or either of
those values if it is not.

### `Cos`

Returns the cosine of `n`.

### `CosH`

Returns the hyperbolic cosine of `n`.

### `Exp`

Returns euler's number raised to the power `n`. Note that you probably want
instead the `**` binary operator, as in `a ** b`, since euler's number is
generally not a very useful constant when programming games.

### `Floor`

Returns the integral portion of `n`, rounded down.

### `Log`

Returns the natural (base of euler's number) logarithm of `n`.

### `Log10`

Returns the common (base 10) logarithm of `n`. Note that this is useful for
instance when calculating the number of decimal digits in a number.

### `Max`

Returns `n` if `n` is less than `maximum`, or `maximum`.

### `Min`

Returns `n` if `n` is more than `minimum`, or `minimum`.

### `Sin`

Returns the sine of `n`.

### `SinH`

Returns the hyperbolic sine of `n`.

### `Sqrt`

Returns the square root of `n`.

### `Tan`

Returns the tangent of `n`.

### `TanH`

Returns the hyperbolic tangent of `n`.

### `VectorAngle`

Same as `ATan2`, but with arguments reversed.

<!-- EOF -->
