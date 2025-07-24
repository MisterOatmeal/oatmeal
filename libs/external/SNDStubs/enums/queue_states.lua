-- Usage:
-- luanet.load_assembly('FFXIVClientStructs')
-- QueueStates = luanet.import_type('FFXIVClientStructs.FFXIV.Client.Game.UI.ContentsFinderQueueInfo+QueueStates')
-- QueueStates.None

--- @alias QueueStatesValue
---| 0 # None
---| 1 # Pending
---| 2 # Queued
---| 3 # Ready
---| 4 # Accepted
---| 5 # InContent

--- @class QueueStates
--- @field None QueueStatesValue
--- @field Pending QueueStatesValue
--- @field Queued QueueStatesValue
--- @field Ready QueueStatesValue
--- @field Accepted QueueStatesValue
--- @field InContent QueueStatesValue
