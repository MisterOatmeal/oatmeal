-- =========================================
-- Introduction
-- =========================================
-- I would really love to get this to a fishing-functioning level so i can run it.
-- A lot of changes needs to have now with these data tables to make the core logic much cleaner.
-- We also need to look into have a better toolset of the SND API and Ferret to have a comprehensive script.

-- other thoughts:
-- function EstablishMyMissionCatalogue do return end renturn = {array of numbers -> string to print("/ice on { ' .. ' }") } -- this ensures (if we ultimately go in this direction that the missions chosen are active in the ICE logbook, )
-- ultimate the script should get to a point of
    -- self-sufficiency that it can callback missions picking/abandoning/submitting itself
    -- removing ICE reliance is priority number one
-- i found a library with a FFXIV plugin and its specifically for creating scripts for Cosmic Exploration, its called Ferret.
-- I want to use this perfectly-tailored library, because someone has already done the grunt work of making functions and calls and classes to execute a script like this.
-- Ferret's library also has the tools fo add botancy and mining to this script.

-- I think that, ultimtely, the will either grow into one gigantic one, one perfect optimized for fisher, or like one script with 3 "branches" for the 3 gathering jobs.

--[[ MissionStep = {}
MissionStep.__index = MissionStep

function MissionStep:new(data)
    local self = setmetatable({}, MissionStep)
    for k, v in pairs(data) do self[k] = v end
    return self
end

function MissionStep:performFishing()
    print("Fishing at: " .. self.hole_name)
    -- fishing logic
end

-- Usage:
local mission = MissionStep:new{
    mission_id = 509,
    mission_name = "A-2: Refined Moon Gel",
    hole_name = "Westward Hop-print",
    -- ...more data...
}
mission:performFishing()]]


-- =========================================
-- DATA TABLES
-- =========================================

import("System.Numerics")

local job_information = {
    { job_name = "Carpenter", job_id = 8, disciple = "crafter", },
    { job_name = "Blacksmith", job_id = 9, disciple = "crafter", },
    { job_name = "Armorer", job_id = 10 , disciple = "crafter", },
    { job_name = "Goldsmith", job_id = 11 , disciple = "crafter", },
    { job_name = "Leatherworker", job_id = 12 , disciple = "crafter", },
    { job_name = "Weaver", job_id = 13 , disciple = "crafter", },
    { job_name = "Alchemist", job_id = 14 , disciple = "crafter", },
    { job_name = "Culinarian", job_id = 15 , disciple = "crafter", },
    { job_name = "Miner", job_id = 16 , disciple = "gatherer", },
    { job_name = "Botanist", job_id = 17, disciple = "gatherer", },
    { job_name = "Fisher", job_id = 18,  disciple = "gatherer" } }

local fishing_hole = {
    { hole_name = "Palus Arsenici", coords = { x = 526.3, y = 53.7, z = 597.7 }, route = "Oat_PalusArsenici" },
    { hole_name = "Hollow Harbor", coords = { x = -563.5, y = 69.1, z = -647.4 }, route = "Oat_HollowHarbor" },
    { hole_name = "Northward Hop-print", coords = { x = 918.3, y = -58.8, z = -337.2 }, route = "Oat_NHopPrint" },
    { hole_name = "Southeast Well", coords = { x = 203.7, y = 19.5, z = 204.7 }, route = "Oat_SoutheastWell" },
    { hole_name = "Weeping Pool", coords = { x = 70.5, y = 26.0, z = -307.1 }, route = "Oat_WeepPool" },
    { hole_name = "Westward Hop-print", coords = { x = -264.2, y = 22.4, z = -96.1 }, route = "Oat_WHopPrint" },
    { hole_name = "Glimmerpond Alpha", coords = { x = -688.1, y = 57.1, z = 398.9 }, route = "Oat_GPAlpha" },
    { hole_name = "Glimmerpond Beta", coords = { x = -357.5, y = 47.8, z = 639.8 }, route = "Oat_GPBeta" },
    { hole_name = "Aetherial Falls", coords = { x = 918.2, y = -58.8, z = -337.2 }, route = "Oat_AetherialFalls", },
    { hole_name = "critical_drone_loc", coords = { x = -124.4, y = 20.1, z = -286.3 }, route = "Oat_CritDrone", },
    { hole_name = "critical_ediblefish_loc", coords = { x = -299.7, y = 24.4, z = -102.0 }, route = "Oat_CritEdible", },
    { hole_name = "critical_mutatedfish_loc", coords = { x = 110.2, y = 18.8, z = -229.5 }, route = "Oat_CritMutant", } }

local cosmic_missions = {
    { mission_id = 485, mission_type = "standard", mission_name = "A-1: Fine-grade Water Filter Materials I", hole_name = "Westward Hop-print", coords = fishing_hole.["Westward Hop-print"], }, -- fix coords, needs a function bhind it to ipairs() the dictionary to get an array.
    { mission_id = 486, mission_type = "standard", mission_name = "A-2: Fine-grade Water Filter Materials II", hole_name = "Weeping Pool", coords = fishing_hole["Weeping Pool"], },
    { mission_id = 487, mission_type = "standard", mission_name = "A-3: Fine-grade Water Filter Materials iii", hole_name = "Hollow Harbor", coords = fishing_hole["Hollow Harbor"], },
    { mission_id = 510, mission_type = "hybrid", mission_name = "A-3: Crystallic Gems", hole_name = "Palus Arsenici", coords = fishing_hole["Palus Arsenici"], crafter = "Goldsmith", fish_id = 45928, famount = 14, item_id = 47221, iamount = 3, min_iamount = 1, weather_id = 49 },
    { mission_id = 511, mission_type = "hybrid", mission_name = "A-3: Eel Rations", hole_name = "Hollow Harbor", coords = fishing_hole["Hollow Harbor"], crafter = "Culinarian", fish_id = 45940, famount = 3, item_id = 45934, iamount = 3, min_iamount = 1, weather_id = 148 },
    { mission_id = 509, mission_type = "hybrid", mission_name = "A-2: Refined Moon Gel", hole_name = "Westward Hop-print", coords = fishing_hole["Westward Hop-print"], crafter = "Alchemist", fish_id = 45922, famount = 3, item_id = 47593, iamount = 3, min_iamount = 1, weather_id = 1 },
    { mission_id = 508, mission_type = "hybrid", mission_name = "A-2: Processed Aquatic Metals", hole_name = "Southeast Well", coords = fishing_hole["Southeast Well"],  crafter = "Blacksmith", fish_id = 45917, famount = 14, item_id = 46973, iamount = 3, min_iamount = 1, weather_id = 1 },
    { mission_id = 543, mission_type = "critical", mission_name = "Sunken Drone Salvage", hole_name = "critical_drone_loc", coords = fishing_hole["critical_drone_loc"], turn_in_coords = "Critical_Drone_TurnIn", fish_id = 45939, fish_count = 3, weather_id = 149 },
    { mission_id = 544, mission_type = "critical", mission_name = "Mutated Fish", hole_name = "critical_mutatedfish_loc", coords = fishing_hole["critical_mutatedfish_loc"], turn_in_coords = "Critical_MutatedFish_TurnIn", fish_id = 45945, fish_count = 3, weather_id = 197 },
    { mission_id = 542, mission_type = "critical", mission_name = "Edible Fish", hole_name = "critical_ediblefish_loc", coords = fishing_hole["critical_ediblefish_loc"], turn_in_coords = "Critical_EdibleFish_TurnIn", fish_id = 45937, fish_count = 3, weather_id = 196 } }

local mission_type_requirements = {
    { mission_type = "Standard", weather_id = 1 , fishing_step = true, crafting_step = false, submit_method = "callback" },
    { mission_type = "Hybrid", weather_id = {49, 148}, fishing_step = true, crafting_step = true, submit_method = "callback" },
    { mission_type = "Critical",  weather_id = {196, 197}, fishing_step = true, crafting_step = false, submit_method = "submit_npc" } }

local autohook_preset_key = {
    { mission_id = 509, preset = "MoonGel" },
    { mission_id = 508, preset = "ProcessedMetals" },
    { mission_id = 510, preset = "CrystallicGems" },
    { mission_id = 511, preset = "EelRations" },
    { mission_id = 543, preset = "SunkDrone",},
    { mission_id = 544, preset = "MutatedFish" },
    { mission_id = 542, preset = "EdibleFish" } }

local mission_sequences = {
    -- standard = { "getMission", "rerollMissionsByPriority", "findLocation", "pathToLocation", "doFishing", "submit" }, -- not implemented
    hybrid = {  "getMission", "pathToLocation",  "doFishing", "doCrafting", "submit" },
    critical = { "getMission", "findLocation", "pathToLocation",  "doFishing", "specialSubmit" } }

-- ==============================
-- IMPORT FERRET HELPERS
-- ==============================

Object = require('external/classic')

i18n = require('external/i18n/init')
i18n.setLocale(_language or 'en')
i18n.load(require('Ferret/i18n/translations'))

-- Mixins
require('Ferret/Mixins/Translation')

-- Data enums and objects
require('Ferret/Data/Translatable')
require('Ferret/Data/Events')
require('Ferret/Data/Requests')
require('Ferret/Data/Jobs')
require('Ferret/Data/Objects')
require('Ferret/Data/Status')
require('Ferret/Data/Version')
require('Ferret/Data/Node')

-- Managers
local CosmicExploration = require('Ferret 0.12.1.lib.Ferret.CosmicExploration.Addons.Addons')
local EventManager = require('Ferret/EventManager')
local RequestManager = require('Ferret/RequestManager')
local ExtensionManager = require('Ferret/ExtensionManager')

-- Base extension
require('Ferret/Extensions/Extension')

-- Addons
local Addons require('Ferret/Addons/Addons')

-- Actions
require('Ferret/Actions/Actions')

-- Static objects
Character = require('Ferret/Character')
Mount = require('Ferret/Mount')
World = require('Ferret/World')
Gathering = require('Ferret/Gathering')
GatherBuddy = require('Ferret/GatherBuddy')
Logger = require('Ferret/Logger')
Debug = require('Ferret/Debug')
Table = require('Ferret/Table')
String = require('Ferret/String')
Wait = require('Ferret/Wait')


-- ==============================
-- OOP: Object/Data-Driven MissionStep Step Template
-- ==============================

-- Prototype
---@class MissionStep : Object
local MissionStep = {}
MissionStep.__index = MissionStep

-- Constructor Template
function MissionStep:sequenceStep(functions, args, int, booleans... etc) -- set Data from Data Tables
    local self = setmetatable({}, MissionStep)  -- "self" will use MissionStep as its metatable
    for k, v in pairs(data) do self[k] = v end  -- copy keys/values from your data table
    return self
end

function MissionStep:pathToMissionLocation()
    local self = setmetatable({}, MissionStep)
    for k, v in pairs(data) do self[k] = v end
    if self.coords and self.coords.x then
        self.node = Node(self.coords.x, self.coords.y, self.coords.z)


    end
    return self
end



-- =========================================
-- HELPER FUNCTIONS
-- =========================================

-- Prototype
---@class MissionStep : Object
local MissionStep = {}
MissionStep.__index = MissionStep

function MissionStep:getMission()
    local self = setmetatable({}, MissionStep)

    yield("/echo Getting mission...")
    CosmicExploration:open_mission_infomation() -- Ferret helper, opens WKSMissionInfomation
    local weather_id = GetActiveWeatherID() -- SND helper, gets current weather ID
    for k, v in pairs({cosmic_missions}) do self[k] = v -- iterates over cosmic_missions
    return v

    if v = weather_id ==


    if weather_id ==


    if player already has a mission, if true then abandon mission (first try only) else continue
    yield(" AbandonMissionbyCallback ") -- fire command to game
    if Player does not have mission, get mission with callback to WKSMissionInfomation
        if critical mission weather, then pick critical mission end
        print("/callback ....") -> continue

        elseif umbral wind or moon dust, then pick hybrid mission
        print("/callback ....") -> continue

        elseif clear skies, then attempt to pick a non-weather hybrid (508 and 509)
            while this is happening
            yield("/wait 0.25")
            if mission 508 or 509 is available,
            print("/callback ....")
        end
        repeat until player_has_mission == true
    print("MissionStep got")

        fallback - attempt for 2 minutes, then quit(killscript)
end

-- function MissionStep:rerollMissionsByPriority()
    -- print("Rerolling missions...")
        -- logic here
-- end

function MissionStep:findLocation(cosmic_missions)
    print("Gauging our coordinates...")



end




local step1_state = {}
    while step1_state do

setmetatable(MissionSequence, process_metatable)

process_metatable.__index = function(a table, key)



-- =========================================
-- HELPER FUNCTIONS
-- =========================================

function EquipFisher()
    local currentJobID = Svc.ClientState.LocalPlayer.ClassJob.Id
    if currentJobID ~= 18 then
        yield("/gs change " .. FisherGearset)
        yield("/wait 1")
    end
end

function ChangeJob(job_id_step)
    local job_id_now = Svc.ClientState.LocalPlayer.ClassJob.Id
    local job_id_step = {}

    if Player.Gearset.ClassJob == job_id_now
        then


    for i, gs in ipairs(Gearsets) do
        if Gearset.Name == "Fisher" then
            Player.Gearsets:Equip(i)
            break
        end
    end
    Player.Gearsets:Equip()



function EnsurePlayerIdle(minWait, maxWait)
    minWait = minWait or 3 -- Minimum seconds to wait (customize if you like)
    maxWait = maxWait or 7 -- Maximum seconds to wait (customize if you like)
    local targetWait = math.random(minWait, maxWait)
    yield("/echo [EnsurePlayerIdle] Waiting for idle: " .. targetWait .. "s...")
    local start = os.time()
    while (Svc.Condition[6] or Svc.Condition[7] or Svc.Condition[36]) and (os.time() - start < targetWait) do
        yield("/wait 0.2")
    end
    if Svc.Condition[6] or Svc.Condition[7] or Svc.Condition[36] then
        yield("/echo [EnsurePlayerIdle] Player still busy after " .. targetWait .. "s. Forcing idle...")
        if Svc.Condition[6] then yield("/ac quit") end
        if Svc.Condition[7] or Svc.Condition[36] then yield("/callback WKSMissionInfomation true 11 1") end
        yield("/wait 1")
        if Svc.Condition[6] or Svc.Condition[7] or Svc.Condition[36] then
            yield("/echo [EnsurePlayerIdle] WARNING: Still not idle after force!")
            return false
        end
    end
    return true
end

function MakeAddonVisible()
    if not Addons.GetAddon("WKSMissionInfomation").Ready then
        yield("/callback WKSHud true 11")
        yield("/wait 1")
    end
end


-- function GetMissionByPriority -- a replacement for ICE, use ferret scripts

    -- do MakeAddonVisible()
    -- local available_mission_id
    -- Read mission selection amission selec5tion addon nodes are available MissionStep nodes, get available_mission_id
            -- (1) if weather = critical then f(SelectMission(critical)), continue
            -- (2) if weather = umbral wind or moon dust then f(SelectMission(hybrid)), continue
            -- (3) if weather = clear skies, then look for mission_id = 508 or 509
                -- (4) if mission_id of missions_in_addon ~= one of cosmic_missions.missionid, then abandon mission, repeat until mission_got = true
    -- local active_mission_name = Addons.GetAddon("WKSMissionInfomation"):GetNode(1, 3).Text => 'string'
    --
    -- for _, mission_name in ipairs(cosmic_missions) do
        -- if mission_name == active_mission_name then yield mission_id:cosmic_missions[mission_name]
        -- active_mission_id = yield
    -- print("/echo MissionStep Obtained: ( .. 'active_mission_name' ..). Success!")\
-- end

function GetActiveMission()
    if Addons.GetAddon("WKSMissionInfomation").Ready ~= true then
        do MakeAddonVisible()
        yield("/wait 0.5")
    until Addons.GetAddon("WKSMissionInfomation").Ready == true then

    local active_mission

    yield()

    if Addons.GetAddon("WKSMissionInfomation").Ready == true then repeat

    else return Addons.GetAddon("WKSMissionInfomation"):GetNode(1, 3).Text
            for _, mission in ipairs(cosmic_missions) do
                if mission.name == missionName then return active_mission end
            end
        end
        yield("/wait 0.5")
    end
end


function GetAutoHookPreset()
    local active_mission_id =
    for _, entry in ipairs(autohook_preset_key) do
        autohook_preset_key.mission_id = preset_mission

    mission_id:autohook_preset_key ==

end

function IsCriticalMission(mcosmic_missions)
    if mcosmic_missions.mission_type == "Critical" then return
end

function GetDistanceToTarget(targetCoords)
    if not targetCoords then return 999 end
    local playerPos = Svc.ClientState.LocalPlayer.Position
    return math.sqrt((playerPos.X - targetCoords.x) ^ 2 + (playerPos.Y - targetCoords.y) ^ 2 +
    (playerPos.Z - targetCoords.z) ^ 2)
end

function HasMinAnglersArtStacks()
    if not (Svc and Svc.ClientState and Svc.ClientState.LocalPlayer and Svc.ClientState.LocalPlayer.StatusList) then return false end
    for _, status in ipairs(Svc.ClientState.LocalPlayer.StatusList) do
        if status.StatusId == 2778 and status.Param >= 3 then
            return true
        end
    end
    return false
end

function UseAnglersArtStacks()
    local function getStacks()
        for _, status in ipairs(Svc.ClientState.LocalPlayer.StatusList) do
            if status.StatusId == 2778 then return status.Param end
        end
        return 0
    end

    local stacks = getStacks()
    if stacks < 3 then
        yield("/echo Not enough Angler's Art stacks (" .. stacks .. ") for Thaliak's Favor. Skipping.")
        return false
    end

    yield(string.format("/echo Using Thaliak's Favor on %d stacks...", stacks))
    while stacks >= 3 do
        Actions.ExecuteGeneralAction(26804) -- Thaliak's Favor
        yield("/echo Thaliak's Favor used. Waiting for animation...")
        yield("/wait 2.5")                  -- Wait for GCD/animation

        stacks = getStacks()
        yield(string.format("/echo Current Angler's Art stacks: %d", stacks))
    end

    yield("/echo Done using Thaliak's Favor. Remaining stacks: " .. stacks)
    return true
end

function CurrentLunarPoints()
    local pointsNode = Addons.GetAddon("WKSHud").GetNode(4, 3)
    if pointsNode and pointsNode.Text then
        local pointsString = string.gsub(pointsNode.Text, ",", "")
        return tonumber(pointsString) or 0
    end
    return 0
end

function CurrentCosmicClassExp()
    local xpNode = Addons.GetAddon("WKSScoreList").GetNode(8, 3, 5)
    if xpNode and xpNode.Text then
        local xpString = xpNode.Text
        xpString = string.gsub(xpString, ",", "")
        xpString = string.gsub(xpString, "%.", "")
        return tonumber(xpString) or 0
    end
    return 0
end

function EnsureStandingFromSeatedCrafting()
    local tries = 0
    while Svc.Condition[41] and tries < 6 do
        yield("/callback WKSMissionInfomation true 11 1")
        yield("/wait 1")
        tries = tries + 1
    end
    if Svc.Condition[41] then
        yield("/echo [Crafting] Still seated after callback. Manual intervention may be needed.")
        return false
    end
    yield("/echo [Crafting] Stance cleared. Proceeding.")
    return true
end

function IsAtCoords(targetCoords, tolerance)
    tolerance = tolerance or 2
    local playerPos = Svc.ClientState.LocalPlayer.Position
    local dx = playerPos.X - targetCoords.x
    local dy = playerPos.Y - targetCoords.y
    local dz = playerPos.Z - targetCoords.z
    local dist = math.sqrt(dx * dx + dy * dy + dz * dz)
    return dist <= tolerance
end

-- =========================================
-- CORE SCRIPT LOGIC FUNCTIONS
-- =========================================

function AutoHookPresetByMission(missionID, missionName)
    local preset = presetMap[missionID]
    if preset then
        IPC.AutoHook.SetPreset(preset)
        yield('/echo AutoHook preset set to: "' .. preset .. '".')
        return true
    else
        yield('/echo ERROR: No AutoHook preset found for mission "' .. (missionName or "?") .. '".')
        return false
    end
end

function MoveToTarget(hole_name, targetCoords)
    local maxRetries = 2
    local holeData = FishingHole[hole_name]
    if not (holeData and holeData.route and holeData.route ~= "") then
        yield('/echo ERROR: No Visland route found for "' .. hole_name .. '".')
        return false
    end
    for attempt = 1, maxRetries do
        yield('/echo Move attempt ' .. attempt .. '/' .. maxRetries .. ' to "' .. hole_name .. '".')
        yield('/visland execonce ' .. holeData.route)
        local startTime = os.time()
        local maxTravelTime = 120
        local lastStuckCheckTime = os.time()
        local lastStuckCheckPos = Svc.ClientState.LocalPlayer.Position
        while IPC.visland.IsRouteRunning() do
            if (os.time() - startTime) > maxTravelTime then
                yield("/echo MOVEMENT TIMEOUT.")
                IPC.visland.StopRoute()
                break
            end
            if (os.time() - lastStuckCheckTime) > 10 then
                local currentPos = Svc.ClientState.LocalPlayer.Position
                local distMoved = math.sqrt((currentPos.X - lastStuckCheckPos.X) ^ 2 +
                (currentPos.Y - lastStuckCheckPos.Y) ^ 2 + (currentPos.Z - lastStuckCheckPos.Z) ^ 2)
                if distMoved < 1 then
                    yield("/echo STUCK DETECTED.")
                    IPC.visland.StopRoute()
                    break
                end
                lastStuckCheckTime = os.time()
                lastStuckCheckPos = currentPos
            end
            yield("/wait 1")
        end
        if GetDistanceToTarget(targetCoords) <= 5 then
            yield('/echo Arrived at ' .. hole_name .. '.')
            return true
        elseif attempt < maxRetries then
            yield("/echo Movement failed. Returning to base to retry...")
            Actions.ExecuteGeneralAction(26) -- "Return" Action
            yield("/wait " .. math.random(7, 12))
        end
    end
    yield("/echo FAILED to reach " .. hole_name .. " after " .. maxRetries .. " attempts.")
    return false
end

function PerformFishingMission(mission)
    local startTime = os.time()
    local maxFishingTime = 480 -- 8 minutes

    yield("/echo Starting fishing phase.")
    yield("/wait 1")

    -- Fallback
    if not mission.fishID or not mission.famount then
        yield("/echo [Fishing] Missing mission.fishID or famount.")
        return false, "Missing mission.fishID or famount"
    end

    yield("/echo [Fishing] Sending /ahstart to begin fishing.")
    yield("/ahstart")

    while Inventory.GetItemCount(mission.fishID) < mission.famount do
        if (os.time() - startTime) > maxFishingTime then
            yield("/echo [Fishing] Timeout reached. Proceeding to next step (craft/submit).")
            break
        end
        yield("/wait 1")
    end

    yield("/echo [Fishing] Complete or timed out.")
    if Svc.Condition[6] then
        yield("/ac quit")
        while Svc.Condition[6] do yield("/wait 0.2") end
    end

    UseAnglersArtStacks()
    return true
end

function DoCraftingStep(mission)
    if not mission.requiresCrafting then
        return true
    end

    EnsurePlayerIdle(2, 5)

    -- Failsafe check
    if mission.crafter then
        yield("/echo Switching to crafter: " .. mission.crafter)
        GearSwap(mission.crafter, GetJobIDs(mission.crafter))
    else
        yield("/echo ERROR: MissionStep has no crafter job info. Debug data tables.")
        return false
    end

    -- Ensure that crafting window opens
    EnsureMissionWindowOpen()
    EnsurePlayerIdle(1, 3)

    -- Ensure mission crafting log is pulled.
    while not Addons.GetAddon("WKSMissionInfomation").Ready do yield("/wait 2") end
    if not Addons.GetAddon("WKSRecipeNotebook").Ready then
        yield("/callback WKSMissionInfomation true 14 1")
        yield("/wait 2")
    end

    -- Failsafe check
    local alreadyHave = Inventory.GetItemCount(mission.itemId)
    local needed = (mission.min_iamount or mission.iamount or 1)

    if alreadyHave >= needed then
        yield("/echo Already have enough crafted items (" .. alreadyHave .. ") for this turn-in.")
        EnsureStandingFromSeatedCrafting()
        return true
    end

    -- Ensure crafting begins through artisan.
    yield("/echo Starting Artisan Endurance for crafting...")
    IPC.Artisan.SetEnduranceStatus(true)
    yield("/wait 2")

    local craftStart = os.time()
    local maxWait = 120

    -- Failsafe crafting timeout check
    while IPC.Artisan.GetEnduranceStatus() do
        if os.time() - craftStart > maxWait then
            yield("/echo ERROR: Crafting timeout. Something went wrong.")
            EnsureStandingFromSeatedCrafting()
            return false
        end
        yield("/wait 1")
    end

    local nowHave = Inventory.GetItemCount(mission.itemId)

    -- Ensure items are crafted for submission
    EnsureStandingFromSeatedCrafting()

    if nowHave >= needed then
        yield("/echo [Crafting] Step complete, returning success!")
        return true
    else
        yield("/echo [Crafting] Step incomplete, returning failure!")
        return false
    end
end

function SubmitMission(mission)
    local haveFish = Inventory.GetItemCount(mission.fishID or 0)
    local haveItem = Inventory.GetItemCount(mission.itemId or 0)
    local minFish = (mission.min_famount or mission.famount or 1)
    local minItem = (mission.min_iamount or mission.iamount or 1)

    -- Must have enough of both if both required
    local enoughFish = (not mission.fishID) or (haveFish >= minFish)
    local enoughItem = (not mission.itemId) or (haveItem >= minItem)

    if not (enoughFish and enoughItem) then
        yield(string.format(
            "/echo [Submit] Not enough to turn in: Fish (%d/%d), Item (%d/%d). Skipping.",
            haveFish, minFish, haveItem, minItem
        ))
        return false
    end

    -- CRAFTING MISSION
    if mission.requiresCrafting then
        EnsureMissionWindowOpen()
        yield("/wait 1")
        if not Addons.GetAddon("WKSRecipeNotebook").Ready then
            yield("/callback WKSMissionInfomation true 14 1")
        end
        while Svc.Condition[5] do yield("/wait 0.2") end
        yield("/echo Changing jobs to Fisher for mission submission.")
        EquipFisher()
        yield("/wait 1")
        yield("/callback WKSMissionInfomation true 11 1")
        yield("/echo MissionStep submission complete.")
        return true

        -- CRITICAL MISSION
    elseif IsCriticalMission(mission) then
        local turnInCoords = FishingHole[mission.turnIn]
        local dest = Vector3.new(turnInCoords.x, turnInCoords.y, turnInCoords.z)
        IPC.vnavmesh.PathfindAndMoveTo(dest, false)
        while IPC.vnavmesh.IsRunning() do
            yield("/wait 0.5")
        end
        yield('/target "Collection Point"')
        yield("/wait 1")
        yield("/interact")
        yield("/wait 3")
        yield("/echo Critical mission turn-in complete.")
        return true

        -- DEFAULT (add other mission types here as needed)
    else
        yield("/echo [Submit] WARNING: Unrecognized mission type for submission.")
        return false
    end
end

-- =========================================
-- MAIN LOOP
-- =========================================

local lastCompletionTime = os.time()
local lastLunarPoints = 0
local lastClassExp = 0
local isFirstRun = true
local previousMissionID = nil

while true do
    yield("/echo --- Loop restarting ---")

    -- Step 0: Liveness Check
    if not isFirstRun and (os.time() - lastCompletionTime) > 900 then
        yield("/echo No progress in 15 minutes. Stopping script.")
        yield("/snd stop all")
        return
    end

    -- Step 1: Equip Fisher
    yield("/echo Equipping Fisher for mission cycle...")
    EquipFisher()
    yield("/wait 1")

    -- Step 2: Get MissionStep
    local mission = GetActiveMission()
    if not mission then
        yield("/echo No active mission. Retrying in 5 seconds.")
        yield("/wait 5")
        goto continue
    end

    -- Step 3: Set AutoHook Preset
    yield("/echo Setting up AutoHook preset (before movement)...")
    if not AutoHookPresetByMission(mission.id, mission.name) then
        yield("/echo --- Loop restarting (autohook fail) ---")
        goto continue
    end
    IPC.AutoHook.SetPluginState(true)
    yield("/wait 1")

    -- Step 4: Movement logic
    if previousMissionID ~= nil and mission.id == previousMissionID and IsAtCoords(mission.coords, 5) then
        yield("/echo [Movement] Same mission and already at fishing spot. No movement needed.")
        -- No movement, proceed
    else
        if previousMissionID ~= nil and mission.id ~= previousMissionID then
            yield("/echo [Movement] MissionStep changed, returning to base.")
            Actions.ExecuteGeneralAction(26) -- Return
            yield("/wait " .. math.random(7, 12))
        end
        yield("/echo Pathing to new target...")

        if not MoveToTarget(mission.hole, mission.coords) then
            yield("/echo ERROR: Movement failed. Skipping mission for now.")
            EnsureMissionWindowOpen()
            yield("/wait 5")
            goto continue
        end

        while GetDistanceToTarget(mission.coords) > 1 do
            yield("/wait 1")
        end

        yield("/echo Arrived at fishing hole.")
        yield("/wait 2")
    end

    -- Step 5: Perform Fishing
    yield("/echo Starting fishing operation...")
    if not PerformFishingMission(mission) then
        yield("/echo --- Loop restarting (fishing fail, waiting 10s) ---")
        yield("/wait 10")
        goto continue
    end
    yield("/wait 2")

    -- Step 6: Crafting (if required)
    if mission.requiresCrafting then
        yield("/echo Starting crafting operation...")
        if not DoCraftingStep(mission) then
            yield("/echo --- Loop restarting (crafting fail, waiting 10s) ---")
            yield("/wait 10")
            goto continue
        end
        yield("/wait 2")
    else
        yield("/echo [Crafting] Not required for this mission. Skipping.")
    end

    -- Step 7: Submit MissionStep
    yield("/echo Submitting mission turn-in...")
    if not SubmitMission(mission) then
        yield("/echo --- Loop restarting (submit fail, waiting 10s) ---")
        yield("/wait 10")
        goto continue
    end
    yield("/wait 2")

    -- Step 8: Stats and Update
    local currentLunarPoints = CurrentLunarPoints()
    local currentClassExp = CurrentCosmicClassExp()

    if isFirstRun then
        yield("/echo First mission complete!")
        isFirstRun = false
    else
        local lunarGained = currentLunarPoints - lastLunarPoints
        local expGained = currentClassExp - lastClassExp
        local timeElapsed = os.time() - lastCompletionTime
        if timeElapsed > 0 then
            local hoursElapsed = timeElapsed / 3600
            local lunarPPH = math.floor(lunarGained / hoursElapsed)
            local expPPH = math.floor(expGained / hoursElapsed)
            yield("/echo MissionStep success! Rates -- Lunar Credits: " .. lunarPPH .. "/hr | EXP: " .. expPPH .. "/hr.")
        end
    end

    -- Step 9: Loop update
    lastCompletionTime = os.time()
    lastLunarPoints = currentLunarPoints
    lastClassExp = currentClassExp
    previousMissionID = mission.id

    yield("/wait " .. math.random(2, 4))
    ::continue::
end
