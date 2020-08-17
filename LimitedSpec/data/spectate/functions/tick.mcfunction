# Toggles the status of the player.

#Tick based command here...


#Update the SP-ID
scoreboard players add @a sp_id 0
scoreboard players add @a sp_status 0

scoreboard players enable @a[gamemode=!spectator,scores={sp_status=0}] sp_on
scoreboard players enable @a[gamemode=spectator,scores={sp_status=1}] sp_off

execute as @a[scores={sp_on=1..,sp_status=0}] at @s run function spectate:on
scoreboard players set @a sp_on 0
execute as @a[scores={sp_off=1..,sp_status=1}] at @s run function spectate:off
scoreboard players set @a sp_off 0

execute at @a[scores={sp_id=0}] run scoreboard players add sp_curr_id sp_id 1
scoreboard players operation @p[scores={sp_id=0}] sp_id = sp_curr_id sp_id

#Force radius
scoreboard players set @r[scores={sp_status=1}] sp_selector 1
execute as @e[type=minecraft:armor_stand,tag=sp_dummy_stand] at @s run execute if score @r[scores={sp_selector=1},distance=64..] sp_id = @s sp_id run tp @a[scores={sp_selector=1},distance=64..] @s
scoreboard players reset @a sp_selector