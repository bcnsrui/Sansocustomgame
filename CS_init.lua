-- Sansocustomgame bridge init for Cookie Run Braverse core.
local function tryload(path)
	return pcall(Duel.LoadScript,path)
end

local function try_many(paths)
	for _,p in ipairs(paths) do
		if Cookie2 and Cookie4 and Cookie6 then return true end
		tryload(p)
	end
	return Cookie2 and Cookie4 and Cookie6
end

-- Try same-dir names first (server-side packed script roots).
try_many({
	"CookieMainCharacter.lua",
	"CookieCharacter.lua",
	"CookieCommonEff.lua",
	"CookieCommonEff2.lua",
	"CookieCommonEff3.lua",
	"CookieTrigger.lua",
	"Cookieeffecttype.lua"
})

-- Try script-prefixed paths.
if not (Cookie2 and Cookie4 and Cookie6) then
	try_many({
		"script/CookieMainCharacter.lua",
		"script/CookieCharacter.lua",
		"script/CookieCommonEff.lua",
		"script/CookieCommonEff2.lua",
		"script/CookieCommonEff3.lua",
		"script/CookieTrigger.lua",
		"script/Cookieeffecttype.lua"
	})
end

-- Local workspace fallback.
if not (Cookie2 and Cookie4 and Cookie6) then
	try_many({
		"expansions/script/CookieMainCharacter.lua",
		"expansions/script/CookieCharacter.lua",
		"expansions/script/CookieCommonEff.lua",
		"expansions/script/CookieCommonEff2.lua",
		"expansions/script/CookieCommonEff3.lua",
		"expansions/script/CookieTrigger.lua",
		"expansions/script/Cookieeffecttype.lua"
	})
end
