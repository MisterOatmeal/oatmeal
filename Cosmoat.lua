-- =========================================
-- Introduction (comments omitted for clarity)
-- =========================================

local presetMap = {
    [509] = "MoonGel",
    [508] = "ProcessedMetals",
    [510] = "CrystallicGems",
    [511] = "EelRations",
    [543] = "SunkDrone",
    [544] = "MutatedFish",
    [542] = "EdibleFish",
}

-- =========================================
-- DATA TABLES
-- =========================================

import("System.Numerics")

FisherGearset = "Fisher"
GoldsmithGearset = "Goldsmith"
AlchemistGearset = "Alchemist"
BlacksmithGearset = "Blacksmith"
CulinarianGearset = "Culinarian"

local fishingHoles = {
    ["Palus Arsenici"]          = { x = 526.3,  y = 53.7,  z = 597.7, route = "Oat_PalusArsenici" },
    ["Hollow Harbor"]           = { x = -563.5, y = 69.1,  z = -647.4, route = "Oat_HollowHarbor" },
    ["Northward Hop-print"]     = { x = 918.3,  y = -58.8,  z = -337.2, route = "Oat_NHopPrint" },
    ["Southeast Well"]          = { x = 203.7,  y = 19.5,  z = 204.7, route = "Oat_SoutheastWell" },
    ["Weeping Pool"]            = { x = 70.5,   y = 26.0,  z = -307.1, route = "Oat_WeepPool" },
    ["Westward Hop-print"]      = { x = -264.2, y = 22.4,  z = -96.1, route = "Oat_WHopPrint" },
    ["Glimmerpond Alpha"]       = { x = -688.1, y = 57.1,  z = 398.9, route = "Oat_GPAlpha" },
    ["Glimmerpond Beta"]        = { x = -357.5, y = 47.8,  z = 639.8, route = "Oat_GPBeta" },
    ["Aetherial Falls"]         = { x = 918.2,  y = -58.8, z = -337.2, route = "Oat_AetherialFalls" },
    ["Critical_Drone_LOC"]        = { x = -124.4, y = 20.1,  z = -286.3, route = "Oat_CritDrone" },
    ["Critical_EdibleFish_LOC"]   = { x = -299.7, y = 24.4,  z = -102.0, route = "Oat_CritEdible" },
    ["Critical_MutatedFish_LOC"]  = { x = 110.2,  y = 18.8,  z = -229.5, route = "Oat_CritMutant" },
    ["Critical_Drone_TurnIn"]       = { x = -250.9, y = 19.5,  z = -250.9 },
    ["Critical_EdibleFish_TurnIn"]  = { x = -459.2, y = 37.7,  z = -67.1 },
    ["Critical_MutatedFish_TurnIn"] = { x = 114.9,  y = 19.7,  z = -196.9 },
}

local FishingMissions = {
    -- Prerequisite Missions (UNFINISHED)
    { id = 485, name = "A-1: Fine-grade Water Filter Materials I", hole = "Westward Hop-print", coords = fishingHoles["Westward Hop-print"], requiresCrafting = false },
    { id = 486, name = "A-2: Fine-grade Water Filter Materials II", hole = "Weeping Pool", coords = fishingHoles["Weeping Pool"], requiresCrafting = false },
    { id = 487, name = "A-3: Fine-grade Water Filter Materials III", hole = "Hollow Harbor", coords = fishingHoles["Hollow Harbor"], requiresCrafting = false },

    -- Hybrid Missions
    { id = 510, name = "A-3: Crystallic Gems", fishID = 45928, famount = 14, itemId = 47221, iamount = 3, min_iamount = 1, weatherId = 49, hole = "Palus Arsenici", coords = fishingHoles["Palus Arsenici"], requiresCrafting = true, crafter = "Goldsmith" },
    { id = 511, name = "A-3: Eel Rations", fishID = 45940, famount = 3, itemId = 45934, iamount = 3, min_iamount = 1, weatherId = 148, hole = "Hollow Harbor", coords = fishingHoles["Hollow Harbor"], requiresCrafting = true, crafter = "Culinarian" },
    { id = 509, name = "A-2: Refined Moon Gel", fishID = 45922, famount = 3, itemId = 47593, iamount = 3, min_iamount = 1, weatherId = 1, hole = "Westward Hop-print", coords = fishingHoles["Westward Hop-print"], requiresCrafting = true, crafter = "Alchemist" },
    { id = 508, name = "A-2: Processed Aquatic Metals", fishID = 45917, famount = 14, itemId = 46973, iamount = 3, min_iamount = 1, weatherId = 1, hole = "Southeast Well", coords = fishingHoles["Southeast Well"], requiresCrafting = true, crafter = "Blacksmith" },

    -- Critical Missions
    { id = 543, name = "Sunken Drone Salvage", fishID = 45939, famount = 3, weatherId = 149, hole = "Critical_Drone_LOC", coords = fishingHoles["Critical_Drone_LOC"], turnIn = "Critical_Drone_TurnIn", requiresCrafting = false },
    { id = 544, name = "Mutated Fish", fishID = 45945, famount = 3, weatherId = 197, hole = "Critical_MutatedFish_LOC", coords = fishingHoles["Critical_MutatedFish_LOC"], turnIn = "Critical_MutatedFish_TurnIn", requiresCrafting = false },
    { id = 542, name = "Edible Fish", fishID = 45937, famount = 3, weatherId = 196, hole = "Critical_EdibleFish_LOC", coords = fishingHoles["Critical_EdibleFish_LOC"], turnIn = "Critical_EdibleFish_TurnIn", requiresCrafting = false },
}

-- =========================================
-- HELPER FUNCTIONS
-- =========================================

function GetJobIDs(job)
    local ids = {
        ["Carpenter"] = 8,
        ["Blacksmith"] = 9,
        ["Armorer"] = 10,
        ["Goldsmith"] = 11,
        ["Leatherworker"] = 12,
        ["Weaver"] = 13,
        ["Alchemist"] = 14,
        ["Culinarian"] = 15,
        ["Miner"] = 16,
        ["Botanist"] = 17,
        ["Fisher"] = 18,
    }
    return ids[job] or 0
end

function EquipFisher()
    local currentJobId = Svc.ClientState.LocalPlayer.ClassJob.Id
    if currentJobId ~= 18 then 
        yield("/gs change " .. FisherGearset)
        yield("/wait 1")
    end
end

function EnsurePlayerIdle(minWait, maxWait)
    minWait = minWait or 3    -- Minimum seconds to wait (customize if you like)
    maxWait = maxWait or 7    -- Maximum seconds to wait (customize if you like)
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

function EnsureMissionWindowOpen()
    if not Addons.GetAddon("WKSMissionInfomation").Ready then
        yield("/callback WKSHud true 11")
        yield("/wait 2")
    end
end

local iceStarted = false
function GetActiveMission()
    if not iceStarted then
        yield("/ice start")
        yield("/wait 1")
        iceStarted = true
    end
    while true do
        EnsureMissionWindowOpen()
        if Addons.GetAddon("WKSMissionInfomation").Ready then
            local missionName = Addons.GetAddon("WKSMissionInfomation"):GetNode(1, 3).Text
            for _, mission in ipairs(FishingMissions) do
                if mission.name == missionName then return mission end
            end
        end
        yield("/wait 0.5")
    end
end

function IsCriticalMission(mission)
    return mission.id == 542 or mission.id == 543 or mission.id == 544
end

function GetDistanceToTarget(targetCoords)
    if not targetCoords then return 999 end
    local playerPos = Svc.ClientState.LocalPlayer.Position
    return math.sqrt((playerPos.X - targetCoords.x)^2 + (playerPos.Y - targetCoords.y)^2 + (playerPos.Z - targetCoords.z)^2)
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
        yield("/echo Not enough Angler's Art stacks ("..stacks..") for Thaliak's Favor. Skipping.")
        return false
    end

    yield(string.format("/echo Using Thaliak's Favor on %d stacks...", stacks))
    while stacks >= 3 do
        Actions.ExecuteGeneralAction(26804) -- Thaliak's Favor
        yield("/echo Thaliak's Favor used. Waiting for animation...")
        yield("/wait 2.5") -- Wait for GCD/animation

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
        local dist = math.sqrt(dx*dx + dy*dy + dz*dz)
    return dist <= tolerance
end

-- =========================================
-- CORE SCRIPT LOGIC FUNCTIONS
-- =========================================

function AutoHookPresetByMission(missionId, missionName)
    local preset = presetMap[missionId]
    if preset then
        IPC.AutoHook.SetPreset(preset)
        yield('/echo AutoHook preset set to: "' .. preset .. '".')
        return true
    else
        yield('/echo ERROR: No AutoHook preset found for mission "' .. (missionName or "?") .. '".')
        return false
    end
end

function MoveToTarget(holeName, targetCoords)
    local maxRetries = 2
    local holeData = fishingHoles[holeName]
    if not (holeData and holeData.route and holeData.route ~= "") then
        yield('/echo ERROR: No Visland route found for "' .. holeName .. '".')
        return false
    end
    for attempt = 1, maxRetries do
        yield('/echo Move attempt ' .. attempt .. '/' .. maxRetries .. ' to "' .. holeName .. '".')
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
                local distMoved = math.sqrt((currentPos.X - lastStuckCheckPos.X)^2 + (currentPos.Y - lastStuckCheckPos.Y)^2 + (currentPos.Z - lastStuckCheckPos.Z)^2)
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
            yield('/echo Arrived at ' .. holeName .. '.')
            return true
        elseif attempt < maxRetries then
            yield("/echo Movement failed. Returning to base to retry...")
            Actions.ExecuteGeneralAction(26) -- "Return" Action
            yield("/wait " .. math.random(7, 12))
        end
    end
    yield("/echo FAILED to reach " .. holeName .. " after " .. maxRetries .. " attempts.")
    return false
end

function PerformFishingMission(mission)
    local startTime = os.time()
    local maxFishingTime = 480  -- 8 minutes

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
        yield("/echo ERROR: Mission has no crafter job info. Debug data tables.")
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
        yield("/echo Already have enough crafted items ("..alreadyHave..") for this turn-in.")
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
        yield("/echo Mission submission complete.")
        return true

    -- CRITICAL MISSION
    elseif IsCriticalMission(mission) then
        local turnInCoords = fishingHoles[mission.turnIn]
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
local previousMissionId = nil

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

    -- Step 2: Get Mission
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
    if previousMissionId ~= nil and mission.id == previousMissionId and IsAtCoords(mission.coords, 5) then
        yield("/echo [Movement] Same mission and already at fishing spot. No movement needed.")
        -- No movement, proceed
    else
        if previousMissionId ~= nil and mission.id ~= previousMissionId then
            yield("/echo [Movement] Mission changed, returning to base.")
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

    -- Step 7: Submit Mission
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
            yield("/echo Mission success! Rates -- Lunar Credits: " .. lunarPPH .. "/hr | EXP: " .. expPPH .. "/hr.")
        end
    end

    -- Step 9: Loop update
    lastCompletionTime = os.time()
    lastLunarPoints = currentLunarPoints
    lastClassExp = currentClassExp
    previousMissionId = mission.id

    yield("/wait " .. math.random(2, 4))
    ::continue::
end
