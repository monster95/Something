print("hello world")

local i,j = 1,1
for k = 1,20 do
    print(j)
    j = i + j
    i = j - i
end

-- lua for class
newclass = function(superclass)
    local class = {mt = {}}
    class.mt.__index = class
    if superclass then
        if type(superclass) == "table" then
            setmetatable(class,superclass)
        elseif superclass == "g" then
            setmetatable(class,{__index = _G})
        end
    end
    return class
end

isElementInTable = function(element,table)
    for k, v in pairs(table or {}) do
        if element == v then
            return true
        end
    end
    return false
end

printTable = function(tb,index,tableCache)
    index = index or 1
    tb = tb or {}
    tableCache = tableCache or {}
    local seperator = "\t"
    local pre = ""
    for i = 1,index - 1 do
        pre = pre..seperator
    end
    print(pre.."{")
    for k,v in pairs(tb) do
        if type(v) == "table" then
            if isElementInTable(v, tableCache) then
                print(pre .. seperator .. tostring(k) .. " = " .. "tableCache")
            else
                print(pre .. seperator .. tostring(k) .. " = ")
                table.insert(tableCache, v)
                printTable(v, index + 1, tableCache)
            end
        else
            print(pre..seperator..tostring(k).." = "..tostring(v))
        end
    end
    print(pre.."}")
end