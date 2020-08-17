#Function for Turning off Spectator mode and TP player back to start

#TP Player to ArmorStand
execute at @e[type=minecraft:armor_stand,tag=sp_dummy_stand] run execute if score @s[gamemode=spectator,scores={sp_status=1}] sp_id = @e[type=minecraft:armor_stand,tag=sp_dummy_stand,limit=1,sort=nearest] sp_id run tp @s ~ ~ ~

#TP twice for delayfixing issues.
execute at @e[type=minecraft:armor_stand,tag=sp_dummy_stand] run execute if score @s[gamemode=spectator,scores={sp_status=1}] sp_id = @e[type=minecraft:armor_stand,tag=sp_dummy_stand,limit=1,sort=nearest] sp_id run tp @s ~ ~ ~
execute as @s if score @e[type=minecraft:armor_stand,tag=sp_dummy_stand,limit=1,distance=..40] sp_id = @s sp_id run function spectate:offtest
tellraw @s[gamemode=spectator] ""
tellraw @s[gamemode=spectator] ""
tellraw @s[gamemode=spectator] ""
tellraw @s[gamemode=spectator] ""
tellraw @s[gamemode=spectator] ["",{"text":"Please use ","color":"yellow"},{"text":"/trigger sp_off","color":"green"},{"text":" again, to disable spectator mode.","color":"yellow"},{"text":"\n"},{"text":"If you keep seeing this message, move to the armorstand that\nwas generated when you entered spectator mode, or contact\nan administrator.","color":"red"}]