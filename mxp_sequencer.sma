#include <amxmodx>

// Natives
native mxp_load_model_sequence(const WeaponModelPath[]);
native mxp_get_model_sequence(const WeaponModelPath[], const SequenceToSearch[], &sequence_id, &Float:sequence_fps, &sequence_frames);
native mxp_free_global_models();

#define MODEL_1 "models/v_ak47.mdl"
#define MODEL_2 "models/v_knife_r.mdl"
#define MODEL_PLAYER "models/player/vip/vip.mdl"

new const g_animations_to_check[][] = {
    "idle1",
    "reload",
    "draw",
    "shoot1",
    "shoot2",
    "shoot3"
}

new const g_animations_to_check_2[][] = {
    "idle3",
    "slash1",
    "slash2",
    "draw",
    "stab",
    "stab_miss",
    "midslash1",
    "midslash2"
}

new const g_animations_to_check_random[][] = {
    "draw",
    "idle1",
    "shoot3",    
    "shoot1",
    "shoot2",
    "reload"
}

new const g_animations_to_check_player_vip[][] = {
    "jump",
    "run",
    "left",
    "death2",
    "ref_shoot_ak47",
    "crouch_aim_shieldgren",
    "back"
}

public plugin_init()
{
    register_plugin("[MXP] Sequencer", "1.0", "AMG");
}

public plugin_precache()
{
    // Load random models
    mxp_load_model_sequence("models/v_deagle.mdl");

    // Model 1
    mxp_load_model_sequence(MODEL_1);

    mxp_load_model_sequence("models/v_galil.mdl");
    mxp_load_model_sequence("models/v_famas.mdl");

    for(new i = 0, Anim[33]; i < sizeof(g_animations_to_check); i++)
    {
        copy(Anim, 32, g_animations_to_check[i]);

        new sequence_id, Float:sequence_fps, sequence_frames;
        mxp_get_model_sequence(MODEL_1, Anim, sequence_id, sequence_fps, sequence_frames);

        server_print("Avem: %s | %d | %.2f | %d", Anim, sequence_id, sequence_fps, sequence_frames);
    }

    // // Model 2
    mxp_load_model_sequence(MODEL_2);

    mxp_load_model_sequence("models/v_awp.mdl");
    mxp_load_model_sequence("models/v_m4a1.mdl");

    for(new i = 0, Anim[33]; i < sizeof(g_animations_to_check_2); i++)
    {
        copy(Anim, 32, g_animations_to_check_2[i]);

        new sequence_id, Float:sequence_fps, sequence_frames;
        mxp_get_model_sequence(MODEL_2, Anim, sequence_id, sequence_fps, sequence_frames);

        server_print("Avem: %s | %d | %.2f | %d", Anim, sequence_id, sequence_fps, sequence_frames);
    }

    for(new i = 0, Anim[33]; i < sizeof(g_animations_to_check_random); i++)
    {
        copy(Anim, 32, g_animations_to_check_random[i]);

        new sequence_id, Float:sequence_fps, sequence_frames;
        mxp_get_model_sequence(MODEL_1, Anim, sequence_id, sequence_fps, sequence_frames);

        server_print("Avem: %s | %d | %.2f | %d", Anim, sequence_id, sequence_fps, sequence_frames);
    }

    mxp_load_model_sequence(MODEL_PLAYER);

    for(new i = 0, Anim[33]; i < sizeof(g_animations_to_check_player_vip); i++)
    {
        copy(Anim, 32, g_animations_to_check_player_vip[i]);

        new sequence_id, Float:sequence_fps, sequence_frames;
        mxp_get_model_sequence(MODEL_PLAYER, Anim, sequence_id, sequence_fps, sequence_frames);

        server_print("Avem: %s | %d | %.2f | %d", Anim, sequence_id, sequence_fps, sequence_frames);
    }

    // Release HashTable from modules
    mxp_free_global_models();

    // Attempt to acces any model animation after mem was release (free)
    // Remove /* */ to activate it
    /*    
    for(new i = 0, Anim[33]; i < sizeof(g_animations_to_check_player_vip); i++)
    {
        copy(Anim, 32, g_animations_to_check_player_vip[i]);

        new sequence_id, Float:sequence_fps, sequence_frames;
        mxp_get_model_sequence(MODEL_PLAYER, Anim, sequence_id, sequence_fps, sequence_frames);

        server_print("Avem: %s | %d | %.2f | %d", Anim, sequence_id, sequence_fps, sequence_frames);
    }*/
}