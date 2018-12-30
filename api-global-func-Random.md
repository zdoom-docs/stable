# Random Number Generation

All of these functions may have `[identifier]` between the function name and the argument list to specify a named RNG table to use. This special syntax applies only to these functions.

```
double FRandom(double min, double max);
double FRandomPick(double...);
int    Random(int min = 0, int max = 255);
int    Random2(uint mask = uint.Max);
int    RandomPick(int...);
void   SetRandomSeed(uint num);
```

- `FRandom`

   Returns a random float between `min` and `max`.

- `FRandomPick`

   Same as `RandomPick`, but with floats.

- `Random`

   Returns a random integer between `min` and `max`.

- `Random2`

   Returns a random integer value between `-mask` and `mask`. `mask` is used as a bit mask, so it is recommended to use a value of one less than a power of two (i.e. 3, 7, 15, 31, 63, 127, 255...)

- `RandomPick`

   Returns one of the provided parameters randomly.

- `SetRandomSeed`

   Sets the seed of the RNG table to `num`.

<!-- EOF -->
