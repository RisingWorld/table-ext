

--- Slice part of a table and return a new copy
---
--- Note : This methods does not check if tbl is a table, it does not check
---        if first and last are valid... it is the responsibility of the caller
---        to make sure all args are valid.
---
-- @param tbl the table to slice
-- @param first (optional) the starting index (default 1)
-- @param last (optional) the last index (default #tbl)
-- @param step (optinal) skip elements between first...last (default 1)
-- @return table
function table.slice(tbl, first, last, step)
  local sliced = {}

  for i = first or 1, last or #tbl, step or 1 do
    sliced[#sliced+1] = tbl[i]
  end

  return sliced
end


--- Return all the keys in the given table. The table is assume not to be
--- an array.
-- @param tbl the table
-- @return table an array of all the keys in the given table
function table.keys(tbl)
  local keys = {};

  for key,val in pairs(tbl) do
    table.insert(keys, key);
  end

  return keys;
end


--- Used to find out if the provided table contains the specified value.
-- @param tbl The table
-- @param value The value you're looking for
-- @return True if the value exists in the table, false if not
function table.contains(tbl, value)
  local found = false;

  for key,val in pairs(tbl) do
    if val == value then
      found = true;
      break;
    end
  end

  return found;
end


--- Used to remove a value from the provided table. If the value is present
--- multiple times, all will be removed.
-- @param tbl The table
-- @param value The value you want to remove
-- @return the number of times value was removed from the array
function table.remove(tbl, value)
  local n = #input;
  local j = 0;
  local removed = 0;

  -- 1. Remove all values from array and/or table
  for key, val in pairs(tbl) do
    if val == value then
      tbl[key] = nil;
      removed = removed + 1;
    end
  end

  -- 2. shifting elements
  for i = 1, n do
    if tbl[i] ~= nil then
      j = j + 1;
      tbl[j] = tbl[i];
    end
  end

  -- 3. Compacting
  for i = j + 1, n do
    tbl[i] = nil;
  end

  return removed;
end