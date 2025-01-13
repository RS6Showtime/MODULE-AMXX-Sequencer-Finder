# - Introduction
You can obtain any sequence information from specific GoldSrc models with help from a Linux shared lib build for amxmodx.

# Usage (build an amxmodx plugin)
```
native mxp_load_model_sequence(const WeaponModelPath[]);
```

Will load the specific model, attempt to obtain all available sequences, and keep it in a HashTable.

```
native mxp_get_model_sequence(const WeaponModelPath[], const SequenceToSearch[], &sequence_id, &Float:sequence_fps, &sequence_frames);
```

It will attempt to search for the specified sequences from the syntax and return his ID, FPS & Frames.

```
native mxp_free_global_models();
```

This will clear all loaded models from the HashTable.
!!! After calling this syntax there is no going back from previously loaded models.

# Install

```
Move the file "mxp_sequencer_amxx_i386.so" into "addons/amxmodx/modules" path file.
Add the text "mxp_sequencer" in "addons/amxmodx/configs/modules.ini".
You are ready to write plugins & use this modules.
```

# Examples

I will leave an example  plugin that will help you to understand on how to use it better

# Crash Course

There is a limit to how many models you can load into the memory and it is:

```
75 MODELS
```

Attempting to load more could crash the server or lose memory.

What native errors could I get?

```
If syntax failed to send a default value
If the model couldn't be found in cstrike
The model header is invalid (Not a valid model/Wrong header)
Couldn't parse sequence base info.
Can't read a specific sequence.
The sequence contains invalid data.
Can't find the sequences that you attempted to obtain.
```

