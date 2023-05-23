local AddonName, E = ...
local AddonTitle = GetAddOnMetadata(AddonName, "Title")
local Version = GetAddOnMetadata(AddonName, "Version")
E.modules = {}
--------------------------------------------------------------------------------

tinsert(E.modules, function()
	if Octo_ToDo_DragonflyVars.config.UsableItems then
	local UnitLevel = UnitLevel("PLAYER")
	local scale = WorldFrame:GetWidth() / GetPhysicalScreenSize() / UIParent:GetScale()
	local bytetoB64 = {
		[0]="a", "b", "c", "d", "e", "f", "g", "h",
		"i", "j", "k", "l", "m", "n", "o", "p",
		"q", "r", "s", "t", "u", "v", "w", "x",
		"y", "z", "A", "B", "C", "D", "E", "F",
		"G", "H", "I", "J", "K", "L", "M", "N",
		"O", "P", "Q", "R", "S", "T", "U", "V",
		"W", "X", "Y", "Z", "0", "1", "2", "3",
		"4", "5", "6", "7", "8", "9", "(", ")"
	}
	function GenerateUniqueID()
		local s = {}
		for i=1, 11 do
			tinsert(s, bytetoB64[math.random(0, 63)])
		end
		return table.concat(s)
	end
	local white_list = {
		-- TEST
		-- 122250, 122360, 110560,
		5523,7973,21746,50160,54537,93724,111956,128313,136926,166297,168740,171209,171210,178040,178128,180085,180355,180592,180646,180647,180648,180649,180974,180976,180980,181372,181475,181476,181556,181557,181732,181733,181741,183699,183702,183703,184045,184046,184047,184048,184395,184522,184630,184631,184632,184633,184634,184635,184636,184637,184638,184639,184640,184641,184642,184643,184644,184645,184646,184647,184648,184843,184868,184869,185832,185972,185990,185991,185992,185993,186196,186531,186533,186650,186680,186688,186691,186693,186705,186706,186707,186708,186970,187028,187029,187278,187351,187354,187440,187543,187551,187569,187570,187571,187572,187573,187574,187575,187576,187577,187781,187787,189765,190178,190339,190610,190655,190656,191040,191139,191303,191701,192130,192131,192132,192892,192893,193891,193897,193898,193899,193900,193901,193902,193903,193904,193905,193907,193909,193910,193913,194039,194040,194041,194054,194055,194061,194062,194063,194064,194066,194067,194068,194072,194076,194077,194078,194079,194080,194081,194337,194697,194698,194699,194700,194702,194703,194704,194708,198395,198438,198454,198510,198599,198606,198607,198608,198609,198610,198611,198612,198613,198614,198656,198658,198659,198660,198662,198663,198664,198667,198669,198670,198680,198682,198683,198684,198685,198686,198687,198690,198692,198693,198696,198697,198699,198702,198703,198704,198710,198711,198712,198789,198791,198837,198841,198863,198864,198865,198866,198867,198868,198869,198963,198964,198965,198966,198967,198968,198969,198970,198971,198972,198973,198974,198975,198976,198977,198978,199115,199122,199128,199192,199197,199472,199473,199474,199475,200069,200070,200072,200073,200095,200156,200285,200287,200288,200289,200300,200452,200453,200454,200455,200468,200513,200515,200516,200609,200610,200611,200677,200678,200972,200973,200974,200975,200976,200977,200978,200979,200980,200981,200982,201003,201004,201005,201006,201007,201008,201009,201010,201011,201012,201013,201014,201015,201016,201017,201018,201019,201020,201023,201250,201268,201269,201270,201271,201272,201273,201274,201275,201276,201277,201278,201279,201280,201281,201282,201283,201284,201285,201286,201287,201288,201289,201300,201301,201326,201343,201352,201353,201439,201462,201700,201705,201706,201708,201709,201710,201711,201712,201713,201714,201715,201716,201717,201728,201754,201755,201756,201781,201782,201817,201921,201922,201923,201924,202011,202014,202016,202052,202054,202055,202056,202057,202058,202079,202080,202091,202092,202093,202094,202097,202098,202142,202171,202172,202371,202667,202668,202669,202670,203217,203220,203222,203224,203476,203681,203699,203700,203702,204222,204224,204225,204226,204227,204228,204229,204230,204231,204232,204233,204359,204378,204379,204380,204381,204383,204403,204469,204470,204471,204475,204480,204558,204559,204560,204573,204574,204575,204576,204577,204578,204579,204717,204721,204722,204723,204724,204725,204726,204850,204853,204855,204911,204986,204987,204988,204990,205001,205211,205212,205213,205214,205216,205219,205226,205247,205248,205249,205250,205251,205253,205254,205288,205342,205346,205347,205348,205350,205351,205352,205353,205354,205355,205356,205357,205358,205365,205367,205368,205369,205370,205371,205372,205373,205374,205424,205425,205426,205427,205428,205429,205430,205431,205432,205433,205434,205435,205436,205437,205438,205439,205440,205441,205442,205443,205444,205445,205682,205964,205982,205983,205985,205986,205987,205988,205989,205991,205992,205998,206019,206025,206030,206031,206034,206035,206135,206136
	}
	local white_list_plus15 = {
		204075,
		204076,
		204077,
		204078,
	}
	local white_list70 ={
		205423,
	}
	if UnitLevel == 70 then
		MergeTable(white_list, white_list70)
	end
		local UsableItems_Frame = CreateFrame("Button", AddonTitle..GenerateUniqueID(), UIParent, "SecureActionButtonTemplate,BackDropTemplate")
		UsableItems_Frame:Hide()
		UsableItems_Frame:SetSize(64*scale, 64*scale)
		UsableItems_Frame:SetPoint("TOPLEFT", 0, 0)
		UsableItems_Frame:SetBackdrop({ edgeFile = "Interface\\Addons\\"..AddonName.."\\Media\\border\\01 Octo.tga", edgeSize = 1})
		UsableItems_Frame:SetBackdropBorderColor(1, 1, 1, 1)
		UsableItems_Frame:RegisterForClicks("LeftButtonUp", "LeftButtonDown")
		UsableItems_Frame:SetAttribute("type", "macro")

		local texture = UsableItems_Frame:CreateTexture(nil, "BACKGROUND")
		UsableItems_Frame.icon = texture
		texture:SetAllPoints(UsableItems_Frame)
		texture:SetTexture(413587)

		local function UsableItemFrame_OnLoad()
			local EventFrame = CreateFrame("Frame", AddonTitle..GenerateUniqueID(), UIParent)
			EventFrame:Hide()
			EventFrame:RegisterEvent("PLAYER_LOGIN")
			EventFrame:RegisterEvent("BAG_UPDATE")
			EventFrame:RegisterEvent("VARIABLES_LOADED")
			EventFrame:SetScript("OnEvent", UsableItemFrame_OnEvent)
		end

		function UsableItemFrame_OnEvent(self, event)
			--[[if event == "VARIABLES_LOADED" then
										if Octo_ToDo_DragonflyVars.config.UsableItems == false then
											UsableItems_Frame:Hide()
											return
										end
									else]]if event == "BAG_UPDATE" then
				UsableItemFrame()
			end
		end

		function UsableItemFrame()
			for _, itemID in ipairs(white_list) do
				UsableItems_Frame.itemID = itemID
				if GetItemCount(itemID) >= 1 then
					UsableItems_Frame:Show()
					UsableItems_Frame:SetAttribute("macrotext", "/use item:"..itemID)
					UsableItems_Frame.icon:SetTexture(select(10, GetItemInfo(itemID)) or 413587)
					break
				elseif GetItemCount(itemID) == 0 then
					UsableItems_Frame:Hide()
					UsableItems_Frame.icon:SetTexture(413587)
				end
			end
		end


		E.UsableItems_Frame = UsableItems_Frame
		E.UsableItemFrame_OnLoad = UsableItemFrame_OnLoad
		E.UsableItemFrame = UsableItemFrame
		UsableItemFrame_OnLoad()
	end
end)