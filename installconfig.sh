#!/bin/ash

# ioquake3 install script for pterodactyl egg dockerfile
# send bug reports to whatever git repo i choose for this thing
# i hate docker

cd /home/container

# autoexec.cfg
printf '// https://github.com/ioquake/ioq3/issues/399\n// https://github.com/ioquake/ioq3/blob/master/code/qcommon/qcommon.h#L334\n// VMI_NATIVE (0) is shared libs / dlls.\n// VMI_BYTECODE (1) is qvm bytecode using the interpreter (slow).\n// VMI_COMPILED (2) is qvm bytecode using various CPU instruction sets (default, fast).\nset vm_game 2\nset vm_cgame 2\nset vm_ui 2\n\n// dedicated server but not announced\nset dedicated 1\n' >/home/container/.q3a/baseq3/autoexec.cfg

# server.cfg
printf '// shamelessly stolen from https://github.com/roguephysicist/q3a-server\n\n// general server info\nseta sv_hostname "Quake3Arena Server"      // name that appears in server list\nseta g_motd "Quake3Arena Server"           // message that appears when connecting\nseta sv_maxclients 16                      // max number of clients than can connect\nseta sv_pure 1                             // pure server, no altered pak files\nseta g_quadfactor 4                        // uad damage strength (3 is normal)\nseta g_friendlyFire 1                      // friendly fire\n\n// capture the flag\n//seta g_gametype 4                        // 0:FFA, 1:Tourney, 2:FFA, 3:TD, 4:CTF\n//seta g_teamAutoJoin 0                    // 0:goes into spectator mode, 1:auto joins a team \n//seta g_teamForceBalance 0                // 0:free selection, 1:forces player on weak team\n//seta timelimit 30                        // Time limit in minutes\n//seta capturelimit 8                      // Capture limit for CTF\n//seta fraglimit 0                         // Frag limit\n\n// team deathmatch\n//seta g_gametype 3                      // 0:FFA, 1:Tourney, 2:FFA, 3:TD, 4:CTF\n//seta g_teamAutoJoin 0                  // 0:goes into spectator mode, 1:auto joins a team\n//seta g_teamForceBalance 1              // 0:free selection, 1:forces player on weak team\n//seta timelimit 15                      // Time limit in minutes\n//seta fraglimit 25                      // Frag limit\n\n// free for all\n//seta g_gametype 0                      // 0:FFA, 1:Tourney, 2:FFA, 3:TD, 4:CTF\n//seta timelimit 10                      // Time limit in minutes\n//seta fraglimit 15                      // Frag limit\n\nseta g_weaponrespawn 2                   // weapon respawn in seconds \nseta g_inactivity 120                    // kick players after being inactive for x seconds\nseta g_forcerespawn 0                    // player has to press primary button to respawn\nseta g_log server.log                    // log name\nseta logfile 3                           // log verbosity\nseta rconpassword "secret"               // sets RCON password for remote console\n\nseta rate "12400"\nseta snaps "40"\nseta cl_maxpackets "40"\nseta cl_packetdup "1"\n' >/home/container/.q3a/baseq3/server.cfg

# bots.cfg
printf '// shamelessly stolen from https://github.com/roguephysicist/q3a-server\n\nseta bot_enable 1       // Allow bots on the server\nseta bot_nochat 1       // Make bots quiet\nseta g_spskill 4        // Default skill of bots [1-5] \nseta bot_minplayers 5   // This fills the server with bots to satisfy the minimum\n\n//## Manual adding of bots. syntax:\n//## addbot name [skill] [team] [delay]\n//addbot doom       4   blue    10\n//addbot bones      4   blue    10\n//addbot slash      4   blue    10\n//addbot orbb       4   red     10\n//addbot major      4   red     10\n//addbot hunter     4   red     10\n//addbot bitterman  4   red     10\n//addbot keel       4   red     10\n' >/home/container/.q3a/baseq3/bots.cfg

# levels.cfg
printf '// shamelessly stolen from https://github.com/roguephysicist/q3a-server\n\nset dm1 "map q3ctf4; set nextmap vstr dm2"\nset dm2 "map q3ctf3; set nextmap vstr dm3"\nset dm3 "map q3ctf2; set nextmap vstr dm4"\nset dm4 "map q3ctf1; set nextmap vstr dm1"\nvstr dm1' >/home/container/.q3a/baseq3/bots.cfg

# make persistence file
touch /home/container/.gameexists
