#Function for Turning off Spectator mode and TP player back to start
#Set gamemode to survival

gamemode survival @s[gamemode=spectator]

execute at @e[type=minecraft:armor_stand,tag=sp_dummy_stand] run execute if score @s[scores={sp_status=1}] sp_id = @e[type=minecraft:armor_stand,tag=sp_dummy_stand,limit=1,sort=nearest] sp_id run forceload remove ~ ~ ~ ~ 
#Delete ArmorStand
execute at @e[type=minecraft:armor_stand,tag=sp_dummy_stand] run execute if score @s[scores={sp_status=1}] sp_id = @e[type=minecraft:armor_stand,tag=sp_dummy_stand,limit=1,sort=nearest] sp_id run kill @e[type=minecraft:armor_stand,tag=sp_dummy_stand,limit=1,sort=nearest]

#Update Player Score Status
scoreboard players set @s sp_status 0
tellraw @s[gamemode=!spectator] ["",{"text":" \nSpectator mode","color":"light_purple"},{"text":" disabled.","color":"red"}]