-- Emergency Lights resource by vovo4ka
-- please, do not remove copyright
-- Edited by #FurkanOzulus [OzulusTR]
-- Special Thanks, vovo4ka for the this script :)


local strobo_interval = 10		-- strobo light freq. 10 = 0.5 sec
local is_strobo_enabled = enable	-- enable/disable stroboscopic lights mode
-- lamps
local flash_interval = 1		-- flash freq
-- led blink mode
local blink_interval = 20		-- blink interval
local blink_duration = 2		-- 1..blink_interval

local car_lights_table = {

-- Firetruck
[407] = {["mode"]="lamp", 
[1]={["pos"]={0.64, 2.325, 1.42}, ["color"]={0,0,255}, ["size"]=0.5, ["phase"]=10.0}, 
[2]={["pos"]={-0.64, 2.325, 1.42}, ["color"]={0,0,255}, ["size"]=0.5, ["phase"]=10.0},
[3]={["pos"]={0, -3.5, 1.42}, ["color"]={0,0,255}, ["size"]=0.5, ["phase"]=10.0}, 
[4]={["pos"]={-0.40, 3, 0.03}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=10.0}, 
[5]={["pos"]={0.40, 3, 0.03}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=0.0},
},

-- Ambulance
[416] = {["mode"]="lamp", 
[1]={["pos"]={0.63, 0.90, 1.25}, ["color"]={0,0,255}, ["size"]=0.5, ["phase"]=10.0}, 
[2]={["pos"]={-0.63, 0.90, 1.25}, ["color"]={0,0,255}, ["size"]=0.5, ["phase"]=10.0},
[3]={["pos"]={-0.80, -3.6, 1.61}, ["color"]={0,0,255}, ["size"]=0.5, ["phase"]=10.0}, 
[4]={["pos"]={0.80, -3.6, 1.61}, ["color"]={0,0,255}, ["size"]=0.5, ["phase"]=10.0}, 
[5]={["pos"]={-0.25, 2.46, -0.589}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=10.0}, 
[6]={["pos"]={0.25, 2.46, -0.589}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=0.0},
},

-- FBi Truck
[528] = {["mode"]="lamp", 
[1]={["pos"]={0.6, 0.45, 1.7}, ["color"]={0,0,255}, ["size"]=0.35, ["phase"]=10.0}, 
[2]={["pos"]={-0.6, 0.45, 1.7}, ["color"]={0,0,255}, ["size"]=0.35, ["phase"]=10.0},
[3]={["pos"]={-0.5, -2.8, 1.65}, ["color"]={0,0,255}, ["size"]=0.5, ["phase"]=10.0}, 
[4]={["pos"]={0.5, -2.8, 1.65}, ["color"]={0,0,255}, ["size"]=0.5, ["phase"]=10.0}, 
[5]={["pos"]={-0.25, 2.9, 0.12}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=10.0}, 
[6]={["pos"]={0.25, 2.9, 0.12}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=0.0},
},

-- Enforcer
[427] = {["mode"]="lamp", 
[1]={["pos"]={-0.32, -2.7, 1.95}, ["color"]={0,0,255}, ["size"]=0.35, ["phase"]=3.0}, 
[2]={["pos"]={-0.25, 2.87, 0.1}, ["color"]={255,0,0}, ["size"]=0.12, ["phase"]=0.0}, 
[3]={["pos"]={0.25, 2.87, 0.1}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=10.0},
[4]={["pos"]={-0.07, 2.18, 0.72}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=0.0}, 
[5]={["pos"]={0.07, 2.18, 0.72}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=10.0},
[6]={["pos"]={0.2, 0.25, 1.95}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=10.0},
[7]={["pos"]={0.35, 0.25, 1.95}, ["color"]={255,255,255}, ["size"]=0.12, ["phase"]=0.0}, 
[8]={["pos"]={0.5, 0.25, 1.95}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=5.0},
[9]={["pos"]={-0.2, 0.25, 1.95}, ["color"]={255,0,0}, ["size"]=0.12, ["phase"]=5.0},
[10]={["pos"]={-0.5, 0.25, 1.95}, ["color"]={255,0,0}, ["size"]=0.12, ["phase"]=0.0},
[11]={["pos"]={-0.35, 0.25, 1.95}, ["color"]={255,255,255}, ["size"]=0.12, ["phase"]=10.0},
[12]={["pos"]={0.05, 0.25, 1.95}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=10.0},
[13]={["pos"]={-0.05, 0.25, 1.95}, ["color"]={255,0,0}, ["size"]=0.12, ["phase"]=10.0},
[14]={["pos"]={0.2, -0.09, 1.95}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=10.0},
[15]={["pos"]={0.35, -0.09, 1.95}, ["color"]={255,255,255}, ["size"]=0.12, ["phase"]=0.0}, 
[16]={["pos"]={0.5, -0.09, 1.95}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=5.0},
[17]={["pos"]={-0.2, -0.09, 1.95}, ["color"]={255,0,0}, ["size"]=0.12, ["phase"]=5.0},
[18]={["pos"]={-0.5, -0.09, 1.95}, ["color"]={255,0,0}, ["size"]=0.12, ["phase"]=0.0},
[19]={["pos"]={-0.35, -0.09, 1.95}, ["color"]={255,255,255}, ["size"]=0.12, ["phase"]=10.0},
[20]={["pos"]={0.05, -0.09, 1.95}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=10.0},
[21]={["pos"]={-0.05, -0.09, 1.95}, ["color"]={255,0,0}, ["size"]=0.12, ["phase"]=10.0},
[22]={["pos"]={-0.6, 0, 1.95}, ["color"]={255,0,0}, ["size"]=0.12, ["phase"]=0.0},
[23]={["pos"]={-0.6, 0.1, 1.95}, ["color"]={255,255,255}, ["size"]=0.12, ["phase"]=0.0},
[24]={["pos"]={-0.6, 0.2, 1.95}, ["color"]={255,0,0}, ["size"]=0.12, ["phase"]=0.0},
[22]={["pos"]={0.6, 0, 1.95}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=0.0},
[23]={["pos"]={0.6, 0.1, 1.95}, ["color"]={255,255,255}, ["size"]=0.12, ["phase"]=0.0},
[24]={["pos"]={0.6, 0.2, 1.95}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=0.0},
},


-- Police LS
 [596] = {["mode"]="lamp",   
[1]={["pos"]={-0.41, 0, 1.09}, ["color"]={0,0,255}, ["size"]=0.4, ["phase"]=0.0}, 
[2]={["pos"]={0.41, 0, 1.09}, ["color"]={0,0,255}, ["size"]=0.4, ["phase"]=10.0},
[3]={["pos"]={-0.25, 2.47, 0.17}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=10.0}, 
[4]={["pos"]={0.25, 2.47, 0.17}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=0.0},
},


-- Police Lv
[598] = {["mode"]="led",  
[1]={["pos"]={-0.45, -0.40, 1}, ["color"]={0,0,255}, ["size"]=0.4, ["phase"]=0.0}, 
[2]={["pos"]={0.45, -0.40, 1}, ["color"]={0,0,255}, ["size"]=0.4, ["phase"]=10.0},
[3]={["pos"]={-0.25, 2.17, -0.038}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=10.0}, 
[4]={["pos"]={0.25, 2.17, -0.038}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=0.0},
},



-- Police Bike
 [523] = {["mode"]="lamp", 
[1]={["pos"]={-0.2, 0.80, 0.28}, ["color"]={255,0,0}, ["size"]=0.12, ["phase"]=0.0}, 
[2]={["pos"]={0.2, 0.80, 0.28}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=10.0},
},



-- Police SF
 [597] = {["mode"]="lamp", 
[1]={["pos"]={-0.45, -0.3, 0.77}, ["color"]={0,0,255}, ["size"]=0.35, ["phase"]=0.0}, 
[2]={["pos"]={0.45, -0.3, 0.77}, ["color"]={0,0,255}, ["size"]=0.35, ["phase"]=10.0},
[3]={["pos"]={-0.25, 2.6, -0.18}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=10.0}, 
[4]={["pos"]={0.25, 2.6, -0.18}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=0.0},
},


-- Fire Truck SF
[544] = {["mode"]="lamp",
[1]={["pos"]={0.3, -0.18, 1}, ["color"]={255,0,0}, ["size"]=0.2, ["phase"]=10.0},
[2]={["pos"]={0.5, -0.18, 1}, ["color"]={255,0,0}, ["size"]=0.2, ["phase"]=0.0}, 
[3]={["pos"]={0.7, -0.18, 1}, ["color"]={255,0,0}, ["size"]=0.2, ["phase"]=5.0},
[4]={["pos"]={-0.3, -0.18, 1}, ["color"]={0,0,255}, ["size"]=0.21, ["phase"]=5.0},
[5]={["pos"]={-0.7, -0.18, 1}, ["color"]={0,0,255}, ["size"]=0.21, ["phase"]=0.0},
[6]={["pos"]={-0.5, -0.18, 1}, ["color"]={0,0,255}, ["size"]=0.21, ["phase"]=10.0},
[7]={["pos"]={-0.40, 2.46, -0.025}, ["color"]={255,0,0}, ["size"]=0.1, ["phase"]=0.0}, 
[8]={["pos"]={-0.29, 2.46, -0.025}, ["color"]={255,0,0}, ["size"]=0.1, ["phase"]=0.0}, 
[9]={["pos"]={0.29, 2.46, -0.025}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=10.0},
[10]={["pos"]={0.40, 2.46, -0.025}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=10.0},
},

-- Admin
[429] = {["mode"]="lamp",
[1]={["pos"]={0.25, -0.18, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=10.0},
[2]={["pos"]={0.4, -0.18, 1.05}, ["color"]={255,255,255}, ["size"]=0.07, ["phase"]=0.0}, 
[3]={["pos"]={0.57, -0.18, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=5.0},
[4]={["pos"]={-0.25, -0.18, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=5.0},
[5]={["pos"]={-0.57, -0.18, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=0.0},
[6]={["pos"]={-0.4, -0.18, 1.05}, ["color"]={255,255,255}, ["size"]=0.07, ["phase"]=10.0},
[7]={["pos"]={-0.2, 2.645, 0.1}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=0.0}, 
[8]={["pos"]={0.2, 2.645, 0.1}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=10.0},
[9]={["pos"]={0.08, -0.18, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=10.0},
[10]={["pos"]={-0.08, -0.18, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=10.0},
[11]={["pos"]={0.25, -0.5, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=10.0},
[12]={["pos"]={0.4, -0.5, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=0.0}, 
[13]={["pos"]={0.57, -0.5, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=5.0},
[14]={["pos"]={-0.25, -0.5, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=5.0},
[15]={["pos"]={-0.57, -0.5, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=0.0},
[16]={["pos"]={-0.4, -0.5, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=10.0},
[17]={["pos"]={0.08, -0.5, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=10.0},
[18]={["pos"]={-0.08, -0.5, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=10.0},
[19]={["pos"]={0.63, -0.22, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=5.0},
[20]={["pos"]={-0.63, -0.22, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=0.0},
[21]={["pos"]={0.63, -0.45, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=5.0},
[22]={["pos"]={-0.63, -0.45, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=0.0},
[23]={["pos"]={0.63, -0.34, 1.05}, ["color"]={255,255,255}, ["size"]=0.1, ["phase"]=5.0},
[24]={["pos"]={-0.63, -0.34, 1.05}, ["color"]={255,255,255}, ["size"]=0.1, ["phase"]=0.0},
[25]={["pos"]={0.4, -1.3, 0.85}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=5.0},
[26]={["pos"]={-0.4, -1.3, 0.85}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=0.0},
},

--Admin VW
[400] = {["mode"]="lamp",
[1]={["pos"]={-0.2, 1.935, 0.1}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=0.0}, 
[2]={["pos"]={0.2, 1.935, 0.1}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=10.0},
[3]={["pos"]={0.57, -0.7, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=5.0},
[4]={["pos"]={-0.25, -0.7, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=5.0},
[5]={["pos"]={-0.57, -0.7, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=0.0},
[6]={["pos"]={-0.4, -0.7, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=10.0},
[7]={["pos"]={0.25, -0.7, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=10.0},
[8]={["pos"]={0.4, -0.7, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=0.0}, 
[9]={["pos"]={0.08, -0.7, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=10.0},
[10]={["pos"]={-0.08, -0.7, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=10.0},
[11]={["pos"]={0.25, -0.6, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=10.0},
[12]={["pos"]={0.4, -0.6, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=0.0}, 
[13]={["pos"]={0.57, -0.6, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=5.0},
[14]={["pos"]={-0.25, -0.6, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=5.0},
[15]={["pos"]={-0.57, -0.6, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=0.0},
[16]={["pos"]={-0.4, -0.6, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=10.0},
[17]={["pos"]={0.08, -0.6, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=10.0},
[18]={["pos"]={-0.08, -0.6, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=10.0},
[19]={["pos"]={0.63, -0.6, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=5.0},
[20]={["pos"]={-0.63, -0.6, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=0.0},
[21]={["pos"]={0.63, -0.6, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=5.0},
[22]={["pos"]={-0.63, -0.6, 1.05}, ["color"]={0,0,255}, ["size"]=0.07, ["phase"]=0.0},
[23]={["pos"]={0.63, -0.7, 1.05}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=5.0},
[24]={["pos"]={-0.63, -0.7, 1.05}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=0.0},
},

--Servicecar
[554] = {["mode"]="lamp",
[1]={["pos"]={-0.2, 1.935, 0.1}, ["color"]={255,128,0}, ["size"]=0.1, ["phase"]=0.0}, 
[2]={["pos"]={0.2, 1.935, 0.1}, ["color"]={255,128,0}, ["size"]=0.1, ["phase"]=10.0},
[3]={["pos"]={0.57, -0.7, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=5.0},
[4]={["pos"]={-0.25, -0.7, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=5.0},
[5]={["pos"]={-0.57, -0.7, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=0.0},
[6]={["pos"]={-0.4, -0.7, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=10.0},
[7]={["pos"]={0.25, -0.7, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=10.0},
[8]={["pos"]={0.4, -0.7, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=0.0}, 
[9]={["pos"]={0.08, -0.7, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=10.0},
[10]={["pos"]={-0.08, -0.7, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=10.0},
[11]={["pos"]={0.25, -0.6, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=10.0},
[12]={["pos"]={0.4, -0.6, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=0.0}, 
[13]={["pos"]={0.57, -0.6, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=5.0},
[14]={["pos"]={-0.25, -0.6, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=5.0},
[15]={["pos"]={-0.57, -0.6, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=0.0},
[16]={["pos"]={-0.4, -0.6, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=10.0},
[17]={["pos"]={0.08, -0.6, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=10.0},
[18]={["pos"]={-0.08, -0.6, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=10.0},
[19]={["pos"]={0.63, -0.6, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=5.0},
[20]={["pos"]={-0.63, -0.6, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=0.0},
[21]={["pos"]={0.63, -0.6, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=5.0},
[22]={["pos"]={-0.63, -0.6, 1.05}, ["color"]={255,128,0}, ["size"]=0.07, ["phase"]=0.0},
[23]={["pos"]={0.63, -0.7, 1.05}, ["color"]={255,128,0}, ["size"]=0.1, ["phase"]=5.0},
[24]={["pos"]={-0.63, -0.7, 1.05}, ["color"]={255,128,0}, ["size"]=0.1, ["phase"]=0.0},
},


-- Police Ranger
[599] = {["mode"]="lamp",
[1]={["pos"]={0.3, -0.18, 1}, ["color"]={255,0,0}, ["size"]=0.2, ["phase"]=10.0},
[2]={["pos"]={0.5, -0.18, 1}, ["color"]={255,0,0}, ["size"]=0.2, ["phase"]=0.0}, 
[3]={["pos"]={0.7, -0.18, 1}, ["color"]={255,0,0}, ["size"]=0.2, ["phase"]=5.0},
[4]={["pos"]={-0.3, -0.18, 1}, ["color"]={0,0,255}, ["size"]=0.21, ["phase"]=5.0},
[5]={["pos"]={-0.7, -0.18, 1}, ["color"]={0,0,255}, ["size"]=0.21, ["phase"]=0.0},
[6]={["pos"]={-0.5, -0.18, 1}, ["color"]={0,0,255}, ["size"]=0.21, ["phase"]=10.0},
[7]={["pos"]={-0.40, 2.46, -0.025}, ["color"]={255,0,0}, ["size"]=0.1, ["phase"]=0.0}, 
[8]={["pos"]={-0.29, 2.46, -0.025}, ["color"]={255,0,0}, ["size"]=0.1, ["phase"]=0.0}, 
[9]={["pos"]={0.29, 2.46, -0.025}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=10.0},
[10]={["pos"]={0.40, 2.46, -0.025}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=10.0},
},


-- Police Bus
[437] = {["mode"]="lamp",
[1]={["pos"]={0.13, 2.75, 1.235}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=10.0},
[2]={["pos"]={0.3, 2.75, 1.235}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=0.0}, 
[3]={["pos"]={0.45, 2.75, 1.235}, ["color"]={0,0,255}, ["size"]=0.12, ["phase"]=5.0},
[4]={["pos"]={-0.35, 2.75, 1.235}, ["color"]={255,0,0}, ["size"]=0.12, ["phase"]=5.0},
[5]={["pos"]={-0.65, 2.75, 1.235}, ["color"]={255,0,0}, ["size"]=0.12, ["phase"]=0.0},
[6]={["pos"]={-0.5, 2.75, 1.235}, ["color"]={255,0,0}, ["size"]=0.12, ["phase"]=10.0},
[7]={["pos"]={-0.715, 2.9, -0.8}, ["color"]={255,0,0}, ["size"]=0.1, ["phase"]=0.0}, 
[8]={["pos"]={-0.95, 2.9, -0.785}, ["color"]={255,0,0}, ["size"]=0.1, ["phase"]=0.0}, 
[9]={["pos"]={-0.85, 2.9, -0.785}, ["color"]={255,0,0}, ["size"]=0.1, ["phase"]=0.0},
[10]={["pos"]={0.715, 2.9, -0.777}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=10.0},
[11]={["pos"]={0.57, 2.9, -0.785}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=10.0},
[12]={["pos"]={0.47, 2.9, -0.785}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=10.0},
[13]={["pos"]={-0.8, -3, 1.3}, ["color"]={255,0,0}, ["size"]=0.1, ["phase"]=0.0}, 
[14]={["pos"]={0.55, -3, 1.3}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=10.0},
[15]={["pos"]={-0.88, -3, -0.172}, ["color"]={255,201,14}, ["size"]=0.15, ["phase"]=0.0}, 
[16]={["pos"]={0.635, -3, -0.172}, ["color"]={255,201,14}, ["size"]=0.15, ["phase"]=10.0},
[17]={["pos"]={-0.88, -3, -0.315}, ["color"]={255,0,0}, ["size"]=0.1, ["phase"]=0.0}, 
[18]={["pos"]={0.635, -3, -0.315}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=10.0},
[19]={["pos"]={-0.88, -3, -0.45}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=0.0}, 
[20]={["pos"]={0.635, -3, -0.45}, ["color"]={255,0,0}, ["size"]=0.1, ["phase"]=10.0},
[21]={["pos"]={-0.85, -3, -0.58}, ["color"]={255,201,14}, ["size"]=0.1, ["phase"]=0.0}, 
[22]={["pos"]={0.63, -3, -0.58}, ["color"]={255,201,14}, ["size"]=0.1, ["phase"]=10.0},
[23]={["pos"]={-0.85, -3, -0.8}, ["color"]={255,0,0}, ["size"]=0.1, ["phase"]=0.0}, 
[24]={["pos"]={0.6, -3, -0.8}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=10.0},
},

-- Swatvan
[601] = {["mode"]="lamp",
[1]={["pos"]={-0.55, 3.65, 0.85}, ["color"]={255,0,0}, ["size"]=0.13, ["phase"]=0.0}, 
[2]={["pos"]={-0.75, 3.65, 0.85}, ["color"]={255,0,0}, ["size"]=0.13, ["phase"]=0.0}, 
[3]={["pos"]={0.75, 3.65, 0.85}, ["color"]={0,0,255}, ["size"]=0.13, ["phase"]=10.0},
[4]={["pos"]={0.55, 3.65, 0.85}, ["color"]={0,0,255}, ["size"]=0.13, ["phase"]=10.0}, 
[5]={["pos"]={-0.7, -3.75, 1.21}, ["color"]={255,0,0}, ["size"]=0.2, ["phase"]=0.0}, 
[6]={["pos"]={0.7, -3.75, 1.21}, ["color"]={0,0,255}, ["size"]=0.2, ["phase"]=10.0},
},
 
-- FBI Ranger
[490] = {["mode"]="lamp",
[1]={["pos"]={-0.2, 2.59, -0.1}, ["color"]={255,0,0}, ["size"]=0.1, ["phase"]=0.0}, 
[2]={["pos"]={0.2, 2.59, -0.1}, ["color"]={0,0,255}, ["size"]=0.1, ["phase"]=10.0},
[3]={["pos"]={-0.35, -1.45, 0.7}, ["color"]={255,0,0}, ["size"]=0.11, ["phase"]=0.0}, 
[4]={["pos"]={-0.50, -1.45, 0.7}, ["color"]={0,0,255}, ["size"]=0.11, ["phase"]=0.0}, 
[5]={["pos"]={0.50, -1.45, 0.7}, ["color"]={255,0,0}, ["size"]=0.11, ["phase"]=10.0},
[6]={["pos"]={0.35, -1.45, 0.7}, ["color"]={0,0,255}, ["size"]=0.11, ["phase"]=10.0},
[7]={["pos"]={-0.35, 0.35, 0.7}, ["color"]={255,0,0}, ["size"]=0.11, ["phase"]=10.0}, 
[8]={["pos"]={-0.5, 0.35, 0.7}, ["color"]={0,0,255}, ["size"]=0.11, ["phase"]=0.0}, 
[9]={["pos"]={0.5, 0.35, 0.7}, ["color"]={0,0,255}, ["size"]=0.11, ["phase"]=0.0},
[10]={["pos"]={0.35, 0.35, 0.7}, ["color"]={255,0,0}, ["size"]=0.11, ["phase"]=10.0},
[11]={["pos"]={0.1, 1, 0.4}, ["color"]={0,0,255}, ["size"]=0.11, ["phase"]=0.0},
[12]={["pos"]={-0.1, 1, 0.4}, ["color"]={255,0,0}, ["size"]=0.11, ["phase"]=10.0},
},

-- Towtruck
[525] = {["mode"]="led",  
[1]={["pos"]={-0.5, -1.21, 1.12}, ["color"]={255,201,14}, ["size"]=0.7, ["phase"]=0.0}, 
[2]={["pos"]={0.5, -1.21, 1.12}, ["color"]={255,201,14}, ["size"]=0.70, ["phase"]=10.0},
[3]={["pos"]={-0.25, 3.1, 0}, ["color"]={255,201,14}, ["size"]=0.15, ["phase"]=10.0}, 
[4]={["pos"]={0.25, 3.1, 0}, ["color"]={255,201,14}, ["size"]=0.15, ["phase"]=0.0},
[5]={["pos"]={-1.2, 1.2, -0.75}, ["color"]={255,201,14}, ["size"]=0.1, ["phase"]=10.0}, 
[6]={["pos"]={1.2, 1.2, -0.75}, ["color"]={255,201,14}, ["size"]=0.1, ["phase"]=0.0},
[7]={["pos"]={-1.2, -0.7, -0.75}, ["color"]={255,201,14}, ["size"]=0.1, ["phase"]=10.0}, 
[8]={["pos"]={1.2, -0.7, -0.75}, ["color"]={255,201,14}, ["size"]=0.1, ["phase"]=0.0},
[9]={["pos"]={-1.2, 0.5, -0.75}, ["color"]={255,201,14}, ["size"]=0.1, ["phase"]=10.0}, 
[10]={["pos"]={1.2, 0.5, -0.75}, ["color"]={255,201,14}, ["size"]=0.1, ["phase"]=0.0},
[11]={["pos"]={-1.2, 0, -0.75}, ["color"]={255,201,14}, ["size"]=0.1, ["phase"]=10.0}, 
[12]={["pos"]={1.2, 0, -0.75}, ["color"]={255,201,14}, ["size"]=0.1, ["phase"]=0.0},
},

-- Daf
[515] = {["mode"]="led",  
[1]={["pos"]={-0.25, 3.1, 0.2}, ["color"]={255,201,14}, ["size"]=0.2, ["phase"]=0.0}, 
[2]={["pos"]={0.25, 3.1, 0.2}, ["color"]={255,201,14}, ["size"]=0.2, ["phase"]=0.0},
[3]={["pos"]={-0.25, 3.1, 0}, ["color"]={255,201,14}, ["size"]=0.2, ["phase"]=10.0}, 
[4]={["pos"]={0.25, 3.1, 0}, ["color"]={255,201,14}, ["size"]=0.2, ["phase"]=10.0},
[5]={["pos"]={-0.25, 3.1, -0.2}, ["color"]={255,201,14}, ["size"]=0.2, ["phase"]=5.0}, 
[6]={["pos"]={0.25, 3.1, -0.2}, ["color"]={255,201,14}, ["size"]=0.2, ["phase"]=5.0},
},

-- Kukás kocsi
[408] = {["mode"]="led",  
[1]={["pos"]={-0.25, 4.55, 0.52}, ["color"]={255,201,14}, ["size"]=0.2, ["phase"]=10.0}, 
[2]={["pos"]={0.25, 4.55, 0.52}, ["color"]={255,201,14}, ["size"]=0.2, ["phase"]=10.0},
[3]={["pos"]={-0.25, 4.55, 0.32}, ["color"]={255,201,14}, ["size"]=0.2, ["phase"]=5.0}, 
[4]={["pos"]={0.25, 4.55, 0.32}, ["color"]={255,201,14}, ["size"]=0.2, ["phase"]=5.0},
[5]={["pos"]={-1.005, 4, 2.05}, ["color"]={255,201,14}, ["size"]=0.32, ["phase"]=10.0}, 
[6]={["pos"]={1.005, 4, 2.05}, ["color"]={255,201,14}, ["size"]=0.32, ["phase"]=10.0},
[7]={["pos"]={-1.17, -4.83, 1.8}, ["color"]={255,201,14}, ["size"]=0.15, ["phase"]=5.0}, 
[8]={["pos"]={1.17, -4.83, 1.8}, ["color"]={255,201,14}, ["size"]=0.15, ["phase"]=5.0},
},


-- packer
 [443] = {["mode"]="lamp", 
[1]={["pos"]={-0.2, 3.3, -0.4}, ["color"]={255,201,14}, ["size"]=0.2, ["phase"]=0.0}, 
[2]={["pos"]={0.2, 3.3, -0.4}, ["color"]={255,201,14}, ["size"]=0.2, ["phase"]=10.0},
},





 
-- since 0.8 there are no default lights position, because only emergency and pre-defined vehicles can use lights
--["default"] = {["mode"]="lamp", [1]={["pos"]={0.5, 0, 0.8}, ["color"]={255,0,0}, ["size"]=0.25, ["phase"]=0.0}, [2]={["pos"]={-0.5, 0, 0.8}, ["color"]={0,0,255}, ["size"]=0.25, ["phase"]=10.0}}
}

-- do not modify --------------------------------------------
local vehicles = {}
local timers = {}

local base_freq = 50	-- freq of timer for light change

-------------------------------------------------------------
function release_vehicle(vehicle)
	if (isElement(vehicle)) then
		if (is_strobo_enabled) then
			setVehicleOverrideLights ( vehicle, 0)
			setVehicleLightState ( vehicle, 0,  1 )
			setVehicleLightState ( vehicle, 1,  1 )
			setVehicleLightState ( vehicle, 2,  1 )
			setVehicleLightState ( vehicle, 3,  1 )
		end
	end
	if (vehicles[vehicle]~=nil) then	
		-- release the markers
		for key, value in pairs(vehicles[vehicle]["flist"]) do
			destroyElement (value["m"])
		end
		
		vehicles[vehicle] = nil
	end
	if (timers[vehicle]~=nil) then
		-- kill the strobo timer
		killTimer(timers[vehicle])
		timers[vehicle] = nil
		
		if (isElement(vehicle)) then
			if (getElementData( vehicle, "emerlights_source")==getPlayerName(getLocalPlayer())) then
				triggerEvent ( "onPlayerEmergencyLightStateChange", getRootElement(), 0 )
			end
		end
	end
end

function checkForAbility(vehicle)
	local veh_model = getElementModel ( vehicle )
	if (car_lights_table[veh_model]==nil)or(getElementData( vehicle, "emerlights_enabled" )=="false") then
		return false
	end
	return true
end

function strobo_state_update (vehicle)
	-- check for valid vehicle
	if (isElement(vehicle)) then
		if (vehicles[vehicle]==nil) then
			-- check for disallowing to use lights
			-- its enabled by default
			if (checkForAbility(vehicle)==false) then
				release_vehicle(vehicle)
				return
			end
			local veh_model = getElementModel ( vehicle )
			
			--if (car_lights_table[veh_model]==nil) then
			--veh_model = "default"
			--end
			
			local occupant = getVehicleOccupant( vehicle, 0)
			if (getElementType(occupant)=="player") then	-- peds also can use emerlights
				local src = getPlayerName(occupant)
				setElementData( vehicle, "emerlights_source", src, false)
				if (src==getPlayerName(getLocalPlayer())) then
					triggerEvent ( "onPlayerEmergencyLightStateChange", getRootElement(), 1 )
				end
			end
			-- init state variable
			
			vehicles[vehicle] = {}
			vehicles[vehicle]["lstate"] = 0 	-- strobo lights state
			vehicles[vehicle]["fstate"] = 0	-- flash light state
			vehicles[vehicle]["flist"] = {}		-- flash lights list (marker ids)
			
			-- create flash lights

			
			local mode = car_lights_table[veh_model]["mode"]
			if (mode==nil) then
				mode = "lamp"
			end
			
			local coeff = 0
			if (mode=="lamp") then
				coeff = 3.141592654/10.0
			else
				coeff = blink_interval/20.0
			end
			
			vehicles[vehicle]["fmode"] = mode
			
			for light_id, light_desc in pairs(car_lights_table[veh_model]) do
				if (light_id~="mode") then
					vehicles[vehicle]["flist"][light_id] = {}
					vehicles[vehicle]["flist"][light_id]["m"] = createMarker( 0.0001, 0.0001, 0.0001, "corona", light_desc["size"], light_desc["color"][1], light_desc["color"][2], light_desc["color"][3], 100)
					vehicles[vehicle]["flist"][light_id]["p"] = light_desc["phase"]*coeff
					attachElements ( vehicles[vehicle]["flist"][light_id]["m"], vehicle, light_desc["pos"][1], light_desc["pos"][2], light_desc["pos"][3] )
				end
			end
				
		end
		
		-- strobo light
		if (is_strobo_enabled) then
			setVehicleOverrideLights ( vehicle, 2)
			if (vehicles[vehicle]["lstate"]<strobo_interval) then
				setVehicleLightState ( vehicle, 0,  1 )
				setVehicleLightState ( vehicle, 1,  0 )
				setVehicleLightState ( vehicle, 2,  0 )
				setVehicleLightState ( vehicle, 3,  1 )	
			else
				setVehicleLightState ( vehicle, 0,  0 )
				setVehicleLightState ( vehicle, 1,  1 )
				setVehicleLightState ( vehicle, 2,  1 )
				setVehicleLightState ( vehicle, 3,  0 )	 
			end
			if (vehicles[vehicle]["lstate"]>=strobo_interval*2) then
				vehicles[vehicle]["lstate"] = 0
			else
				vehicles[vehicle]["lstate"] = vehicles[vehicle]["lstate"] + 1
			end
		end
		-- flash light
		if (vehicles[vehicle]["fmode"]=="lamp") then
		-- lamp mode
			local tmp_fstate = vehicles[vehicle]["fstate"]
			for key, value in pairs(vehicles[vehicle]["flist"]) do
				local R, G, B, A = getMarkerColor( value["m"] )
				setMarkerColor(value["m"], R, G, B, (math.sin(tmp_fstate+value["p"])+1.0)*128.0)
			end
			
			vehicles[vehicle]["fstate"] = vehicles[vehicle]["fstate"] + flash_interval
			
		else
		-- led mode
			local tmp_fstate = vehicles[vehicle]["fstate"]

			for key, value in pairs(vehicles[vehicle]["flist"]) do
				local R, G, B, A = getMarkerColor(value["m"])
				-- blinking mode
				local tmp_val = tmp_fstate+value["p"]
				if (tmp_val>blink_interval) then
					tmp_val = tmp_val - blink_interval
				end
				if ((tmp_val>=0)and(tmp_val<blink_duration))or((tmp_val>=blink_duration+1)and(tmp_val<blink_duration*2+1)) then
					setMarkerColor(value["m"], R, G, B, 255)
				else
					setMarkerColor(value["m"], R, G, B, 0)
				end
			end		
			vehicles[vehicle]["fstate"] = vehicles[vehicle]["fstate"] + 1
			if (vehicles[vehicle]["fstate"]>blink_interval) then
				vehicles[vehicle]["fstate"] = vehicles[vehicle]["fstate"] - blink_interval
			end
		end
	else
		-- if vehicle is no more exists
		release_vehicle(vehicle)
	end
end

-- not used anymore
function stroboLightOn()
    playerVehicle = getPedOccupiedVehicle ( getLocalPlayer()  )  -- get the player's vehicle

	--setElementData( playerVehicle, "emerlights_enabled", "true" )	-- debug
	
    if ( playerVehicle ) then
		-- if player is not a driver
		if (getLocalPlayer()~=getVehicleOccupant( playerVehicle )) then
			--outputChatBox("you're not a driver!")
			return
		end
		
		setStroboLightsOn(playerVehicle, nil)
    end
end

function isStroboLightsOn (vehicle_id)
	if (timers[vehicle_id]) then
		return 1
	else
		return 0
	end
end

function setStroboLightsOn(vehicle_id, value)
    if ( vehicle_id ) then
		if (value==nil) then
			if (isStroboLightsOn(vehicle_id)==1) then
				value = 0
			else
				value = 1
			end;
		end;
		if (value==0) then
			if (timers[vehicle_id]) then
				release_vehicle(vehicle_id)
				end
		end
		if (value==1) then
			if (timers[vehicle_id]) then
				release_vehicle(vehicle_id)
			end
			-- create strobo timer
			timers[vehicle_id] = setTimer ( strobo_state_update, base_freq, 0,  vehicle_id )
		end
    end
end

-- only local effect
function enableStroboLightsMode(source, value)
	if (value=="0")or(value=="false") then
		is_strobo_enabled = false
		outputConsole("Stroboscopic mode disabled")
	else
		if (value=="1")or(value=="true") then
			is_strobo_enabled = true
			outputChatBox("Stroboscopic mode enabled")
		else
			outputChatBox("Usage: strobo 0 or strobo 1  for disable/enable stroboscopic lights mode")
		end
	end
end
addCommandHandler("strobo", enableStroboLightsMode)

-- triggered by server
function setEmerlightsState(value, state)
	local player = getPlayerFromName ( value )
	local vehicle = getPedOccupiedVehicle(player)
	if (vehicle) then
		setStroboLightsOn(vehicle, state)
	end
end
addEvent("setEmerlights", true)
addEventHandler("setEmerlights", getRootElement(), setEmerlightsState)

function requestEmerlights()
	-- check for driver
    playerVehicle = getPedOccupiedVehicle (getLocalPlayer())  -- get the player's vehicle

    if (playerVehicle) then
		-- if player is not a driver
		if (getLocalPlayer()~=getVehicleOccupant( playerVehicle )) then
			--outputChatBox("you're not a driver!")
			return
		end
		if (checkForAbility(playerVehicle)) then
			-- sync
			triggerServerEvent("requestEmerlightChangeState", getLocalPlayer(), 1-isStroboLightsOn(getPedOccupiedVehicle(getLocalPlayer())))
		else
			-- not able to use lights for this vehicle
				--outputChatBox("unknown car!")
		end
    end

end

addCommandHandler("Strobo Light On", requestEmerlights)--stroboLightOn)
bindKey("h", "down", "Strobo Light On")

addEvent("onPlayerEmergencyLightStateChange")
