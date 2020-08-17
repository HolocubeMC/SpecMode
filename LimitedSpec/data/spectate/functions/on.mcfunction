#Save Location
execute at @s run summon armor_stand ~ ~1 ~ {Tags:["sp_dummy_stand"],NoGravity:1b,Invisible:1,NoBasePlate:1,PersistenceRequired:1,ArmorItems:[{},{},{},{id:"minecraft:golden_helmet",Count:1b}]}
execute at @s run scoreboard players operation @e[type=minecraft:armor_stand,tag=sp_dummy_stand,limit=1,sort=nearest] sp_id = @s sp_id
execute at @s run forceload add ~ ~ ~ ~ 
scoreboard players set @s[gamemode=!spectator,scores={sp_id=1..}] sp_status 1

#Set Gamemode
tellraw @s[gamemode=!spectator] ""
tellraw @s[gamemode=!spectator] ["",{"text":"Spectator mode","color":"light_purple"},{"text":" enabled.","color":"green"},{"text":"\n"},{"text":"To go back to survival, use\nthe command","color":"dark_purple"},{"text":" /trigger sp_off","color":"yellow"},{"text":"\n\n"},{"text":"Warning: ","color":"red"},{"text":"Do not teleport to other\nplayers while in spectator mode. \nYou can get stuck in ","color":"yellow"},{"text":"spectator limbo.","color":"red","hoverEvent":{"action":"show_text","value":["",{"text":"You will be ","color":"aqua"},{"text":"unable","color":"red"},{"text":" to get out\nof ","color":"aqua"},{"text":"spectator mode","color":"yellow"},{"text":", until the ","color":"aqua"},{"text":"chunk","color":"yellow"},{"text":"\n"},{"text":"you started in gets ","color":"aqua"},{"text":"loaded","color":"yellow"},{"text":" again...","color":"aqua"}]}},{"text":"\n "}]
gamemode spectator @s[gamemode=!spectator]