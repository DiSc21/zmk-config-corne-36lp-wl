## ZMK CORNE 36 LED



#### Features:

* [x] LED-color layer indicators:
* [x] Couple of combo keys (see keymaps)
* [x] [Urob's timerless homerow mods](https://github.com/urob/zmk-config)
* [x] "CTRL-space-(stickyshif)-tabdance":
  Double-tab with active ctrl-mod adds punctuation mark, space and (not for comma) stickyshift
  | Key           | Layer         | Tap | Dance        | Stickyshift |
  | ------------- |:-------------:| ---:| ------------:|:-----------:|
  | `.`           | `default`     | `.` |  `.`+`SPACE` |          ✅ |
  | `,`           | `default`     | `,` |  `,`+`SPACE` |          ⛔ |
  | `Q`           | `default`     | `Q` |  `!`+`SPACE` |          ✅ |
  | `/`           | `default`     | `/` |  `?`+`SPACE` |          ✅ |

* [x] Keymap image generator helpers and actions
  - [x] [Keymap image generator](https://github.com/caksoylar/keymap-drawer?tab=readme-ov-file)
  - [x] Script to create layer overlays
  - [x] (Dirty) Github workflow for auto updates
  - [x] Playful GitHub actions addition of `shellcheck` with auto comments on issues

#### Noteable Customizations:

* Ctrl-Tabdances
  - Add `SPACE` for `ctrl`-tapdance on `.`
  - Add `SPACE+StickyCaps` for `ctrl`-`shift`-tapdance on `.`
* Layer-Combos:
  - * Capsword on `A-S`-Combo
  - * Toggle default layer on `O-P`-Combo
  - * Toggle navigation layer on `G-H`-Combo
  - * Toggle numbers layer on `C-V`-Combo
  - * Sticky rgb layer on `B-N`-Combo
  - * Sticky bluetooth layer on `T-Y`-Combo

#### Missing Features:

* [ ] BT Shortcuts
* [ ] LED Shortcuts
* [ ] Mouse Actions
* [ ] Intelligent CAPS WORD
* [ ] Intelligent Number Layer

#### Cleanups/Optimizations:

* [ ] Optimize combo timings
* [ ] Clean up config (includes)
* [ ] Clean up overlay script (includes)
* [ ] Optimize numbers layer trigger
* [ ] Optimize hold-tap/combo/... timings

#### Keyboard Layout:

<svg width="975" height="411" viewBox="0 0 975 411" class="keymap" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<style>/* font and background color specifications */
</style>
<g>
  <image x="0"   y="20" width="100%" height="100%" href="./keymap/fancy/corne_default.svg" />
  <image x="20"  y="0"  width="100%" height="100%" href="./keymap/fancy/corne_signs.svg" />
  <image x="-18" y="0"  width="100%" height="100%" href="./keymap/fancy/corne_numbers.svg" />
  <image x="-18" y="40" width="100%" height="100%" href="./keymap/fancy/corne_navigation.svg" />
</g>
</svg>

![Alt text](./keymap/fancy/corne.svg)

