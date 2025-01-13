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
