# Wads

The `Wads` group of functions allow you to access the virtual file system by
reading from loaded archives. Note that all archive operations are **not
deterministic** unless all users have the exact same files loaded. This is
generally fine even if they are not exactly the same, but be careful to not do
things which may collide with what another mod is doing.

As a summary of how the virtual file system works, files of various kinds are
loaded from *archives* into a structure of *lumps* and *namespaces*. The term
*lump* in this document refers to any file object loaded from an archive which
has its name truncated to 8 characters and its extension stripped, and the term
*file* refers to any actual file within a real folder structure. Archives which
have real folder structures are referred to in this document as *resource
archives* or *resources*. The other two types of supported archives are *Doom
Wad* (commonly just "Wad") and *Blood* `RFF` files. The latter is useless. The
former, *Doom Wads*, are most commonly used for maps, map sets, older mods and
all commercially available games including Doom, Heretic &al. The currently
supported resource archive file types include `PKZIP` (`.zip`, `.pk3`, `.pkz`),
7-Zip (`.7z`, `.pk7`), BUILD `GRP` (`.grp`), Quake `PAK` (`.pak`), and folders.
Single files can also be loaded as archives, containing only themselves.

In short:

* *Lump* refers to an object from any archive type with an 8 character filename (extension removed.)
* *File* refers to fully qualified object from a resource archive, which can also be used as a lump through its truncated name.
* *Archives* are real files or folders which hold *lumps*.
* *Resource archives* are archives with a folder structure for determining lump namespaces, and also store fully qualified paths for files.
* *Wad files* are archives which hold only lumps, and use markers for determining lump namespaces.

| Name              | Description                                             | Resource path | Wad file marker                          |
| ----              | -----------                                             | ------------- | ---------------                          |
| `NS_ACSLIBRARY`   | ACS libraries.                                          | `/acs/`       | `A_START`/`A_END`                        |
| `NS_BLOODMISC`    | Unused.                                                 | N/A           | N/A                                      |
| `NS_BLOODRAW`     | Blood `RAW` format sounds. Found only in `RFF` files.   | N/A           | N/A                                      |
| `NS_BLOODSFX`     | Blood `SFX` format sounds. Found only in `RFF` files.   | N/A           | N/A                                      |
| `NS_COLORMAPS`    | Boom color maps.                                        | `/colormaps/` | `C_START`/`C_END`                        |
| `NS_FLATS`        | Flat textures.                                          | `/flats/`     | `FF_START`/`FF_END`                      |
| `NS_GLOBAL`       | The global namespace, which is the root of any archive. | `/`           | None                                     |
| `NS_GRAPHICS`     | Miscellaneous graphics.                                 | `/graphics/`  | None                                     |
| `NS_HIDDEN`       | Used for filtered files that did not match this game.   | N/A           | N/A                                      |
| `NS_HIRES`        | Deprecated high-resolution textures.                    | `/hires/`     | `HI_START`/`HI_END`                      |
| `NS_MUSIC`        | Music files.                                            | `/music/`     | None                                     |
| `NS_NEWTEXTURES`  | Generic texture files, usable as patches or flats.      | `/textures/`  | `TX_START`/`TX_END`                      |
| `NS_PATCHES`      | Texture patches.                                        | `/patches/`   | None                                     |
| `NS_SOUNDS`       | Sound files.                                            | `/sounds/`    | None                                     |
| `NS_SPRITES`      | Sprites are all contained in this namespace.            | `/sprites/`   | `S_START`/`S_END` or `SS_START`/`SS_END` |
| `NS_STRIFEVOICES` | Strife voice files.                                     | `/voices/`    | `V_START`/`V_END`                        |
| `NS_VOXELS`       | Volumetric pixel (voxel) models.                        | `/voxels/`    | `VX_START`/`VX_END`                      |

Additionally, `NS_SPECIALZIPDIRECTORY` denotes the start of the specialized
resource archive folder namespaces, which are normally under `NS_GLOBAL`.

```
struct Wads
{
	static int    CheckNumForFullName(string name);
	static int    CheckNumForName(string name, int ns, int wadnum = -1, bool exact = false);
	static int    FindLump(string name, int startlump = 0, FindLumpNamespace ns = Wads.GLOBALNAMESPACE);
	static string ReadLump(int lump);
}
```

### `CheckNumForFullName`

Returns the handle of the first file named `name`, matching only the full path
to it, including the extension, or `-1` if the file was not found. Only works
with files defined in resource archives.

### `CheckNumForName`

Returns the handle of the first lump named `name` within namespace `ns`. If
`wadnum` is not `-1`, then it signifies, if `exact` is false, the number of the
last archive to search in, or the only archive to search in if `exact` is
`true`.

Note there is currently no way to actually *get* the number of an archive, even
the current one. The only guarantee is that archive `0` will be the base
archive (`gzdoom.pk3`.)

### `FindLump`

Returns the handle of the first lump named `name` starting at `startlump` (zero
indicates the first lump) in either the global namespace or any namespace. `ns`
can be either `Wads.GLOBALNAMESPACE` or `Wads.ANYNAMESPACE` to specify this.
Returns `-1` if there are no lumps with that name left.

This function can be used in a loop to find all lumps with a specified name.

### `ReadLump`

Reads the whole contents of `lump` into a string and returns the result. If
`lump` is not valid, returns an empty string. Note that binary lumps can be
loaded this way and the string's length will be correct according to the lump's
size even if null characters are present in the lump.

<!-- EOF -->
