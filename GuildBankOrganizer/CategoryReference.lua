local _, GBO = ...

local EMPTY_RESULT = "No bundled MoP Classic profession item found."

local function cloneExamples(examples)
    local copy = {}
    for _, example in ipairs(examples or {}) do
        table.insert(copy, example)
    end
    return copy
end

local function cloneSortedTabs(tabs)
    local copy = {}
    for _, tab in ipairs(tabs or {}) do
        tab = tonumber(tab)
        if tab then
            table.insert(copy, tab)
        end
    end
    table.sort(copy)
    return copy
end

function GBO:GetCategoryReferenceSections()
    local sections = {}
    for _, category in ipairs(self:GetDepositCategoryCatalog() or {}) do
        table.insert(sections, {
            key = category.key,
            name = category.name,
            description = category.description,
            examples = cloneExamples(category.examples),
        })
    end
    table.sort(sections, function(left, right)
        if left.name == right.name then
            return left.key < right.key
        end
        return left.name < right.name
    end)
    return sections
end

function GBO:FormatCategoryReferenceResult(record)
    local itemID = type(record) == "table" and tonumber(record.itemID)
        or tonumber(record)
    local reference = itemID and self:DescribeProfessionReference(itemID) or nil
    if not reference then
        return {
            itemID = itemID,
            name = type(record) == "table" and record.name or nil,
            categoryKey = nil,
            categoryName = nil,
            expansionID = nil,
            expansionName = nil,
            evidence = nil,
            status = "unsupported",
            statusText = EMPTY_RESULT,
            exactTabs = {},
            exactRouteText = nil,
        }
    end

    local result = {
        itemID = reference.itemID,
        name = reference.name,
        categoryKey = reference.categoryKey,
        categoryName = reference.categoryName,
        expansionID = reference.expansionID,
        expansionName = reference.expansionName,
        evidence = reference.evidence,
        status = reference.status,
        exactTabs = cloneSortedTabs(reference.exactTabs),
    }

    if result.status == "excluded" then
        result.statusText = "Excluded: " .. tostring(
            result.evidence or "not available for built-in routing"
        )
    else
        result.statusText = "Included in the bundled profession reference."
    end

    if #result.exactTabs > 0 then
        local destinations = {}
        for _, tab in ipairs(result.exactTabs) do
            local profile = self:GetDepositProfile(tab, false)
            local label = profile and type(profile.label) == "string"
                and string.match(profile.label, "^%s*(.-)%s*$")
                or ""
            if label ~= "" then
                table.insert(destinations, string.format("Tab %d (%s)", tab, label))
            else
                table.insert(destinations, string.format("Tab %d", tab))
            end
        end
        result.exactRouteText = string.format(
            "Custom exact-ID destination: %s. Built-in category remains %s.",
            table.concat(destinations, ", "),
            tostring(result.categoryName or "unassigned")
        )
    end

    return result
end
