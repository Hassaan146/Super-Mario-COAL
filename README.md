# Super Mario — COAL (x86 Assembly)

A console **Super Mario platformer written entirely in x86 assembly** (MASM + the Irvine32 library), built as the semester project for Computer Organization & Assembly Language (COAL).

The whole game lives in one file: [`mario.asm`](mario.asm).

## Gameplay & implementation

- **ASCII level maps** — levels are defined as `BYTE` strings (120×26 grid) drawn straight to the console
- **Movement & gravity** — keyboard-driven horizontal movement with jump and gravity handled manually via row/column position bytes
- **Scoring** — collectibles tracked in a score counter and printed on screen
- Rendering, input, timing, and collision are all done with Irvine32 console routines — no engine, no OS abstractions

## Building & running

1. Install **Visual Studio** with the MASM toolchain.
2. Set up the **Irvine32 library** (from *Assembly Language for x86 Processors* — [kipirvine.com/asm](https://kipirvine.com/asm/)) and add its include/lib paths to the project.
3. Create an empty MASM project, add `mario.asm`, build, and run from the console.

> The console window should be sized to at least 120 columns so the level map renders correctly.
