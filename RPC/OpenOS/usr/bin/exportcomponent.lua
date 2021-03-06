local component = require "component"
local rpc = require "rpc"
local tA = {...}

if #tA < 1 then
 print("Usage: exportcomponent <component address> [component address...]")
end

for k,v in ipairs(tA) do
 local px = component.proxy(component.get(v))
 print(px.type.."_"..px.address)
 for l,m in pairs(px) do
  rpc.register(px.type.."_"..px.address.."_"..l,m)
 end
end
