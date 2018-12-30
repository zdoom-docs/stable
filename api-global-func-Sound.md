# Sound

TODO

```
void  SetMusicVolume(float vol);
bool  S_ChangeMusic(string name, int order = 0, bool looping = true, bool force = false);
float S_GetLength(sound id);
void  S_PauseSound(bool notmusic, bool notsfx);
void  S_ResumeSound(bool notsfx);
void  S_Sound(sound id, int channel, float volume = 1, float attenuation = ATTN_NORM);
```

- `SetMusicVolume`

   Sets the volume of the music relative to the user's volume. Range is 0-1, inclusive.

- `S_ChangeMusic`

   Changes the music to `name`. If `name` is `"*"`, the music will be set to the default music for this level. Will loop if `looping` is `true`. `force` will force the music to play even if a playlist (from the `playlist` console command) is playing.

   `order` may mean something different based on the music format:

   | Format                              | Meaning                                     |
   | ------                              | -------                                     |
   | Tracker music (`.mod`, `.xm`, etc.) | Specifies the order the song will start at. |
   | Multi-track `.ogg`, `.flac`, etc.   | Specifies the track to begin playing at.    |
   | Any other format                    | No meaning, will be ignored.                |

- `S_GetLength`

   Returns the length of a sound in seconds. **Potentially non-deterministic if all users in a networked game are not using the same sounds.**

- `S_PauseSound`

   Pauses music if `notmusic` is `false` and all game sounds if `notsfx` is `false`. Used for instance in the time stop power-up.

- `S_ResumeSound`

   Resumes playing music and, if `notsfx` is `false`, all game sounds as well.

- `S_Sound`

   Plays a sound (as defined in `SNDINFO`) from the calling object if it has world presence (is an actor or sector etc.)

   `channel` may be:

   | Name          | Description                                                        |
   | ----          | -----------                                                        |
   | `CHAN_AUTO`   | Automatically assigns the sound to a free channel (if one exists.) |
   | `CHAN_BODY`   | For footsteps and generally anything else.                         |
   | `CHAN_ITEM`   | For item pickups.                                                  |
   | `CHAN_VOICE`  | For player grunts.                                                 |
   | `CHAN_WEAPON` | For weapon noises.                                                 |
   | `CHAN_5`      | Extra sound channel.                                               |
   | `CHAN_6`      | Extra sound channel.                                               |
   | `CHAN_7`      | Extra sound channel.                                               |

   `channel` may also have the following flags applied with the binary OR operator `|`:

   | Name               | Description                                                                              |
   | ----               | -----------                                                                              |
   | `CHAN_LISTENERZ`   | Sound ignores height entirely, playing at the listener's vertical position.              |
   | `CHAN_LOOP`        | Continues playing the sound on loop until it is stopped manually.                        |
   | `CHAN_MAYBE_LOCAL` | Does not play sound to other players if the silent pickup compatibility flag is enabled. |
   | `CHAN_NOPAUSE`     | Does not pause in menus or when `S_PauseSound` is called.                                |
   | `CHAN_NOSTOP`      | Does not start a new sound if the channel is already playing something.                  |
   | `CHAN_UI`          | Does not record sound in saved games or demos.                                           |

   Additionally, `CHAN_PICKUP` is equivalent to `CHAN_ITEM | CHAN_MAYBE_LOCAL`.

   `attenuation` determines the drop-off distance of the sound. The higher the value, the quicker it fades. Constants include:

   | Name          | Value   | Description                                                                         |
   | ----          | -----   | -----------                                                                         |
   | `ATTN_IDLE`   | `1.001` | Uses Doom's default sound attenuation.                                              |
   | `ATTN_NONE`   | `0`     | Does not drop off at all, plays throughout the whole map.                           |
   | `ATTN_NORM`   | `1`     | Drops off using the `close_dist` and `clipping_dist` defined in `SNDINFO`. Default. |
   | `ATTN_STATIC` | `3`     | Drops off quickly, at around 512 units.                                             |

<!-- EOF -->
