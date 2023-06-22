local GlobalAddonName, E = ...
local AddonTitle = GetAddOnMetadata(GlobalAddonName, "Title")
local AddonVersion = GetAddOnMetadata(GlobalAddonName, "Version")
local GBI_version, GBI_build, GBI_date, GBI_tocversion, GBI_localizedVersion, GBI_buildType = GetBuildInfo()
local Octo_Show_Dev = false
if PTR_IssueReporter then PTR_IssueReporter:Hide() end
if WeeklyRewardExpirationWarningDialog then WeeklyRewardExpirationWarningDialog:Hide() end
local inspectScantip = CreateFrame("GameTooltip", "LegToDoScanningTooltip", nil, "GameTooltipTemplate")
if Octo_Show_Dev == true then
	print ("inspectScantip = CreateFrame"..GetTime())
end
inspectScantip:SetOwner(UIParent, "ANCHOR_NONE")
-- суббота 23:00
-- E.modules = {}
local L = LibStub("AceLocale-3.0"):GetLocale("OctoTODO")
_G["OctoTODO"] = OctoTODO
local LibStub, ldb, ldbi = LibStub, LibStub("LibDataBroker-1.1"), LibStub("LibDBIcon-1.0")
local Button = nil
local CF = nil
local OctoFrame_Char_Frame = nil
local OctoFrame_EventFrame = nil
local OctoFrame_Main_Frame = nil
local OctoFrame_UPGRADERANKS_Frame = nil
local OctoFrame_Close_Button = nil
local OctoFrame_Options_Button = nil
local OctoFrame_MarkOfHonor_Button = nil
local OctoFrame_QuestFeast_Button = nil
local OctoFrame_AbandonAllQuests_Button = nil
local className, classFilename, classId = UnitClass("PLAYER")
local Kyri_Color = "|cff6fa8dc"
local Necr_Color = "|cff93c47d"
local NFae_Color = "|cffb4a7d6"
local Vent_Color = "|cffea9999"
local Cyan_Color = "|cff00ccff"
local Rift_Color = "|cffbf9eff"
local Gray_Color = "|cff404040"
local Addon_Color = "|cff4FFF79"-- "|cff00FF00"
local White_Color = "|cffFFF7D7"
local Blue_Color = "|cff00A3FF"
local Red_Color = "|cffFF4C4F"
local Green_Color = "|cff4FFF79"
local Yellow_Color = "|cffFFF371"
local Purple_Color = "|cffAF61FF"
local Orange_Color = "|cffFF661A"
local Horde_Icon = "|T132485:16:16:::64:64:4:60:4:60|t"
local Alliance_Icon = "|T132486:16:16:::64:64:4:60:4:60|t"
local Kyrian_Icon = "|T3257748:16:16:::64:64:4:60:4:60|t"
local Necrolord_Icon = "|T3257749:16:16:::64:64:4:60:4:60|t"
local NightFae_Icon = "|T3257750:16:16:::64:64:4:60:4:60|t"
local Venthyr_Icon = "|T3257751:16:16:::64:64:4:60:4:60|t"
local WorldBoss_Icon = "|T3528312:16:16:::64:64:4:60:4:60|t"
local Kyri_Color_r, Kyri_Color_g, Kyri_Color_b = 0.44, 0.66, 0.86
local Necr_Color_r, Necr_Color_g, Necr_Color_b = 0.58, 0.77, 0.49
local NFae_Color_r, NFae_Color_g, NFae_Color_b = 0.56, 0.49, 0.76
local Vent_Color_r, Vent_Color_g, Vent_Color_b = 0.88, 0.40, 0.40
local grayR,grayG,grayB,grayA = 0.5,0.5,0.5,1
local classColor = C_ClassColor.GetClassColor(classFilename)
local r, g, b = classColor:GetRGB()
local scale = WorldFrame:GetWidth() / GetPhysicalScreenSize() / UIParent:GetScale()
-- local curWidth = Octo_ToDo_DragonflyVars.config.Addon_curWidth*scale or 100*scale
local curWidth = 96*scale
local curHeight = 20*scale -- высота 20 24
local curWidthTitle = curWidth*2
local curFontTTF, curFontSize, curFontOutline = [[Interface\Addons\]]..GlobalAddonName..[[\Media\font\01 Octo.TTF]], 11, "OUTLINE"
local curCharName, _ = UnitFullName("PLAYER")
local curServer = GetRealmName()
local TotalMoney = 0
local TotalMoneyAllServer = 0
local TotalTransAnima = 0
local TotalKills = 0
local curMoney = 0
local thursdayReset = (1514358000-10800) -- https://wowreset.com/ 14-3=11(ТСК) -- thursdayResetDay0EU
local thursdayResetDay0US = 1514300400
local daytime = 86400 -- 60 * 60 * 24 -- 60 сек на 60 мин на 24 ч
local NONE = Gray_Color.."None|r"
local DONE = Addon_Color.."Done|r"
local isPlayerMaxLevel = GetMaxLevelForExpansionLevel(GetExpansionLevel())
local regionalWeeklyStart = 1668981600
local bgCr, bgCg, bgCb, bgCa = 14/255, 14/255, 14/255, 0.8 -- 0.1, 0.1, 0.1, 1
local edgeFile = [[Interface\Buttons\WHITE8X8]]
local bgFile = [[Interface\Buttons\WHITE8X8]]
local IconTexture = [[Interface\Addons\]]..GlobalAddonName..[[\Media\AddonTexture.tga]]
local PlayCustomSound = false
local Meta_Table_0 = {__index = function() return 0 end}
local Meta_Table_1 = {__index = function() return 1 end}
local Meta_Table_false = {__index = function() return false end}
local Meta_Table_true = {__index = function() return true end}
local Meta_Table_DONE = {__index = function() return DONE end}
local Meta_Table_NONE = {__index = function() return NONE end}
-- OptionsFrame.image = ELib:Texture(OptionsFrame, "Interface\\AddOns\\"..GlobalGlobalAddonName.."\\media\\OptionLogo2"):Point("TOPLEFT", 15, 5):Size(140, 140)
-- OptionsFrame_title = ELib:Texture(OptionsFrame, "Interface\\AddOns\\"..GlobalGlobalAddonName.."\\media\\logoname2"):Point("LEFT", OptionsFrame.image, "RIGHT", 15, -5):Size(512*0.7, 128*0.7)
local OctoTable_bytetoB64 = {
	[0]="a", "b", "c", "d", "e", "f", "g", "h",
	"i", "j", "k", "l", "m", "n", "o", "p",
	"q", "r", "s", "t", "u", "v", "w", "x",
	"y", "z", "A", "B", "C", "D", "E", "F",
	"G", "H", "I", "J", "K", "L", "M", "N",
	"O", "P", "Q", "R", "S", "T", "U", "V",
	"W", "X", "Y", "Z", "0", "1", "2", "3",
	"4", "5", "6", "7", "8", "9", "(", ")"
}
local OctoTable_itemID_Cataloged_Research = {
	{itemiD = 186685, count = 1},
	{itemiD = 187322, count = 8},
	{itemiD = 187457, count = 8},
	{itemiD = 187324, count = 8},
	{itemiD = 187323, count = 8},
	{itemiD = 187460, count = 8},
	{itemiD = 187458, count = 8},
	{itemiD = 187459, count = 8},
	{itemiD = 187465, count = 48},
	{itemiD = 187327, count = 48},
	{itemiD = 187463, count = 48},
	{itemiD = 187325, count = 48},
	{itemiD = 187325, count = 48},
	{itemiD = 187326, count = 48},
	{itemiD = 187462, count = 48},
	{itemiD = 187478, count = 48},
	{itemiD = 187336, count = 100},
	{itemiD = 187466, count = 100},
	{itemiD = 187332, count = 100},
	{itemiD = 187328, count = 100},
	{itemiD = 187334, count = 100},
	{itemiD = 187330, count = 150},
	{itemiD = 187329, count = 150},
	{itemiD = 187467, count = 150},
	{itemiD = 187331, count = 150},
	{itemiD = 187311, count = 300},
	{itemiD = 187333, count = 300},
	{itemiD = 187350, count = 300},
}
local OctoTable_itemID_ALL = {
	122457,169223,174764,174765,174759,174767,174760,174766,174758,174768,174756,174761,
	86547,124124,173363,24915,24916,24917,24918,24919,49040,50274,51316,51317,51318,51319,51320,51321,52200,52201,52251,52252,52253,83078,92426,92441,92471,122284,122338,122339,122340,122341,128353,129940,129941,129942,129943,129944,129945,129946,129947,129948,129949,129950,129951,129954,129955,133150,133151,133152,133154,133159,133160,137642,138486,138488,138727,138728,138729,141605,141652,143935,143936,143937,143938,143939,143940,143941,143942,143943,143944,143945,143946,143947,151614,151615,166751,167731,167732,167862,167924,167925,167926,167927,167928,167929,167930,167932,168017,168018,180817,183616,185834,187997,187998,188152,189765,190189,190453,190454,190455,190456,191251,191264,191784,191915,192130,192131,192132,193201,193891,193897,193898,193899,193900,193901,193902,193903,193904,193905,193907,193909,193910,193913,194039,194040,194041,194054,194055,194061,194062,194063,194064,194066,194067,194068,194072,194076,194077,194078,194079,194080,194081,194337,194697,194698,194699,194700,194702,194703,194704,194708,197921,198046,198395,198438,198454,198510,198599,198606,198607,198608,198609,198610,198611,198612,198613,198656,198658,198659,198660,198662,198663,198664,198667,198669,198670,198680,198682,198683,198684,198685,198686,198687,198690,198692,198693,198696,198697,198699,198702,198703,198704,198710,198711,198712,198789,198837,198841,198863,198864,198865,198866,198867,198868,198869,198963,198964,198965,198966,198967,198968,198969,198970,198971,198972,198973,198974,198975,198976,198977,198978,199115,199122,199128,199192,199197,199472,199473,199474,199475,200069,200070,200072,200073,200095,200224,200285,200287,200288,200289,200300,200452,200453,200454,200455,200468,200513,200515,200516,200609,200610,200611,200652,200677,200678,200686,200764,200811,200846,200972,200973,200974,200975,200976,200977,200978,200979,200980,200981,200982,201003,201004,201005,201006,201007,201008,201009,201010,201011,201012,201013,201014,201015,201016,201017,201018,201019,201020,201023,201250,201268,201269,201270,201271,201272,201273,201274,201275,201276,201277,201278,201279,201280,201281,201282,201283,201284,201285,201286,201287,201288,201289,201300,201301,201326,201352,201439,201462,201700,201705,201706,201708,201709,201710,201711,201712,201713,201714,201715,201716,201717,201728,201755,201756,201781,201782,201817,201836,201921,201922,201923,201924,201991,202011,202014,202016,202017,202039,202052,202079,202080,202091,202092,202093,202094,202097,202098,202142,202152,202171,202172,202173,202196,202371,202667,202668,202669,202670,202870,202871,202872,203217,203220,203222,203224,203430,203476,203611,203612,203613,203614,203615,203616,203617,203618,203619,203620,203622,203623,203626,203627,203628,203629,203630,203631,203632,203633,203634,203635,203636,203637,203638,203639,203640,203641,203642,203643,203644,203645,203646,203647,203648,203649,203650,203681,203683,203699,203700,203702,203710,204075,204076,204077,204078,204180,204186,204187,204188,204189,204190,204191,204193,204194,204195,204196,204215,204217,204222,204224,204225,204226,204227,204228,204229,204230,204231,204232,204233,204276,204352,204359,204378,204379,204380,204381,204383,204403,204440,204464,204469,204470,204471,204475,204558,204559,204560,204573,204574,204575,204576,204577,204578,204579,204681,204682,204697,204715,204717,204721,204722,204723,204724,204725,204726,204727,204843,204850,204853,204855,204985,204986,204987,204988,204990,204999,205001,205188,205211,205212,205213,205214,205216,205219,205225,205249,205250,205288,205347,205367,205423,205878,205903,205982,205984,205986,205987,205988,205989,205999,206019,206025,206028,206030,206031,206034,206035,206037,206139,206140,206141,206142,206143,206144,206366,
}
local OctoTable_itemID_Reputation = {
	192055,200443,200093,200447,199906,200450,201411,201412,200071,200449,201470,201471,206006,202854,190941
}
local OctoTable_itemID_DFMountsSkins = {
	192111,192523,194034,194106,194521,194549,194705,194838,196961,196962,196963,196964,196965,196966,196967,196968,196969,196970,196971,196972,196973,196974,196975,196976,196977,196978,196979,196980,196981,196982,196983,196984,196985,196986,196987,196988,196989,196990,196991,196992,196993,196994,196995,196996,196997,196998,196999,197000,197001,197002,197003,197004,197005,197006,197007,197008,197009,197010,197011,197012,197013,197014,197015,197016,197017,197018,197019,197020,197021,197022,197023,197090,197091,197093,197094,197095,197096,197097,197098,197099,197100,197101,197102,197103,197104,197105,197106,197107,197108,197109,197110,197111,197112,197113,197114,197115,197116,197117,197118,197119,197120,197121,197122,197123,197124,197125,197126,197127,197128,197129,197130,197131,197132,197133,197134,197135,197136,197137,197138,197139,197140,197141,197142,197143,197144,197145,197146,197147,197148,197149,197150,197151,197152,197153,197154,197155,197156,197346,197347,197348,197349,197350,197351,197352,197353,197354,197355,197356,197357,197358,197359,197360,197361,197362,197363,197364,197365,197366,197367,197368,197369,197370,197371,197372,197373,197374,197375,197376,197377,197378,197379,197380,197381,197382,197383,197384,197385,197386,197387,197388,197389,197390,197391,197392,197393,197394,197395,197396,197397,197398,197399,197400,197401,197402,197403,197404,197405,197406,197407,197408,197577,197578,197579,197580,197581,197582,197583,197584,197585,197586,197587,197588,197589,197590,197591,197592,197593,197594,197595,197596,197597,197598,197599,197600,197601,197602,197603,197604,197605,197606,197607,197608,197609,197610,197611,197612,197613,197614,197615,197616,197617,197618,197619,197620,197621,197622,197623,197624,197625,197626,197627,197628,197629,197630,197634,197635,197636,198438,198891,198892,198893,198894,198895,198896,198899,198901,198902,198903,198904,199192,201734,201735,201736,201737,201738,201739,201741,201742,201743,201790,201792,202102,202273,202274,202275,202277,202278,202279,202280,203299,203300,203303,203304,203306,203307,203308,203309,203310,203311,203312,203313,203314,203315,203316,203317,203318,203319,203320,203321,203322,203323,203324,203325,203327,203328,203329,203330,203331,203332,203333,203334,203335,203336,203337,203338,203339,203340,203341,203342,203343,203344,203345,203346,203347,203348,203349,203350,203351,203352,203353,203354,203355,203357,203358,203359,203360,203361,203362,203363,203364,203365,204359,204361,205226,205341,205865,205876,206955,
}
local OctoTable_QuestID = {
	38242,43533,13183,24545,24547,24548,24549,24743,24748,24749,24756,24757,32295,32307,32309,32310,32317,32324,32325,40168,40173,40786,40787,45563,47148,55498,55499,55509,55511,56337,56339,64367,64710,65143,65282,66042,66133,66419,66860,66861,66862,66863,66864,66865,66866,66867,66868,66870,66871,66873,66874,66875,71026,72166,72167,72168,72169,72170,72171,72646,72647,72648,72649,72719,72720,72721,72722,72723,72724,72725,72726,72727,72728,72810,74378,74568,74569,74570,74771,74775,74871,74905,75234,75239,75390,75393,75397,75459,75497,75506,75516,75517,75619,75620,75621,75622,75665,75694,75887,75888,75996,76014,76015,76016,76027,76081,76084,76122,13183,24545,24547,24548,24549,24743,24748,24749,24756,24757,32295,32307,32309,32310,32317,32324,32325,36614,40168,40173,40786,40787,45563,47148,55498,55499,55509,55511,56337,56339,60242,60243,60244,60245,60246,60247,60248,60249,60250,60251,60252,60253,60254,60255,60256,60257,60646,60762,60775,61075,61079,61088,61103,61104,61765,61813,61814,61815,61816,61981,61982,61983,61984,62214,62234,62284,62285,62286,62287,62288,62631,62632,62633,62634,62635,62636,62637,62638,62639,62640,62858,62859,62860,62861,62862,62863,62864,62865,62866,62867,62868,62869,63543,63815,63816,63817,63818,63822,63823,63824,63825,63826,63830,63949,63993,63995,63996,63997,63998,63999,64021,64027,64044,64045,64055,64056,64057,64058,64059,64060,64061,64152,64209,64232,64233,64243,64245,64246,64247,64251,64256,64257,64258,64263,64265,64269,64270,64272,64273,64276,64278,64283,64284,64285,64291,64300,64303,64307,64313,64316,64317,64318,64320,64338,64339,64341,64342,64343,64344,64347,64348,64349,64351,64354,64355,64356,64357,64358,64359,64360,64361,64362,64363,64364,64366,64367,64428,64433,64434,64435,64436,64439,64440,64442,64455,64456,64457,64470,64471,64472,64522,64531,64564,64565,64575,64709,64710,64747,64748,64749,64750,64751,64752,64753,64754,64755,64756,64757,64828,65143,65266,65282,66042,66133,66419,66860,66861,66862,66863,66864,66865,66866,66867,66868,66870,66871,66873,66874,66875,71026,72166,72167,72168,72169,72170,72171,72646,72647,72648,72649,72719,72720,72721,72722,72723,72724,72725,72726,72727,72728,72810,74300,74305,74306,74307,74321,74322,74325,74328,74329,74330,74331,74332,74333,74336,74337,74338,74339,74341,74342,74343,74344,74345,74346,74347,74349,74352,74378,74568,74569,74570,74771,74775,74871,74905,75156,75222,75234,75239,75267,75269,75271,75274,75276,75285,75292,75296,75298,75314,75322,75326,75334,75336,75338,75340,75342,75349,75353,75358,75360,75364,75366,75370,75390,75393,75397,75441,75450,75451,75454,75455,75459,75461,75471,75476,75478,75494,75497,75506,75516,75517,75576,75611,75612,75619,75620,75621,75622,75624,75664,75665,75694,75705,75888,75996,76014,76015,76016,76027,76081,76084,76122,39246,34378
}
local OctoTable_SpellID = {
	-- Рыбалка
	366253, -- Рыбная ловля дракьньих осттавов
	-- Полёты
	33388,
	33391,
	34090,
	90265,
	366256, -- Кулинария
}
local OctoTable_currencyID_ALL = {
	22,42,61,81,101,102,103,104,121,122,123,124,125,126,161,181,201,221,241,301,321,341,361,384,385,391,393,394,395,396,397,398,399,400,401,402,416,483,484,515,614,615,676,677,692,697,698,738,752,754,776,777,789,810,821,823,824,828,829,830,897,910,944,980,994,999,1008,1017,1020,1101,1129,1149,1154,1155,1166,1171,1172,1173,1174,1191,1220,1226,1268,1273,1275,1299,1314,1324,1325,1342,1347,1349,1350,1355,1356,1357,1379,1388,1401,1416,1501,1506,1508,1533,1534,1535,1540,1541,1553,1559,1560,1565,1579,1580,1585,1586,1587,1592,1593,1594,1595,1596,1597,1598,1599,1600,1602,1703,1704,1705,1710,1714,1715,1716,1717,1718,1719,1721,1722,1723,1728,1738,1739,1740,1742,1743,1744,1745,1746,1747,1748,1749,1750,1752,1754,1755,1757,1758,1761,1762,1763,1767,1769,1792,1794,1802,1803,1804,1805,1806,1807,1808,1810,1811,1812,1813,1816,1819,1820,1822,1828,1829,1830,1831,1832,1835,1836,1837,1838,1839,1840,1841,1842,1843,1844,1845,1846,1847,1848,1849,1850,1851,1852,1853,1859,1860,1861,1862,1863,1864,1865,1866,1867,1868,1869,1870,1871,1872,1873,1874,1877,1878,1880,1883,1884,1885,1887,1888,1889,1891,1902,1903,1904,1906,1907,1909,1910,1911,1912,1913,1914,1915,1916,1917,1918,1919,1920,1921,1922,1923,1924,1925,1926,1931,1932,1933,1934,1935,1936,1937,1938,1939,1940,1941,1942,1943,1944,1945,1946,1947,1948,1949,1950,1951,1952,1953,1954,1955,1956,1957,1958,1959,1960,1961,1962,1963,1964,1965,1966,1967,1968,1969,1970,1971,1972,1976,1977,1979,1980,1981,1982,1997,2000,2001,2002,2003,2005,2006,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066,2067,2069,2070,2073,2074,2075,2076,2077,2078,2079,2080,2081,2082,2083,2084,2085,2086,2087,2088,2089,2090,2091,2092,2093,2094,2095,2096,2097,2098,2099,2100,2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2113,2114,2115,2116,2118,2119,2120,2122,2123,2124,2125,2126,2128,2129,2130,2131,2132,2133,2134,2135,2136,2137,2138,2139,2140,2141,2142,2148,2149,2150,2151,2152,2153,2154,2155,2156,2157,2158,2159,2160,2161,2162,2165,2166,2167,2169,2170,2171,2172,2173,2174,2175,2176,2177,2178,2179,2180,2181,2182,2183,2184,2185,2186,2187,2188,2189,2190,2191,2192,2193,2194,2195,2196,2197,2198,2199,2201,2202,2203,2204,2205,2206,2207,2208,2209,2210,2211,2212,2213,2214,2215,2216,2217,2218,2224,2225,2226,2227,2228,2235,2236,2237,2244,2245,2246,2247,2248,2249,2250,2251,2252,2253,2254,2255,2256,2257,2258,2259,2260,2261,2262,2263,2264,2265,2266,2267,2268,2269,2270,2271,2272,2273,2274,2275,2276,2277,2278,2279,2280,2402,2408,2409,2410,2411,2412,2413,2419,2420,2533
}
local OctoTable_reputation = {
	21,47,54,59,67,68,69,70,72,76,81,87,92,93,169,270,349,369,469,470,509,510,529,530,576,577,589,609,729,730,749,809,889,890,891,892,909,910,911,922,930,932,933,934,935,936,941,942,946,947,967,970,978,980,989,990,1011,1012,1015,1031,1037,1038,1050,1052,1064,1067,1068,1072,1073,1077,1085,1090,1091,1094,1097,1098,1104,1105,1106,1117,1118,1119,1124,1126,1133,1134,1135,1156,1158,1162,1171,1172,1173,1174,1177,1178,1204,1216,1228,1242,1245,1269,1270,1271,1272,1273,1275,1276,1277,1278,1279,1280,1281,1282,1283,1302,1337,1341,1345,1351,1352,1353,1358,1359,1374,1375,1376,1387,1388,1419,1435,1440,1444,1445,1492,1515,1520,1681,1682,1690,1691,1708,1710,1711,1731,1732,1733,1735,1736,1737,1738,1739,1740,1741,1815,1828,1834,1847,1848,1849,1850,1859,1860,1861,1862,1883,1888,1894,1899,1900,1919,1947,1948,1975,1984,1989,2010,2011,2018,2045,2085,2086,2087,2088,2089,2090,2091,2097,2098,2099,2100,2101,2102,2103,2104,2111,2135,2156,2157,2158,2159,2161,2162,2163,2164,2165,2166,2170,2233,2264,2265,2370,2371,2372,2373,2374,2375,2376,2377,2378,2379,2380,2381,2382,2383,2384,2385,2386,2387,2388,2389,2390,2391,2392,2395,2400,2401,2407,2410,2413,2414,2415,2416,2417,2418,2422,2427,2432,2439,2440,2441,2442,2444,2445,2446,2447,2448,2449,2450,2451,2452,2453,2454,2455,2456,2457,2458,2459,2460,2461,2462,2463,2464,2465,2469,2470,2471,2472,2473,2474,2478,2479,2503,2504,2506,2507,2508,2509,2510,2511,2512,2513,2517,2518,2520,2521,2522,2523,2524,2526,2542,2544,2550,2551,2552,2554,2555,2564,2565,2568
}
local OctoTable_func_otrisovka = {
}
local OctoTable_UniversalQuest = {
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	{
		name_save = "ALL",
		name_quest = WorldBoss_Icon.."WB",
		reset = "Weekly",
		expansion = "DF",
		place = "",
		desc = "WB",
		questID = {69927,69928,69929,69930},
		max = 1
	},
	{
		name_save = "ZaqaliElders",
		name_quest = WorldBoss_Icon.."WB: Старейшины закали",
		reset = "Weekly",
		expansion = "DF",
		place = "ZaralekCavern",
		desc = "WB",
		questID = {74892},
		max = 1
	},
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	{
		name_save = "ALL",
		name_quest = WorldBoss_Icon.."WB",
		reset = "Weekly",
		expansion = "SL",
		place = "",
		desc = "WB",
		questID = {61813,61814,61815,61816},
		max = 1
	},
	{
		name_save = "Antros",
		name_quest = WorldBoss_Icon.."WB: Антрос",
		reset = "Weekly",
		expansion = "SL",
		place = "ZM",
		desc = "WB",
		questID = {65143},
		max = 1
	},
	{
		name_save = "Morgeth",
		name_quest = WorldBoss_Icon.."WB: Мор'гет",
		reset = "Weekly",
		expansion = "SL",
		place = "Maw",
		desc = "WB",
		questID = {64531},
		max = 1
	},
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	{
		name_save = "ALL",
		name_quest = WorldBoss_Icon.."WB",
		reset = "Weekly",
		expansion = "BfA",
		place = "",
		desc = "WB",
		questID = {52157,52163,52166,52181,52169,52196},
		max = 1,
	},
	{
		name_save = "TerroroftheDepths",
		name_quest = WorldBoss_Icon.."WB: Глубинный ужас",
		reset = "Weekly",
		expansion = "BfA",
		place = "Nazjatar",
		desc = "WB",
		questID = {56056},
		max = 1,
	},
	{
		name_save = "Assault",
		name_quest = WorldBoss_Icon.."WB: Вук'лаз Землелом",
		reset = "Weekly",
		expansion = "BfA",
		place = "",
		desc = "WB",
		questID = {55466},
		max = 1,
	},
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	{
		name_save = "ALL",
		name_quest = WorldBoss_Icon.."WB",
		reset = "Weekly",
		expansion = "Legion",
		place = "",
		desc = "WB",
		questID = {43512,43193,43448,43985,42819,43192,43513,42270,42779,42269,44287},
		max = 1,
	},
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	{
		name_save = "ShapingFate", -- Определяя судьбу
		name_quest = "Определяя судьбу",
		reset = "Weekly",
		expansion = "SL",
		place = "Korthia",
		desc = "",
		questID = {63949},
		max = 1
	},
	{
		name_save = "ReplenishtheReservoir", -- Наполнение резервуара
		name_quest = "Наполнение резервуара",-- func_currencyicon(1813)..func_questName(61981),
		reset = "Weekly",
		expansion = "SL",
		place = "",
		desc = "",
		questID = {61981,61982,61983,61984},
		max = 1
	},
	{
		name_save = "Torghast",
		name_quest = "Торгаст",
		reset = "Weekly",
		expansion = "SL",
		place = "Maw",
		desc = "",
		questID = {64347},
		max = 1
	},
	{
		name_save = "CovenantAssault",
		name_quest = "Атака ковенантов",
		reset = "Weekly",
		expansion = "SL",
		place = "Maw",
		desc = "",
		questID = {63822,63823,63824,63543},
		max = 1
	},
	{
		name_save = "ContainingtheHelsworn", -- Сдержать Верных Хелии
		name_quest = "Сдержать Верных Хелии",-- func_itemTexture(186997)..func_questName(64273),
		reset = "Weekly",
		expansion = "SL",
		place = "Maw",
		desc = "",
		questID = {64273},
		max = 1
	},
	{
		name_save = "ReturnLostSouls", -- Возвращение потерянных душ
		name_quest = "Возвращение потерянных душ",-- func_currencyicon(1810)..func_questName(62858),
		reset = "Weekly",
		expansion = "SL",
		place = "",
		desc = "",
		questID = {62858,62859,62860,62861,62862,62863,62864,62865,62866,62867,62868,62869},
		max = 1
	},
	{
		name_save = "TradingFavors",
		name_quest = "Обмен услугами или Ценная находка",
		reset = "Weekly",
		expansion = "SL",
		place = "",
		desc = "",
		questID = {60242,60243,60244,60245,60246,60247,60248,60249,60250,60251,60252,60253,60254,60255,60256,60257},
		max = 2
	},
	{
		name_save = "WeekendEvent",
		name_quest = "Событие выходного дня",
		reset = "Weekly",
		expansion = "DF",
		place = "",
		desc = "",
		questID = {72728,72720,72722,72723},
		max = 1
	},
	-- {
	-- name_save = "Timewalk5DUNGEONS",
	-- name_quest = "Таймволк 5 инстов",
	-- reset = "Weekly",
	-- expansion = "DF",
	-- place = "",
	-- desc = "",
	-- questID = {72727,72810,72719,72725,72726},
	-- max = 1
	-- },
	{
		name_save = "PVP",
		name_quest = "ПВП",
		reset = "Weekly",
		expansion = "DF",
		place = "",
		desc = "",
		questID = {47148,71026,72169,72167,72166,72168,72171,72170,72646,74871,72648,72647,72649},
		max = 3
	},
	{
		name_save = "StolenKorthianSupplies",
		name_quest = "Украденные кортийские припасы (ДРОПАЕТСЯ)",
		reset = "Weekly",
		expansion = "SL",
		place = "Korthia",
		desc = "",
		questID = {64522},
		max = 1
	},
	{
		name_save = "LostResearch",
		name_quest = "Пропавшие исследования",
		reset = "Weekly",
		expansion = "SL",
		place = "Korthia",
		desc = "",
		questID = {65266},
		max = 1
	},
	{
		name_save = "KorthianAnimaVessel", -- Тайник с украденной анимой
		name_quest = "Кортийский сосуд с анимой",
		reset = "Daily",
		expansion = "SL",
		place = "Korthia",
		desc = "",
		questID = {64575},
		max = 1
	},
	{
		name_save = "StolenAnimaVessel", -- RIFT
		name_quest = "Сосуд с украденной анимой", -- func_texturefromIcon(528693).."Сосуд с украденной анимой",
		reset = "Weekly",
		expansion = "SL",
		place = "Korthia",
		desc = "RIFT",
		questID = {64265,64269,64270},
		max = 3
	},
	{
		name_save = "RiftboundCache", -- RIFT DAILY
		name_quest = "Тайник Разлома", -- func_texturefromIcon(528693).."Тайник Разлома",
		reset = "Daily",
		expansion = "SL",
		place = "Korthia",
		desc = "RIFT",
		questID = {64470,64471,64472,64456},
		max = 4
	},
	{
		name_save = "ZovaalsVault", -- RIFT DAILY
		name_quest = "Хранилище Зоваала", -- func_texturefromIcon(528693).."Хранилище Зоваала",
		reset = "Daily",
		expansion = "SL",
		place = "Korthia",
		desc = "RIFT",
		questID = {64283},
		max = 1
	},
	{
		name_save = "SpectralBoundChest", -- RIFT DAILY -- Chest with 3 keys
		name_quest = "Сундук с призрачным замком", -- func_texturefromIcon(528693).."Сундук с призрачным замком",
		reset = "Daily",
		expansion = "SL",
		place = "Korthia",
		desc = "RIFT",
		questID = {64247},
		max = 1
	},
	{
		name_save = "HelswornChest", -- Maw chest in Desmotaeron
		name_quest = "Сундук Верных Хелии",
		reset = "Daily",
		expansion = "SL",
		place = "Maw",
		desc = "",
		questID = {64256},
		max = 1
	},
	{
		name_save = "Mobs",
		name_quest = "Мобы", -- func_texturefromIcon(237273).."Мобы",
		reset = "Daily",
		expansion = "SL",
		place = "Korthia",
		desc = "",
		questID = {64341,64342,64343,64344,64747,64748,64749,64750,64751,64752,64753,64754,64755,64756,64757},
		max = 3
	},
	{
		name_save = "RelicGorger",
		name_quest = "Поглотитель реликвий", -- func_texturefromIcon(237273).."Поглотитель реликвий",
		reset = "Daily",
		expansion = "SL",
		place = "Korthia",
		desc = "",
		questID = {64433,64434,64435,64436},
		max = 4
	},
	{
		name_save = "Collection",
		name_quest = "Сбор",
		reset = "Daily",
		expansion = "SL",
		place = "Korthia",
		desc = "",
		questID = {64351,64354,64355,64356,64357,64358,64359,64360,64361,64362,64021,64363,64364,64316,64317,64318,64564,64565},
		max = 18
	},
	{
		name_save = "Quest",
		name_quest = "Утроба",
		reset = "Daily",
		expansion = "SL",
		place = "Maw",
		desc = "",
		questID = {60646,60762,60775,61075,61079,61088,61103,61104,61765,62214,62234},
		max = 3
	},
	{
		name_save = "Rares",
		name_quest = "Рарки", -- func_texturefromIcon(237273).."Рарки",
		reset = "Weekly",
		expansion = "SL",
		place = "Korthia",
		desc = "",
		questID = {64457,64338,64442,64278,64245,64246,64263,64428,64258,64233,64349,63830,64243,64291,64455,64320,64313,64284,64285,64257,64440,64276,64272,64232,64251,64152,64439},
		max = 23
	},
	{
		name_save = "ResearchReportRelicExaminationTechniques", -- Отчет об исследованиях: методика изучения реликвий
		name_quest = "Отчет об исследованиях: методика изучения реликвий", -- +50% REP -- func_itemTexture(187136)..func_itemName(187136), -- +50% REP
		reset = "Once",
		expansion = "SL",
		place = "Korthia",
		desc = "ITEM",
		questID = {64367},
		max = 1
	},
	{
		name_save = "VaultAnimaTracker", -- Детектор украденной анимы
		name_quest = "Детектор украденной анимы", -- доступ к сосудам 1000 -- func_itemTexture(186453)..func_itemName(186453), -- доступ к сосудам 1000
		reset = "Once",
		expansion = "SL",
		place = "Korthia",
		desc = "ITEM",
		questID = {64061},
		max = 1
	},
	{
		name_save = "ResearchReportAllSeeingCrystal", -- Отчет об исследованиях: всевидящий кристалл
		name_quest = "Отчет об исследованиях: всевидящий кристалл", -- func_itemTexture(186714)..func_itemName(186714),
		reset = "Once",
		expansion = "SL",
		place = "Korthia",
		desc = "ITEM",
		questID = {64339},
		max = 1
	},
	{
		name_save = "TreatiseRecognizingStygiaanditsUses", -- Исследование: распознавание стигии и ее применение
		name_quest = "Исследование: распознавание стигии и ее применение", -- func_itemTexture(187145)..func_itemName(187145),
		reset = "Once",
		expansion = "SL",
		place = "Korthia",
		desc = "ITEM",
		questID = {64307},
		max = 1
	},
	{
		name_save = "TreatiseBondsofStygiainMortals", -- Исследование: узы стигии в смертных
		name_quest = "Исследование: узы стигии в смертных", -- func_itemTexture(187706)..func_itemName(187706),
		reset = "Once",
		expansion = "SL",
		place = "Korthia",
		desc = "ITEM",
		questID = {64828},
		max = 1
	},
	{
		name_save = "ResearchReportAncientShrines", -- Отчет об исследованиях: древние святилища
		name_quest = "Отчет об исследованиях: древние святилища", -- func_itemTexture(186716)..func_itemName(186716),
		reset = "Once",
		expansion = "SL",
		place = "Korthia",
		desc = "ITEM",
		questID = {64348},
		max = 1
	},
	{
		name_save = "TreatiseTheStudyofAnimaandHarnessingEveryDrop", -- Исследование: свойства и эффективное использование анимы
		name_quest = "Исследование: свойства и эффективное использование анимы", -- func_itemTexture(186722)..func_itemName(186722),
		reset = "Once",
		expansion = "SL",
		place = "Korthia",
		desc = "ITEM",
		questID = {64027},
		max = 1
	},
	{
		name_save = "TreatiseRelicsAboundintheShadowlands", -- Исследование: поиски реликвий в Темных Землях
		name_quest = "Исследование: поиски реликвий в Темных Землях", -- func_itemTexture(186721)..func_itemName(186721),
		reset = "Once",
		expansion = "SL",
		place = "Korthia",
		desc = "ITEM",
		questID = {64366},
		max = 1
	},
	{
		name_save = "ResearchReportAdaptiveAlloys", -- Отчет об исследованиях: адаптивные сплавы
		name_quest = "Отчет об исследованиях: адаптивные сплавы", -- func_itemTexture(186717)..func_itemName(186717),
		reset = "Once",
		expansion = "SL",
		place = "Korthia",
		desc = "ITEM",
		questID = {64300},
		max = 1
	},
	{
		name_save = "ResearchReportFirstAlloys", -- Отчет об исследованиях: первые сплавы
		name_quest = "Отчет об исследованиях: первые сплавы", -- func_itemTexture(187138)..func_itemName(187138),
		reset = "Once",
		expansion = "SL",
		place = "Korthia",
		desc = "ITEM",
		questID = {64303},
		max = 1
	},
	{
		name_save = "Events",
		name_quest = "Пещера Заралек (события)",
		reset = "Daily",
		expansion = "DF",
		place = "ZaralekCavern",
		desc = "",
		questID = {75612,75471,75455,75664,75611,75478,75451,75461,75705,75454,75450,75222,75370,75494,75441,75156,75624,74352},
		max = 18
	},
	{
		name_save = "Rares",
		name_quest = "Рарки", -- func_texturefromIcon(237273).."Рарки",
		reset = "Daily",
		expansion = "DF",
		place = "ZaralekCavern",
		desc = "",
		questID = {75271,75285,75298,75326,75576,75314,75296,75353,75358,75274,75366,75336,75269,75334,75322,75267,75476,75276,75342,75338,75340,75360,75292,75349,75364},
		max = 25
	},
	{
		name_save = "AWorthyAllyLoammNiffen", -- Достойный союзник: лоаммские ниффы
		name_quest = "Достойный союзник: лоаммские ниффы", -- func_questName(75665),
		reset = "Weekly",
		expansion = "DF",
		place = "",
		desc = "ZaralekCavern",
		questID = {75665},
		max = 1
	},
	{
		name_save = "Sniffenseeking",
		name_quest = "нюхорысканье",
		reset = "Weekly",
		expansion = "DF",
		place = "ZaralekCavern",
		desc = "",
		questID = {75459,76027,75621,75397,75517,75619,76014,75620,76081,75390,75234,75516,75996,76016,75393,76015,76084},
		max = 9 -- ?
	},
	{
		name_save = "Rares",
		name_quest = "Рарки", -- func_texturefromIcon(237273).."Рарки",
		reset = "Daily",
		expansion = "DF",
		place = "TheForbiddenReach",
		desc = "",
		questID = {74331,74347,74345,74336,74337,74342,74321,74343,74338,74329,74307,74325,74346,74344,74332,74306,74333,74341,74305,74339,74300,74349,74322,74330,74328},
		max = 25
	},
	{
		name_save = "Feast",
		name_quest = L["Community Feast"],
		reset = "Weekly",
		expansion = "DF",
		place = "",
		desc = "",
		questID = {70893},
		max = 1
	},
	{
		name_save = "DragonbaneKeep",
		name_quest = L["Siege on Dragonbane Keep"],
		reset = "Weekly",
		expansion = "DF",
		place = "",
		desc = "",
		questID = {70866},
		max = 1
	},
	{
		name_save = "TheGrandHunt",
		name_quest = L["Grand Hunt"],
		reset = "Weekly",
		expansion = "DF",
		place = "",
		desc = "",
		questID = {70906},
		max = 1
	},
	{
		name_save = "StormsFury",
		name_quest = L["The Storm's Fury"],
		reset = "Weekly",
		expansion = "DF",
		place = "",
		desc = "",
		questID = {73162},
		max = 1
	},
	{
		name_save = "KeysofLoyalty",
		name_quest = L["Keys of Loyalty"],
		reset = "Weekly",
		expansion = "DF",
		place = "",
		desc = "",
		questID = {66133},
		max = 1
	},
	{
		name_save = "StormBoundChest",
		name_quest = "Запечатанный бурей сундук",
		reset = "Weekly",
		expansion = "DF",
		place = "",
		desc = "",
		questID = {74567},
		max = 1
	},
	{
		name_save = "ResearchersUnderFire",
		name_quest = L["Researchers Under Fire"],
		reset = "Weekly",
		expansion = "DF",
		place = "",
		desc = "",
		questID = {75630}, -- 75643
		max = 1
	},
	{
		name_save = "FyrakkAssaults",
		name_quest = L["Fyrakk Asssaults (Local)"],
		reset = "Weekly",
		expansion = "DF",
		place = "",
		desc = "",
		questID = {74501,75280}, -- 75887
		max = 1
	},
	{
		name_save = "Timewalk500CURRENCY",
		name_quest = PLAYER_DIFFICULTY_TIMEWALKER.."(500 cur)",
		reset = "Weekly",
		expansion = "DF",
		place = "",
		desc = "",
		questID = {40173,64710,40168,40786,45563,55499,55498,40787},
		max = 1
	},
	{
		name_save = "Timewalk5DUNGEONS",
		name_quest = PLAYER_DIFFICULTY_TIMEWALKER.."Timewalk5DUNGEONS",
		reset = "Weekly",
		expansion = "DF",
		place = "",
		desc = "",
		questID = {72727,72810,72719,72725,72726,72724},
		max = 1
	},
	{
		name_save = "3kREP", -- Помощь союзу
		name_quest = "Помощь союзу", -- func_questName(70750),
		reset = "Weekly",
		expansion = "DF",
		place = "",
		desc = "",
		questID = {72068,72373,72374,72375,75259,70750,75859,75860,75861},
		max = 1
	},
	{
		name_save = "FightingisItsOwnReward", -- Славный бой – это уже награда
		name_quest = "Славный бой – это уже награда",-- func_questName(76122),
		reset = "Weekly",
		expansion = "DF",
		place = "",
		desc = "",
		questID = {76122},
		max = 1
	},
	{
		name_save = "Shadowmourne",
		name_quest = "Темная Скорбь",
		reset = "Once",
		expansion = "WotLK",
		place = "",
		desc = "",
		questID = {24545,24743,24547,24749,24756,24757,24548,24549,24748},
		max = 9
	},
	{
		name_save = "Warlock",
		name_quest = "Зеленый огонь",
		reset = "Once",
		expansion = "MoP",
		place = "",
		desc = "",
		questID = {32295,32307,32309,32310,32317,32324,32325}, -- КАКОЙ-то за орду, какой-то за алли и почему-то 8
		max = 7
	},
	{
		name_save = "PatternsWithinPatterns", -- Закономерности в закономерностях
		name_quest = "Закономерности в закономерностях", -- func_texturefromIcon(4074774)..func_questName(66042),
		reset = "Weekly",
		expansion = "SL",
		place = "ZM",
		desc = "",
		questID = {66042},
		max = 1
	},
	{
		name_save = "Rares",
		name_quest = "Рарки", -- func_texturefromIcon(237273)..
		reset = "Daily",
		expansion = "SL",
		place = "ZM",
		desc = "",
		questID = {65557,65547,65581,65579,63988,65552,65582,64668,64716,64719,65548,65550,65239,65585,65586,65587,65583,65580,65553,65544,65240,65241,65556,65584,65551,65251,65257,65272,65574,65273,65555,65549},
		max = 25
	},
	{
		name_save = "RaresDuneDominance",
		name_quest = "Рарки (Дюны)", -- func_texturefromIcon(237273)..
		reset = "Daily",
		expansion = "SL",
		place = "ZM",
		desc = "",
		questID = {65585,65586,65587},
		max = 3
	},
	{
		name_save = "worldQuests",
		name_quest = "worldQuests",
		reset = "Daily",
		expansion = "SL",
		place = "ZM",
		desc = "",
		questID = {64960,64974,65081,65089,65102,65115,65117,65119,65230,65232,65234,65244,65252,65262,65402,65403,65404,65405,65406,65407,65408,65410,65411,65412,65413,65414,65415,65416,65417,65231},
		max = 3
	},
	{
		name_save = "TREASURES",
		name_quest = "TREASURES",
		reset = "Daily",
		expansion = "SL",
		place = "ZM",
		desc = "",
		questID = {65520,65573,65489,64667,65465,65523,65487,65503,65178,65480,65545,65173,65441,65522,65537,65536,65542,65546,65540,65566,65447,65543,64545,65270,65565,65175},
		max = 36
	},
	{
		name_save = "GetLockStatus",
		name_quest = "GetLockStatus",
		reset = "Daily",
		expansion = "SL",
		place = "ZM",
		desc = "",
		questID = {65589,65590,65591,65592},
		max = 4
	},
	{
		name_save = "UndulatingFoliage",
		name_quest = "UndulatingFoliage",
		reset = "Once",
		expansion = "SL",
		place = "ZM",
		desc = "",
		questID = {65572},
		max = 1
	},
	{
		name_save = "PryingEyeDiscovery",
		name_quest = "ZM_PryingEyeDiscovery",
		reset = "Daily",
		expansion = "SL",
		place = "ZM",
		desc = "",
		questID = {65184,65501,65611},
		max = 1
	},
	{
		name_save = "PUZZLECACHES",
		name_quest = "PUZZLECACHES",
		reset = "Daily",
		expansion = "SL",
		place = "ZM",
		desc = "",
		questID = {65094,65323,65318,65322,65317,65093,65321,65092,65316,65412,65315,65091,65320,64972,65314,65319},
		max = 50
	},
	{
		name_save = "Concordance", -- Волнующий конкорданс -- Оживленный конкорданс -- Безмятежный конкорданс
		name_quest = "Concordance",
		reset = "Once",
		expansion = "SL",
		place = "ZM",
		desc = "",
		questID = {65179,65213,65216,65210,65180,65214,65211,65217,64940,65212,65209,65215,},
		max = 12
	},
	{
		name_save = "coinsQuests",
		name_quest = "coinsQuests WoD",
		reset = "Weekly",
		expansion = "WoD",
		place = "",
		desc = "",
		questID = {36058,36055,37452,37453,36056,37457,37456,36054,37455,37454,36057,37458,37459},
		max = 3,
	},
	{
		name_save = "coinsQuests",
		name_quest = "coinsQuests Legion",
		reset = "Weekly",
		expansion = "Legion",
		place = "",
		desc = "",
		questID = {43895,43897,43896,43892,43893,43894,47851,47864,47865,43510},
		max = 2,
	},
	{
		name_save = "coinsQuests",
		name_quest = "coinsQuests BfA",
		reset = "Weekly",
		expansion = "BfA",
		place = "",
		desc = "",
		questID = {52835,52834,52837,52840,52838,52839},
		max = 2,
	},
	{
		name_save = "miniVision",
		name_quest = "miniVision",
		reset = "Weekly",
		expansion = "BfA",
		place = "",
		desc = "",
		questID = {58168,58155,58151,58167,58156},
		max = 5,
	},
	{
		name_save = "AssaultTheBlackEmpire",
		name_quest = "Assault: The Black Empire",
		reset = "Weekly",
		expansion = "BfA",
		place = "",
		desc = "",
		questID = {56064,},
		max = 1,
	},
	{
		name_save = "Warfront1",
		name_quest = "Warfront1",
		reset = "Weekly",
		expansion = "BfA",
		place = "",
		desc = "",
		questID = {53416,53414},
		max = 1,
	},
	{
		name_save = "Warfront2",
		name_quest = "Warfront2",
		reset = "Weekly",
		expansion = "BfA",
		place = "",
		desc = "",
		questID = {53955,53992},
		max = 1,
	},
	{
		name_save = "WarfrontHC",
		name_quest = "WarfrontHC",
		reset = "Weekly",
		expansion = "BfA",
		place = "",
		desc = "",
		questID = {56137,56136,57959,57960},
		max = 1,
	},
	-- Баланс сил
	{
		name_save = "BalanceofPower",
		name_quest = "Balance of Power",
		reset = "Once",
		expansion = "Legion",
		place = "",
		desc = "",
		questID = {43496,43503,43501,43505,40668,43514,43517,43518,43519,43581,43520,43521,43522,43938,43527,43937,43523,40673,43524,40675,43525,40678,43526,40603,40608,40613,40614,40672,40615,43898,43528,43530,43531,43532,43533,},
		max = 33,
	},
	-- InvasionQuests https://www.wowhead.com/ru/quests/battle-for-azeroth/tiragarde-sound#200-2+1+12
	{
		name_save = "InvasionQuests", -- PVP
		name_quest = "Invasion Quests",
		reset = "Daily",
		expansion = "BfA",
		place = "",
		desc = "",
		questID = {
			54134,54136,53711,53701,54138,51982,
			53883,54137,53885,53939,54135,54132,
		},
		max = 1,
	},
	{
		name_save = "AssaultQuests", -- Nzoth
		name_quest = "Assault Quests",
		reset = "Daily",
		expansion = "BfA",
		place = "",
		desc = "",
		questID = {
			55350,
		},
		max = 1,
	},
}
local function TableConcat(table1, table2)
	for i=1, #table2 do
		table1[#table1+1] = table2[i]
	end
	return table1
end
TableConcat(OctoTable_itemID_ALL,OctoTable_itemID_Reputation)
TableConcat(OctoTable_itemID_ALL,OctoTable_itemID_DFMountsSkins)
local function GenerateUniqueID()
	local s = {}
	for i=1, 11 do
		tinsert(s, OctoTable_bytetoB64[math.random(0, 63)])
	end
	return table.concat(s)
end
local function CompactNumberFormat(number)
	if not number then
		number = 0
	end
	if number == 0 then
		return 0
	elseif number < 1000 then
		return (math.floor((number+0.5)-0.5)/10)*10
	elseif number < 1000000 then
		return (math.floor(number/100)/10) .."k"
	else return (math.floor(number/100000)/10) .."m"
	end
end
local function func_texturefromIcon(textureID)
	return "|T"..textureID..":16:16:::64:64:4:60:4:60|t"
end
local function func_questName(questID)
	local title = C_QuestLog.GetTitleForQuestID(questID) or "notitle"
	return title
end
local function func_reputationName(factionID)
	local name = GetFactionInfoByID(factionID)
	if not name then
		local reputationInfo = C_GossipInfo.GetFriendshipReputation(factionID or 0)
		name = reputationInfo.name or "NONAME"
	end
	local color = "|cffFFFFFF"
	local r = "|r"
	if factionID == 1168 then color = "|cff909090" end
	return color..name..r
end
local function func_itemName(itemID)
	local itemName, _, itemQuality = GetItemInfo(itemID)
	if itemQuality then
		local r, g, b = GetItemQualityColor(itemQuality)
		local color = CreateColor(r, g, b, 1)
		local itemNameColored = color:WrapTextInColorCode(itemName)
		return itemNameColored or "noname"
	end
	return itemName or "noname"
end
local function func_itemName_NOCOLOR(itemID)
	local itemName = GetItemInfo(itemID)
	return itemName or "noname"
end
local function func_itemTexture(itemID)
	local itemTexture = select(10, GetItemInfo(itemID)) or 134400 -- https://www.wowhead.com/ru/icon=134400/inv-misc-questionmark
	if itemTexture then
		return "|T"..itemTexture..":16:16:::64:64:4:60:4:60|t"
	end
	return "|T134400:16:16:::64:64:4:60:4:60|t"
end
local function func_currencyName(currencyID)
	local info = C_CurrencyInfo.GetCurrencyInfo(currencyID)
	if info then
		local name = info.name
		local iconFileID = info.iconFileID
		local quality = info.quality
		local r, g, b = GetItemQualityColor(quality)
		local color = CreateColor(r, g, b, 1)
		local currencyName = color:WrapTextInColorCode(name)
		return currencyName
	end
end
local function func_currencyicon(currencyID)
	local info = C_CurrencyInfo.GetCurrencyInfo(currencyID)
	if info then
		iconFileID = info.iconFileID or 134400 -- https://www.wowhead.com/ru/icon=134400/inv-misc-questionmark
	end
	return "|T"..iconFileID..":16:16:::64:64:4:60:4:60|t"
end
local function func_currencyquantity(currencyID)
	local info = C_CurrencyInfo.GetCurrencyInfo(currencyID)
	if info then
		quantity = info.quantity or 0 -- https://www.wowhead.com/ru/icon=134400/inv-misc-questionmark
	end
	return quantity
end
local function func_spellName(spellID)
	local name = GetSpellInfo(spellID)
	return name
end
local function Central_Frame_Mouse_OnEnter(self)
	local parent = self:GetParent():GetParent()["FrameLine"..self.index]
	parent:GetScript("OnEnter")(parent)
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	if not self.tooltip then return end
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM", 0, -10)
	GameTooltip:AddLine(" ")
	for _, v in pairs(self.tooltip) do
		if v[2] ~= "0/0" then
			GameTooltip:AddDoubleLine(v[1], v[2], 1, 1, 1, 1, 1, 1)
		end
	end
	GameTooltip:AddLine(" ")
	GameTooltip:Show()
end
local function Central_Frame_Mouse_OnLeave(self)
	local parent = self:GetParent():GetParent()["FrameLine"..self.index]
	parent:GetScript("OnLeave")(parent)
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	GameTooltip:Hide()
end
local function SecondsToClock(seconds)
	local seconds = tonumber(seconds)
	if seconds <= 0 or seconds == nil then
		return "0:00"
	elseif seconds >= 3600 then
		hours = string.format("%01.f", math.floor(seconds/3600))
		mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)))
		return hours.."h "..mins.."m"
	elseif seconds >= 600 then
		hours = string.format("%01.f", math.floor(seconds/3600))
		mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)))
		return mins.."m"
	else
		hours = string.format("%01.f", math.floor(seconds/3600))
		mins = string.format("%01.f", math.floor(seconds/60 - (hours*60)))
		return mins.."m"
	end
end
local function CheckCompletedByQuestID(questID)
	local Octopussy = ""
	-- сделан
	if C_QuestLog.IsQuestFlaggedCompleted(questID) == true then
		Octopussy = (DONE)
		-- можно сдать
	elseif C_QuestLog.IsComplete(questID) == true then
		Octopussy = Purple_Color..">>СДАЙ<<|r"
		-- не сделан и нет квеста
	elseif C_QuestLog.IsQuestFlaggedCompleted(questID) == false and C_QuestLog.IsOnQuest(questID) == false then
		Octopussy = (NONE)
		-- есть кв и нельзя сдать
	elseif C_QuestLog.IsOnQuest(questID) == true and C_QuestLog.IsComplete(questID) == false then
		local objectives = C_QuestLog.GetQuestObjectives(questID)
		local objectiveText, objectiveType, finished, numFulfilled, numRequired = GetQuestObjectiveInfo(questID, 1, false)
		if objectives == nil then
			return ""
		end
		if objectiveType == "progressbar" then
			return Red_Color..GetQuestProgressBarPercent(questID).."%|r"
		end
		local OBJF1 = "" local OBJR1 = "" local C1 = Red_Color local R1 = "|r"
		local OBJF2 = "" local OBJR2 = "" local C2 = Red_Color local R2 = "|r"
		local OBJF3 = "" local OBJR3 = "" local C3 = Red_Color local R3 = "|r"
		local OBJF4 = "" local OBJR4 = "" local C4 = Red_Color local R4 = "|r"
		local OBJF5 = "" local OBJR5 = "" local C5 = Red_Color local R5 = "|r"
		if objectives[1] == nil then
		OBJF1 = "" OBJR1 = "" else if
			objectives[1].numFulfilled == objectives[1].numRequired then
			OBJF1 = Green_Color.."done|r" OBJR1 = "" else if
				objectives[1].numFulfilled >= 0 then
					OBJF1 = objectives[1].numFulfilled.."/" OBJR1 = objectives[1].numRequired
				end
			end
		end
		if OBJF1 == OBJR1 then
			C1 = Green_Color..""
		end
		if objectives[2] == nil then
		OBJF2 = "" OBJR2 = "" else if
			objectives[2].numFulfilled == objectives[2].numRequired then
			OBJF2 = Green_Color.."done|r" OBJR2 = "" else if
				objectives[2].numFulfilled >= 0 then
					OBJF2 = objectives[2].numFulfilled.."/" OBJR2 = objectives[2].numRequired
				end
			end
		end
		if OBJF2 == OBJR2 then
			C2 = Green_Color..""
		end
		if objectives[3] == nil then
		OBJF3 = "" OBJR3 = "" else if
			objectives[3].numFulfilled == objectives[3].numRequired then
			OBJF3 = Green_Color.."done|r" OBJR3 = "" else if
				objectives[3].numFulfilled >= 0 then
					OBJF3 = objectives[3].numFulfilled.."/" OBJR3 = objectives[3].numRequired
				end
			end
		end
		if OBJF3 == OBJR3 then
			C3 = Green_Color..""
		end
		if objectives[4] == nil then
		OBJF4 = "" OBJR4 = "" else if
			objectives[4].numFulfilled == objectives[4].numRequired then
			OBJF4 = Green_Color.."done|r" OBJR4 = "" else if
				objectives[4].numFulfilled >= 0 then
					OBJF4 = objectives[4].numFulfilled.."/" OBJR4 = objectives[4].numRequired
				end
			end
		end
		if OBJF4 == OBJR4 then
			C4 = Green_Color..""
		end
		if objectives[5] == nil then
		OBJF5 = "" OBJR5 = "" else if
			objectives[5].numFulfilled == objectives[5].numRequired then
			OBJF5 = Green_Color.."done|r" OBJR5 = "" else if
				objectives[5].numFulfilled >= 0 then
					OBJF5 = objectives[5].numFulfilled.."/" OBJR5 = objectives[5].numRequired
				end
			end
		end
		if OBJF5 == OBJR5 then
			C5 = Green_Color..""
		end
		if objectives then
			if objectives[5] then
				Octopussy = Red_Color..CompactNumberFormat(objectives[5].numFulfilled).."/"..CompactNumberFormat(objectives[5].numRequired).."|r"
			elseif objectives[4] then
				Octopussy = Red_Color..CompactNumberFormat(objectives[4].numFulfilled).."/"..CompactNumberFormat(objectives[4].numRequired).."|r"
			elseif objectives[3] then
				Octopussy = Red_Color..CompactNumberFormat(objectives[3].numFulfilled).."/"..CompactNumberFormat(objectives[3].numRequired).."|r"
			elseif objectives[2] then
				Octopussy = Red_Color..CompactNumberFormat(objectives[2].numFulfilled).."/"..CompactNumberFormat(objectives[2].numRequired).."|r"
			elseif objectives[1] then
				Octopussy = Red_Color..CompactNumberFormat(objectives[1].numFulfilled).."/"..CompactNumberFormat(objectives[1].numRequired).."|r"
			end
		end
	end
	return Octopussy
end
local function CheckReputationByRepID(factionID)
	local Vivod = ""
	local dev_text = ""
	local friendshipRank, friendshipMaxRank
	local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, _, _, isWatched, isChild, _, hasBonusRepGain, canBeLFGBonus = GetFactionInfoByID(factionID)
	local color = White_Color
	local r = "|r"
	local standingTEXT = ""
	-- RED
	if standingID == 1 then
		color = Red_Color
		standingTEXT = " ("..FACTION_STANDING_LABEL1..")" -- color = "|cffc0443b" Hated
	elseif standingID == 2 then
		color = Red_Color
		standingTEXT = " ("..FACTION_STANDING_LABEL2..")" -- color = "|cffd91614" Hostile
		-- оранж
	elseif standingID == 3 then
		color = Orange_Color
		standingTEXT = " ("..FACTION_STANDING_LABEL3..")" -- color = "|cffcd732e" Unfriendly
		-- ЖЕЛТЫЙ
	elseif standingID == 4 then
		color = Yellow_Color
		standingTEXT = " ("..FACTION_STANDING_LABEL4..")" -- color = Yellow_Color Neutral
		-- ЗЕЛЕНЫЙ
	elseif standingID == 5 then
		color = Yellow_Color
		standingTEXT = " ("..FACTION_STANDING_LABEL5..")" -- color = "|cff1af11a" Friendly
		-- ПОЧТИ ЗЕЛЕНЫЙ
	elseif standingID == 6 then
		color = Green_Color
		standingTEXT = " ("..FACTION_STANDING_LABEL6..")" -- color = "|cff1af05e" Honored
	elseif standingID == 7 then
		color = Green_Color
		standingTEXT = " ("..FACTION_STANDING_LABEL7..")" -- color = "|cff19ffc6" Revered
		-- БИРЮЗОВЫЙ
	elseif standingID == 8 then
		color = Addon_Color
		standingTEXT = " ("..FACTION_STANDING_LABEL8..")" -- color = "|cff00ffff" Exalted
	elseif standingID == 9 then
		color = Addon_Color
		standingTEXT = " ("..FACTION_STANDING_LABEL9..")" -- color ="|cff00ffff" Paragon
	end
	local reputationInfo = C_GossipInfo.GetFriendshipReputation(factionID or 0)
	-- if not barMax then
	-- Vivod = "not barMax"
	-- elseif factionID and barMax and barMin ~= 0 then
	-- -- -- -- -- - ПАРАГОН
	if C_Reputation.IsFactionParagon(factionID) then
		if Octo_Show_Dev == true then dev_text = Red_Color.."ПАРАГОН: |r" end
		local currentValue = C_Reputation.GetFactionParagonInfo(factionID) or 0
		local threshold = 1
		local _, threshold, rewardQuestID, hasRewardPending, tooLowLevelForParagon = C_Reputation.GetFactionParagonInfo(factionID)
		if threshold then
			local value = currentValue % threshold
			Vivod = dev_text..Blue_Color..--[[CompactNumberFormat]](value).."/"..--[[CompactNumberFormat]](threshold)..r
			if hasRewardPending then
				Vivod = dev_text..CheckCompletedByQuestID(rewardQuestID)
			end
		end
		-- -- -- -- -- - МАЖОР ФАКШН
	elseif C_Reputation.IsMajorFaction(factionID) then
		if Octo_Show_Dev == true then dev_text = Green_Color.."МАЖОР ФАКШН: |r" end
		local data = C_MajorFactions.GetMajorFactionData(factionID)
		local currentValue = data.renownReputationEarned
		local totalValue = data.renownLevelThreshold
		local standing = data.renownLevel
		Vivod = dev_text..--[[CompactNumberFormat]](currentValue).."/"..--[[CompactNumberFormat]](totalValue)..Addon_Color.."("..--[[CompactNumberFormat]](standing)..")|r"
		if standing == 0 then Vivod = 0 end
		-- -- -- -- -- - ФРЕНД ФАКШН
	elseif (reputationInfo and reputationInfo.friendshipFactionID and reputationInfo.friendshipFactionID > 0) then
		if Octo_Show_Dev == true then dev_text = Yellow_Color.."ФРЕНД ФАКШН: |r" end
		local friendshipFactionID = reputationInfo.friendshipFactionID or 0
		local reactionThreshold = reputationInfo.reactionThreshold or 0
		local nextThreshold = reputationInfo.nextThreshold or 0
		local standing = reputationInfo.standing or 0
		local name = reputationInfo.name
		local currentValue = standing-reactionThreshold
		local totalValue = nextThreshold-reactionThreshold
		local rankInfo = C_GossipInfo.GetFriendshipReputationRanks(friendshipFactionID)
		local currentLevel, maxLevel
		if rankInfo then
			currentLevel = rankInfo.currentLevel or 0
			maxLevel = rankInfo.maxLevel or 0
		end
		standingTEXT = " ("..currentLevel.."/"..maxLevel..")"
		-- if currentLevel == 1 then
		-- color = Yellow_Color
		-- standingTEXT = " (Stranger)" -- 1
		-- elseif currentLevel == 2 then
		-- color = Yellow_Color
		-- standingTEXT = " (Acquaintance)" -- 2
		-- elseif currentLevel == 3 then
		-- color = Yellow_Color
		-- standingTEXT = " (Buddy)" -- 3
		-- elseif currentLevel == 4 then
		-- color = Yellow_Color
		-- standingTEXT = " (Friend)" -- 4
		-- elseif currentLevel == 5 then
		-- color = Green_Color
		-- standingTEXT = " (Good Friend)" -- 5
		-- elseif currentLevel == 6 then
		-- color = Addon_Color
		-- standingTEXT = " (Best Friend)" -- 6
		-- end
		Vivod = dev_text..color..--[[CompactNumberFormat]](currentValue).."/"..--[[CompactNumberFormat]](totalValue)..standingTEXT..r
		if currentLevel == maxLevel then Vivod = dev_text..Addon_Color.."Done|r" end
		-- if standing == 0 then Vivod = 0 end
		-- -- -- -- -- - Other
	else
		if Octo_Show_Dev == true then dev_text = Purple_Color.."Other: |r" end
		if barValue then
			local currentValue = barValue-barMin
			local totalValue = barMax-barMin
			Vivod = dev_text..color..--[[CompactNumberFormat]](currentValue).."/"..--[[CompactNumberFormat]](totalValue)..standingTEXT..r
			if currentValue == totalValue or nextThreshold == 0 then Vivod = dev_text..Addon_Color.."Done|r" end
			-- if standingID == 0 or currentValue == 0 then Vivod = 0 end
		end
	end
	-- end
	return Vivod
end
local function Empty_Zero(number)
	if number == 0 then
		return ""
	end
	return number
end
local function tmstpDayReset(n)
	local n = n or 1
	local currTime = GetServerTime()
	local xyu = (math.ceil((currTime - thursdayReset)/(daytime*n))*daytime*n)+thursdayReset
	return (math.ceil((currTime - thursdayReset)/(daytime*n))*daytime*n)+thursdayReset
end
local function WA_Utf8Sub(input, size)
	local output = ""
	if type(input) ~= "string" then
		return output
	end
	local i = 1
	while (size > 0) do
		local byte = input:byte(i)
		if not byte then
			return output
		end
		if byte < 128 then
			output = output..input:sub(i, i)
			size = size - 1
		elseif byte < 192 then
			output = output..input:sub(i, i)
		elseif byte < 244 then
			output = output..input:sub(i, i)
			size = size - 1
		end i = i + 1
	end
	while (true) do
		local byte = input:byte(i)
		if byte and byte >= 128 and byte < 192 then
			output = output..input:sub(i, i)
		else
			break
		end
		i = i + 1
	end
	return output
end
local function checkCharInfo(CharInfo)
	for k,v in pairs(OctoTable_UniversalQuest) do
		for q,w in pairs(v) do
			CharInfo["Octopussy_"..v.expansion.."_"..v.reset.."_"..v.desc..v.place..v.name_save.."_name"] = CharInfo["Octopussy_"..v.expansion.."_"..v.reset.."_"..v.desc..v.place..v.name_save.."_name"] or NONE
			CharInfo["Octopussy_"..v.expansion.."_"..v.reset.."_"..v.desc..v.place..v.name_save.."_count"] = CharInfo["Octopussy_"..v.expansion.."_"..v.reset.."_"..v.desc..v.place..v.name_save.."_count"] or NONE
			CharInfo["Octopussy_"..v.expansion.."_"..v.reset.."_"..v.desc..v.place..v.name_save.."_questID"] = CharInfo["Octopussy_"..v.expansion.."_"..v.reset.."_"..v.desc..v.place..v.name_save.."_questID"] or NONE
		end
	end
	CharInfo.avgItemLevel = CharInfo.avgItemLevel or 0
	CharInfo.avgItemLevelEquipped = CharInfo.avgItemLevelEquipped or 0
	CharInfo.avgItemLevelPvp = CharInfo.avgItemLevelPvp or 0
	CharInfo.className = CharInfo.className or 0
	CharInfo.classFilename = CharInfo.classFilename or 0
	CharInfo.classId = CharInfo.classId or 0
	CharInfo.classColor = CharInfo.classColor or {r = 0.5, g = 0.5, b = 0.5}
	CharInfo.curCovID = CharInfo.curCovID or 0
	CharInfo.CurrencyID = CharInfo.CurrencyID or {}
	CharInfo.CurrencyID_maxQuantity = CharInfo.CurrencyID_maxQuantity or {}
	CharInfo.CurrencyID_Total = CharInfo.CurrencyID_Total or {}
	CharInfo.curServer = CharInfo.curServer or 0
	CharInfo.azeriteLVL = CharInfo.azeriteLVL or 0
	CharInfo.azeriteEXP = CharInfo.azeriteEXP or 0
	CharInfo.cloak_lvl = CharInfo.cloak_lvl or 0
	CharInfo.cloak_res = CharInfo.cloak_res or 0
	CharInfo.curServerShort = CharInfo.curServerShort or 0
	CharInfo.Faction = CharInfo.Faction or 0
	CharInfo.ItemsInBag = CharInfo.ItemsInBag or {}
	CharInfo.KnownSpell = CharInfo.KnownSpell or {}
	CharInfo.maxNumQuestsCanAccept = CharInfo.maxNumQuestsCanAccept or 0
	CharInfo.Name = CharInfo.Name or 0
	CharInfo.needResetDaily = CharInfo.needResetDaily or false
	CharInfo.needResetWeekly = CharInfo.needResetWeekly or false
	CharInfo.numQuests = CharInfo.numQuests or 0
	CharInfo.numShownEntries = CharInfo.numShownEntries or 0
	CharInfo.Possible_Anima = CharInfo.Possible_Anima or 0
	CharInfo.Possible_CatalogedResearch = CharInfo.Possible_CatalogedResearch or 0
	CharInfo.loginDate = CharInfo.loginDate or 0
	CharInfo.loginDay = CharInfo.loginDay or 0
	CharInfo.loginHour = CharInfo.loginHour or 0
	CharInfo.profID_prof1 = CharInfo.profID_prof1 or {}
	CharInfo.profID_prof1.chest = CharInfo.profID_prof1.chest or {}
	CharInfo.profID_prof1.craftOrder = CharInfo.profID_prof1.craftOrder or {}
	CharInfo.profID_prof1.drops = CharInfo.profID_prof1.drops or {}
	CharInfo.profID_prof1.profQuest = CharInfo.profID_prof1.profQuest or {}
	CharInfo.profID_prof1.treatise = CharInfo.profID_prof1.treatise or {}
	CharInfo.profID_prof2 = CharInfo.profID_prof2 or {}
	CharInfo.profID_prof2.chest = CharInfo.profID_prof2.chest or {}
	CharInfo.profID_prof2.craftOrder = CharInfo.profID_prof2.craftOrder or {}
	CharInfo.profID_prof2.drops = CharInfo.profID_prof2.drops or {}
	CharInfo.profID_prof2.profQuest = CharInfo.profID_prof2.profQuest or {}
	CharInfo.profID_prof2.treatise = CharInfo.profID_prof2.treatise or {}
	CharInfo.PVP = CharInfo.PVP or {}
	CharInfo.OctoTable_QuestID = CharInfo.OctoTable_QuestID or {}
	CharInfo.reputationID = CharInfo.reputationID or {}
	CharInfo.Shadowland = CharInfo.Shadowland or {}
	CharInfo.totalSlots = CharInfo.totalSlots or 0
	CharInfo.totalSlotsBANK = CharInfo.totalSlotsBANK or 0
	CharInfo.UnitLevel = CharInfo.UnitLevel or 0
	CharInfo.usedSlots = CharInfo.usedSlots or 0
	CharInfo.usedSlotsBANK = CharInfo.usedSlotsBANK or 0
	CharInfo.VOID_STORAGE_PAGE1 = CharInfo.VOID_STORAGE_PAGE1 or {}
	CharInfo.VOID_STORAGE_PAGE2 = CharInfo.VOID_STORAGE_PAGE2 or {}
	CharInfo.canUseMountEquipment = CharInfo.canUseMountEquipment or false
	CharInfo.currentMountItemID = CharInfo.currentMountItemID or 0
	CharInfo.HasAvailableRewards = CharInfo.HasAvailableRewards or false
	CharInfo.BindLocation = CharInfo.BindLocation or 0
	CharInfo.CurrentLocation = CharInfo.CurrentLocation or 0
	CharInfo.islandBfA = CharInfo.islandBfA or 0
	CharInfo.bounty_BfA1 = CharInfo.bounty_BfA1 or 0
	CharInfo.bounty_BfA2 = CharInfo.bounty_BfA2 or 0
	CharInfo.bounty_BfA3 = CharInfo.bounty_BfA3 or 0
	CharInfo.bounty_BfA1_end = CharInfo.bounty_BfA1_end or 0
	CharInfo.bounty_BfA2_end = CharInfo.bounty_BfA2_end or 0
	CharInfo.bounty_BfA3_end = CharInfo.bounty_BfA3_end or 0
	CharInfo.bounty_BfA1_questID = CharInfo.bounty_BfA1_questID or 0
	CharInfo.bounty_BfA2_questID = CharInfo.bounty_BfA2_questID or 0
	CharInfo.bounty_BfA3_questID = CharInfo.bounty_BfA3_questID or 0
	CharInfo.bounty_BfA1_icon = CharInfo.bounty_BfA1_icon or 0
	CharInfo.bounty_BfA2_icon = CharInfo.bounty_BfA2_icon or 0
	CharInfo.bounty_BfA3_icon = CharInfo.bounty_BfA3_icon or 0
	CharInfo.bounty_Legion1 = CharInfo.bounty_Legion1 or 0
	CharInfo.bounty_Legion2 = CharInfo.bounty_Legion2 or 0
	CharInfo.bounty_Legion3 = CharInfo.bounty_Legion3 or 0
	CharInfo.bounty_Legion1_end = CharInfo.bounty_Legion1_end or 0
	CharInfo.bounty_Legion2_end = CharInfo.bounty_Legion2_end or 0
	CharInfo.bounty_Legion3_end = CharInfo.bounty_Legion3_end or 0
	CharInfo.bounty_Legion1_questID = CharInfo.bounty_Legion1_questID or 0
	CharInfo.bounty_Legion2_questID = CharInfo.bounty_Legion2_questID or 0
	CharInfo.bounty_Legion3_questID = CharInfo.bounty_Legion3_questID or 0
	CharInfo.bounty_Legion1_icon = CharInfo.bounty_Legion1_icon or 0
	CharInfo.bounty_Legion2_icon = CharInfo.bounty_Legion2_icon or 0
	CharInfo.bounty_Legion3_icon = CharInfo.bounty_Legion3_icon or 0
	CharInfo.hasMail = CharInfo.hasMail or false
	setmetatable(CharInfo, Meta_Table_0)
	setmetatable(CharInfo.CurrencyID_maxQuantity, Meta_Table_0)
	setmetatable(CharInfo.CurrencyID_Total, Meta_Table_0)
	setmetatable(CharInfo.CurrencyID, Meta_Table_0)
	setmetatable(CharInfo.ItemsInBag, Meta_Table_0)
	setmetatable(CharInfo.KnownSpell, Meta_Table_false)
	setmetatable(CharInfo.profID_prof1, Meta_Table_0)
	setmetatable(CharInfo.profID_prof1.chest, Meta_Table_0)
	setmetatable(CharInfo.profID_prof1.craftOrder, Meta_Table_0)
	setmetatable(CharInfo.profID_prof1.drops, Meta_Table_0)
	setmetatable(CharInfo.profID_prof1.profQuest, Meta_Table_0)
	setmetatable(CharInfo.profID_prof1.treatise, Meta_Table_0)
	setmetatable(CharInfo.profID_prof2, Meta_Table_0)
	setmetatable(CharInfo.profID_prof2.chest, Meta_Table_0)
	setmetatable(CharInfo.profID_prof2.craftOrder, Meta_Table_0)
	setmetatable(CharInfo.profID_prof2.drops, Meta_Table_0)
	setmetatable(CharInfo.profID_prof2.profQuest, Meta_Table_0)
	setmetatable(CharInfo.profID_prof2.treatise, Meta_Table_0)
	setmetatable(CharInfo.PVP, Meta_Table_0)
	setmetatable(CharInfo.OctoTable_QuestID, Meta_Table_NONE)
	setmetatable(CharInfo.reputationID, Meta_Table_0)
	setmetatable(CharInfo.Shadowland, Meta_Table_0)
	setmetatable(CharInfo.VOID_STORAGE_PAGE1, Meta_Table_0)
	setmetatable(CharInfo.VOID_STORAGE_PAGE2, Meta_Table_0)
	if (CharInfo.tmstp_Weekly or 0) < GetServerTime() and CharInfo.CurrentKey ~= 0 then
		CharInfo.CurrentKey = Addon_Color..">VAULT<|r"
	end
	if (CharInfo.tmstp_Weekly or 0) < GetServerTime() and CharInfo.Octopussy_DF_Weekly_3kREP_count == DONE then
		CharInfo.Octopussy_DF_Weekly_3kREP_count = NONE
	end
	if (CharInfo.tmstp_Weekly or 0) < GetServerTime() and CharInfo.Octopussy_DF_Weekly_Feast_count == DONE then
		CharInfo.Octopussy_DF_Weekly_Feast_count = NONE
	end
	if (CharInfo.tmstp_Weekly or 0) < GetServerTime() then
		CharInfo.tmstp_Weekly = tmstpDayReset(7)
		CharInfo.needResetWeekly = true
		CharInfo.Octopussy_DF_Weekly_DragonbaneKeep_count = NONE
		CharInfo.Octopussy_DF_Weekly_FightingisItsOwnReward_count = NONE
		CharInfo.Octopussy_DF_Weekly_FyrakkAssaults_count = NONE
		CharInfo.Octopussy_DF_Weekly_KeysofLoyalty_count = NONE
		CharInfo.Octopussy_DF_Weekly_PVP_count = NONE
		CharInfo.Octopussy_DF_Weekly_ResearchersUnderFire_count = NONE
		CharInfo.Octopussy_DF_Weekly_StormBoundChest_count = NONE
		CharInfo.Octopussy_DF_Weekly_StormsFury_count = NONE
		CharInfo.Octopussy_DF_Weekly_TheGrandHunt_count = NONE
		CharInfo.Octopussy_DF_Weekly_Timewalk500CURRENCY_count = NONE
		CharInfo.Octopussy_DF_Weekly_Timewalk5DUNGEONS_count = NONE
		CharInfo.Octopussy_DF_Weekly_WBALL_count = NONE
		CharInfo.Octopussy_DF_Weekly_WBZaralekCavernZaqaliElders_count = NONE
		CharInfo.Octopussy_DF_Weekly_WeekendEvent_count = NONE
		CharInfo.Octopussy_DF_Weekly_ZaralekCavernAWorthyAllyLoammNiffen_count = NONE
		CharInfo.Octopussy_DF_Weekly_ZaralekCavernSniffenseeking_count = NONE
		CharInfo.Octopussy_SL_Weekly_ITEMKorthiaResearchReportAncientShrines_count = NONE
		CharInfo.Octopussy_SL_Weekly_KorthiaLostResearch_count = NONE
		CharInfo.Octopussy_SL_Weekly_KorthiaRares_count = NONE
		CharInfo.Octopussy_SL_Weekly_KorthiaShapingFate_count = NONE
		CharInfo.Octopussy_SL_Weekly_KorthiaStolenKorthianSupplies_count = NONE
		CharInfo.Octopussy_SL_Weekly_MawContainingtheHelsworn_count = NONE
		CharInfo.Octopussy_SL_Weekly_MawCovenantAssault_count = NONE
		CharInfo.Octopussy_SL_Weekly_MawTorghast_count = NONE
		CharInfo.Octopussy_SL_Weekly_ReplenishtheReservoir_count = NONE
		CharInfo.Octopussy_SL_Weekly_ReturnLostSouls_count = NONE
		CharInfo.Octopussy_SL_Weekly_RIFTKorthiaStolenAnimaVessel_count = NONE
		CharInfo.Octopussy_SL_Weekly_TradingFavors_count = NONE
		CharInfo.Octopussy_SL_Weekly_WBALL_count = NONE
		CharInfo.Octopussy_SL_Weekly_WBMawMorgeth_count = NONE
		CharInfo.Octopussy_SL_Weekly_WBZMAntros_count = NONE
		CharInfo.Octopussy_SL_Weekly_ZMPatternsWithinPatterns_count = NONE
		CharInfo.Octopussy_BfA_Weekly_AssaultTheBlackEmpire_count = NONE
		CharInfo.Octopussy_BfA_Weekly_coinsQuests_count = NONE
		CharInfo.Octopussy_BfA_Weekly_miniVision_count = NONE
		CharInfo.Octopussy_BfA_Weekly_Warfront1_count = NONE
		CharInfo.Octopussy_BfA_Weekly_Warfront2_count = NONE
		CharInfo.Octopussy_BfA_Weekly_WarfrontHC_count = NONE
		CharInfo.Octopussy_BfA_Weekly_WBALL_count = NONE
		CharInfo.Octopussy_BfA_Weekly_WBAssault_count = NONE
		CharInfo.Octopussy_BfA_Weekly_WBNazjatarTerroroftheDepths_count = NONE
		CharInfo.Octopussy_Legion_Weekly_coinsQuests_count = NONE
		CharInfo.Octopussy_Legion_Weekly_WBALL_count = NONE
		CharInfo.Octopussy_WoD_Weekly_coinsQuests_count = NONE
	end
	if (CharInfo.tmstp_Daily or 0) < GetServerTime() then
		CharInfo.tmstp_Daily = tmstpDayReset(1)
		CharInfo.Octopussy_DF_Daily_TheForbiddenReachRares_count = NONE
		CharInfo.Octopussy_DF_Daily_ZaralekCavernEvents_count = NONE
		CharInfo.Octopussy_DF_Daily_ZaralekCavernRares_count = NONE
		CharInfo.Octopussy_SL_Daily_KorthiaCollection_count = NONE
		CharInfo.Octopussy_SL_Daily_KorthiaKorthianAnimaVessel_count = NONE
		CharInfo.Octopussy_SL_Daily_KorthiaMobs_count = NONE
		CharInfo.Octopussy_SL_Daily_KorthiaRelicGorger_count = NONE
		CharInfo.Octopussy_SL_Daily_MawHelswornChest_count = NONE
		CharInfo.Octopussy_SL_Daily_MawQuest_count = NONE
		CharInfo.Octopussy_SL_Daily_RIFTKorthiaRiftboundCache_count = NONE
		CharInfo.Octopussy_SL_Daily_RIFTKorthiaSpectralBoundChest_count = NONE
		CharInfo.Octopussy_SL_Daily_RIFTKorthiaZovaalsVault_count = NONE
		CharInfo.Octopussy_SL_Daily_ZMGetLockStatus_count = NONE
		CharInfo.Octopussy_SL_Daily_ZMPryingEyeDiscovery_count = NONE
		CharInfo.Octopussy_SL_Daily_ZMPUZZLECACHES_count = NONE
		CharInfo.Octopussy_SL_Daily_ZMRares_count = NONE
		CharInfo.Octopussy_SL_Daily_ZMRaresDuneDominance_count = NONE
		CharInfo.Octopussy_SL_Daily_ZMTREASURES_count = NONE
		CharInfo.Octopussy_SL_Daily_ZMworldQuests_count = NONE
		CharInfo.needResetDaily = true
		CharInfo.bounty_BfA1 = 0
		CharInfo.bounty_BfA2 = 0
		CharInfo.bounty_BfA3 = 0
		CharInfo.bounty_BfA1_end = 0
		CharInfo.bounty_BfA2_end = 0
		CharInfo.bounty_BfA3_end = 0
		CharInfo.bounty_BfA1_questID = 0
		CharInfo.bounty_BfA2_questID = 0
		CharInfo.bounty_BfA3_questID = 0
		CharInfo.bounty_BfA1_icon = 0
		CharInfo.bounty_BfA2_icon = 0
		CharInfo.bounty_BfA3_icon = 0
		CharInfo.bounty_Legion1 = 0
		CharInfo.bounty_Legion2 = 0
		CharInfo.bounty_Legion3 = 0
		CharInfo.bounty_Legion1_end = 0
		CharInfo.bounty_Legion2_end = 0
		CharInfo.bounty_Legion3_end = 0
		CharInfo.bounty_Legion1_questID = 0
		CharInfo.bounty_Legion2_questID = 0
		CharInfo.bounty_Legion3_questID = 0
		CharInfo.bounty_Legion1_icon = 0
		CharInfo.bounty_Legion2_icon = 0
		CharInfo.bounty_Legion3_icon = 0
	end
end
function Collect_ALL_PlayerInfo()
	local curGUID = UnitGUID("PLAYER")
	local UnitLevel = UnitLevel("PLAYER") or 0
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	local specId, specName, _, specIcon = GetSpecializationInfo(GetSpecialization())
	local currentXP = UnitXP("PLAYER") or 0
	local UnitXPMax = UnitXPMax("PLAYER") or 0
	-- local classcolor = CreateColor(CharInfo.classColor.r, CharInfo.classColor.g, CharInfo.classColor.b)
	local curServerShort = GetRealmName()
	local text = (curServerShort):gsub("-", " "):gsub("'", " ")
	local a, b = strsplit(" ", text)
	if b then
		collect.curServerShort = WA_Utf8Sub(a, 1)..WA_Utf8Sub(b, 1):upper() else curServerShort = WA_Utf8Sub(a, 3):lower()
	end
	if collect and not InCombatLockdown() then
		collect.currentXP = currentXP
		collect.UnitXPMax = UnitXPMax
		collect.Name = curCharName
		collect.curServer = curServer
		collect.className = className
		collect.classFilename = classFilename
		collect.classId = classId
		collect.GUID = curGUID
		collect.Faction = UnitFactionGroup("PLAYER")
		collect.UnitLevel = UnitLevel
		collect.specId = specId
		collect.specName = specName
		collect.specIcon = specIcon
		collect.classColor = classColor or {r = 0.5, g = 0.5, b = 0.5}
	end
end
function Collect_ALL_Mail()
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	local hasMail = HasNewMail()
	if collect and not InCombatLockdown() then
		collect.hasMail = hasMail
	end
end
function Collect_ALL_KnownSpell()
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	-- 366253
	for k,v in ipairs(OctoTable_SpellID) do
		local isKnown = IsSpellKnown(v)
		if collect and not InCombatLockdown() then
			collect.KnownSpell[v] = isKnown
		end
	end
end
function Collect_BfA_Azerite()
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	local azeriteItemLocation = C_AzeriteItem.FindActiveAzeriteItem()
	if azeriteItemLocation then
		local xp, totalLevelXP = C_AzeriteItem.GetAzeriteItemXPInfo(azeriteItemLocation)
		local currentLevel = C_AzeriteItem.GetPowerLevel(azeriteItemLocation)
		if totalLevelXP and totalLevelXP ~= 0 then
			if collect and not InCombatLockdown() then
				collect.azeriteLVL = currentLevel
				collect.azeriteEXP = floor(xp / totalLevelXP * 100).."%, -"..CompactNumberFormat(totalLevelXP - xp)
			end
		end
	end
end
function Collect_BfA_Cloaklvl()
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	-- local itemName, itemLink = GetItemInfo(169223)
	local hasItem = GetItemCount(169223, true, true, true)
	if hasItem == 1 then
		local itemLink = GetInventoryItemLink("player",15)
		if itemLink then
			local itemID = itemLink:match("item:(%d+)")
			if itemID == "169223" then
				local itemLevel = select(4,GetItemInfo(itemLink))
				if itemLevel then
					if collect and not InCombatLockdown() then
						collect.cloak_lvl = min(15, max((itemLevel - 125) / 2 + 1, 1))
					end
				end
			end
		end
		if itemLink and itemLink:find("item:169223:") then
			inspectScantip:SetInventoryItem("player", 15)
			if inspectScantip:NumLines() > 0 then
				for j=2, inspectScantip:NumLines() do
					local text = _G["LegToDoScanningTooltipTextLeft"..j]:GetText()
					if text and text ~= "" then
						local res = text:gsub("[,]",""):gsub("(%d+)[ ]+(%d+)","%1%2"):match("%+(%d+) ?"..(ITEM_MOD_CORRUPTION_RESISTANCE or "Corruption resistance").."$")
						if res then
							if collect and not InCombatLockdown() then
								collect.cloak_res = res
								break
							end
						end
					end
				end
			end
			inspectScantip:ClearLines()
		end
	else
		collect.cloak_lvl = 0
		collect.cloak_res = 0
	end
end
function Collect_Legion_Artifact()
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	local _,_,_,quantity1,reqQuantity1 = GetAchievementCriteriaInfo(11152,1)
	local _,_,_,quantity2,reqQuantity2 = GetAchievementCriteriaInfo(11153,1)
	local _,_,_,quantity3,reqQuantity3 = GetAchievementCriteriaInfo(11154,1)
	-- ("Dungeons: "..quantity1.."/"..reqQuantity1)
	-- ("WQs: "..quantity2.."/"..reqQuantity2)
	-- ("Kills: "..quantity3.."/"..reqQuantity3)
end
function Collect_ALL_VoidStorage()
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	local VOID_STORAGE_MAX = 80
	local VOID_STORAGE_PAGES = 2
	-- Page 1
	for i = 1, VOID_STORAGE_MAX do
		local itemID, textureName, locked, recentDeposit, isFiltered, quality = GetVoidItemInfo(1, i)
		collect.VOID_STORAGE_PAGE1[i] = itemID or 0
	end
	-- Page 2
	for i = 1, VOID_STORAGE_MAX do
		local itemID, textureName, locked, recentDeposit, isFiltered, quality = GetVoidItemInfo(2, i)
		collect.VOID_STORAGE_PAGE2[i] = itemID or 0
	end
end
function Collect_ALL_LoginTime()
	local UnitLevel = UnitLevel("PLAYER")
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	collect.loginDate = date("%d.%m.%Y %H:%M:%S")
	collect.loginDay = date("%d.%m.%Y")
	collect.loginHour = date("%H:%M")
	collect.needResetWeekly = false
	collect.needResetDaily = false
end
function Collect_SL_CovenantAnima()
	local UnitLevel = UnitLevel("PLAYER")
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	local CovenantNames ={
		[1] = "Kyrian",
		[2] = "Venthyr",
		[3] = "NightFae",
		[4] = "Necrolord",
	}
	local curCovID = C_Covenants.GetActiveCovenantID()
	-- 0None
	-- 1Kyrian
	-- 2Venthyr
	-- 3NightFae
	-- 4Necrolord
	local curCovName = CovenantNames[curCovID]
	local curCovLevel = C_CovenantSanctumUI.GetRenownLevel()
	local currencyInfo = C_CurrencyInfo.GetCurrencyInfo(1813)
	local curAnimaAmount = currencyInfo.quantity
	if curCovID == 0 then return end
	if curCovID == 1 then
		collect.Shadowland[1] = curCovLevel or 0 -- Kyrian.Renown
		collect.Shadowland[2] = curAnimaAmount or 0 -- Kyrian.Anima
	elseif curCovID == 2 then
		collect.Shadowland[3] = curCovLevel or 0 -- Venthyr.Renown
		collect.Shadowland[4] = curAnimaAmount or 0 -- Venthyr.Anima
	elseif curCovID == 3 then
		collect.Shadowland[5] = curCovLevel or 0 -- NightFae.Renown
		collect.Shadowland[6] = curAnimaAmount or 0 -- NightFae.Anima
	elseif curCovID == 4 then
		collect.Shadowland[7] = curCovLevel or 0 -- Necrolord.Renown
		collect.Shadowland[8] = curAnimaAmount or 0 -- Necrolord.Anima
	end
	collect.curCovID = curCovID
end
function Collect_ALL_PVPRaitings()
	local UnitLevel = UnitLevel("PLAYER")
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	if not IsAddOnLoaded("Blizzard_PVPUI") then
		LoadAddOn("Blizzard_PVPUI")
		return
	end
	local rating2v2, seasonBest2v2, weeklyBest2v2, seasonPlayed2v2, seasonWon2v2, weeklyPlayed2v2, weeklyWon2v2, cap2v2 = GetPersonalRatedInfo(1) -- 2x2
	local rating3v3, seasonBest3v3, weeklyBest3v3, seasonPlayed3v3, seasonWon3v3, weeklyPlayed3v3, weeklyWon3v3, cap3v3 = GetPersonalRatedInfo(2) -- 3x3
	local ratingRBG, seasonBestRBG, weeklyBestRBG, seasonPlayedRBG, seasonWonRBG, weeklyPlayedRBG, weeklyWonRBG, capRBG = GetPersonalRatedInfo(4) -- RBG
	local winrate2v2 = 0
	if seasonWon2v2 ~= 0 and seasonPlayed2v2 ~= 0 then
		winrate2v2 = math.floor(seasonWon2v2 / seasonPlayed2v2 * 100).."%"
	end
	local winrate3v3 = 0
	if seasonWon3v3 ~= 0 and seasonPlayed3v3 ~= 0 then
		winrate3v3 = math.floor(seasonWon3v3 / seasonPlayed3v3 * 100).."%"
	end
	local winrateRBG = 0
	if seasonWonRBG ~= 0 and seasonPlayedRBG ~= 0 then
		winrateRBG = math.floor(seasonWonRBG / seasonPlayedRBG * 100).."%"
	end
	Octo_ToDo_DragonflyLevels[curGUID].PVP.rating2v2 = rating2v2
	Octo_ToDo_DragonflyLevels[curGUID].PVP.seasonBest2v2 = seasonBest2v2
	Octo_ToDo_DragonflyLevels[curGUID].PVP.winrate2v2 = winrate2v2
	Octo_ToDo_DragonflyLevels[curGUID].PVP.rating3v3 = rating3v3
	Octo_ToDo_DragonflyLevels[curGUID].PVP.seasonBest3v3 = seasonBest3v3
	Octo_ToDo_DragonflyLevels[curGUID].PVP.winrate3v3 = winrate3v3
	Octo_ToDo_DragonflyLevels[curGUID].PVP.ratingRBG = ratingRBG
	Octo_ToDo_DragonflyLevels[curGUID].PVP.seasonBestRBG = seasonBestRBG
	Octo_ToDo_DragonflyLevels[curGUID].PVP.winrateRBG = winrateRBG
end
function Collect_All_Professions()
	local UnitLevel = UnitLevel("PLAYER")
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	local prof1, prof2 = GetProfessions()
	local prof1 = prof1 and select(7, GetProfessionInfo(prof1))
	local prof2 = prof2 and select(7, GetProfessionInfo(prof2))
	collect.prof1 = prof1 or 0
	collect.prof2 = prof2 or 0
	local profID = {
		name = 0,
		icon = 0,
		chest = {questReq = 0, questID = {}},
		craftOrder = {questReq = 0, questID = {}},
		drops = {questReq = 0, questID = {}},
		profQuest = {questReq = 0, questID = {}},
		treatise = {questReq = 0, questID = {}},
	}
	local iconAL = 4620669-- 136240
	local iconBS = 4620670
	local iconEC = 4620672
	local iconEG = 4620673
	local iconHB = 4620675
	local iconIS = 4620676
	local iconJC = 4620677
	local iconLW = 4620678
	local iconMN = 4620679
	local iconSK = 4620680
	local iconTL = 4620681
	-- Alchemy
	table[171] = {
		-- name = " Alchemy",
		name = " Алхимия",
		icon = "|T"..iconAL..":16:16:::64:64:4:60:4:60|t", -- AL
		chest = {questReq = 2, questID = {66373, 66374}},
		craftOrder = {questReq = 0, questID = {}},
		drops = {questReq = 2, questID = {70511, 70504}},
		profQuest = {questReq = 2, questID = {70530, 66940, 66938, 72427, 70532, 70531, 70533, 66937}},
		treatise = {questReq = 1, questID = {74108}}, }
	-- Blacksmithing
	table[164] = {
		-- name = " Blacksmithing",
		name = " Кузнечное дело",
		icon = "|T"..iconBS..":16:16:::64:64:4:60:4:60|t", -- BS
		chest = {questReq = 2, questID = {66381, 66382}},
		craftOrder = {questReq = 1, questID = {70589}},
		drops = {questReq = 2, questID = {70513, 70512}},
		profQuest = {questReq = 2, questID = {66941, 70233, 66517, 66897, 70235, 72398, 70234, 70211}},
		treatise = {questReq = 1, questID = {74109}}, }
	-- Enchanting
	table[333] = {
		-- name = " Enchanting",
		name = " Наложение чар",
		icon = "|T"..iconEC..":16:16:::64:64:4:60:4:60|t", -- EC
		chest = {questReq = 2, questID = {66377, 66378}},
		craftOrder = {questReq = 0, questID = {}},
		drops = {questReq = 2, questID = {70515, 70514}},
		profQuest = {questReq = 2, questID = {66884, 66900, 66935, 72155, 72172, 72173, 72175, 72423}},
		treatise = {questReq = 1, questID = {74110}}, }
	-- Engineering
	table[202] = {
		-- name = " Engineering",
		name = " Инженерное дело",
		icon = "|T"..iconEG..":16:16:::64:64:4:60:4:60|t", -- EG
		chest = {questReq = 2, questID = {66379, 66380}},
		craftOrder = {questReq = 1, questID = {70591}},
		drops = {questReq = 2, questID = {70517, 70516}},
		profQuest = {questReq = 2, questID = {72396, 70545, 66891, 70540, 66890, 66942, 70557, 70539}},
		treatise = {questReq = 1, questID = {74111}}, }
	-- Herbalism
	table[182] = {
		-- name = " Herbalism",
		name = " Травничество",
		icon = "|T"..iconHB..":16:16:::64:64:4:60:4:60|t", -- HB -- 136240
		chest = {questReq = 2, questID = {}},
		craftOrder = {questReq = 0, questID = {}},
		drops = {questReq = 6, questID = {71857, 71858, 71859, 71860, 71861, 71864}},
		profQuest = {questReq = 1, questID = {70614, 70613, 70616, 70615}},
		treatise = {questReq = 1, questID = {74107}}, }
	-- Inscription
	table[773] = {
		-- name = " Inscription",
		name = " Начертание",
		icon = "|T"..iconIS..":16:16:::64:64:4:60:4:60|t", -- IS
		chest = {questReq = 2, questID = {66375, 66376}},
		craftOrder = {questReq = 1, questID = {70592}},
		drops = {questReq = 2, questID = {70519, 70518}},
		profQuest = {questReq = 2, questID = {66943, 66944, 70559, 70561, 70558, 70560, 66945, 72438}},
		treatise = {questReq = 1, questID = {74105}}, }
	-- Jewelcrafting
	table[755] = {
		-- name = " Jewelcrafting",
		name = " Ювелирное дело",
		icon = "|T"..iconJC..":16:16:::64:64:4:60:4:60|t", -- JC
		chest = {questReq = 2, questID = {66388, 66389}},
		craftOrder = {questReq = 1, questID = {70593}},
		drops = {questReq = 2, questID = {70521, 70520}},
		profQuest = {questReq = 2, questID = {66516, 70565, 66950, 66949, 72428, 70564, 70563, 70562}},
		treatise = {questReq = 1, questID = {74112}}, }
	-- Leatherworking
	table[165] = {
		-- name = " Leatherworking",
		name = " Кожевничество",
		icon = "|T"..iconLW..":16:16:::64:64:4:60:4:60|t", -- LW
		chest = {questReq = 2, questID = {66384, 66385}},
		craftOrder = {questReq = 1, questID = {70594}},
		drops = {questReq = 2, questID = {70523, 70522}},
		profQuest = {questReq = 2, questID = {66364, 66951, 70569, 70568, 70567, 70571, 72407, 66363}},
		treatise = {questReq = 1, questID = {74113}}, }
	-- Mining
	table[186] = {
		-- name = " Mining",
		name = " Горное дело",
		icon = "|T"..iconMN..":16:16:::64:64:4:60:4:60|t", -- MN
		chest = {questReq = 2, questID = {}},
		craftOrder = {questReq = 0, questID = {}},
		drops = {questReq = 6, questID = {72160, 72161, 72162, 72163, 72164, 72165}},
		profQuest = {questReq = 1, questID = {70617, 70618, 72157, 72156}},
		treatise = {questReq = 1, questID = {74106}}, }
	-- Skinning
	table[393] = {
		-- name = " Skinning",
		name = " Снятие шкур",
		icon = "|T"..iconSK..":16:16:::64:64:4:60:4:60|t", -- SK
		chest = {questReq = 2, questID = {}},
		craftOrder = {questReq = 0, questID = {}},
		drops = {questReq = 6, questID = {70381, 70383, 70384, 70385, 70386, 70389}},
		profQuest = {questReq = 4, questID = {70620, 72159, 70619, 72158}},
		treatise = {questReq = 1, questID = {74114}}, }
	-- Tailoring
	table[197] = {
		-- name = " Tailoring",
		name = " Портяжное делло",
		icon = "|T"..iconTL..":16:16:::64:64:4:60:4:60|t", -- TL
		chest = {questReq = 2, questID = {66386, 66387}},
		craftOrder = {questReq = 1, questID = {70595}},
		drops = {questReq = 2, questID = {70524, 70525}},
		profQuest = {questReq = 2, questID = {72410, 70587, 66952, 70586, 70572, 70582, 66953, 66899}},
		treatise = {questReq = 1, questID = {74115}}, }
	if prof1 then
		-- setmetatable(table[prof1], { __index = profID})
		local chest_count_prof1 = 0
		local craftOrder_count_prof1 = 0
		local drops_count_prof1 = 0
		local profQuest_count_prof1 = 0
		local treatise_count_prof1 = 0
		for _, v in ipairs(table[prof1].chest.questID) do
			if C_QuestLog.IsQuestFlaggedCompleted(v) == true then
				chest_count_prof1 = chest_count_prof1 + 1
			end
		end
		for _, v in ipairs(table[prof1].craftOrder.questID) do
			if C_QuestLog.IsQuestFlaggedCompleted(v) == true then
				craftOrder_count_prof1 = craftOrder_count_prof1 + 1
			end
		end
		for _, v in ipairs(table[prof1].drops.questID) do
			if C_QuestLog.IsQuestFlaggedCompleted(v) == true then
				drops_count_prof1 = drops_count_prof1 + 1
			end
		end
		for _, v in ipairs(table[prof1].profQuest.questID) do
			if C_QuestLog.IsQuestFlaggedCompleted(v) == true then
				profQuest_count_prof1 = profQuest_count_prof1 + 1
			end
		end
		for _, v in ipairs(table[prof1].treatise.questID) do
			if C_QuestLog.IsQuestFlaggedCompleted(v) == true then
				treatise_count_prof1 = treatise_count_prof1 + 1
			end
		end
		Octo_ToDo_DragonflyLevels[curGUID].profID_prof1 =
		{
			name = table[prof1].name or "noname",
			icon = table[prof1].icon or 0,
			chest = {questReq = table[prof1].chest.questReq, chest_count_prof1 = chest_count_prof1},
			craftOrder = {questReq = table[prof1].craftOrder.questReq, craftOrder_count_prof1 = craftOrder_count_prof1},
			drops = {questReq = table[prof1].drops.questReq, drops_count_prof1 = drops_count_prof1},
			profQuest = {questReq = table[prof1].profQuest.questReq, profQuest_count_prof1 = profQuest_count_prof1},
			treatise = {questReq = table[prof1].treatise.questReq, treatise_count_prof1 = treatise_count_prof1},
		}
		-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	end
	if prof2 then
		-- setmetatable(table[prof2], { __index = profID})
		local chest_count_prof2 = 0
		local craftOrder_count_prof2 = 0
		local drops_count_prof2 = 0
		local profQuest_count_prof2 = 0
		local treatise_count_prof2 = 0
		for _, v in ipairs(table[prof2].chest.questID) do
			if C_QuestLog.IsQuestFlaggedCompleted(v) == true then
				chest_count_prof2 = chest_count_prof2 + 1
			end
		end
		for _, v in ipairs(table[prof2].craftOrder.questID) do
			if C_QuestLog.IsQuestFlaggedCompleted(v) == true then
				craftOrder_count_prof2 = craftOrder_count_prof2 + 1
			end
		end
		for _, v in ipairs(table[prof2].drops.questID) do
			if C_QuestLog.IsQuestFlaggedCompleted(v) == true then
				drops_count_prof2 = drops_count_prof2 + 1
			end
		end
		for _, v in ipairs(table[prof2].profQuest.questID) do
			if C_QuestLog.IsQuestFlaggedCompleted(v) == true then
				profQuest_count_prof2 = profQuest_count_prof2 + 1
			end
		end
		for _, v in ipairs(table[prof2].treatise.questID) do
			if C_QuestLog.IsQuestFlaggedCompleted(v) == true then
				treatise_count_prof2 = treatise_count_prof2 + 1
			end
		end
		Octo_ToDo_DragonflyLevels[curGUID].profID_prof2 =
		{
			name = table[prof2].name or "noname",
			icon = table[prof2].icon or 0,
			chest = {questReq = table[prof2].chest.questReq, chest_count_prof2 = chest_count_prof2},
			craftOrder = {questReq = table[prof2].craftOrder.questReq, craftOrder_count_prof2 = craftOrder_count_prof2},
			drops = {questReq = table[prof2].drops.questReq, drops_count_prof2 = drops_count_prof2},
			profQuest = {questReq = table[prof2].profQuest.questReq, profQuest_count_prof2 = profQuest_count_prof2},
			treatise = {questReq = table[prof2].treatise.questReq, treatise_count_prof2 = treatise_count_prof2},
		}
		-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	end
	return
end
function Collect_ALL_DungeonsRaiting()
	local UnitLevel = UnitLevel("PLAYER")
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	local RIO_Score = C_ChallengeMode.GetOverallDungeonScore("PLAYER")
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	local info = C_MythicPlus.GetRunHistory(false, true)
	local mapID = C_ChallengeMode.GetMapTable()
	-- -- Get Highest Key Level
	-- local level = {}
	-- for l = 1, #info do
	-- local levelMax = info[l].level
	-- tinsert(level, levelMax)
	-- end
	-- if level[1] == nil then
	-- level = {""}
	-- end
	-- -- Get Seasen Best Level
	-- table.sort(level, function(a, b) return b<a end)
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	-- Get Vault Rewards
	local vault = C_WeeklyRewards.GetActivities()
	local RrLvl = {}
	local PrLvl = {false, false, false}
	local MrLvl = {}
	local pRank = {}
	for _, v in ipairs(vault) do
		for i = 1, 3 do
			if v.index == i then
				if v.type == 3 then
					local ilvl = GetDetailedItemLevelInfo(C_WeeklyRewards.GetExampleRewardItemHyperlinks(v.id))
					tinsert(RrLvl, ilvl)
				end
				if v.type == 2 then
					if v.progress >= v.threshold then
						PrLvl[i] = true
					end
					if PrLvl[i] == true then
						local ilvl = GetDetailedItemLevelInfo(C_WeeklyRewards.GetExampleRewardItemHyperlinks(v.id))
						tinsert(pRank, ilvl)
					end
				end
				if v.type == 1 then
					local ilvl = GetDetailedItemLevelInfo(C_WeeklyRewards.GetExampleRewardItemHyperlinks(v.id))
					tinsert(MrLvl, ilvl)
				end
			end
		end
	end
	-- Set Rewards ILVL
	if pRank[1] == nil then pRank[1] = "" end
	if RrLvl[1] == nil then RrLvl[1] = "" end
	if MrLvl[1] == nil then MrLvl[1] = "" end
	-- 0 None
	-- 1 MythicPlus
	-- 2 RankedPvP
	-- 3 Raid
	-- 4 AlsoReceive
	-- 5 Concession
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	local vaultDataRAID = C_WeeklyRewards.GetActivities()
	local RAIDResult = 0
	local RAIDThreshold = 0
	for i=7, 9 do
		local activityInfoRAID = vaultDataRAID[i]
		if activityInfoRAID then
			RAIDResult = activityInfoRAID.progress
			RAIDThreshold = activityInfoRAID.threshold
		else
			RAIDResult = 0
			RAIDThreshold = 0
		end
	end
	local RAID = RAIDResult.."/"..RAIDThreshold.." |cffa335ee"..table.concat(RrLvl, "/").."|r"
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	local vaultDataKEYS = C_WeeklyRewards.GetActivities()
	local KEYSResult = 0
	local KEYSThreshold = 0
	for i=1, 3 do
		local activityInfoKEYS = vaultDataKEYS[i]
		if activityInfoKEYS then
			KEYSResult = activityInfoKEYS.progress
			KEYSThreshold = activityInfoKEYS.threshold
		else
			KEYSResult = 0
			KEYSThreshold = 0
		end
	end
	-- local KEYS = ("%s/%s"):format(KEYSResult, KEYSThreshold)
	local KEYS = KEYSResult.."/"..KEYSThreshold.." |cffa335ee"..table.concat(MrLvl, "/").."|r"
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	local vaultDataPVPS = C_WeeklyRewards.GetActivities()
	local PVPSResult = 0
	local PVPSThreshold = 0
	for i=4, 6 do
		local activityInfoPVPS = vaultDataPVPS[i]
		if activityInfoPVPS then
			PVPSResult = activityInfoPVPS.progress
			PVPSThreshold = activityInfoPVPS.threshold
		else
			PVPSResult = 0
			PVPSThreshold = 0
		end
	end
	-- local PVPS = ("%s/%s"):format(PVPSResult, PVPSThreshold)
	local PVPS = PVPSResult.."/"..PVPSThreshold.." |cffa335ee"..table.concat(pRank, "/").."|r"
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	local mythicPlusMaps = C_ChallengeMode.GetMapTable()
	C_MythicPlus.RequestRewards()
	local max = C_MythicPlus.GetWeeklyChestRewardLevel() or 0
	C_MythicPlus.RequestMapInfo()
	for i=1, #mythicPlusMaps do
		-- local _, _, level, affixes = C_ChallengeMode.GetMapPlayerStats(mythicPlusMaps[i])
		local _, level = C_MythicPlus.GetWeeklyBestForMap(mythicPlusMaps[i])
		if level and level > max then
			max = level
		end
	end
	if max == 0 then max = "" end
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	collect.RIO_Score = RIO_Score
	collect.RIO_weeklyBest = (Purple_Color..max.."|r") or ""
	collect.RIO_RAID = RAID or ""
	collect.RIO_KEYS = KEYS or ""
	collect.RIO_PVPS = PVPS or ""
end
function Collect_SL_PossibleAnima()
	local UnitLevel = UnitLevel("PLAYER")
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	local Possible_Anima = 0
	local Possible_CatalogedResearch = 0
	for bag = BACKPACK_CONTAINER, NUM_TOTAL_EQUIPPED_BAG_SLOTS do
		for slot = C_Container.GetContainerNumSlots(bag), 1, -1 do
			local containerInfo = C_Container.GetContainerItemInfo(bag, slot)
			if containerInfo then
				local stackCount = containerInfo.stackCount
				local itemID = containerInfo.itemID
				local quality = containerInfo.quality
				local isAnima = C_Item.IsAnimaItemByID(itemID)
				for k,v in pairs(OctoTable_itemID_Cataloged_Research) do
					if itemID == v.itemiD then
						Possible_CatalogedResearch = Possible_CatalogedResearch + v.count
					end
				end
				if stackCount and isAnima and itemID ~= nil then
					if (quality == 2) and (itemID ~= 183727) then
						Possible_Anima = Possible_Anima + 5 * stackCount
					end
					if quality == 3 then
						Possible_Anima = Possible_Anima + 35 * stackCount
					end
					if quality == 4 then
						Possible_Anima = Possible_Anima + 250 * stackCount
					end
					if itemID == 183727 then
						Possible_Anima = Possible_Anima + 3 * stackCount
					end
				end
			end
		end
	end
	Possible_Anima = Possible_Anima
	Possible_CatalogedResearch = Possible_CatalogedResearch
	if collect and not InCombatLockdown() then
		collect.Possible_Anima = Possible_Anima
		collect.Possible_CatalogedResearch = Possible_CatalogedResearch
	end
end
function Collect_ALL_CurrentKEY()
	local UnitLevel = UnitLevel("PLAYER")
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	local mkey = ""
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	local keyStoneLevel = C_MythicPlus.GetOwnedKeystoneLevel()
	if keyStoneLevel then
		for bag = BACKPACK_CONTAINER, NUM_TOTAL_EQUIPPED_BAG_SLOTS do
			for slot = C_Container.GetContainerNumSlots(bag), 1, -1 do
				local containerInfo = C_Container.GetContainerItemInfo(bag, slot)
				if containerInfo then
					for k, v in pairs(containerInfo) do
						if k ~= nil and k == "hyperlink" then
							-- local hyperlink = v
							if v and (
								v:find("item:138019") or
								v:find("keystone:") or
								v:find("Ключ:") or
								v:find("item:158923") or
								v:find("item:180653")
							)
							then
								name = v
								if name:find("Каражан") then
									name = name:gsub("^[^:]+: ", "Кара: ")
								elseif name:find("Мехагон") then
									name = name:gsub("^[^ ]+ ", "")
								end
								local _, _, dungeon, lvl, expire = strsplit(":", name)
								-- local dungeonNAME = C_ChallengeMode.GetMapUIInfo(dungeon)
								-- local str = dungeonNAME
								-- mkey = lvl..": " ..(str:gsub("%s", ""))
								local dungeonNAME = C_ChallengeMode.GetMapUIInfo(dungeon)
								local Abbr_En_Name = "whz" -- https://wow.tools/dbc/?dbc=mapchallengemode
								-- 0
								if dungeon == "56" then Abbr_En_Name = "SB" -- Stormstout Brewery
								elseif dungeon == "57" then Abbr_En_Name = "GSS" -- Gate of the Setting Sun
								elseif dungeon == "58" then Abbr_En_Name = "SPM" -- Shado-Pan Monastery
								elseif dungeon == "59" then Abbr_En_Name = "SoNT" -- Siege of Niuzao Temple
								elseif dungeon == "60" then Abbr_En_Name = "MP" -- Mogu'shan Palace
								elseif dungeon == "76" then Abbr_En_Name = "Scho" -- Scholomance
								elseif dungeon == "77" then Abbr_En_Name = "SH" -- Scarlet Halls
								elseif dungeon == "78" then Abbr_En_Name = "SM" -- Scarlet Monastery
								elseif dungeon == "161" then Abbr_En_Name = "Sky" -- Skyreach
								elseif dungeon == "163" then Abbr_En_Name = "BSM" -- Bloodmaul Slag Mines
								elseif dungeon == "164" then Abbr_En_Name = "Auch" -- Auchindoun
								elseif dungeon == "167" then Abbr_En_Name = "UBS" -- Upper Blackrock Spire
								elseif dungeon == "168" then Abbr_En_Name = "TE" -- The Everbloom
								elseif dungeon == "200" then Abbr_En_Name = "HoV" -- Halls of Valor
								elseif dungeon == "208" then Abbr_En_Name = "MoS" -- Maw of Souls
								elseif dungeon == "209" then Abbr_En_Name = "TA" -- The Arcway
								elseif dungeon == "210" then Abbr_En_Name = "CoS" -- Court of Stars
								elseif dungeon == "227" then Abbr_En_Name = "RtKL" -- Return to Karazhan: Lower
								elseif dungeon == "233" then Abbr_En_Name = "CoEN" -- Cathedral of Eternal Night
								elseif dungeon == "234" then Abbr_En_Name = "RtKU" -- Return to Karazhan: Upper
								elseif dungeon == "239" then Abbr_En_Name = "SotT" -- Seat of the Triumvirate
								elseif dungeon == "197" then Abbr_En_Name = "EoA" -- Eye of Azshara
								elseif dungeon == "198" then Abbr_En_Name = "DHT" -- Darkheart Thicket
								elseif dungeon == "199" then Abbr_En_Name = "BRH" -- Black Rook Hold
								elseif dungeon == "207" then Abbr_En_Name = "VotW" -- Vault of the Wardens
									-- 3 CATA
									-- elseif dungeon == "438" then Abbr_En_Name = "VP" -- The Vortex Pinnacle
									-- 4 MOP
								elseif dungeon == "2" then Abbr_En_Name = "TJS" -- Temple of the Jade Serpent
									-- 5 WOD
								elseif dungeon == "165" then Abbr_En_Name = "SBG" -- Shadowmoon Burial Grounds
								elseif dungeon == "166" then Abbr_En_Name = "GD" -- Grimrail Depot
								elseif dungeon == "169" then Abbr_En_Name = "ID" -- Iron Docks
									-- 6 LEGION
									-- elseif dungeon == "206" then Abbr_En_Name = "NL" -- Neltharion's Lair
									-- 7 BFA
								elseif dungeon == "244" then Abbr_En_Name = "AD" -- Atal'Dazar
									-- elseif dungeon == "245" then Abbr_En_Name = "FH" -- Freehold
								elseif dungeon == "246" then Abbr_En_Name = "TD" -- Tol Dagor
								elseif dungeon == "247" then Abbr_En_Name = "ML" -- The MOTHERLODE!!
								elseif dungeon == "248" then Abbr_En_Name = "WM" -- Waycrest Manor
								elseif dungeon == "249" then Abbr_En_Name = "KR" -- Kings' Rest
								elseif dungeon == "250" then Abbr_En_Name = "ToS" -- Temple of Sethraliss
									-- elseif dungeon == "251" then Abbr_En_Name = "UNDR" -- The Underrot
								elseif dungeon == "252" then Abbr_En_Name = "SotS" -- Shrine of the Storm
								elseif dungeon == "353" then Abbr_En_Name = "SoB" -- Siege of Boralus
								elseif dungeon == "369" then Abbr_En_Name = "OMJ" -- Operation: Mechagon - Junkyard
								elseif dungeon == "370" then Abbr_En_Name = "OMW" -- Operation: Mechagon - Workshop
									-- 8 SL
								elseif dungeon == "375" then Abbr_En_Name = "MoTS" -- Mists of Tirna Scithe
								elseif dungeon == "376" then Abbr_En_Name = "TNW" -- The Necrotic Wake
								elseif dungeon == "377" then Abbr_En_Name = "DOS" -- De Other Side
								elseif dungeon == "378" then Abbr_En_Name = "HoA" -- Halls of Atonement
								elseif dungeon == "379" then Abbr_En_Name = "PF" -- Plaguefall
								elseif dungeon == "380" then Abbr_En_Name = "SD" -- Sanguine Depths
								elseif dungeon == "381" then Abbr_En_Name = "SoA" -- Spires of Ascension
								elseif dungeon == "382" then Abbr_En_Name = "ToP" -- Theater of Pain
								elseif dungeon == "391" then Abbr_En_Name = "STRT" -- Tazavesh: Streets of Wonder
								elseif dungeon == "392" then Abbr_En_Name = "GMBT" -- Tazavesh: So'leah's Gambit
									-- 9 DF
								elseif dungeon == "399" then Abbr_En_Name = "RLP" -- Ruby Life Pools
								elseif dungeon == "400" then Abbr_En_Name = "NO" -- The Nokhud Offensive
								elseif dungeon == "401" then Abbr_En_Name = "AV" -- The Azure Vault
								elseif dungeon == "402" then Abbr_En_Name = "AA" -- Algeth'ar Academy
									-- elseif dungeon == "403" then Abbr_En_Name = "ULD" -- Uldaman: Legacy of Tyr
									-- elseif dungeon == "404" then Abbr_En_Name = "NELT" -- Neltharus
									-- elseif dungeon == "405" then Abbr_En_Name = "BH" -- Brackenhide Hollow
									-- elseif dungeon == "406" then Abbr_En_Name = "HOI" -- Halls of Infusion
								elseif dungeon == "405" then Abbr_En_Name = "BH" -- Brackenhide Hollow 393267 (лощина)
								elseif dungeon == "245" then Abbr_En_Name = "FH" -- Freehold 410071 (гавань)
								elseif dungeon == "406" then Abbr_En_Name = "HOI" -- Halls of Infusion 393283 (чертоги)
								elseif dungeon == "206" then Abbr_En_Name = "NL" -- Neltharion's Lair 410078 (логово)
								elseif dungeon == "404" then Abbr_En_Name = "NELT" -- Neltharus 393276 (нелтарий)
								elseif dungeon == "251" then Abbr_En_Name = "UNDR" -- The Underrot 410074 (подгнилье)
								elseif dungeon == "438" then Abbr_En_Name = "VP" -- The Vortex Pinnacle 410080 (вершина)
								elseif dungeon == "403" then Abbr_En_Name = "ULD" -- Uldaman: Legacy of Tyr 393222 (ульдаман)
								end
								mkey = (Purple_Color..lvl.." " ..Abbr_En_Name.."|r")
							end
						end
					end
				end
			end
		end
	else mkey = 0
	end
	if collect and not InCombatLockdown() then
		collect.CurrentKey = mkey or 0
		local HasAvailableRewards = C_WeeklyRewards.HasAvailableRewards()
		collect.HasAvailableRewards = HasAvailableRewards
	end
end
function Collect_All_Currency()
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	for k, v in ipairs(OctoTable_currencyID_ALL) do
		local data = C_CurrencyInfo.GetCurrencyInfo(v)
		local quantity = data.quantity
		local maxQuantity = data.maxQuantity
		if v == 2167 and maxQuantity > 6 then maxQuantity = 6 end
		if collect and not InCombatLockdown() then
			collect.CurrencyID[v] = quantity
			collect.CurrencyID_maxQuantity[v] = maxQuantity
			if maxQuantity ~= 0 then
				if quantity ~= maxQuantity then
					if quantity ~= 0 then
						collect.CurrencyID_Total[v] = quantity.."/"..maxQuantity
					else
						collect.CurrencyID_Total[v] = Gray_Color..quantity.."/"..maxQuantity.."|r"
					end
				else
					collect.CurrencyID_Total[v] = Green_Color..quantity.."/"..maxQuantity.."|r"
				end
			else
				if quantity ~= 0 then
					collect.CurrencyID_Total[v] = quantity
				else
					collect.CurrencyID_Total[v] = Gray_Color..quantity.."|r"
				end
			end
		end
	end
end
function Collect_ALL_MountEquipmentID()
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	local canUseMountEquipment = C_PlayerInfo.CanPlayerUseMountEquipment()
	local itemID = C_MountJournal.GetAppliedMountEquipmentID()
	if collect and not InCombatLockdown() then
		collect.canUseMountEquipment = canUseMountEquipment
		collect.currentMountItemID = itemID
	end
end
function Collect_ALL_ItemsInBag()
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	local PlayerReagentnumSlots = C_Container.GetContainerNumSlots(BACKPACK_CONTAINER+NUM_BAG_SLOTS+1)
	local usedSlots = 0
	local totalSlots = 0
	for bag = BACKPACK_CONTAINER, NUM_TOTAL_EQUIPPED_BAG_SLOTS do
		local numSlots = C_Container.GetContainerNumSlots(bag)
		totalSlots = totalSlots + numSlots
		local numberOfFreeSlots, BagType = C_Container.GetContainerNumFreeSlots(bag)
		if BagType == 0 then
			usedSlots = usedSlots + (numSlots - numberOfFreeSlots)
		end
	end
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	if collect and not InCombatLockdown() then
		for k, v in ipairs(OctoTable_itemID_ALL) do
			local count = GetItemCount(v, true, true, true)
			collect.ItemsInBag[v] = count
		end
		collect.PlayerReagentnumSlots = PlayerReagentnumSlots
		collect.usedSlots = usedSlots
		collect.totalSlots = totalSlots
	end
end
function Collect_ALL_Locations()
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	local mapID = C_Map.GetBestMapForUnit("player")
	if mapID then
		local BindLocation = GetBindLocation()
		local info = C_Map.GetMapInfo(mapID)
		if info and collect and not InCombatLockdown() then
			collect.BindLocation = BindLocation
			collect.CurrentLocation = info.name or "no CurrentLocation"
		end
	end
end
function Collect_ALL_BankInfo()
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	-- REAGENTBANK_CONTAINER,BANK_CONTAINER
	-- NUM_TOTAL_EQUIPPED_BAG_SLOTS+1,NUM_TOTAL_EQUIPPED_BAG_SLOTS+NUM_BANKBAGSLOTS
	local usedSlotsBANK = 0
	local totalSlotsBANK = 0
	local usedSlotsBANKREAGENT = 0
	local totalSlotsBANKREAGENT = 0
	local usedSlotsBANKBAGS = 0
	local totalSlotsBANKBAGS = 0
	for bag = BANK_CONTAINER, BANK_CONTAINER do
		local numSlots = C_Container.GetContainerNumSlots(bag)
		totalSlotsBANK = totalSlotsBANK + numSlots
		local numberOfFreeSlots, BagType = C_Container.GetContainerNumFreeSlots(bag)
		if BagType == 0 then
			usedSlotsBANK = usedSlotsBANK + (numSlots - numberOfFreeSlots)
		end
	end
	for bag = REAGENTBANK_CONTAINER, REAGENTBANK_CONTAINER do
		local numSlots = C_Container.GetContainerNumSlots(bag)
		totalSlotsBANKREAGENT = totalSlotsBANKREAGENT + numSlots
		local numberOfFreeSlots, BagType = C_Container.GetContainerNumFreeSlots(bag)
		if BagType == 0 then
			usedSlotsBANKREAGENT = usedSlotsBANKREAGENT + (numSlots - numberOfFreeSlots)
		end
	end
	for bag = NUM_TOTAL_EQUIPPED_BAG_SLOTS+1, NUM_TOTAL_EQUIPPED_BAG_SLOTS+NUM_BANKBAGSLOTS do
		local numSlots = C_Container.GetContainerNumSlots(bag)
		totalSlotsBANKBAGS = totalSlotsBANKBAGS + numSlots
		local numberOfFreeSlots, BagType = C_Container.GetContainerNumFreeSlots(bag)
		if BagType == 0 then
			usedSlotsBANKBAGS = usedSlotsBANKBAGS + (numSlots - numberOfFreeSlots)
		end
	end
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	if collect and not InCombatLockdown() then
		collect.usedSlotsBANK = usedSlotsBANK + usedSlotsBANKREAGENT + usedSlotsBANKBAGS
		collect.totalSlotsBANK = totalSlotsBANK + totalSlotsBANKREAGENT + totalSlotsBANKBAGS
	end
end
function Collect_All_Reputations()
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	if collect and not InCombatLockdown() then
		for k, v in pairs(OctoTable_reputation) do
			local rep = CheckReputationByRepID(v)
			collect.reputationID[v] = rep or 0
		end
	end
end
function Collect_All_Quests()
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	local numShownEntries, numQuests = C_QuestLog.GetNumQuestLogEntries()
	local maxNumQuestsCanAccept = C_QuestLog.GetMaxNumQuestsCanAccept()
	local EVENTS_ZARALEK_count = 0
	for k, v in ipairs(OctoTable_QuestID) do
		local qw = CheckCompletedByQuestID(v)
		collect.OctoTable_QuestID[v] = qw or 0
	end
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	if collect and not InCombatLockdown() then
		collect.numShownEntries = numShownEntries
		collect.numQuests = numQuests
		collect.maxNumQuestsCanAccept = maxNumQuestsCanAccept
	end
end
function Collect_BfA_Island()
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	local questID = C_IslandsQueue.GetIslandsWeeklyQuestID()
	if questID then
		if collect and not InCombatLockdown() then
			collect.islandBfA = CheckCompletedByQuestID(questID)
		end
	end
end
function Collect_BfA_QuestsBounties()
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	collect["bounty_Legion1"] = 0
	collect["bounty_Legion1_icon"] = 0
	collect["bounty_Legion1_questID"] = 0
	collect["bounty_Legion1_end"] = 0
	collect["bounty_Legion2"] = 0
	collect["bounty_Legion2_icon"] = 0
	collect["bounty_Legion2_questID"] = 0
	collect["bounty_Legion2_end"] = 0
	collect["bounty_Legion3"] = 0
	collect["bounty_Legion3_icon"] = 0
	collect["bounty_Legion3_questID"] = 0
	collect["bounty_Legion3_end"] = 0
	local bounties_Legion = C_QuestLog.GetBountiesForMapID(619) -- Broken Isles
	if bounties_Legion then
		for i=1,#bounties_Legion do
			local d = bounties_Legion[i]
			local factionName = GetFactionInfoByID(d.factionID)
			local questIndex = C_QuestLog.GetLogIndexForQuestID(d.questID)
			if questIndex > 0 then
				local questData = C_QuestLog.GetInfo(questIndex)
				if questData and questData.title then
					factionName = questData.title
				end
			end
			local currQ, maxQ = 0,0
			local secondsLeft = C_TaskQuest.GetQuestTimeLeftMinutes(d.questID)
			if secondsLeft then
				local strsecondsLeft = format("%dh %dm",(secondsLeft / 60) % 24,secondsLeft % 60)
				if secondsLeft >= 1440 then
					strsecondsLeft = floor(secondsLeft / 1440).."d "..strsecondsLeft
				end
			end
			local faction_icon = "|T"..d.icon..":0|t "
			if collect and not InCombatLockdown() then
				collect["bounty_Legion"..i] = CheckCompletedByQuestID(d.questID)
				collect["bounty_Legion"..i.."_icon"] = faction_icon
				collect["bounty_Legion"..i.."_questID"] = d.questID
				collect["bounty_Legion"..i.."_end"] = time() + secondsLeft * 60
			end
		end
	end
	local bounties_BfA = C_QuestLog.GetBountiesForMapID(875) -- Zandalar
	collect["bounty_BfA1"] = 0
	collect["bounty_BfA1_icon"] = 0
	collect["bounty_BfA1_questID"] = 0
	collect["bounty_BfA1_end"] = 0
	collect["bounty_BfA2"] = 0
	collect["bounty_BfA2_icon"] = 0
	collect["bounty_BfA2_questID"] = 0
	collect["bounty_BfA2_end"] = 0
	collect["bounty_BfA3"] = 0
	collect["bounty_BfA3_icon"] = 0
	collect["bounty_BfA3_questID"] = 0
	collect["bounty_BfA3_end"] = 0
	if bounties_BfA then
		for i=1,#bounties_BfA do
			local d = bounties_BfA[i]
			local factionName = GetFactionInfoByID(d.factionID)
			local questIndex = C_QuestLog.GetLogIndexForQuestID(d.questID)
			if questIndex > 0 then
				local questData = C_QuestLog.GetInfo(questIndex)
				if questData and questData.title then
					factionName = questData.title
				end
			end
			local currQ, maxQ = 0,0
			local secondsLeft = C_TaskQuest.GetQuestTimeLeftMinutes(d.questID)
			if secondsLeft then
				local strsecondsLeft = format("%dh %dm",(secondsLeft / 60) % 24,secondsLeft % 60)
				if secondsLeft >= 1440 then
					strsecondsLeft = floor(secondsLeft / 1440).."d "..strsecondsLeft
				end
			end
			local faction_icon = "|T"..d.icon..":0|t "
			if collect and not InCombatLockdown() then
				collect["bounty_BfA"..i] = CheckCompletedByQuestID(d.questID)
				collect["bounty_BfA"..i.."_icon"] = faction_icon
				collect["bounty_BfA"..i.."_questID"] = d.questID
				collect["bounty_BfA"..i.."_end"] = time() + secondsLeft * 60
			end
		end
	end
end
function Collect_ALL_ItemLevel()
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	local avgItemLevel, avgItemLevelEquipped, avgItemLevelPvp = GetAverageItemLevel()
	if collect and not InCombatLockdown() then
		collect.avgItemLevel = math.floor(avgItemLevel)
		collect.avgItemLevelEquipped = math.floor(avgItemLevelEquipped)
		collect.avgItemLevelPvp = math.floor(avgItemLevelPvp)
	end
end
function Collect_ALL_UNIVERSALQuestUpdate()
	local UnitLevel = UnitLevel("PLAYER")
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	local IsOnQuest = false
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	for k,v in pairs(OctoTable_UniversalQuest) do
		for q,w in pairs(v) do
			local count = 0
			local vivod = ""
			for z,x in pairs(v.questID) do
				IsOnQuest = C_QuestLog.IsOnQuest(x)
				if v.max > 1 then
					if C_QuestLog.IsQuestFlaggedCompleted(x) == true then
						count = count + 1
					end
					vivod = count
				else
					local IsComplete = CheckCompletedByQuestID(x)
					if IsComplete ~= NONE then
						vivod = IsComplete
					end
				end
				-- elseif v.max == 1 then
				-- if C_QuestLog.IsQuestFlaggedCompleted(x) == true then
				-- vivod = DONE
				-- else
				-- vivod = NONE
				-- end
				-- end
				if IsOnQuest == true then
					collect["Octopussy_"..v.expansion.."_"..v.reset.."_"..v.desc..v.place..v.name_save.."_questID"] = x or NONE
				end
			end
			if collect and not InCombatLockdown() then
				collect["Octopussy_"..v.expansion.."_"..v.reset.."_"..v.desc..v.place..v.name_save.."_name"] = v.name_quest or NONE
				if v.max == 1 then
					collect["Octopussy_"..v.expansion.."_"..v.reset.."_"..v.desc..v.place..v.name_save.."_count"] = vivod
				elseif v.max > 1 then
					if vivod == v.max and v.max > 1 then
						collect["Octopussy_"..v.expansion.."_"..v.reset.."_"..v.desc..v.place..v.name_save.."_count"] = DONE
					else
						collect["Octopussy_"..v.expansion.."_"..v.reset.."_"..v.desc..v.place..v.name_save.."_count"] = vivod.."/"..v.max
					end
				end
			end
		end
	end
end
function Collect_ALL_MoneyUpdate()
	local curGUID = UnitGUID("PLAYER")
	local collect = Octo_ToDo_DragonflyLevels[curGUID]
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	local Money = GetMoney()
	if collect and not InCombatLockdown() then
		collect.Money = Money
	end
end
function Timer_Legion_Invasion()
	local TIMER = (1547586000-10800)
	local interval = 66600
	local duration = 21600
	local currTime = tonumber(GetServerTime())
	local nextEventIn = interval - mod(currTime - TIMER, interval)
	local Timer_Legion_Invasion = Red_Color..SecondsToClock(nextEventIn) .."|r "
	if nextEventIn > (interval - duration) then
		nextEventIn = nextEventIn - (interval - duration)
		Timer_Legion_Invasion = Addon_Color..SecondsToClock(nextEventIn) .."|r "
	end
	return Timer_Legion_Invasion
end
function Timer_BfA_Invasion() -- PVP
	local TIMER = (1547586000+3600) -- (1547586000-10800)
	local interval = 68400
	local duration = 25200
	local currTime = tonumber(GetServerTime())
	local nextEventIn = interval - mod(currTime - TIMER, interval)
	local Timer_BfA_Invasion = Red_Color..SecondsToClock(nextEventIn) .."|r "
	if nextEventIn > (interval - duration) then
		nextEventIn = nextEventIn - (interval - duration)
		Timer_BfA_Invasion = Addon_Color..SecondsToClock(nextEventIn) .."|r "
	end
	return Timer_BfA_Invasion
end
function Timer_BfA_Assault() -- NZOTH
	local TIMER = (1547586000+3600+3600+3600+3600+3600+3600+3600) -- (1547586000-10800)
	local interval = 86400
	local duration = 86400
	local currTime = tonumber(GetServerTime())
	local nextEventIn = interval - mod(currTime - TIMER, interval)
	local Timer_BfA_Assault = Red_Color..SecondsToClock(nextEventIn) .."|r "
	if nextEventIn > (interval - duration) then
		nextEventIn = nextEventIn - (interval - duration)
		Timer_BfA_Assault = Addon_Color..SecondsToClock(nextEventIn) .."|r "
	end
	return Timer_BfA_Assault
end
function Timer_DF_ToDragonbaneKeep() -- Драконья экспедиция
	-- local timePattern = "%02d:%02d"
	local TIMER = 1670342460 -- Timer_DF_ToDragonbaneKeep
	local interval = 7200
	local duration = 900
	local currTime = tonumber(GetServerTime())
	local nextEventIn = interval - mod(currTime - TIMER, interval)
	local Timer_DF_ToDragonbaneKeep = Red_Color..SecondsToClock(nextEventIn) .."|r "
	if nextEventIn > (interval - duration) then
		nextEventIn = nextEventIn - (interval - duration)
		Timer_DF_ToDragonbaneKeep = Addon_Color..SecondsToClock(nextEventIn) .."|r "
	end
	return Timer_DF_ToDragonbaneKeep
end
function Timer_DF_GrandHunts() -- Кентавры Маруук
	-- local timePattern = "%02d:%02d"
	local TIMER = 1671307200-- 1675612800 -- Timer_DF_GrandHunts
	local interval = 7200-- 270000
	local duration = 7199-- 900
	local currTime = tonumber(GetServerTime())
	local nextEventIn = interval - mod(currTime - TIMER, interval)
	local Timer_DF_GrandHunts = Red_Color..SecondsToClock(nextEventIn) .."|r "
	if nextEventIn > (interval - duration) then
		nextEventIn = nextEventIn - (interval - duration)
		Timer_DF_GrandHunts = Addon_Color..SecondsToClock(nextEventIn) .."|r "
	end
	return Timer_DF_GrandHunts
end
function Timer_DF_CommunityFeast() -- Искарские клыкарры
	-- local timePattern = "%02d:%02d"
	local TIMER = 1677168000-- 1670331660 -- Timer_DF_CommunityFeast
	local interval = 5400
	local duration = 900
	local currTime = tonumber(GetServerTime())
	local nextEventIn = interval - mod(currTime - TIMER, interval)
	local Timer_DF_CommunityFeast = Red_Color..SecondsToClock(nextEventIn) .."|r "
	if nextEventIn > (interval - duration) then
		nextEventIn = nextEventIn - (interval - duration)
		Timer_DF_CommunityFeast = Addon_Color..SecondsToClock(nextEventIn) .."|r "
	end
	return Timer_DF_CommunityFeast
end
function Timer_DF_PrimalStorms() -- Праймал шторм
	-- local timePattern = "%02d:%02d"
	local TIMER = 1683804640-- 1671303600-- Timer_DF_PrimalStorms
	local interval = 18000-- 10800
	local duration = 7200
	local currTime = tonumber(GetServerTime())
	local nextEventIn = interval - mod(currTime - TIMER, interval)
	local Timer_DF_PrimalStorms = Red_Color..SecondsToClock(nextEventIn) .."|r "
	if nextEventIn > (interval - duration) then
		nextEventIn = nextEventIn - (interval - duration)
		Timer_DF_PrimalStorms = Addon_Color..SecondsToClock(nextEventIn) .."|r "
	end
	return Timer_DF_PrimalStorms
end
function Timer_DF_ResearchersUnderFire()
	local TIMER = 1683804640
	local interval = 3600
	local duration = 1500
	local currTime = tonumber(GetServerTime())
	local nextEventIn = interval - mod(currTime - TIMER, interval)
	local Timer_DF_ResearchersUnderFire = Red_Color..SecondsToClock(nextEventIn) .."|r "
	if nextEventIn > (interval - duration) then
		nextEventIn = nextEventIn - (interval - duration)
		Timer_DF_ResearchersUnderFire = Addon_Color..SecondsToClock(nextEventIn) .."|r "
	end
	return Timer_DF_ResearchersUnderFire
end
function Timer_SL_Maw_Assault() -- Octopussy_SL_Weekly_MawCovenantAssault_count
	-- local refreshTime = 1 -- sec
	-- local invasionStart = 3780-- 3963 -- начало в 00:03
	-- local invasionInterval = 7200 -- 2ч
	-- local invasionPending = 900 -- 15мин
	-- if lastRefresh == nil or lastRefresh < GetTime()-refreshTime then
	-- lastRefresh = GetTime()
	-- local function GetTimeFromMs( ms)
	-- local hr = string.format("%02d", math.floor(ms/3600)) -- hours
	-- local mn = string.format("%02d", math.floor((ms%(3600))/60)) -- minutes
	-- local ss = string.format("%02d", math.floor((ms%(60)))) -- seconds
	-- local out = hr..":"..mn..":"..ss -- format timer output
	-- return out
	-- end
	-- local delta = time() - invasionStart
	-- local perc = invasionInterval - delta%invasionInterval -- time
	-- if (perc > invasionInterval-invasionPending ) then
	-- invasionMsg = Green_Color..GetTimeFromMs(perc-(invasionInterval-invasionPending)).."|r"
	-- else
	-- invasionMsg= Red_Color..GetTimeFromMs(perc).."|r"
	-- end
	-- end
	-- return invasionMsg
	local TIMER = 3780
	local interval = 7200
	local duration = 900
	local currTime = tonumber(GetServerTime())
	local nextEventIn = interval - mod(currTime - TIMER, interval)
	local Timer_SL_Maw_Assault = Red_Color..SecondsToClock(nextEventIn) .."|r "
	if nextEventIn > (interval - duration) then
		nextEventIn = nextEventIn - (interval - duration)
		Timer_SL_Maw_Assault = Addon_Color..SecondsToClock(nextEventIn) .."|r "
	end
	return Timer_SL_Maw_Assault
end
function O_otrisovka()
	-- Эпохальный ключ
	tinsert(OctoTable_func_otrisovka,
		-- 4
		function(CharInfo, tooltip, CL, BG)
			local VivodCent, VivodLeft = "", ""
			VivodLeft = func_itemTexture(180653)..func_itemName(180653)
			if CharInfo.CurrentKey ~= 0 then
				tooltip[#tooltip+1] = {"Score", CharInfo.RIO_Score}
				tooltip[#tooltip+1] = {"Weekly Best", CharInfo.RIO_weeklyBest}
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {"Рейды", CharInfo.RIO_RAID}
				tooltip[#tooltip+1] = {"M+", CharInfo.RIO_KEYS}
				tooltip[#tooltip+1] = {"PVP", CharInfo.RIO_PVPS}
				-- tooltip[#tooltip+1] = {
				-- {"Score", CharInfo.RIO_Score},
				-- {"Weekly Best", CharInfo.RIO_weeklyBest},
				-- {" ", " "},
				-- {"Рейды", CharInfo.RIO_RAID},
				-- {"M+", CharInfo.RIO_KEYS},
				-- {"PVP", CharInfo.RIO_PVPS},
				-- }
				-- tooltip[#tooltip+1] = {"Score", CharInfo.RIO_Score}
				-- tooltip[#tooltip+1] = {"Weekly Best", CharInfo.RIO_weeklyBest}
				-- tooltip[#tooltip+1] = {" ", " "}
				-- tooltip[#tooltip+1] = {"Рейды", CharInfo.RIO_RAID}
				-- tooltip[#tooltip+1] = {"M+", CharInfo.RIO_KEYS}
				-- tooltip[#tooltip+1] = {"PVP", CharInfo.RIO_PVPS}
			end
			-- ТЕКСТ В ЦЕНТРЕ
			if CharInfo.CurrentKey then
				VivodCent = Empty_Zero(CharInfo.CurrentKey)
			end
			if CharInfo.HasAvailableRewards then
				VivodCent = VivodCent..Addon_Color..">V<|r"
			end
			if CharInfo.ItemsInBag[205225] ~= 0 then
				VivodCent = VivodCent.."+"..CharInfo.ItemsInBag[205225]..func_itemTexture(205225)
			end
			if CharInfo.ItemsInBag[205999] ~= 0 then
				VivodCent = VivodCent.."+"..CharInfo.ItemsInBag[205999]..func_itemTexture(205999)
			end
			return VivodCent, VivodLeft
	end)
	if Octo_ToDo_DragonflyVars.config.LINE_Dragonflight then
		-- -- Осада Драконьей Погибели
		-- tinsert(OctoTable_func_otrisovka,
		-- function(CharInfo, tooltip, CL, BG)
		-- local VivodCent, VivodLeft = "", ""
		-- -- ТЕКС СЛЕВА
		-- local VivodLeft = (func_texturefromIcon(3753264).. Timer_DF_ToDragonbaneKeep()..L["Siege on Dragonbane Keep"])
		-- -- ТЕКСТ В ЦЕНТРЕ
		-- if CharInfo.Octopussy_DF_Weekly_DragonbaneKeep_count ~= NONE then
		-- VivodCent = CharInfo.Octopussy_DF_Weekly_DragonbaneKeep_count
		-- end
		-- return VivodCent, VivodLeft
		-- end)
		-- -- Великая охота
		-- tinsert(OctoTable_func_otrisovka,
		-- function(CharInfo, tooltip, CL, BG)
		-- local VivodCent, VivodLeft = "", ""
		-- -- ТЕКС СЛЕВА
		-- local VivodLeft = (func_texturefromIcon(1519430)..Timer_DF_GrandHunts()..L["Grand Hunt"])
		-- -- ТЕКСТ В ЦЕНТРЕ
		-- if CharInfo.Octopussy_DF_Weekly_TheGrandHunt_count ~= NONE then
		-- VivodCent = CharInfo.Octopussy_DF_Weekly_TheGrandHunt_count
		-- end
		-- return VivodCent, VivodLeft
		-- end)
		-- Большое пиршество
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				-- ТЕКС СЛЕВА
				local VivodLeft = (func_texturefromIcon(629056).. Timer_DF_CommunityFeast()..L["Community Feast"])
				-- ТЕКСТ В ЦЕНТРЕ
				if CharInfo.Octopussy_DF_Weekly_Feast_count ~= NONE then
					VivodCent = CharInfo.Octopussy_DF_Weekly_Feast_count
				end
				if CharInfo.ItemsInBag[200652] ~= 0 then
					VivodCent = VivodCent.." +"..CharInfo.ItemsInBag[200652]..func_itemTexture(200652)
				end
				if CharInfo.ItemsInBag[200095] ~= 0 then
					VivodCent = VivodCent.." +"..CharInfo.ItemsInBag[200095]..func_itemTexture(200095)
				end
				if CharInfo.UnitLevel >= 58 and (CharInfo.KnownSpell[366253] == false or CharInfo.KnownSpell[366253] == 0) then
					VivodCent = VivodCent..Red_Color.."-|r"
				end
				return VivodCent, VivodLeft
		end)
		-- -- Неистовство бури
		-- tinsert(OctoTable_func_otrisovka,
		-- function(CharInfo, tooltip, CL, BG)
		-- local VivodCent, VivodLeft = "", ""
		-- -- ТЕКС СЛЕВА
		-- local VivodLeft = (func_texturefromIcon(236469).. Timer_DF_PrimalStorms()..L["The Storm's Fury"])
		-- -- ТЕКСТ В ЦЕНТРЕ
		-- if CharInfo.Octopussy_DF_Weekly_StormsFury_count ~= NONE then
		-- VivodCent = CharInfo.Octopussy_DF_Weekly_StormsFury_count
		-- end
		-- return VivodCent, VivodLeft
		-- end)
		-- Исследователли под огнем
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				-- ТЕКС СЛЕВА
				local VivodLeft = (func_texturefromIcon(236469)..Timer_DF_ResearchersUnderFire()..L["Researchers Under Fire"])
				-- ТЕКСТ В ЦЕНТРЕ
				if CharInfo.Octopussy_DF_Weekly_ResearchersUnderFire_count ~= NONE then
					VivodCent = CharInfo.Octopussy_DF_Weekly_ResearchersUnderFire_count
				end
				return VivodCent, VivodLeft
		end)
		-- Помощь союзу
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				VivodLeft = func_texturefromIcon(1603189)..func_questName(70750)
				-- if CharInfo.OctopussyWeekly_3kREP_IsOnQuest ~= 0 then
				-- tinsert(tooltip,{func_questName(CharInfo.OctopussyWeekly_3kREP_IsOnQuest)})
				-- end
				-- ТЕКСТ В ЦЕНТРЕ
				if CharInfo.Octopussy_DF_Weekly_3kREP_count ~= NONE then
					VivodCent = CharInfo.Octopussy_DF_Weekly_3kREP_count
				end
				if CharInfo.Octopussy_DF_Weekly_3kREP_questID ~= NONE then
					tooltip[#tooltip+1] = {func_questName(CharInfo.Octopussy_DF_Weekly_3kREP_questID)}
				end
				if CharInfo.ItemsInBag[200073] ~= 0 then
					VivodCent = VivodCent.." +"..CharInfo.ItemsInBag[200073]..func_itemTexture(200073)
				end
				return VivodCent, VivodLeft
		end)
		-- Достойный союзник: лоаммские ниффы
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				VivodLeft = func_questName(75665)
				-- ТЕКСТ В ЦЕНТРЕ
				if CharInfo.Octopussy_DF_Weekly_ZaralekCavernAWorthyAllyLoammNiffen_count ~= NONE then
					VivodCent = CharInfo.Octopussy_DF_Weekly_ZaralekCavernAWorthyAllyLoammNiffen_count
				end
				if CharInfo.ItemsInBag[205982] ~= 0 then
					VivodCent = VivodCent.. " +"..CharInfo.ItemsInBag[205982]..func_itemTexture(205982)
				end
				if CharInfo.Octopussy_DF_Weekly_ZaralekCavernAWorthyAllyLoammNiffen_questID ~= NONE then
					tooltip[#tooltip+1] = {func_questName(CharInfo.Octopussy_DF_Weekly_ZaralekCavernAWorthyAllyLoammNiffen_questID)}
				end
				return VivodCent, VivodLeft
		end)
		-- Octopussy_DF_Weekly_WBZaralekCavernZaqaliElders
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				VivodLeft = WorldBoss_Icon.."World Boss: "..func_questName(74892)
				-- ТЕКСТ В ЦЕНТРЕ
				if CharInfo.Octopussy_DF_Weekly_WBZaralekCavernZaqaliElders_count ~= NONE then
					VivodCent = CharInfo.Octopussy_DF_Weekly_WBZaralekCavernZaqaliElders_count
				end
				if CharInfo.Octopussy_DF_Weekly_WBZaralekCavernZaqaliElders_questID ~= NONE then
					tooltip[#tooltip+1] = {func_questName(CharInfo.Octopussy_DF_Weekly_WBZaralekCavernZaqaliElders_questID)}
				end
				return VivodCent, VivodLeft
		end)
		-- Фрагмент 1
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				-- VivodLeft = func_itemTexture(204193)..Gray_Color..PLAYER_DIFFICULTY3..", M+ 1-5|r"
				if CharInfo.ItemsInBag[204075] ~= 0 or CharInfo.ItemsInBag[204193] ~= 0 or CharInfo.ItemsInBag[204075] ~= 0 or CharInfo.CurrencyID[2409] ~= 0 or CharInfo.CurrencyID_maxQuantity[2409] ~= 0 then
					tooltip[#tooltip+1] = {func_itemTexture(204075)..Green_Color..func_itemName_NOCOLOR(204075).."|r", CharInfo.ItemsInBag[204075]..Gray_Color.." ("..CharInfo.CurrencyID[2409].."/"..CharInfo.CurrencyID_maxQuantity[2409]..")|r"}
				end
				if CharInfo.ItemsInBag[204076] >= 1 then
					tooltip[#tooltip+1] = {func_itemTexture(204076)..Blue_Color..func_itemName_NOCOLOR(204076).."|r", CharInfo.ItemsInBag[204076]..Gray_Color.." ("..CharInfo.CurrencyID[2410].."/"..CharInfo.CurrencyID_maxQuantity[2410]..")|r"}
				end
				if CharInfo.ItemsInBag[204077] >= 1 then
					tooltip[#tooltip+1] = {func_itemTexture(204077)..Purple_Color..func_itemName_NOCOLOR(204077).."|r", CharInfo.ItemsInBag[204077]..Gray_Color.." ("..CharInfo.CurrencyID[2411].."/"..CharInfo.CurrencyID_maxQuantity[2411]..")|r"}
				end
				if CharInfo.ItemsInBag[204078] >= 1 then
					tooltip[#tooltip+1] = {func_itemTexture(204078)..Orange_Color..func_itemName_NOCOLOR(204078).."|r", CharInfo.ItemsInBag[204078]..Gray_Color.." ("..CharInfo.CurrencyID[2412].."/"..CharInfo.CurrencyID_maxQuantity[2412]..")|r"}
				end
				-- ТЕКСТ В ЦЕНТРЕ
				if CharInfo.ItemsInBag[204193] >= 1 then
					-- tooltip[#tooltip+1] = {func_itemTexture(204193)..func_itemName(204193), CharInfo.ItemsInBag[204193]}
					VivodCent = Green_Color..CharInfo.ItemsInBag[204193].."|r"
				end
				if CharInfo.ItemsInBag[204195] >= 1 then
					-- tooltip[#tooltip+1] = {func_itemTexture(204195)..func_itemName(204195), CharInfo.ItemsInBag[204195]}
					VivodCent = VivodCent.." "..Blue_Color..CharInfo.ItemsInBag[204195].."|r"
				end
				if CharInfo.ItemsInBag[204196] >= 1 then
					-- tooltip[#tooltip+1] = {func_itemTexture(204196)..func_itemName(204196), CharInfo.ItemsInBag[204196]}
					VivodCent = VivodCent.." "..Purple_Color..CharInfo.ItemsInBag[204196].."|r"
				end
				if CharInfo.ItemsInBag[204194] >= 1 then
					-- tooltip[#tooltip+1] = {func_itemTexture(204194)..func_itemName(204194), CharInfo.ItemsInBag[204194]}
					VivodCent = VivodCent.." "..Orange_Color..CharInfo.ItemsInBag[204194].."|r"
				end
				if CharInfo.ItemsInBag[204075] >= 15 then
					VivodCent = VivodCent.. "(+"..math.floor(CharInfo.ItemsInBag[204075]/15)..")"
				end
				if CharInfo.CurrencyID[2409] ~= 0 and (CharInfo.CurrencyID[2409] == CharInfo.CurrencyID_maxQuantity[2409]) then
					VivodCent = VivodCent..Addon_Color.."+|r"
				end
				return VivodCent, VivodLeft
		end)
		-- -- Фрагмент 2
		-- tinsert(OctoTable_func_otrisovka,
		-- function(CharInfo, tooltip, CL, BG)
		-- local VivodCent, VivodLeft = "", ""
		-- VivodLeft = func_itemTexture(204195)..Gray_Color..PLAYER_DIFFICULTY1..", M+ 6-10|r"
		-- if CharInfo.ItemsInBag[204076] >= 1 then
		-- tooltip[#tooltip+1] = {func_itemTexture(204076)..func_itemName(204076), CharInfo.ItemsInBag[204076]}
		-- end
		-- if (CharInfo.ItemsInBag[204195] ~= 0 or CharInfo.ItemsInBag[204076] ~= 0 or CharInfo.CurrencyID[2410] ~= 0) and CharInfo.CurrencyID_maxQuantity[2410] ~= 0 then
		-- tooltip[#tooltip+1] = {"Weekly CAP: ", CharInfo.CurrencyID[2410].."/"..CharInfo.CurrencyID_maxQuantity[2410]}
		-- end
		-- -- ТЕКСТ В ЦЕНТРЕ
		-- if CharInfo.ItemsInBag[204195] >= 1 then
		-- tooltip[#tooltip+1] = {func_itemTexture(204195)..func_itemName(204195), CharInfo.ItemsInBag[204195]}
		-- VivodCent = Blue_Color..CharInfo.ItemsInBag[204195].."|r"
		-- end
		-- if CharInfo.ItemsInBag[204076] >= 15 then
		-- VivodCent = VivodCent.. "(+"..math.floor(CharInfo.ItemsInBag[204076]/15)..")"
		-- end
		-- if CharInfo.CurrencyID[2410] ~= 0 and (CharInfo.CurrencyID[2410] == CharInfo.CurrencyID_maxQuantity[2410]) then
		-- VivodCent = VivodCent..Addon_Color.."+|r"
		-- end
		-- return VivodCent, VivodLeft
		-- end)
		-- -- Фрагмент 3
		-- tinsert(OctoTable_func_otrisovka,
		-- function(CharInfo, tooltip, CL, BG)
		-- local VivodCent, VivodLeft = "", ""
		-- VivodLeft = func_itemTexture(204196)..Gray_Color..PLAYER_DIFFICULTY2..", M+ 11-15|r"
		-- if CharInfo.ItemsInBag[204077] >= 1 then
		-- tooltip[#tooltip+1] = {func_itemTexture(204077)..func_itemName(204077), CharInfo.ItemsInBag[204077]}
		-- end
		-- if (CharInfo.ItemsInBag[204196] ~= 0 or CharInfo.ItemsInBag[204077] ~= 0 or CharInfo.CurrencyID[2411] ~= 0) and CharInfo.CurrencyID_maxQuantity[2411] ~= 0 then
		-- tooltip[#tooltip+1] = {"Weekly CAP: ", CharInfo.CurrencyID[2411].."/"..CharInfo.CurrencyID_maxQuantity[2411]}
		-- end
		-- -- ТЕКСТ В ЦЕНТРЕ
		-- if CharInfo.ItemsInBag[204196] >= 1 then
		-- tooltip[#tooltip+1] = {func_itemTexture(204196)..func_itemName(204196), CharInfo.ItemsInBag[204196]}
		-- VivodCent = Purple_Color..CharInfo.ItemsInBag[204196].."|r"
		-- end
		-- if CharInfo.ItemsInBag[204077] >= 15 then
		-- VivodCent = VivodCent.. "(+"..math.floor(CharInfo.ItemsInBag[204077]/15)..")"
		-- end
		-- if CharInfo.CurrencyID[2411] ~= 0 and (CharInfo.CurrencyID[2411] == CharInfo.CurrencyID_maxQuantity[2411]) then
		-- VivodCent = VivodCent..Addon_Color.."+|r"
		-- end
		-- return VivodCent, VivodLeft
		-- end)
		-- -- Фрагмент 4
		-- tinsert(OctoTable_func_otrisovka,
		-- function(CharInfo, tooltip, CL, BG)
		-- local VivodCent, VivodLeft = "", ""
		-- VivodLeft = func_itemTexture(204194)..Gray_Color..PLAYER_DIFFICULTY6..", M+ 16+|r"
		-- if CharInfo.ItemsInBag[204078] >= 1 then
		-- tooltip[#tooltip+1] = {func_itemTexture(204078)..func_itemName(204078), CharInfo.ItemsInBag[204078]}
		-- end
		-- if (CharInfo.ItemsInBag[204194] ~= 0 or CharInfo.ItemsInBag[204078] ~= 0 or CharInfo.CurrencyID[2412] ~= 0) and CharInfo.CurrencyID_maxQuantity[2412] ~= 0 then
		-- tooltip[#tooltip+1] = {"Weekly CAP: ", CharInfo.CurrencyID[2412].."/"..CharInfo.CurrencyID_maxQuantity[2412]}
		-- end
		-- -- ТЕКСТ В ЦЕНТРЕ
		-- if CharInfo.ItemsInBag[204194] >= 1 then
		-- tooltip[#tooltip+1] = {func_itemTexture(204194)..func_itemName(204194), CharInfo.ItemsInBag[204194]}
		-- VivodCent = Orange_Color..CharInfo.ItemsInBag[204194].."|r"
		-- end
		-- if CharInfo.ItemsInBag[204078] >= 15 then
		-- VivodCent = VivodCent.. "(+"..math.floor(CharInfo.ItemsInBag[204078]/15)..")"
		-- end
		-- if CharInfo.CurrencyID[2412] ~= 0 and (CharInfo.CurrencyID[2412] == CharInfo.CurrencyID_maxQuantity[2412]) then
		-- VivodCent = VivodCent..Addon_Color.."+|r"
		-- end
		-- return VivodCent, VivodLeft
		-- end)
		-- -- Искра пламени Тьмы
		-- tinsert(OctoTable_func_otrisovka,
		-- function(CharInfo, tooltip, CL, BG)
		-- local VivodCent, VivodLeft = "", ""
		-- if CharInfo.ItemsInBag[204440] ~= 0 then
		-- tooltip[#tooltip+1] = {func_itemName(204440), func_itemTexture(204440)..CharInfo.ItemsInBag[204440]} -- Искра пламени Тьмы
		-- end
		-- if CharInfo.ItemsInBag[204717] ~= 0 then
		-- tooltip[#tooltip+1] = {func_itemName(204717), func_itemTexture(204717)..CharInfo.ItemsInBag[204717]} -- Расщепленная искра пламени Тьмы
		-- end
		-- if CharInfo.ItemsInBag[204681] ~= 0 then
		-- tooltip[#tooltip+1] = {func_itemName(204681), func_itemTexture(204681)..CharInfo.ItemsInBag[204681]} -- Зачарованный гребень дракончика из пламени Тьмы
		-- end
		-- if CharInfo.ItemsInBag[204682] ~= 0 then
		-- tooltip[#tooltip+1] = {func_itemName(204682), func_itemTexture(204682)..CharInfo.ItemsInBag[204682]} -- Зачарованный гребень змея из пламени Тьмы
		-- end
		-- if CharInfo.ItemsInBag[204697] ~= 0 then
		-- tooltip[#tooltip+1] = {func_itemName(204697), func_itemTexture(204697)..CharInfo.ItemsInBag[204697]} -- Зачарованный гребень Аспекта из пламени Тьмы
		-- end
		-- -- ТЕКСТ В ЦЕНТРЕ
		-- if CharInfo.ItemsInBag[204440] >= 1 then
		-- VivodCent = VivodCent..func_itemTexture(204440)..CharInfo.ItemsInBag[204440]
		-- end
		-- if CharInfo.ItemsInBag[204717] >= 1 then
		-- VivodCent = VivodCent..func_itemTexture(204717)..CharInfo.ItemsInBag[204717]
		-- end
		-- if CharInfo.ItemsInBag[204681] >= 1 then
		-- VivodCent = VivodCent..func_itemTexture(204681)..CharInfo.ItemsInBag[204681]
		-- end
		-- if CharInfo.ItemsInBag[204682] >= 1 then
		-- VivodCent = VivodCent..func_itemTexture(204682)..CharInfo.ItemsInBag[204682]
		-- end
		-- if CharInfo.ItemsInBag[204697] >= 1 then
		-- VivodCent = VivodCent..func_itemTexture(204697)..CharInfo.ItemsInBag[204697]
		-- end
		-- VivodLeft = Gray_Color..func_itemTexture(204440)..func_itemName_NOCOLOR(204440).."|r"
		-- return VivodCent, VivodLeft
		-- end)
		-- Возрождающееся пламя Тьмы
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				VivodLeft = func_currencyicon(2533)..func_currencyName(2533)
				-- ТЕКСТ В ЦЕНТРЕ
				if CharInfo.CurrencyID[2533] ~= 0 then
					VivodCent = CharInfo.CurrencyID[2533]
				end
				if CharInfo.CurrencyID[2533] < (CharInfo.CurrencyID_maxQuantity[2533] or 8) and CharInfo.needResetWeekly == true then
					VivodCent = CharInfo.CurrencyID[2533] + 1
				end
				if CharInfo.CurrencyID[2533] == CharInfo.CurrencyID_maxQuantity[2533] then
					VivodCent = Addon_Color..VivodCent.."|r"
				end
				if (CharInfo.tmstp_Weekly or 0) < GetServerTime() and CharInfo.CurrencyID[2533] < 8 then
					VivodCent = Red_Color..VivodCent .."|r"
				end
				return VivodCent, VivodLeft
		end)
		-- Драконьи камни
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID[2245] ~= 0 then
					VivodCent = CharInfo.CurrencyID[2245].."/"..CharInfo.CurrencyID_maxQuantity[2245]
				end
				if CharInfo.CurrencyID[2245] == CharInfo.CurrencyID_maxQuantity[2245] then
					VivodCent = Green_Color..VivodCent.."|r"
				end
				VivodLeft = func_currencyicon(2245)..func_currencyName(2245)
				return VivodCent, VivodLeft
		end)
	end
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	if Octo_ToDo_DragonflyVars.config.LINE_Shadowlands then
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				VivodLeft = "Maw: Covenant Assault "..Timer_SL_Maw_Assault()
				if CharInfo.Octopussy_SL_Weekly_MawCovenantAssault_count ~= NONE then
					VivodCent = CharInfo.Octopussy_SL_Weekly_MawCovenantAssault_count
				end
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				CL:SetTextColor(Kyri_Color_r, Kyri_Color_g, Kyri_Color_b)
				if CharInfo.curCovID == 1 then
					BG:SetColorTexture(Kyri_Color_r, Kyri_Color_g, Kyri_Color_b, .2)
				else
					BG:SetColorTexture(0,0,0,0)
				end
				if CharInfo.Shadowland[1] then
					VivodLeft = Kyrian_Icon..Kyri_Color..L["Kyrian"].."|r"
					VivodCent = Empty_Zero(CharInfo.Shadowland[1])
				end
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				CL:SetTextColor(Necr_Color_r, Necr_Color_g, Necr_Color_b)
				if CharInfo.curCovID == 4 then
					BG:SetColorTexture(Necr_Color_r, Necr_Color_g, Necr_Color_b, .2)
				else
					BG:SetColorTexture(0,0,0,0)
				end
				if CharInfo.Shadowland[7] then
					VivodLeft = Necrolord_Icon..Necr_Color..L["Necrolord"].."|r"
					VivodCent = Empty_Zero(CharInfo.Shadowland[7])
				end
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				CL:SetTextColor(NFae_Color_r, NFae_Color_g, NFae_Color_b)
				if CharInfo.curCovID == 3 then
					BG:SetColorTexture(NFae_Color_r, NFae_Color_g, NFae_Color_b, .2)
				else
					BG:SetColorTexture(0,0,0,0)
				end
				if CharInfo.Shadowland[5] then
					VivodLeft = NightFae_Icon..NFae_Color..L["Night Fae"].."|r"
					VivodCent = Empty_Zero(CharInfo.Shadowland[5])
				end
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				CL:SetTextColor(Vent_Color_r, Vent_Color_g, Vent_Color_b)
				if CharInfo.curCovID == 2 then
					BG:SetColorTexture(Vent_Color_r, Vent_Color_g, Vent_Color_b, .2)
				else
					BG:SetColorTexture(0,0,0,0)
				end
				if CharInfo.Shadowland[3] then
					VivodLeft = Venthyr_Icon..Vent_Color..L["Venthyr"].."|r"
					VivodCent = Empty_Zero(CharInfo.Shadowland[3])
				end
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				CL:SetTextColor(Kyri_Color_r, Kyri_Color_g, Kyri_Color_b)
				if CharInfo.curCovID == 1 then
					BG:SetColorTexture(Kyri_Color_r, Kyri_Color_g, Kyri_Color_b, .2)
				else
					BG:SetColorTexture(0,0,0,0)
				end
				if CharInfo.Shadowland[2] then
					VivodLeft = Kyrian_Icon..Kyri_Color..L["Kyrian"].."|r"
					VivodCent = Empty_Zero(CharInfo.Shadowland[2])
				end
				if CharInfo.Shadowland[2] and CharInfo.Shadowland[2] < 1000 then
					VivodCent = Gray_Color..VivodCent.."|r"
				end
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				CL:SetTextColor(Necr_Color_r, Necr_Color_g, Necr_Color_b)
				if CharInfo.curCovID == 4 then
					BG:SetColorTexture(Necr_Color_r, Necr_Color_g, Necr_Color_b, .2)
				else
					BG:SetColorTexture(0,0,0,0)
				end
				if CharInfo.Shadowland[8] then
					VivodLeft = Necrolord_Icon..Necr_Color..L["Necrolord"].."|r"
					VivodCent = Empty_Zero(CharInfo.Shadowland[8])
				end
				if CharInfo.Shadowland[8] and CharInfo.Shadowland[8] < 1000 then
					VivodCent = Gray_Color..VivodCent.."|r"
				end
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				CL:SetTextColor(NFae_Color_r, NFae_Color_g, NFae_Color_b)
				if CharInfo.curCovID == 3 then
					BG:SetColorTexture(NFae_Color_r, NFae_Color_g, NFae_Color_b, .2)
				else
					BG:SetColorTexture(0,0,0,0)
				end
				if CharInfo.Shadowland[6] then
					VivodLeft = NightFae_Icon..NFae_Color..L["Night Fae"].."|r"
					VivodCent = Empty_Zero(CharInfo.Shadowland[6])
				end
				if CharInfo.Shadowland[6] and CharInfo.Shadowland[6] < 1000 then
					VivodCent = Gray_Color..VivodCent.."|r"
				end
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				CL:SetTextColor(Vent_Color_r, Vent_Color_g, Vent_Color_b)
				if CharInfo.curCovID == 2 then
					BG:SetColorTexture(Vent_Color_r, Vent_Color_g, Vent_Color_b, .2)
				else
					BG:SetColorTexture(0,0,0,0)
				end
				if CharInfo.Shadowland[4] then
					VivodLeft = Venthyr_Icon..Vent_Color..L["Venthyr"].."|r"
					VivodCent = Empty_Zero(CharInfo.Shadowland[4])
				end
				if CharInfo.Shadowland[4] and CharInfo.Shadowland[4] < 1000 then
					VivodCent = Gray_Color..VivodCent.."|r"
				end
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				VivodCent = Empty_Zero(CharInfo.CurrencyID[2009])
				VivodLeft = func_currencyicon(2009)..func_currencyName(2009)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				VivodCent = Empty_Zero(CharInfo.CurrencyID[1906])
				VivodLeft = func_currencyicon(1906)..func_currencyName(1906)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				VivodCent = Empty_Zero(CharInfo.CurrencyID[1828])
				VivodLeft = func_currencyicon(1828)..func_currencyName(1828)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				VivodCent = Empty_Zero(CharInfo.CurrencyID[1979])
				VivodLeft = func_currencyicon(1979)..func_currencyName(1979)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.Octopussy_SL_Weekly_ZMPatternsWithinPatterns_count ~= NONE then
					VivodCent = CharInfo.Octopussy_SL_Weekly_ZMPatternsWithinPatterns_count
				end
				VivodLeft = func_texturefromIcon(4074774)..func_questName(66042)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.Octopussy_SL_Weekly_KorthiaShapingFate_count ~= NONE then
					VivodCent = CharInfo.Octopussy_SL_Weekly_KorthiaShapingFate_count
				end
				VivodLeft = func_texturefromIcon(4066373)..func_questName(63949)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.Octopussy_SL_Weekly_WBALL_count ~= NONE then
					VivodCent = CharInfo.Octopussy_SL_Weekly_WBALL_count
				end
				VivodLeft = WorldBoss_Icon.."World Boss"
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.Octopussy_SL_Weekly_WBZMAntros_count ~= NONE then
					VivodCent = CharInfo.Octopussy_SL_Weekly_WBZMAntros_count
				end
				VivodLeft = WorldBoss_Icon.."World Boss: "..func_questName(65143)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.Octopussy_SL_Weekly_WBMawMorgeth_count ~= NONE then
					VivodCent = CharInfo.Octopussy_SL_Weekly_WBMawMorgeth_count
				end
				VivodLeft = WorldBoss_Icon.."World Boss: "..func_questName(64531)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.Octopussy_SL_Weekly_ReplenishtheReservoir_count ~= NONE then
					VivodCent = CharInfo.Octopussy_SL_Weekly_ReplenishtheReservoir_count
				end
				VivodLeft = func_currencyicon(1813)..func_questName(61981)
				return VivodCent, VivodLeft
		end)
	end
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	if Octo_ToDo_DragonflyVars.config.LINE_BattleforAzeroth then
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				VivodLeft = (Timer_BfA_Invasion().."Timer_BfA_Invasion (PVP)")
				if CharInfo.Octopussy_BfA_Daily_InvasionQuests_count ~= NONE then
					VivodCent = CharInfo.Octopussy_BfA_Daily_InvasionQuests_count
				end
				if CharInfo.Octopussy_BfA_Daily_InvasionQuests_questID ~= NONE then
					tooltip[#tooltip+1] = {func_questName(CharInfo.Octopussy_BfA_Daily_InvasionQuests_questID)}
				end
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				VivodLeft = (Timer_BfA_Assault().."Timer_BfA_Assault (N'zoth)")
				if CharInfo.Octopussy_BfA_Daily_AssaultQuests_count ~= NONE then
					VivodCent = CharInfo.Octopussy_BfA_Daily_AssaultQuests_count
				end
				if CharInfo.ItemsInBag[174765] ~= 0 then
					VivodCent = VivodCent..CharInfo.ItemsInBag[174765]..func_itemTexture(174765)
				end
				if CharInfo.ItemsInBag[174761] ~= 0 then
					VivodCent = VivodCent..CharInfo.ItemsInBag[174761]..func_itemTexture(174761)
				end
				if CharInfo.ItemsInBag[174767] ~= 0 then
					VivodCent = VivodCent..CharInfo.ItemsInBag[174767]..func_itemTexture(174767)
				end
				if CharInfo.ItemsInBag[174766] ~= 0 then
					VivodCent = VivodCent..CharInfo.ItemsInBag[174766]..func_itemTexture(174766)
				end
				if CharInfo.ItemsInBag[174768] ~= 0 then
					VivodCent = VivodCent..CharInfo.ItemsInBag[174768]..func_itemTexture(174768)
				end
				if CharInfo.Octopussy_BfA_Daily_AssaultQuests_questID ~= NONE then
					tooltip[#tooltip+1] = {func_questName(CharInfo.Octopussy_BfA_Daily_AssaultQuests_questID)}
				end
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {func_itemTexture(174764)..CharInfo.ItemsInBag[174764].."/6", "Ульдум "..CharInfo.ItemsInBag[174765]..func_itemTexture(174765)}
				tooltip[#tooltip+1] = {func_itemTexture(174756)..CharInfo.ItemsInBag[174756].."/6", "Ульдум "..CharInfo.ItemsInBag[174761]..func_itemTexture(174761)}
				tooltip[#tooltip+1] = {func_itemTexture(174759)..CharInfo.ItemsInBag[174759].."/6", "Вечноцветущий дол "..CharInfo.ItemsInBag[174767]..func_itemTexture(174767)}
				tooltip[#tooltip+1] = {func_itemTexture(174760)..CharInfo.ItemsInBag[174760].."/6", "Вечноцветущий дол "..CharInfo.ItemsInBag[174766]..func_itemTexture(174766)}
				tooltip[#tooltip+1] = {func_itemTexture(174758)..CharInfo.ItemsInBag[174758].."/6", "Вечноцветущий дол, Ульдум "..CharInfo.ItemsInBag[174768]..func_itemTexture(174768)}
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.Octopussy_BfA_Weekly_WBALL_count ~= NONE then
					VivodCent = Empty_Zero(CharInfo.Octopussy_BfA_Weekly_WBALL_count)
				end
				VivodLeft = WorldBoss_Icon.."World Boss"
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.Octopussy_BfA_Weekly_WBNazjatarTerroroftheDepths_count ~= NONE then
					VivodCent = Empty_Zero(CharInfo.Octopussy_BfA_Weekly_WBNazjatarTerroroftheDepths_count)
				end
				VivodLeft = WorldBoss_Icon.."World Boss: "..func_questName(56056)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.Octopussy_BfA_Weekly_WBAssault_count ~= NONE then
					VivodCent = Empty_Zero(CharInfo.Octopussy_BfA_Weekly_WBAssault_count)
				end
				VivodLeft = WorldBoss_Icon.."World Boss: Assault"
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Ресурсы для войны
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID_Total[1560] ~= "|cff4040400|r" then
					VivodCent = CharInfo.CurrencyID_Total[1560]
				end
				VivodLeft = func_currencyicon(1560)..func_currencyName(1560)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Радужная манажемчужина
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID_Total[1721] ~= "|cff4040400|r" then
					VivodCent = CharInfo.CurrencyID_Total[1721]
				end
				VivodLeft = func_currencyicon(1721)..func_currencyName(1721)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Эхо Ни'алоты
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID_Total[1803] ~= "|cff4040400|r" then
					VivodCent = CharInfo.CurrencyID_Total[1803]
				end
				VivodLeft = func_currencyicon(1803)..func_currencyName(1803)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Сгусток видений
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID_Total[1755] ~= "|cff4040400|r" then
					VivodCent = CharInfo.CurrencyID_Total[1755]
				end
				if CharInfo.ItemsInBag[173363] ~= 0 then
					VivodCent = VivodCent .." +"..CharInfo.ItemsInBag[173363]..func_itemTexture(173363)
				end
				VivodLeft = func_currencyicon(1755)..func_currencyName(1755)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Заряженные реликвии
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID_Total[1719] ~= "|cff4040400|r" then
					VivodCent = CharInfo.CurrencyID_Total[1719]
				end
				VivodLeft = func_currencyicon(1719)..func_currencyName(1719)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Дублон мореплавателя
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID_Total[1710] ~= "|cff4040400|r" then
					VivodCent = CharInfo.CurrencyID_Total[1710]
				end
				VivodLeft = func_currencyicon(1710)..func_currencyName(1710)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Военная медаль Армии Чести
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID_Total[1716] ~= "|cff4040400|r" then
					VivodCent = CharInfo.CurrencyID_Total[1716]
				end
				VivodLeft = func_currencyicon(1716)..func_currencyName(1716)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Пыль титанов
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID_Total[1718] ~= "|cff4040400|r" then
					VivodCent = CharInfo.CurrencyID_Total[1718]
				end
				VivodLeft = func_currencyicon(1718)..func_currencyName(1718)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- azerite
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.azeriteLVL ~= 0 then
					CL:SetFont(curFontTTF, curFontSize-1, curFontOutline)
					VivodCent = Empty_Zero(Green_Color..CharInfo.azeriteLVL.."|r").."|n"..Gray_Color..CharInfo.azeriteEXP.."|r"
				end
				VivodLeft = func_itemTexture(158075)..func_itemName(158075)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- cloak_lvl
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.ItemsInBag[169223] == 0 then
					VivodCent = Red_Color.."no cloak|r"
				end
				if CharInfo.ItemsInBag[169223] ~= 0 then
					VivodCent = Orange_Color.. "neeed to equip|r"
					if CharInfo.cloak_lvl ~= 0 then
						VivodCent = CharInfo.cloak_lvl.." lvl"
						if CharInfo.cloak_lvl == 15 then
							VivodCent = Green_Color..VivodCent.."|r"
						end
					end
					if CharInfo.cloak_res ~= 0 then
						CL:SetFont(curFontTTF, curFontSize-1, curFontOutline)
						VivodCent = VivodCent.."|n"..CharInfo.cloak_res
					end
				end
				VivodLeft = func_itemTexture(169223)..func_itemName(169223)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Assault: The Black Empire
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.Octopussy_BfA_Weekly_AssaultTheBlackEmpire_count ~= NONE then
					VivodCent = Empty_Zero(CharInfo.Octopussy_BfA_Weekly_AssaultTheBlackEmpire_count)
				end
				VivodLeft = Purple_Color..func_questName(56064).."|r"
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- miniVision
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.Octopussy_BfA_Weekly_miniVision_count ~= NONE then
					VivodCent = Empty_Zero(CharInfo.Octopussy_BfA_Weekly_miniVision_count)
				end
				VivodLeft = Purple_Color.."Mini Vision".."|r"
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Assault: The Black Empire
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.islandBfA then
					VivodCent = Empty_Zero(CharInfo.islandBfA)
				end
				VivodLeft = "Collect_BfA_Island"
				local questID = C_IslandsQueue.GetIslandsWeeklyQuestID()
				if questID then
					VivodLeft = func_questName(questID)
				end
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Warfront: The Battle for Stromgarde
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.Octopussy_BfA_Weekly_Warfront1_count ~= NONE then
					VivodCent = Empty_Zero(CharInfo.Octopussy_BfA_Weekly_Warfront1_count)
				end
				VivodLeft = "Warfront: Stromgarde"
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Warfront: The Battle for Darkshore
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.Octopussy_BfA_Weekly_Warfront2_count ~= NONE then
					VivodCent = Empty_Zero(CharInfo.Octopussy_BfA_Weekly_Warfront2_count)
				end
				VivodLeft = "Warfront: Darkshore"
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Heroic Warfront
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.Octopussy_BfA_Weekly_WarfrontHC_count ~= NONE then
					VivodCent = Empty_Zero(CharInfo.Octopussy_BfA_Weekly_WarfrontHC_count)
				end
				VivodLeft = "Warfront: Heroic"
				return VivodCent, VivodLeft
		end)
		-- bounty_BfA1
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.bounty_BfA1 ~= 0 and CharInfo.bounty_BfA1_questID ~= 0 then
					VivodCent = CharInfo.bounty_BfA1_icon..CharInfo.bounty_BfA1
					tooltip[#tooltip+1] = {func_questName(CharInfo.bounty_BfA1_questID)}
					tooltip[#tooltip+1] = {L["Expire on"], date("%d/%m/%Y %H:%M:%S", CharInfo.bounty_BfA1_end) or ""}
				end
				VivodLeft = "bounty_BfA1"
				return VivodCent, VivodLeft
		end)
		-- bounty_BfA2
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.bounty_BfA2 ~= 0 and CharInfo.bounty_BfA2_questID ~= 0 then
					VivodCent = CharInfo.bounty_BfA2_icon..CharInfo.bounty_BfA2
					tooltip[#tooltip+1] = {func_questName(CharInfo.bounty_BfA2_questID)}
					tooltip[#tooltip+1] = {L["Expire on"], date("%d/%m/%Y %H:%M:%S", CharInfo.bounty_BfA2_end) or ""}
				end
				VivodLeft = "bounty_BfA2"
				return VivodCent, VivodLeft
		end)
		-- bounty_BfA3
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.bounty_BfA3 ~= 0 and CharInfo.bounty_BfA3_questID ~= 0 then
					VivodCent = CharInfo.bounty_BfA3_icon..CharInfo.bounty_BfA3
					tooltip[#tooltip+1] = {func_questName(CharInfo.bounty_BfA3_questID)}
					tooltip[#tooltip+1] = {L["Expire on"], date("%d/%m/%Y %H:%M:%S", CharInfo.bounty_BfA3_end) or ""}
				end
				VivodLeft = "bounty_BfA3"
				return VivodCent, VivodLeft
		end)
	end
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	if Octo_ToDo_DragonflyVars.config.LINE_Legion then
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				VivodLeft = (Timer_Legion_Invasion().."Timer_Legion_Invasion")
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID[1273] then
					VivodCent = CharInfo.CurrencyID_Total[1273].."(+"..CharInfo.Octopussy_Legion_Weekly_coinsQuests_count..")"
				end
				VivodLeft = func_currencyicon(1273)..Blue_Color.."("..L["Coins"]..") |r"..func_currencyName(1273)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Дымчатый аргунит
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID[1508] ~= 0 then
					VivodCent = CharInfo.CurrencyID_Total[1508]
				end
				VivodLeft = func_currencyicon(1508)..func_currencyName(1508)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Припасы Армии погибели Легиона
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID_Total[1342] ~= "|cff4040400|r" then
					VivodCent = CharInfo.CurrencyID_Total[1342]
				end
				VivodLeft = func_currencyicon(1342)..func_currencyName(1342)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Ресурсы оплота класса
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID_Total[1220] ~= "|cff4040400|r" then
					VivodCent = CharInfo.CurrencyID_Total[1220]
				end
				VivodLeft = func_currencyicon(1220)..func_currencyName(1220)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Осколок Пустоты
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID_Total[1226] ~= "|cff4040400|r" then
					VivodCent = CharInfo.CurrencyID_Total[1226]
				end
				VivodLeft = func_currencyicon(1226)..func_currencyName(1226)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Пробуждающая сущность
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID_Total[1533] ~= "|cff4040400|r" then
					VivodCent = CharInfo.CurrencyID_Total[1533]
				end
				VivodLeft = func_currencyicon(1533)..func_currencyName(1533)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Кровь Саргераса
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.ItemsInBag[124124] ~= 0 then
					VivodCent = CharInfo.ItemsInBag[124124]
				end
				VivodLeft = Gray_Color..func_itemTexture(124124)..func_itemName_NOCOLOR(124124).."|r"
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.Octopussy_Legion_Weekly_WBALL_count ~= NONE then
					VivodCent = CharInfo.Octopussy_Legion_Weekly_WBALL_count
				end
				VivodLeft = WorldBoss_Icon.."World Boss"
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Баланс сил
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.Octopussy_Legion_Once_BalanceofPower_count ~= NONE then
					VivodCent = CharInfo.Octopussy_Legion_Once_BalanceofPower_count
				end
				if OctoTable_QuestID[43533] == "|cff4FFF79Done|r" then
					VivodCent = DONE
				end
				VivodLeft = func_questName(43533)
				return VivodCent, VivodLeft
		end)
		-- bounty_Legion1
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.bounty_Legion1 ~= 0 and CharInfo.bounty_Legion1_questID ~= 0 then
					VivodCent = CharInfo.bounty_Legion1_icon..CharInfo.bounty_Legion1
					tooltip[#tooltip+1] = {func_questName(CharInfo.bounty_Legion1_questID)}
					tooltip[#tooltip+1] = {L["Expire on"], date("%d/%m/%Y %H:%M:%S", CharInfo.bounty_Legion1_end) or ""}
				end
				VivodLeft = "bounty_Legion1"
				return VivodCent, VivodLeft
		end)
		-- bounty_Legion2
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.bounty_Legion2 ~= 0 and CharInfo.bounty_Legion2_questID ~= 0 then
					VivodCent = CharInfo.bounty_Legion2_icon..CharInfo.bounty_Legion2
					tooltip[#tooltip+1] = {func_questName(CharInfo.bounty_Legion2_questID)}
					tooltip[#tooltip+1] = {L["Expire on"], date("%d/%m/%Y %H:%M:%S", CharInfo.bounty_Legion2_end) or ""}
				end
				VivodLeft = "bounty_Legion2"
				return VivodCent, VivodLeft
		end)
		-- bounty_Legion3
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.bounty_Legion3 ~= 0 and CharInfo.bounty_Legion3_questID ~= 0 then
					VivodCent = CharInfo.bounty_Legion3_icon..CharInfo.bounty_Legion3
					tooltip[#tooltip+1] = {func_questName(CharInfo.bounty_Legion3_questID)}
					tooltip[#tooltip+1] = {L["Expire on"], date("%d/%m/%Y %H:%M:%S", CharInfo.bounty_Legion3_end) or ""}
				end
				VivodLeft = "bounty_Legion3"
				return VivodCent, VivodLeft
		end)
	end
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	if Octo_ToDo_DragonflyVars.config.LINE_WarlordsofDraenor then
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID[1129] then
					VivodCent = CharInfo.CurrencyID_Total[1129].."(+"..CharInfo.Octopussy_WoD_Weekly_coinsQuests_count..")"
				end
				VivodLeft = func_currencyicon(1129)..Blue_Color.."("..L["Coins"]..") |r"..func_currencyName(1129)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID[1129] then
					VivodCent = CharInfo.CurrencyID_Total[994]
				end
				VivodLeft = func_currencyicon(994)..Blue_Color.."("..L["Coins"]..") |r"..func_currencyName(994)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, --
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID_Total[823] ~= "|cff4040400|r" then
					VivodCent = CharInfo.CurrencyID_Total[823]
				end
				VivodLeft = func_currencyicon(823)..func_currencyName(823)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, --
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID_Total[1101] ~= "|cff4040400|r" then
					VivodCent = CharInfo.CurrencyID_Total[1101]
				end
				VivodLeft = func_currencyicon(1101)..func_currencyName(1101)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, --
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID_Total[824] ~= "|cff4040400|r" then
					VivodCent = CharInfo.CurrencyID_Total[824]
				end
				VivodLeft = func_currencyicon(824)..func_currencyName(824)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Создание гарнизона
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.OctoTable_QuestID[34378] ~= NONE then
					VivodCent = CharInfo.OctoTable_QuestID[34378]
				end
				VivodLeft = func_questName(34378)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Моя собственная крепость
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				CL:SetFont(curFontTTF, curFontSize-1, curFontOutline)
				if CharInfo.UnitLevel > 40 then
					if CharInfo.CurrencyID[824] < 2000 then
						VivodCent = VivodCent.."|cffFF0000"..CharInfo.CurrencyID[824]..func_currencyicon(824)
					else
						VivodCent = VivodCent..CharInfo.CurrencyID[824]..func_currencyicon(824).."|r"
					end
					if CharInfo.Money/10000 < 5000 then
						VivodCent = VivodCent.."|cffFF0000"..GetCoinTextureString(CharInfo.Money-CharInfo.Money%10000)
					else
						VivodCent = VivodCent..GetCoinTextureString(CharInfo.Money-CharInfo.Money%10000).."|r"
					end
					if CharInfo.OctoTable_QuestID[36614] ~= NONE then
						CL:SetFont(curFontTTF, curFontSize, curFontOutline)
						VivodCent = CharInfo.OctoTable_QuestID[36614]
					end
				else
					VivodCent = func_texturefromIcon(894556).."|cffFF0000"..CharInfo.UnitLevel.."/40|r"
				end
				VivodLeft = L["Garrison 3 Level"]
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Раскопанная магия
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.OctoTable_QuestID[38242] ~= NONE then
					VivodCent = CharInfo.OctoTable_QuestID[38242]
				end
				if CharInfo.ItemsInBag[122457] ~= 0 then
					VivodCent = VivodCent.. "+"..CharInfo.ItemsInBag[122457]..func_itemTexture(122457)
				end
				VivodLeft = func_questName(38242).." (ап пета)"
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka, -- Владычество над морями
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.OctoTable_QuestID[39246] ~= NONE then
					VivodCent = CharInfo.OctoTable_QuestID[39246]
				end
				VivodLeft = func_questName(39246)
				return VivodCent, VivodLeft
		end)
	end
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	if Octo_ToDo_DragonflyVars.config.LINE_MistsofPandaria then
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID[697] then
					VivodCent = CharInfo.CurrencyID_Total[697]
				end
				VivodLeft = func_currencyicon(697)..Blue_Color.."("..L["Coins"]..") |r"..func_currencyName(697)
				return VivodCent, VivodLeft
		end)
		tinsert(OctoTable_func_otrisovka,
			function(CharInfo, tooltip, CL, BG)
				local VivodCent, VivodLeft = "", ""
				if CharInfo.CurrencyID[776] then
					VivodCent = CharInfo.CurrencyID_Total[776]
				end
				VivodLeft = func_currencyicon(776)..Blue_Color.."("..L["Coins"]..") |r"..func_currencyName(776)
				return VivodCent, VivodLeft
		end)
	end
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	if Octo_ToDo_DragonflyVars.config.LINE_Cataclysm then
	end
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	if Octo_ToDo_DragonflyVars.config.LINE_WrathoftheLichKing then
	end
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	if Octo_ToDo_DragonflyVars.config.LINE_TheBurningCrusade then
	end
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	if Octo_ToDo_DragonflyVars.config.LINE_Classic then
	end
	-- ВАЛЮТА
	tinsert(OctoTable_func_otrisovka,
		function(CharInfo, tooltip, CL, BG)
			local VivodCent, VivodLeft = "", ""
			-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
			if Octo_ToDo_DragonflyVars.config.LINE_Dragonflight then
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {" "..Blue_Color.."Dragonflight".."|r", " "}
				tooltip[#tooltip+1] = {func_currencyicon(2245)..func_currencyName(2245), CharInfo.CurrencyID_Total[2245]} -- Драконьи камни
				tooltip[#tooltip+1] = {func_currencyicon(2122)..func_currencyName(2122), CharInfo.CurrencyID_Total[2122]} -- Печать бури
				tooltip[#tooltip+1] = {func_currencyicon(2118)..func_currencyName(2118), CharInfo.CurrencyID_Total[2118]} -- Энергия стихий
				tooltip[#tooltip+1] = {func_currencyicon(2003)..func_currencyName(2003), CharInfo.CurrencyID_Total[2003]} -- Припасы Драконьих островов
				if CharInfo.CurrencyID[2245] ~= 0 then
					VivodCent = func_currencyicon(2245)..Empty_Zero(CharInfo.CurrencyID[2245])
				end
				if CharInfo.CurrencyID[2245] == CharInfo.CurrencyID_maxQuantity[2245] then
					VivodCent = Addon_Color..VivodCent.."|r"
				end
			end
			-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
			if Octo_ToDo_DragonflyVars.config.LINE_Shadowlands then
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {" "..Blue_Color.."Shadowlands".."|r", " "}
				tooltip[#tooltip+1] = {func_currencyicon(2009)..func_currencyName(2009), CharInfo.CurrencyID_Total[2009]}
				tooltip[#tooltip+1] = {func_currencyicon(1906)..func_currencyName(1906), CharInfo.CurrencyID_Total[1906]}
				tooltip[#tooltip+1] = {func_currencyicon(1828)..func_currencyName(1828), CharInfo.CurrencyID_Total[1828]}
				tooltip[#tooltip+1] = {func_currencyicon(1977)..func_currencyName(1977), CharInfo.CurrencyID_Total[1977]}
				tooltip[#tooltip+1] = {func_currencyicon(1813)..func_currencyName(1813), CharInfo.CurrencyID_Total[1813]} -- Запасенная анима
				tooltip[#tooltip+1] = {func_currencyicon(1979)..func_currencyName(1979), CharInfo.CurrencyID_Total[1979]}
				tooltip[#tooltip+1] = {func_currencyicon(1904)..func_currencyName(1904), CharInfo.CurrencyID_Total[1904]} -- Знания о Башне
				tooltip[#tooltip+1] = {func_currencyicon(1819)..func_currencyName(1819), CharInfo.CurrencyID_Total[1819]}
				tooltip[#tooltip+1] = {func_currencyicon(1931)..func_currencyName(1931), CharInfo.CurrencyID_Total[1931]}
				tooltip[#tooltip+1] = {func_currencyicon(1767)..func_currencyName(1767), CharInfo.CurrencyID_Total[1767]}
				tooltip[#tooltip+1] = {func_currencyicon(1885)..func_currencyName(1885), CharInfo.CurrencyID_Total[1885]}
				tooltip[#tooltip+1] = {func_currencyicon(1820)..func_currencyName(1820), CharInfo.CurrencyID_Total[1820]} -- Насыщенный рубин
				tooltip[#tooltip+1] = {func_currencyicon(1816)..func_currencyName(1816), CharInfo.CurrencyID_Total[1816]}
				if CharInfo.Possible_Anima == 0 and CharInfo.Possible_CatalogedResearch == 0 then
					VivodCent = Gray_Color..CURRENCY.."|r"
				end
				if CharInfo.Possible_Anima ~= 0 then
					VivodCent = VivodCent..Blue_Color..CharInfo.Possible_Anima.."|r"
				end
				if CharInfo.Possible_CatalogedResearch ~= 0 then
					VivodCent = VivodCent.." "..Rift_Color..CharInfo.Possible_CatalogedResearch.."|r"
				end
				-- Korthia
				if CharInfo.OctoTable_QuestID[64367] ~= Addon_Color.."Done|r" then
					tooltip[#tooltip+1] = {func_itemTexture(187136)..func_itemName(187136), Rift_Color.."(Korthia)|r".."Нужно купить +50%".. func_currencyicon(1931)}
					VivodCent = VivodCent..Rift_Color.."-".."|r"
				end
				-- ZM
				if CharInfo.OctoTable_QuestID[65282] ~= Addon_Color.."Done|r" then
					tooltip[#tooltip+1] = {func_itemTexture(188793)..func_itemName(188793), Cyan_Color.."(ZerethMortis)|r".."Нужно купить +50%".. func_currencyicon(1979)}
					VivodCent = VivodCent..Cyan_Color.."-".."|r"
				end
				VivodLeft = L["Transferable Anima"]..": "..Blue_Color..TotalTransAnima.."|r"
			end
			-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
			if Octo_ToDo_DragonflyVars.config.LINE_BattleforAzeroth then
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {" "..Blue_Color.."Battle for Azeroth".."|r", " "}
				tooltip[#tooltip+1] = {func_currencyicon(1580)..Blue_Color.."("..L["Coins"]..") |r"..func_currencyName(1580), CharInfo.CurrencyID_Total[1580].."(+"..CharInfo.Octopussy_BfA_Weekly_coinsQuests_count..")"} -- Печать судьбы воина
				tooltip[#tooltip+1] = {func_currencyicon(1803)..func_currencyName(1803), CharInfo.CurrencyID_Total[1803]}
				tooltip[#tooltip+1] = {func_currencyicon(1721)..func_currencyName(1721), CharInfo.CurrencyID_Total[1721]}
				tooltip[#tooltip+1] = {func_currencyicon(1587)..func_currencyName(1587), CharInfo.CurrencyID_Total[1587]}
				tooltip[#tooltip+1] = {func_currencyicon(1299)..func_currencyName(1299), CharInfo.CurrencyID_Total[1299]}
				tooltip[#tooltip+1] = {func_currencyicon(1565)..func_currencyName(1565), CharInfo.CurrencyID_Total[1565]}
				tooltip[#tooltip+1] = {func_currencyicon(1715)..func_currencyName(1715), CharInfo.CurrencyID_Total[1715]}
				tooltip[#tooltip+1] = {func_currencyicon(1755)..func_currencyName(1755), CharInfo.CurrencyID_Total[1755]}
				tooltip[#tooltip+1] = {func_currencyicon(1710)..func_currencyName(1710), CharInfo.CurrencyID_Total[1710]}
				if CharInfo.Faction == "Horde" then
					tooltip[#tooltip+1] = {func_currencyicon(1716)..func_currencyName(1716), CharInfo.CurrencyID_Total[1716]}
				else
					tooltip[#tooltip+1] = {func_currencyicon(1717)..func_currencyName(1717), CharInfo.CurrencyID_Total[1717]}
				end
				tooltip[#tooltip+1] = {func_currencyicon(1560)..func_currencyName(1560), CharInfo.CurrencyID_Total[1560]}
				tooltip[#tooltip+1] = {func_currencyicon(1719)..func_currencyName(1719), CharInfo.CurrencyID_Total[1719]}
				tooltip[#tooltip+1] = {func_currencyicon(1718)..func_currencyName(1718), CharInfo.CurrencyID_Total[1718]}
			end
			-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
			if Octo_ToDo_DragonflyVars.config.LINE_Legion then
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {" "..Blue_Color.."Legion".."|r", " "}
				tooltip[#tooltip+1] = {func_currencyicon(1273)..Blue_Color.."("..L["Coins"]..") |r"..func_currencyName(1273), CharInfo.CurrencyID_Total[1273].."(+"..CharInfo.Octopussy_Legion_Weekly_coinsQuests_count..")"} -- Печать сломанной судьбы
				tooltip[#tooltip+1] = {func_currencyicon(1356)..func_currencyName(1356),CharInfo.CurrencyID_Total[1356]}
				tooltip[#tooltip+1] = {func_currencyicon(1275)..func_currencyName(1275),CharInfo.CurrencyID_Total[1275]}
				tooltip[#tooltip+1] = {func_currencyicon(1357)..func_currencyName(1357),CharInfo.CurrencyID_Total[1357]}
				tooltip[#tooltip+1] = {func_currencyicon(1508)..func_currencyName(1508),CharInfo.CurrencyID_Total[1508]}
				tooltip[#tooltip+1] = {func_currencyicon(1416)..func_currencyName(1416),CharInfo.CurrencyID_Total[1416]}
				tooltip[#tooltip+1] = {func_currencyicon(1342)..func_currencyName(1342),CharInfo.CurrencyID_Total[1342]}
				tooltip[#tooltip+1] = {func_currencyicon(1355)..func_currencyName(1355),CharInfo.CurrencyID_Total[1355]}
				tooltip[#tooltip+1] = {func_currencyicon(1154)..func_currencyName(1154),CharInfo.CurrencyID_Total[1154]}
				tooltip[#tooltip+1] = {func_currencyicon(1314)..func_currencyName(1314),CharInfo.CurrencyID_Total[1314]}
				tooltip[#tooltip+1] = {func_currencyicon(1149)..func_currencyName(1149),CharInfo.CurrencyID_Total[1149]}
				tooltip[#tooltip+1] = {func_currencyicon(1533)..func_currencyName(1533),CharInfo.CurrencyID_Total[1533]}
				tooltip[#tooltip+1] = {func_currencyicon(1226)..func_currencyName(1226),CharInfo.CurrencyID_Total[1226]}
				tooltip[#tooltip+1] = {func_currencyicon(1155)..func_currencyName(1155),CharInfo.CurrencyID_Total[1155]}
				tooltip[#tooltip+1] = {func_currencyicon(1220)..func_currencyName(1220),CharInfo.CurrencyID_Total[1220]}
				tooltip[#tooltip+1] = {func_currencyicon(1268)..func_currencyName(1268),CharInfo.CurrencyID_Total[1268]}
			end
			-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
			if Octo_ToDo_DragonflyVars.config.LINE_WarlordsofDraenor then
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {" "..Blue_Color.."Warlords of Draenor".."|r", " "}
				tooltip[#tooltip+1] = {func_currencyicon(1129)..Blue_Color.."("..L["Coins"]..") |r"..func_currencyName(1129), CharInfo.CurrencyID_Total[1129].."(+"..CharInfo.Octopussy_WoD_Weekly_coinsQuests_count..")"} -- Печать неизбежной судьбы
				tooltip[#tooltip+1] = {func_currencyicon(994)..Blue_Color.."("..L["Coins"]..") |r"..func_currencyName(994), CharInfo.CurrencyID_Total[994]} -- Печать закаленной судьбы
				tooltip[#tooltip+1] = {func_currencyicon(823)..func_currencyName(823),CharInfo.CurrencyID_Total[823]}
				tooltip[#tooltip+1] = {func_currencyicon(824)..func_currencyName(824),CharInfo.CurrencyID_Total[824]}
				tooltip[#tooltip+1] = {func_currencyicon(1101)..func_currencyName(1101),CharInfo.CurrencyID_Total[1101]}
				tooltip[#tooltip+1] = {func_currencyicon(980)..func_currencyName(980),CharInfo.CurrencyID_Total[980]}
				tooltip[#tooltip+1] = {func_currencyicon(1017)..func_currencyName(1017),CharInfo.CurrencyID_Total[1017]}
				tooltip[#tooltip+1] = {func_currencyicon(910)..func_currencyName(910),CharInfo.CurrencyID_Total[910]}
				tooltip[#tooltip+1] = {func_currencyicon(944)..func_currencyName(944),CharInfo.CurrencyID_Total[944]}
				tooltip[#tooltip+1] = {func_currencyicon(1008)..func_currencyName(1008),CharInfo.CurrencyID_Total[1008]}
				tooltip[#tooltip+1] = {func_currencyicon(1020)..func_currencyName(1020),CharInfo.CurrencyID_Total[1020]}
				tooltip[#tooltip+1] = {func_currencyicon(999)..func_currencyName(999),CharInfo.CurrencyID_Total[999]}
			end
			-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
			if Octo_ToDo_DragonflyVars.config.LINE_MistsofPandaria then
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {" "..Blue_Color.."Mists of Pandaria".."|r", " "}
				tooltip[#tooltip+1] = {func_currencyicon(697)..Blue_Color.."("..L["Coins"]..") |r"..func_currencyName(697), CharInfo.CurrencyID_Total[697]} -- Большой амулет удачи
				tooltip[#tooltip+1] = {func_currencyicon(776)..Blue_Color.."("..L["Coins"]..") |r"..func_currencyName(776), CharInfo.CurrencyID_Total[776]} -- Закаленная в бою печать
				tooltip[#tooltip+1] = {func_currencyicon(777)..func_currencyName(777),CharInfo.CurrencyID_Total[777]}
				tooltip[#tooltip+1] = {func_currencyicon(738)..func_currencyName(738),CharInfo.CurrencyID_Total[738]}
				tooltip[#tooltip+1] = {func_currencyicon(752)..func_currencyName(752),CharInfo.CurrencyID_Total[752]}
				tooltip[#tooltip+1] = {func_currencyicon(789)..func_currencyName(789),CharInfo.CurrencyID_Total[789]}
			end
			-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
			if Octo_ToDo_DragonflyVars.config.LINE_Cataclysm then
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {" "..Blue_Color.."Cataclysm".."|r", " "}
				tooltip[#tooltip+1] = {func_currencyicon(416)..func_currencyName(416),CharInfo.CurrencyID_Total[416]}
				tooltip[#tooltip+1] = {func_currencyicon(361)..func_currencyName(361),CharInfo.CurrencyID_Total[361]}
				tooltip[#tooltip+1] = {func_currencyicon(615)..func_currencyName(615),CharInfo.CurrencyID_Total[615]}
				tooltip[#tooltip+1] = {func_currencyicon(614)..func_currencyName(614),CharInfo.CurrencyID_Total[614]}
			end
			-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
			if Octo_ToDo_DragonflyVars.config.LINE_WrathoftheLichKing then
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {" "..Blue_Color.."Wrath of the Lich King".."|r", " "}
				tooltip[#tooltip+1] = {func_currencyicon(241)..func_currencyName(241),CharInfo.CurrencyID_Total[241]}
				tooltip[#tooltip+1] = {func_currencyicon(61)..func_currencyName(61),CharInfo.CurrencyID_Total[61]}
			end
			-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
			if Octo_ToDo_DragonflyVars.config.LINE_TheBurningCrusade then
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {Blue_Color.."The Burning Crusade".."|r", " "}
				tooltip[#tooltip+1] = {func_currencyicon(1704)..func_currencyName(1704),CharInfo.CurrencyID_Total[1704]}
			end
			-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
			if #tooltip > 0 then
				tooltip[#tooltip+1] = {" ", " "}
			end
			tooltip[#tooltip+1] = {" "..Blue_Color..L["Other"].."|r", " "}
			tooltip[#tooltip+1] = {func_currencyicon(2032)..func_currencyName(2032), func_currencyquantity(2032)} -- Торговый жетон
			tooltip[#tooltip+1] = {func_currencyicon(81)..func_currencyName(81), CharInfo.CurrencyID_Total[81]} -- Награда гурмана
			tooltip[#tooltip+1] = {func_currencyicon(1379)..func_currencyName(1379), CharInfo.CurrencyID_Total[1379]} -- Жетон шоу "Наденьте это немедленно!"
			tooltip[#tooltip+1] = {func_currencyicon(515)..func_currencyName(515), CharInfo.CurrencyID_Total[515]} -- Призовой купон ярмарки Новолуния
			tooltip[#tooltip+1] = {func_currencyicon(402)..func_currencyName(402), CharInfo.CurrencyID_Total[402]} -- Жетон Железной Лапы
			-- tooltip[#tooltip+1] = {func_currencyicon(1401)..func_currencyName(1401), CharInfo.CurrencyID_Total[1401]} -- Припасы крепости
			-- tooltip[#tooltip+1] = {func_currencyicon(1388)..func_currencyName(1388), CharInfo.CurrencyID_Total[1388]} -- Металлолом
			tooltip[#tooltip+1] = {" "," "}
			tooltip[#tooltip+1] = {Blue_Color..GROUP_FINDER.."|r",""}
			tooltip[#tooltip+1] = {func_currencyicon(1166)..func_currencyName(1166), CharInfo.CurrencyID_Total[1166]} -- Искаженный временем знак
			if #tooltip > 0 then
				tooltip[#tooltip+1] = {" ", " "}
			end
			tooltip[#tooltip+1] = {" "..Blue_Color.."PvP".."|r", " "}
			tooltip[#tooltip+1] = {func_currencyicon(1602)..func_currencyName(1602), CharInfo.CurrencyID_Total[1602]} -- Очки завоевания
			tooltip[#tooltip+1] = {func_currencyicon(1792)..func_currencyName(1792), CharInfo.CurrencyID_Total[1792]} -- Честь
			tooltip[#tooltip+1] = {func_currencyicon(2123)..func_currencyName(2123), CharInfo.CurrencyID_Total[2123]} -- Кровавые жетоны
			if Octo_ToDo_DragonflyVars.config.LINE_Cataclysm then
				tooltip[#tooltip+1] = {func_currencyicon(391)..func_currencyName(391), CharInfo.CurrencyID_Total[391]} -- Рекомендательный значок Тол Барада
			end
			if #tooltip ~= 0 then
				VivodCent = Gray_Color..CURRENCY.."|r"
			end
			return VivodCent, VivodLeft
	end)
	-- РЕПУТАЦИЯ
	tinsert(OctoTable_func_otrisovka,
		function(CharInfo, tooltip, CL, BG)
			local VivodCent, VivodLeft = "", ""
			for k,v in ipairs (OctoTable_itemID_Reputation) do
				if CharInfo.ItemsInBag[v] ~= 0 then
					tooltip[#tooltip+1] = {func_itemTexture(v)..func_itemName(v), CharInfo.ItemsInBag[v]}
				end
			end
			if Octo_ToDo_DragonflyVars.config.LINE_Dragonflight then
				-- if #tooltip > 0 then
				-- tooltip[#tooltip+1] = {" ", " "}
				-- end
				-- tooltip[#tooltip+1] = {Blue_Color..ITEMS.."|r", " "}
				-- 0None
				-- 1Kyrian
				-- 4Necrolord
				-- 3NightFae
				-- 2Venthyr
				if #tooltip > 0 then
					tooltip[#tooltip+1] = {" ", " "}
				end
				tooltip[#tooltip+1] = {" "..Blue_Color.."Dragonflight".."|r", " "}
				tooltip[#tooltip+1] = {func_reputationName(2507), CharInfo.reputationID[2507]}
				tooltip[#tooltip+1] = {func_reputationName(2503), CharInfo.reputationID[2503]}
				tooltip[#tooltip+1] = {func_reputationName(2511), CharInfo.reputationID[2511]}
				tooltip[#tooltip+1] = {func_reputationName(2510), CharInfo.reputationID[2510]}
				tooltip[#tooltip+1] = {func_reputationName(2564), CharInfo.reputationID[2564]}
				tooltip[#tooltip+1] = {func_reputationName(2568), CharInfo.reputationID[2568]}
				tooltip[#tooltip+1] = {func_reputationName(2544), CharInfo.reputationID[2544]}
				tooltip[#tooltip+1] = {func_reputationName(2526), CharInfo.reputationID[2526]}
				tooltip[#tooltip+1] = {func_reputationName(2550), CharInfo.reputationID[2550]}
				tooltip[#tooltip+1] = {func_reputationName(2517), CharInfo.reputationID[2517]}
				tooltip[#tooltip+1] = {func_reputationName(2518), CharInfo.reputationID[2518]}
			end
			if Octo_ToDo_DragonflyVars.config.LINE_Shadowlands then
				if #tooltip > 0 then
					tooltip[#tooltip+1] = {" ", " "}
				end
				tooltip[#tooltip+1] = {" "..Blue_Color.."Shadowlands".."|r", " "}
				tooltip[#tooltip+1] = { func_reputationName(2478), CharInfo.reputationID[2478]} -- Просветленные
				tooltip[#tooltip+1] = { func_reputationName(2470), CharInfo.reputationID[2470]} -- Легион Смерти
				tooltip[#tooltip+1] = { func_reputationName(2472), CharInfo.reputationID[2472]} -- Кодекс архивариуса
				tooltip[#tooltip+1] = { func_reputationName(2432), CharInfo.reputationID[2432]} -- Ве'нари
				tooltip[#tooltip+1] = {Kyrian_Icon..func_reputationName(2407), CharInfo.reputationID[2407]} -- Перерожденные
				tooltip[#tooltip+1] = {Necrolord_Icon..func_reputationName(2410), CharInfo.reputationID[2410]} -- Неумирающая армия
				tooltip[#tooltip+1] = {NightFae_Icon..func_reputationName(2465), CharInfo.reputationID[2465]} -- Дикая Охота
				tooltip[#tooltip+1] = {Venthyr_Icon..func_reputationName(2413), CharInfo.reputationID[2413]} -- Двор Жнецов
				tooltip[#tooltip+1] = { func_reputationName(2439), CharInfo.reputationID[2439]} -- Нераскаявшиеся
				-- if CharInfo.curCovID == 1 then -- 1Kyrian
				-- if #tooltip > 0 then
				-- tooltip[#tooltip+1] = {" ", " "}
				-- end
				-- tooltip[#tooltip+1] = {" "..Kyri_Color..L["Kyrian"].."|r", " "}
				-- end
				if CharInfo.curCovID == 4 then -- 4Necrolord
					if #tooltip > 0 then
						tooltip[#tooltip+1] = {" ", " "}
					end
					tooltip[#tooltip+1] = {" "..Necrolord_Icon..Necr_Color..L["Necrolord"].."|r", " "}
					tooltip[#tooltip+1] = {func_reputationName(2462), CharInfo.reputationID[2462]} -- Штопальщики
				end
				if CharInfo.curCovID == 3 then -- 3NightFae
					if #tooltip > 0 then
						tooltip[#tooltip+1] = {" ", " "}
					end
					tooltip[#tooltip+1] = {" "..NightFae_Icon..NFae_Color..L["Night Fae"].."|r", " "}
					tooltip[#tooltip+1] = {func_reputationName(2464), CharInfo.reputationID[2464]} -- Двор Ночи
					tooltip[#tooltip+1] = {func_reputationName(2463), CharInfo.reputationID[2463]} -- Чесночник
				end
				if CharInfo.curCovID == 2 then -- 2Venthyr
					if #tooltip > 0 then
						tooltip[#tooltip+1] = {" ", " "}
					end
					tooltip[#tooltip+1] = {" "..Venthyr_Icon..Vent_Color..L["Venthyr"].."|r", " "}
					tooltip[#tooltip+1] = {func_reputationName(2445), CharInfo.reputationID[2445]} -- Пепельный двор
					tooltip[#tooltip+1] = {func_reputationName(2449), CharInfo.reputationID[2449]} -- Графиня
					tooltip[#tooltip+1] = {func_reputationName(2455), CharInfo.reputationID[2455]} -- Хранитель склепа Каззир
					tooltip[#tooltip+1] = {func_reputationName(2457), CharInfo.reputationID[2457]} -- Великий мастер Воул
					tooltip[#tooltip+1] = {func_reputationName(2450), CharInfo.reputationID[2450]} -- Александрос Могрейн
					tooltip[#tooltip+1] = {func_reputationName(2456), CharInfo.reputationID[2456]} -- Дроман Алиот
					tooltip[#tooltip+1] = {func_reputationName(2446), CharInfo.reputationID[2446]} -- Баронесса Вайш
					tooltip[#tooltip+1] = {func_reputationName(2469), CharInfo.reputationID[2469]} -- Понимание фракталов
					tooltip[#tooltip+1] = {func_reputationName(2460), CharInfo.reputationID[2460]} -- Камнелоб
					tooltip[#tooltip+1] = {func_reputationName(2458), CharInfo.reputationID[2458]} -- Клейя и Пелагий
					tooltip[#tooltip+1] = {func_reputationName(2447), CharInfo.reputationID[2447]} -- Леди Лунная Ягода
					tooltip[#tooltip+1] = {func_reputationName(2454), CharInfo.reputationID[2454]} -- Чуфа
					tooltip[#tooltip+1] = {func_reputationName(2459), CharInfo.reputationID[2459]} -- Сика
					tooltip[#tooltip+1] = {func_reputationName(2448), CharInfo.reputationID[2448]} -- Миканикос
					tooltip[#tooltip+1] = {func_reputationName(2461), CharInfo.reputationID[2461]} -- Изобретатель чумы Марилет
					tooltip[#tooltip+1] = {func_reputationName(2451), CharInfo.reputationID[2451]} -- Капитан-егерь Корейн
					tooltip[#tooltip+1] = {func_reputationName(2452), CharInfo.reputationID[2452]} -- Полемарх Адрест
					tooltip[#tooltip+1] = {func_reputationName(2453), CharInfo.reputationID[2453]} -- Рендл и Дуборыл
				end
				-- tooltip[#tooltip+1] = { func_reputationName(2422), CharInfo.reputationID[2422]} -- Ночной народец
				-- tooltip[#tooltip+1] = { func_reputationName(2479), CharInfo.reputationID[2479]} -- Просветленные (идеал)
				-- tooltip[#tooltip+1] = { func_reputationName(2442), CharInfo.reputationID[2442]} -- Двор Жнецов (Идеал)
				-- tooltip[#tooltip+1] = { func_reputationName(2471), CharInfo.reputationID[2471]} -- Легион Смерти (идеал)
				-- tooltip[#tooltip+1] = { func_reputationName(2441), CharInfo.reputationID[2441]} -- Перерожденные (Идеал)
				-- tooltip[#tooltip+1] = { func_reputationName(2444), CharInfo.reputationID[2444]} -- Дикая Охота (Идеал)
				-- tooltip[#tooltip+1] = { func_reputationName(2474), CharInfo.reputationID[2474]} -- Ве'нари (идеал)
				-- tooltip[#tooltip+1] = { func_reputationName(2473), CharInfo.reputationID[2473]} -- Кодекс архивариуса (идеал)
				-- tooltip[#tooltip+1] = { func_reputationName(2440), CharInfo.reputationID[2440]} -- Неумирающая армия (Идеал)
			end
			if Octo_ToDo_DragonflyVars.config.LINE_BattleforAzeroth then
				if #tooltip > 0 then
					tooltip[#tooltip+1] = {" ", " "}
				end
				tooltip[#tooltip+1] = {Blue_Color.."Battle for Azeroth".."|r", " "}
				if CharInfo.Faction == "Horde" then
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(2103), CharInfo.reputationID[2103]} -- Империя Зандалари
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(2158), CharInfo.reputationID[2158]} -- Жители Вол'дуна
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(2373), CharInfo.reputationID[2373]} -- Освобожденные
					-- tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(2111), CharInfo.reputationID[2111]} -- Зандаларские динозавры
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(2157), CharInfo.reputationID[2157]} -- Армия Чести
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(2156), CharInfo.reputationID[2156]} -- Экспедиция Таланджи
				else
					-- tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(2160), CharInfo.reputationID[2160]} -- Адмиралтейство Праудмуров
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(2159), CharInfo.reputationID[2159]} -- 7-й легион
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(2400), CharInfo.reputationID[2400]} -- Клинки Волн
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(2395), CharInfo.reputationID[2395]} -- Улей Медокрылов
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(2161), CharInfo.reputationID[2161]} -- Орден Пылающих Углей
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(2162), CharInfo.reputationID[2162]} -- Орден Возрождения Шторма
					-- tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(2120), CharInfo.reputationID[2120]} -- Кул-Тирас - Тирагард
					-- tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(2264), CharInfo.reputationID[2264]} -- Кул-Тирас - Друствар
					-- tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(2265), CharInfo.reputationID[2265]} -- Кул-Тирас - долина Штормов
				end
				tooltip[#tooltip+1] = {func_reputationName(2417), CharInfo.reputationID[2417]} -- Ульдумский союз
				tooltip[#tooltip+1] = {func_reputationName(2415), CharInfo.reputationID[2415]} -- Раджани
				tooltip[#tooltip+1] = {func_reputationName(2391), CharInfo.reputationID[2391]} -- Ржавоболтское сопротивление
				tooltip[#tooltip+1] = {func_reputationName(2164), CharInfo.reputationID[2164]} -- Защитники Азерот
				tooltip[#tooltip+1] = {func_reputationName(2163), CharInfo.reputationID[2163]} -- Тортолланские искатели
				if CharInfo.Faction == "Horde" then
					tooltip[#tooltip+1] = {func_texturefromIcon(2267047)..func_reputationName(2389), CharInfo.reputationID[2389]} -- Нери Остроерш
					tooltip[#tooltip+1] = {func_texturefromIcon(2267047)..func_reputationName(2388), CharInfo.reputationID[2388]} -- Поэн Солежабрик
					tooltip[#tooltip+1] = {func_texturefromIcon(2267047)..func_reputationName(2390), CharInfo.reputationID[2390]} -- Вим Соленодух
				else
					tooltip[#tooltip+1] = {func_texturefromIcon(2267047)..func_reputationName(2375), CharInfo.reputationID[2375]} -- Мастер охоты Акана
					tooltip[#tooltip+1] = {func_texturefromIcon(2267047)..func_reputationName(2376), CharInfo.reputationID[2376]} -- Оракул Ори
					tooltip[#tooltip+1] = {func_texturefromIcon(2267047)..func_reputationName(2377), CharInfo.reputationID[2377]} -- Мастер клинка Иновари
				end
				tooltip[#tooltip+1] = {func_reputationName(2427), CharInfo.reputationID[2427]} -- Молодой акир
				-- tooltip[#tooltip+1] = {func_reputationName(2370), CharInfo.reputationID[2370]} -- Обучение динозавров – Дикорог
				-- tooltip[#tooltip+1] = {func_reputationName(2233), CharInfo.reputationID[2233]} -- Dino Training - Pterrodax
				-- tooltip[#tooltip+1] = {func_reputationName(2416), CharInfo.reputationID[2416]} -- Раджани (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2392), CharInfo.reputationID[2392]} -- Ржавоболтское сопротивление (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2385), CharInfo.reputationID[2385]} -- Армия Чести (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2384), CharInfo.reputationID[2384]} -- 7-й легион (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2381), CharInfo.reputationID[2381]} -- Орден Возрождения Шторма (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2379), CharInfo.reputationID[2379]} -- Адмиралтейство Праудмуров (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2378), CharInfo.reputationID[2378]} -- Империя Зандалари (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2382), CharInfo.reputationID[2382]} -- Жители Вол'дуна (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2383), CharInfo.reputationID[2383]} -- Орден Пылающих Углей (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2387), CharInfo.reputationID[2387]} -- Тортолланские искатели (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2386), CharInfo.reputationID[2386]} -- Защитники Азерот (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2380), CharInfo.reputationID[2380]} -- Экспедиция Таланджи (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2418), CharInfo.reputationID[2418]} -- Ульдумский союз (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2374), CharInfo.reputationID[2374]} -- Освобожденные (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2401), CharInfo.reputationID[2401]} -- Анкоа из клана Клинков Волн (идеал)
			end
			if Octo_ToDo_DragonflyVars.config.LINE_Legion then
				if #tooltip > 0 then
					tooltip[#tooltip+1] = {" ", " "}
				end
				tooltip[#tooltip+1] = {Blue_Color.."Legion".."|r", " "}
				tooltip[#tooltip+1] = {func_reputationName(2018), CharInfo.reputationID[2018]} -- Отмщение Когтя
				tooltip[#tooltip+1] = {func_reputationName(1975), CharInfo.reputationID[1975]} -- Кудесник Маргосс
				tooltip[#tooltip+1] = {func_reputationName(1859), CharInfo.reputationID[1859]} -- Помраченные
				tooltip[#tooltip+1] = {func_reputationName(2097), CharInfo.reputationID[2097]} -- Илиссия Водная
				tooltip[#tooltip+1] = {func_reputationName(1948), CharInfo.reputationID[1948]} -- Валарьяры
				tooltip[#tooltip+1] = {func_reputationName(1900), CharInfo.reputationID[1900]} -- Двор Фарондиса
				tooltip[#tooltip+1] = {func_reputationName(2098), CharInfo.reputationID[2098]} -- Хранительница Рейна
				tooltip[#tooltip+1] = {func_reputationName(1894), CharInfo.reputationID[1894]} -- Стражи
				tooltip[#tooltip+1] = {func_reputationName(2102), CharInfo.reputationID[2102]} -- Бесс
				tooltip[#tooltip+1] = {func_reputationName(2170), CharInfo.reputationID[2170]} -- Защитники Аргуса
				tooltip[#tooltip+1] = {func_reputationName(1828), CharInfo.reputationID[1828]} -- Племена Крутогорья
				tooltip[#tooltip+1] = {func_reputationName(1883), CharInfo.reputationID[1883]} -- Ткачи Снов
				tooltip[#tooltip+1] = {func_reputationName(2101), CharInfo.reputationID[2101]} -- Ша'лет
				tooltip[#tooltip+1] = {func_reputationName(2165), CharInfo.reputationID[2165]} -- Армия Света
				tooltip[#tooltip+1] = {func_reputationName(2135), CharInfo.reputationID[2135]} -- Хроми
				tooltip[#tooltip+1] = {func_reputationName(2045), CharInfo.reputationID[2045]} -- Армия погибели Легиона
				tooltip[#tooltip+1] = {func_reputationName(2099), CharInfo.reputationID[2099]} -- Акуле Речной Рог
				tooltip[#tooltip+1] = {func_reputationName(2100), CharInfo.reputationID[2100]} -- Корбин
				-- tooltip[#tooltip+1] = {func_reputationName(2089), CharInfo.reputationID[2089]} -- Помраченные (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2086), CharInfo.reputationID[2086]} -- Валарьяры (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2085), CharInfo.reputationID[2085]} -- Племена Крутогорья (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2090), CharInfo.reputationID[2090]} -- Стражи (идеал)
				-- tooltip[#tooltip+1] = {func_reputationName(2087), CharInfo.reputationID[2087]} -- Двор Фарондиса (идеал)
				tooltip[#tooltip+1] = {func_reputationName(1899), CharInfo.reputationID[1899]} -- Лунные стражи
				-- tooltip[#tooltip+1] = {func_reputationName(2091), CharInfo.reputationID[2091]} -- Армия погибели Легиона (идеал)
				tooltip[#tooltip+1] = {func_reputationName(1984), CharInfo.reputationID[1984]} -- Спасатели
				-- tooltip[#tooltip+1] = {func_reputationName(2166), CharInfo.reputationID[2166]} -- Армия Света (идеал)
				tooltip[#tooltip+1] = {func_reputationName(1815), CharInfo.reputationID[1815]} -- Выжившие из Гилнеаса
				-- tooltip[#tooltip+1] = {func_reputationName(2088), CharInfo.reputationID[2088]} -- Ткачи Снов (идеал)
				tooltip[#tooltip+1] = {func_reputationName(1947), CharInfo.reputationID[1947]} -- Иллидари
				tooltip[#tooltip+1] = {func_reputationName(1989), CharInfo.reputationID[1989]} -- Лунные стражи
				tooltip[#tooltip+1] = {func_reputationName(1862), CharInfo.reputationID[1862]} -- Жажда магии Окулета
				tooltip[#tooltip+1] = {func_reputationName(1888), CharInfo.reputationID[1888]} -- Яндвикские врайкулы
				tooltip[#tooltip+1] = {func_reputationName(1861), CharInfo.reputationID[1861]} -- Arcane Thirst (Silgryn) DEPRECATED
				tooltip[#tooltip+1] = {func_reputationName(1919), CharInfo.reputationID[1919]} -- Жажда магии Вальтруа
				tooltip[#tooltip+1] = {func_reputationName(1860), CharInfo.reputationID[1860]} -- Жажда магии Талисры
			end
			if Octo_ToDo_DragonflyVars.config.LINE_WarlordsofDraenor then
				if #tooltip > 0 then
					tooltip[#tooltip+1] = {" ", " "}
				end
				tooltip[#tooltip+1] = {Blue_Color.."Warlords of Draenor".."|r", " "}
				tooltip[#tooltip+1] = {func_reputationName(1445), CharInfo.reputationID[1445]}
				tooltip[#tooltip+1] = {func_reputationName(1711), CharInfo.reputationID[1711]}
				tooltip[#tooltip+1] = {func_reputationName(1708), CharInfo.reputationID[1708]}
				tooltip[#tooltip+1] = {func_reputationName(1849), CharInfo.reputationID[1849]}
				tooltip[#tooltip+1] = {func_reputationName(1710), CharInfo.reputationID[1710]}
				tooltip[#tooltip+1] = {func_reputationName(1515), CharInfo.reputationID[1515]}
				tooltip[#tooltip+1] = {func_reputationName(1850), CharInfo.reputationID[1850]}
				tooltip[#tooltip+1] = {func_reputationName(1731), CharInfo.reputationID[1731]}
				tooltip[#tooltip+1] = {func_reputationName(1847), CharInfo.reputationID[1847]}
				tooltip[#tooltip+1] = {func_reputationName(1848), CharInfo.reputationID[1848]}
				tooltip[#tooltip+1] = {func_reputationName(1738), CharInfo.reputationID[1738]}
				tooltip[#tooltip+1] = {func_reputationName(1733), CharInfo.reputationID[1733]}
				tooltip[#tooltip+1] = {func_reputationName(1735), CharInfo.reputationID[1735]}
				tooltip[#tooltip+1] = {func_reputationName(1740), CharInfo.reputationID[1740]}
				tooltip[#tooltip+1] = {func_reputationName(1739), CharInfo.reputationID[1739]}
				tooltip[#tooltip+1] = {func_reputationName(1520), CharInfo.reputationID[1520]}
				tooltip[#tooltip+1] = {func_reputationName(1737), CharInfo.reputationID[1737]}
				tooltip[#tooltip+1] = {func_reputationName(1741), CharInfo.reputationID[1741]}
				tooltip[#tooltip+1] = {func_reputationName(1736), CharInfo.reputationID[1736]}
				tooltip[#tooltip+1] = {func_reputationName(1732), CharInfo.reputationID[1732]}
			end
			if Octo_ToDo_DragonflyVars.config.LINE_MistsofPandaria then
				if #tooltip > 0 then
					tooltip[#tooltip+1] = {" ", " "}
				end
				tooltip[#tooltip+1] = {Blue_Color.."Mists of Pandaria".."|r", " "}
				tooltip[#tooltip+1] = {func_reputationName(1492), CharInfo.reputationID[1492]}
				tooltip[#tooltip+1] = {func_reputationName(1435), CharInfo.reputationID[1435]}
				tooltip[#tooltip+1] = {func_reputationName(1341), CharInfo.reputationID[1341]}
				tooltip[#tooltip+1] = {func_reputationName(1302), CharInfo.reputationID[1302]}
				tooltip[#tooltip+1] = {func_reputationName(1376), CharInfo.reputationID[1376]}
				tooltip[#tooltip+1] = {func_reputationName(1269), CharInfo.reputationID[1269]}
				tooltip[#tooltip+1] = {func_reputationName(1272), CharInfo.reputationID[1272]}
				tooltip[#tooltip+1] = {func_reputationName(1375), CharInfo.reputationID[1375]}
				tooltip[#tooltip+1] = {func_reputationName(1270), CharInfo.reputationID[1270]}
				tooltip[#tooltip+1] = {func_reputationName(1359), CharInfo.reputationID[1359]}
				tooltip[#tooltip+1] = {func_reputationName(1271), CharInfo.reputationID[1271]}
				tooltip[#tooltip+1] = {func_reputationName(1358), CharInfo.reputationID[1358]}
				tooltip[#tooltip+1] = {func_reputationName(1387), CharInfo.reputationID[1387]}
				tooltip[#tooltip+1] = {func_reputationName(1337), CharInfo.reputationID[1337]}
				tooltip[#tooltip+1] = {func_reputationName(1388), CharInfo.reputationID[1388]}
				tooltip[#tooltip+1] = {func_reputationName(1345), CharInfo.reputationID[1345]}
				tooltip[#tooltip+1] = {func_reputationName(1242), CharInfo.reputationID[1242]}
				tooltip[#tooltip+1] = {func_reputationName(1228), CharInfo.reputationID[1228]}
				tooltip[#tooltip+1] = {func_reputationName(1278), CharInfo.reputationID[1278]}
				tooltip[#tooltip+1] = {func_reputationName(1277), CharInfo.reputationID[1277]}
				tooltip[#tooltip+1] = {func_reputationName(1216), CharInfo.reputationID[1216]}
				tooltip[#tooltip+1] = {func_reputationName(1283), CharInfo.reputationID[1283]}
				tooltip[#tooltip+1] = {func_reputationName(1276), CharInfo.reputationID[1276]}
				tooltip[#tooltip+1] = {func_reputationName(1273), CharInfo.reputationID[1273]}
				tooltip[#tooltip+1] = {func_reputationName(1275), CharInfo.reputationID[1275]}
				tooltip[#tooltip+1] = {func_reputationName(1279), CharInfo.reputationID[1279]}
				tooltip[#tooltip+1] = {func_reputationName(1281), CharInfo.reputationID[1281]}
				tooltip[#tooltip+1] = {func_reputationName(1282), CharInfo.reputationID[1282]}
				tooltip[#tooltip+1] = {func_reputationName(1280), CharInfo.reputationID[1280]}
				tooltip[#tooltip+1] = {func_reputationName(1440), CharInfo.reputationID[1440]}
				tooltip[#tooltip+1] = {func_reputationName(1351), CharInfo.reputationID[1351]}
			end
			if Octo_ToDo_DragonflyVars.config.LINE_Cataclysm then
				if #tooltip > 0 then
					tooltip[#tooltip+1] = {" ", " "}
				end
				tooltip[#tooltip+1] = {Blue_Color.."Cataclysm".."|r", " "}
				tooltip[#tooltip+1] = {func_reputationName(1204), CharInfo.reputationID[1204]}
				tooltip[#tooltip+1] = {func_reputationName(1173), CharInfo.reputationID[1173]}
				tooltip[#tooltip+1] = {func_reputationName(1135), CharInfo.reputationID[1135]}
				tooltip[#tooltip+1] = {func_reputationName(1171), CharInfo.reputationID[1171]}
				tooltip[#tooltip+1] = {func_reputationName(1172), CharInfo.reputationID[1172]}
				tooltip[#tooltip+1] = {func_reputationName(1174), CharInfo.reputationID[1174]}
				tooltip[#tooltip+1] = {func_reputationName(1158), CharInfo.reputationID[1158]}
				tooltip[#tooltip+1] = {func_reputationName(1177), CharInfo.reputationID[1177]}
				tooltip[#tooltip+1] = {func_reputationName(1178), CharInfo.reputationID[1178]}
			end
			if Octo_ToDo_DragonflyVars.config.LINE_WrathoftheLichKing then
				if #tooltip > 0 then
					tooltip[#tooltip+1] = {" ", " "}
				end
				tooltip[#tooltip+1] = {Blue_Color.."Wrath of the Lich King".."|r", " "}
				tooltip[#tooltip+1] = {func_reputationName(1073), CharInfo.reputationID[1073]}
				tooltip[#tooltip+1] = {func_reputationName(1119), CharInfo.reputationID[1119]}
				tooltip[#tooltip+1] = {func_reputationName(1098), CharInfo.reputationID[1098]}
				tooltip[#tooltip+1] = {func_reputationName(1105), CharInfo.reputationID[1105]}
				tooltip[#tooltip+1] = {func_reputationName(1156), CharInfo.reputationID[1156]}
				tooltip[#tooltip+1] = {func_reputationName(1106), CharInfo.reputationID[1106]}
				tooltip[#tooltip+1] = {func_reputationName(1104), CharInfo.reputationID[1104]}
				tooltip[#tooltip+1] = {func_reputationName(1094), CharInfo.reputationID[1094]}
				tooltip[#tooltip+1] = {func_reputationName(1091), CharInfo.reputationID[1091]}
				tooltip[#tooltip+1] = {func_reputationName(1090), CharInfo.reputationID[1090]}
				tooltip[#tooltip+1] = {func_reputationName(1124), CharInfo.reputationID[1124]}
				tooltip[#tooltip+1] = {func_reputationName(1050), CharInfo.reputationID[1050]}
				tooltip[#tooltip+1] = {func_reputationName(1037), CharInfo.reputationID[1037]}
				tooltip[#tooltip+1] = {func_reputationName(1068), CharInfo.reputationID[1068]}
				tooltip[#tooltip+1] = {func_reputationName(1064), CharInfo.reputationID[1064]}
				tooltip[#tooltip+1] = {func_reputationName(1067), CharInfo.reputationID[1067]}
				tooltip[#tooltip+1] = {func_reputationName(1052), CharInfo.reputationID[1052]}
				tooltip[#tooltip+1] = {func_reputationName(1126), CharInfo.reputationID[1126]}
				tooltip[#tooltip+1] = {func_reputationName(1085), CharInfo.reputationID[1085]}
				tooltip[#tooltip+1] = {func_reputationName(1117), CharInfo.reputationID[1117]}
			end
			if Octo_ToDo_DragonflyVars.config.LINE_TheBurningCrusade then
				if #tooltip > 0 then
					tooltip[#tooltip+1] = {" ", " "}
				end
				tooltip[#tooltip+1] = {Blue_Color.."The Burning Crusade".."|r", " "}
				tooltip[#tooltip+1] = {func_reputationName(1015), CharInfo.reputationID[1015]}
				tooltip[#tooltip+1] = {func_reputationName(1031), CharInfo.reputationID[1031]}
				tooltip[#tooltip+1] = {func_reputationName(1038), CharInfo.reputationID[1038]}
				tooltip[#tooltip+1] = {func_reputationName(933), CharInfo.reputationID[933]}
				tooltip[#tooltip+1] = {func_reputationName(989), CharInfo.reputationID[989]}
				tooltip[#tooltip+1] = {func_reputationName(978), CharInfo.reputationID[978]}
				tooltip[#tooltip+1] = {func_reputationName(942), CharInfo.reputationID[942]}
				tooltip[#tooltip+1] = {func_reputationName(934), CharInfo.reputationID[934]}
				tooltip[#tooltip+1] = {func_reputationName(970), CharInfo.reputationID[970]}
				tooltip[#tooltip+1] = {func_reputationName(932), CharInfo.reputationID[932]}
				tooltip[#tooltip+1] = {func_reputationName(941), CharInfo.reputationID[941]}
				tooltip[#tooltip+1] = {func_reputationName(1077), CharInfo.reputationID[1077]}
				tooltip[#tooltip+1] = {func_reputationName(990), CharInfo.reputationID[990]}
				tooltip[#tooltip+1] = {func_reputationName(967), CharInfo.reputationID[967]}
				tooltip[#tooltip+1] = {func_reputationName(935), CharInfo.reputationID[935]}
				tooltip[#tooltip+1] = {func_reputationName(1011), CharInfo.reputationID[1011]}
				tooltip[#tooltip+1] = {func_reputationName(1012), CharInfo.reputationID[1012]}
				tooltip[#tooltip+1] = {func_reputationName(946), CharInfo.reputationID[946]}
				tooltip[#tooltip+1] = {func_reputationName(947), CharInfo.reputationID[947]}
				tooltip[#tooltip+1] = {func_reputationName(922), CharInfo.reputationID[922]}
				tooltip[#tooltip+1] = {func_reputationName(936), CharInfo.reputationID[936]}
			end
			if Octo_ToDo_DragonflyVars.config.LINE_Classic then
				if #tooltip > 0 then
					tooltip[#tooltip+1] = {" ", " "}
				end
				tooltip[#tooltip+1] = {Blue_Color.."Classic".."|r", " "}
				if CharInfo.Faction == "Alliance" then
					-- Alliance
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(469), CharInfo.reputationID[469]}
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(891), CharInfo.reputationID[891]}
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(2524), CharInfo.reputationID[2524]}
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(1353), CharInfo.reputationID[1353]}
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(72), CharInfo.reputationID[72]}
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(69), CharInfo.reputationID[69]}
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(47), CharInfo.reputationID[47]}
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(54), CharInfo.reputationID[54]}
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(1134), CharInfo.reputationID[1134]}
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(930), CharInfo.reputationID[930]}
					-- -- -- -- -- -
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(509), CharInfo.reputationID[509]}
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(1682), CharInfo.reputationID[1682]}
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(890), CharInfo.reputationID[890]}
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(730), CharInfo.reputationID[730]}
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(1419), CharInfo.reputationID[1419]}
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(1691), CharInfo.reputationID[1691]}
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(2011), CharInfo.reputationID[2011]}
					tooltip[#tooltip+1] = {Alliance_Icon..func_reputationName(2371), CharInfo.reputationID[2371]}
				end
				if CharInfo.Faction == "Horde" then
					-- Horde
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(67), CharInfo.reputationID[67]}
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(892), CharInfo.reputationID[892]}
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(2523), CharInfo.reputationID[2523]}
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(1352), CharInfo.reputationID[1352]}
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(911), CharInfo.reputationID[911]}
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(76), CharInfo.reputationID[76]}
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(530), CharInfo.reputationID[530]}
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(1133), CharInfo.reputationID[1133]}
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(81), CharInfo.reputationID[81]}
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(68), CharInfo.reputationID[68]}
					-- -- -- -- -- -
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(510), CharInfo.reputationID[510]}
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(1681), CharInfo.reputationID[1681]}
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(889), CharInfo.reputationID[889]}
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(729), CharInfo.reputationID[729]}
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(1374), CharInfo.reputationID[1374]}
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(1690), CharInfo.reputationID[1690]}
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(2010), CharInfo.reputationID[2010]}
					tooltip[#tooltip+1] = {Horde_Icon..func_reputationName(2372), CharInfo.reputationID[2372]}
				end
				tooltip[#tooltip+1] = {func_reputationName(349), CharInfo.reputationID[349]}
				tooltip[#tooltip+1] = {func_reputationName(87), CharInfo.reputationID[87]}
				tooltip[#tooltip+1] = {func_reputationName(749), CharInfo.reputationID[749]}
				tooltip[#tooltip+1] = {func_reputationName(529), CharInfo.reputationID[529]}
				tooltip[#tooltip+1] = {func_reputationName(21), CharInfo.reputationID[21]}
				tooltip[#tooltip+1] = {func_reputationName(169), CharInfo.reputationID[169]}
				tooltip[#tooltip+1] = {func_reputationName(70), CharInfo.reputationID[70]}
				tooltip[#tooltip+1] = {func_reputationName(369), CharInfo.reputationID[369]}
				tooltip[#tooltip+1] = {func_reputationName(609), CharInfo.reputationID[609]}
				tooltip[#tooltip+1] = {func_reputationName(576), CharInfo.reputationID[576]}
				tooltip[#tooltip+1] = {func_reputationName(577), CharInfo.reputationID[577]}
				tooltip[#tooltip+1] = {func_reputationName(59), CharInfo.reputationID[59]}
				tooltip[#tooltip+1] = {func_reputationName(470), CharInfo.reputationID[470]}
				tooltip[#tooltip+1] = {func_reputationName(910), CharInfo.reputationID[910]}
				tooltip[#tooltip+1] = {func_reputationName(270), CharInfo.reputationID[270]}
				-- tooltip[#tooltip+1] = {func_reputationName(589), CharInfo.reputationID[589]}
				tooltip[#tooltip+1] = {func_reputationName(809), CharInfo.reputationID[809]}
				tooltip[#tooltip+1] = {func_reputationName(92), CharInfo.reputationID[92]}
				tooltip[#tooltip+1] = {func_reputationName(909), CharInfo.reputationID[909]}
				tooltip[#tooltip+1] = {func_reputationName(93), CharInfo.reputationID[93]}
			end
			-- ТЕКСТ В ЦЕНТРЕ
			if #tooltip ~= 0 then
				VivodCent = Gray_Color..REPUTATION.."|r"
			end
			return VivodCent, VivodLeft
	end)
	-- ЗАДАНИЯ
	tinsert(OctoTable_func_otrisovka,
		function(CharInfo, tooltip, CL, BG)
			local VivodCent, VivodLeft = "", ""
			if Octo_ToDo_DragonflyVars.config.LINE_Dragonflight then
				tooltip[#tooltip+1] = {" "..Blue_Color.."Dragonflight".."|r", " "}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_DF_Weekly_WBALL_name, CharInfo.Octopussy_DF_Weekly_WBALL_count}
				tooltip[#tooltip+1] = {Timer_DF_ToDragonbaneKeep()..CharInfo.Octopussy_DF_Weekly_DragonbaneKeep_name, CharInfo.Octopussy_DF_Weekly_DragonbaneKeep_count}
				tooltip[#tooltip+1] = {Timer_DF_GrandHunts()..CharInfo.Octopussy_DF_Weekly_TheGrandHunt_name, CharInfo.Octopussy_DF_Weekly_TheGrandHunt_count}
				tooltip[#tooltip+1] = {Timer_DF_CommunityFeast()..CharInfo.Octopussy_DF_Weekly_Feast_name, CharInfo.Octopussy_DF_Weekly_Feast_count}
				tooltip[#tooltip+1] = {Timer_DF_PrimalStorms()..CharInfo.Octopussy_DF_Weekly_StormsFury_name, CharInfo.Octopussy_DF_Weekly_StormsFury_count}
				tooltip[#tooltip+1] = {Timer_DF_ResearchersUnderFire()..CharInfo.Octopussy_DF_Weekly_ResearchersUnderFire_name, CharInfo.Octopussy_DF_Weekly_ResearchersUnderFire_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_DF_Weekly_3kREP_name, CharInfo.Octopussy_DF_Weekly_3kREP_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_DF_Weekly_FightingisItsOwnReward_name, CharInfo.Octopussy_DF_Weekly_FightingisItsOwnReward_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_DF_Weekly_FyrakkAssaults_name, CharInfo.Octopussy_DF_Weekly_FyrakkAssaults_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_DF_Weekly_KeysofLoyalty_name, CharInfo.Octopussy_DF_Weekly_KeysofLoyalty_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_DF_Weekly_PVP_name, CharInfo.Octopussy_DF_Weekly_PVP_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_DF_Weekly_Timewalk500CURRENCY_name, CharInfo.Octopussy_DF_Weekly_Timewalk500CURRENCY_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_DF_Weekly_Timewalk5DUNGEONS_name, CharInfo.Octopussy_DF_Weekly_Timewalk5DUNGEONS_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_DF_Weekly_WeekendEvent_name, CharInfo.Octopussy_DF_Weekly_WeekendEvent_count}
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {" "..Blue_Color..L["Zaralek Cavern"].." (10.1.0)|r", " "}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_DF_Weekly_WBZaralekCavernZaqaliElders_name, CharInfo.Octopussy_DF_Weekly_WBZaralekCavernZaqaliElders_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_DF_Weekly_ZaralekCavernAWorthyAllyLoammNiffen_name, CharInfo.Octopussy_DF_Weekly_ZaralekCavernAWorthyAllyLoammNiffen_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_DF_Weekly_ZaralekCavernSniffenseeking_name, CharInfo.Octopussy_DF_Weekly_ZaralekCavernSniffenseeking_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_DF_Daily_ZaralekCavernEvents_name, CharInfo.Octopussy_DF_Daily_ZaralekCavernEvents_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_DF_Daily_ZaralekCavernRares_name, CharInfo.Octopussy_DF_Daily_ZaralekCavernRares_count}
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {" "..Blue_Color..L["The Forbidden Reach"].." (10.0.7)|r", " "}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_DF_Daily_TheForbiddenReachRares_name, CharInfo.Octopussy_DF_Daily_TheForbiddenReachRares_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_DF_Weekly_StormBoundChest_name, CharInfo.Octopussy_DF_Weekly_StormBoundChest_count}
			end
			if Octo_ToDo_DragonflyVars.config.LINE_Shadowlands then
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {" "..Blue_Color.."Shadowlands".."|r", " "}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_ReplenishtheReservoir_name, CharInfo.Octopussy_SL_Weekly_ReplenishtheReservoir_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_ReturnLostSouls_name, CharInfo.Octopussy_SL_Weekly_ReturnLostSouls_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_TradingFavors_name, CharInfo.Octopussy_SL_Weekly_TradingFavors_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_WBALL_name, CharInfo.Octopussy_SL_Weekly_WBALL_count}
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {" "..Blue_Color..L["Zereth Mortis"].."|r", " "}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_ZMPatternsWithinPatterns_name, CharInfo.Octopussy_SL_Weekly_ZMPatternsWithinPatterns_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_WBZMAntros_name, CharInfo.Octopussy_SL_Weekly_WBZMAntros_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_ZMGetLockStatus_name, CharInfo.Octopussy_SL_Daily_ZMGetLockStatus_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_ZMPryingEyeDiscovery_name, CharInfo.Octopussy_SL_Daily_ZMPryingEyeDiscovery_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_ZMPUZZLECACHES_name, CharInfo.Octopussy_SL_Daily_ZMPUZZLECACHES_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_ZMRares_name, CharInfo.Octopussy_SL_Daily_ZMRares_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_ZMRaresDuneDominance_name, CharInfo.Octopussy_SL_Daily_ZMRaresDuneDominance_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_ZMTREASURES_name, CharInfo.Octopussy_SL_Daily_ZMTREASURES_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_ZMworldQuests_name, CharInfo.Octopussy_SL_Daily_ZMworldQuests_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Once_ZMConcordance_name, CharInfo.Octopussy_SL_Once_ZMConcordance_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Once_ZMUndulatingFoliage_name, CharInfo.Octopussy_SL_Once_ZMUndulatingFoliage_count}
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {" "..Blue_Color..L["Korthia"].."|r", " "}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_KorthiaCollection_name, CharInfo.Octopussy_SL_Daily_KorthiaCollection_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_KorthiaKorthianAnimaVessel_name, CharInfo.Octopussy_SL_Daily_KorthiaKorthianAnimaVessel_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_KorthiaMobs_name, CharInfo.Octopussy_SL_Daily_KorthiaMobs_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_KorthiaRelicGorger_name, CharInfo.Octopussy_SL_Daily_KorthiaRelicGorger_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_RIFTKorthiaStolenAnimaVessel_name, CharInfo.Octopussy_SL_Weekly_RIFTKorthiaStolenAnimaVessel_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_RIFTKorthiaRiftboundCache_name, CharInfo.Octopussy_SL_Daily_RIFTKorthiaRiftboundCache_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_RIFTKorthiaSpectralBoundChest_name, CharInfo.Octopussy_SL_Daily_RIFTKorthiaSpectralBoundChest_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_RIFTKorthiaZovaalsVault_name, CharInfo.Octopussy_SL_Daily_RIFTKorthiaZovaalsVault_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_KorthiaLostResearch_name, CharInfo.Octopussy_SL_Weekly_KorthiaLostResearch_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_KorthiaRares_name, CharInfo.Octopussy_SL_Weekly_KorthiaRares_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_KorthiaShapingFate_name, CharInfo.Octopussy_SL_Weekly_KorthiaShapingFate_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_KorthiaStolenKorthianSupplies_name, CharInfo.Octopussy_SL_Weekly_KorthiaStolenKorthianSupplies_count}
				-- tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Once_ITEMKorthiaResearchReportAdaptiveAlloys_name, CharInfo.Octopussy_SL_Once_ITEMKorthiaResearchReportAdaptiveAlloys_count}
				-- tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Once_ITEMKorthiaResearchReportAllSeeingCrystal_name, CharInfo.Octopussy_SL_Once_ITEMKorthiaResearchReportAllSeeingCrystal_count}
				-- tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Once_ITEMKorthiaResearchReportFirstAlloys_name, CharInfo.Octopussy_SL_Once_ITEMKorthiaResearchReportFirstAlloys_count}
				-- tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Once_ITEMKorthiaResearchReportRelicExaminationTechniques_name, CharInfo.Octopussy_SL_Once_ITEMKorthiaResearchReportRelicExaminationTechniques_count}
				-- tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Once_ITEMKorthiaTreatiseBondsofStygiainMortals_name, CharInfo.Octopussy_SL_Once_ITEMKorthiaTreatiseBondsofStygiainMortals_count}
				-- tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Once_ITEMKorthiaTreatiseRecognizingStygiaanditsUses_name, CharInfo.Octopussy_SL_Once_ITEMKorthiaTreatiseRecognizingStygiaanditsUses_count}
				-- tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Once_ITEMKorthiaTreatiseRelicsAboundintheShadowlands_name, CharInfo.Octopussy_SL_Once_ITEMKorthiaTreatiseRelicsAboundintheShadowlands_count}
				-- tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Once_ITEMKorthiaTreatiseTheStudyofAnimaandHarnessingEveryDrop_name, CharInfo.Octopussy_SL_Once_ITEMKorthiaTreatiseTheStudyofAnimaandHarnessingEveryDrop_count}
				-- tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Once_ITEMKorthiaVaultAnimaTracker_name, CharInfo.Octopussy_SL_Once_ITEMKorthiaVaultAnimaTracker_count}
				-- tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Once_ITEMKorthiaResearchReportAncientShrines_name, CharInfo.Octopussy_SL_Once_ITEMKorthiaResearchReportAncientShrines_count}
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {" "..Blue_Color..L["Maw"].."|r", " "}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_WBMawMorgeth_name, CharInfo.Octopussy_SL_Weekly_WBMawMorgeth_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_MawContainingtheHelsworn_name, CharInfo.Octopussy_SL_Weekly_MawContainingtheHelsworn_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_MawQuest_name, CharInfo.Octopussy_SL_Daily_MawQuest_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_MawHelswornChest_name, CharInfo.Octopussy_SL_Daily_MawHelswornChest_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_MawCovenantAssault_name, CharInfo.Octopussy_SL_Weekly_MawCovenantAssault_count}
				tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_MawTorghast_name, CharInfo.Octopussy_SL_Weekly_MawTorghast_count}
				-- tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_MawContainingtheHelsworn_name, CharInfo.Octopussy_SL_Weekly_MawContainingtheHelsworn_count}
				-- tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_MawCovenantAssault_name, CharInfo.Octopussy_SL_Weekly_MawCovenantAssault_count}
				-- tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_WBMawMorgeth_name, CharInfo.Octopussy_SL_Weekly_WBMawMorgeth_count}
				-- tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Weekly_MawTorghast_name, CharInfo.Octopussy_SL_Weekly_MawTorghast_count}
				-- tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_MawHelswornChest_name, CharInfo.Octopussy_SL_Daily_MawHelswornChest_count}
				-- tooltip[#tooltip+1] = {CharInfo.Octopussy_SL_Daily_MawQuest_name, CharInfo.Octopussy_SL_Daily_MawQuest_count}
			end
			if CharInfo.classFilename == "WARRIOR" or CharInfo.classFilename == "PALADIN" or CharInfo.classFilename == "DEATHKNIGHT" or CharInfo.classFilename == "WARLOCK" then
				if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
				tooltip[#tooltip+1] = {" "..Blue_Color..L["Class quests"].."|r"," "}
				if CharInfo.classFilename == "WARRIOR" or CharInfo.classFilename == "PALADIN" or CharInfo.classFilename == "DEATHKNIGHT" then
					tooltip[#tooltip+1] = {CharInfo.Octopussy_WotLK_Once_Shadowmourne_name, CharInfo.Octopussy_WotLK_Once_Shadowmourne_count}
				end
				if CharInfo.classFilename == "WARLOCK" then
					tooltip[#tooltip+1] = {CharInfo.Octopussy_MoP_Once_Warlock_name, CharInfo.Octopussy_MoP_Once_Warlock_count}
				end
			end
			if #tooltip ~= 0 then
				VivodCent = Gray_Color..QUESTS_LABEL.."|r"
			end
			return VivodCent, VivodLeft
	end)
	-- ПРЕДМЕТЫ
	tinsert(OctoTable_func_otrisovka,
		function(CharInfo, tooltip, CL, BG)
			local VivodCent, VivodLeft = "", ""
			-- ТЕКСТ В ЦЕНТРЕ
			for k, v in ipairs(OctoTable_itemID_ALL) do
				local count = tonumber(CharInfo.ItemsInBag[v])
				if count ~= 0 then
					tooltip[#tooltip+1] = {func_itemTexture(v)..func_itemName(v), count}
				end
			end
			if #tooltip > 0 then tooltip[#tooltip+1] = {" ", " "} end
			for k, v in ipairs(CharInfo.VOID_STORAGE_PAGE1) do
				if v ~= 0 then
					tooltip[#tooltip+1] = {func_itemTexture(CharInfo.VOID_STORAGE_PAGE1[k])..func_itemName(CharInfo.VOID_STORAGE_PAGE1[k])}
				end
			end
			for k, v in ipairs(CharInfo.VOID_STORAGE_PAGE2) do
				if v ~= 0 then
					tinsert(tooltip,{func_itemTexture(CharInfo.VOID_STORAGE_PAGE2[k])..func_itemName(CharInfo.VOID_STORAGE_PAGE2[k])})
				end
			end
			if #tooltip ~= 0 then
				VivodCent = Gray_Color..ITEMS.."|r"
			end
			return VivodCent, VivodLeft
	end)
	-- ПРОФЕССИИ
	tinsert(OctoTable_func_otrisovka,
		function(CharInfo, tooltip, CL, BG)
			local VivodCent, VivodLeft = "", ""
			if CharInfo.prof1 ~= 0 or CharInfo.prof2 ~= 0 then
				tooltip[#tooltip+1]= {Empty_Zero(CharInfo.profID_prof1.icon)..Purple_Color..Empty_Zero(CharInfo.profID_prof1.name).."|r"}
				tooltip[#tooltip+1]= {"Сундуки", CharInfo.profID_prof1.chest.chest_count_prof1.."/"..CharInfo.profID_prof1.chest.questReq}
				tooltip[#tooltip+1]= {"Лут", CharInfo.profID_prof1.drops.drops_count_prof1.."/"..CharInfo.profID_prof1.drops.questReq}
				tooltip[#tooltip+1]= {"Квест", CharInfo.profID_prof1.profQuest.profQuest_count_prof1.."/"..CharInfo.profID_prof1.profQuest.questReq}
				tooltip[#tooltip+1]= {"Трактаты", CharInfo.profID_prof1.treatise.treatise_count_prof1.."/"..CharInfo.profID_prof1.treatise.questReq}
				tooltip[#tooltip+1]= {"Крафт", CharInfo.profID_prof1.craftOrder.craftOrder_count_prof1.."/"..CharInfo.profID_prof1.craftOrder.questReq}
				tooltip[#tooltip+1]= {" ", " "}
				tooltip[#tooltip+1]= {Empty_Zero(CharInfo.profID_prof2.icon)..Purple_Color..Empty_Zero(CharInfo.profID_prof2.name).."|r"}
				tooltip[#tooltip+1]= {"Сундуки", CharInfo.profID_prof2.chest.chest_count_prof2.."/"..CharInfo.profID_prof2.chest.questReq}
				tooltip[#tooltip+1]= {"Лут", CharInfo.profID_prof2.drops.drops_count_prof2.."/"..CharInfo.profID_prof2.drops.questReq}
				tooltip[#tooltip+1]= {"Квест", CharInfo.profID_prof2.profQuest.profQuest_count_prof2.."/"..CharInfo.profID_prof2.profQuest.questReq}
				tooltip[#tooltip+1]= {"Трактаты", CharInfo.profID_prof2.treatise.treatise_count_prof2.."/"..CharInfo.profID_prof2.treatise.questReq}
				tooltip[#tooltip+1]= {"Крафт", CharInfo.profID_prof2.craftOrder.craftOrder_count_prof2.."/"..CharInfo.profID_prof2.craftOrder.questReq}
				tooltip[#tooltip+1]= {" ", " "}
			end
			-- Бутилированная сущность
			if CharInfo.ItemsInBag[199197] >= 1 then
				tooltip[#tooltip+1] = {func_itemTexture(199197)..func_itemName(199197), CharInfo.ItemsInBag[199197]}
			else
				tooltip[#tooltip+1] = {func_itemTexture(199197)..Gray_Color..func_itemName_NOCOLOR(199197).."|r", Gray_Color..CharInfo.ItemsInBag[199197].."|r"}
			end
			-- Искра искусности
			if CharInfo.ItemsInBag[190453] >= 1 then
				tooltip[#tooltip+1] = {func_itemTexture(190453)..func_itemName(190453), CharInfo.ItemsInBag[190453]}
			else
				tooltip[#tooltip+1] = {func_itemTexture(190453)..Gray_Color..func_itemName_NOCOLOR(190453).."|r", Gray_Color..CharInfo.ItemsInBag[190453].."|r"}
			end
			-- Драконий осколок знания
			if CharInfo.ItemsInBag[191784] >= 1 then
				tooltip[#tooltip+1] = {func_itemTexture(191784)..func_itemName(191784), CharInfo.ItemsInBag[191784]}
			else
				tooltip[#tooltip+1] = {func_itemTexture(191784)..Gray_Color..func_itemName_NOCOLOR(191784).."|r", Gray_Color..CharInfo.ItemsInBag[191784].."|r"}
			end
			-- Обменный кирпич
			if CharInfo.ItemsInBag[204985] >= 1 then
				tooltip[#tooltip+1] = {func_itemTexture(204985)..func_itemName(204985), CharInfo.ItemsInBag[204985]}
			else
				tooltip[#tooltip+1] = {func_itemTexture(204985)..Gray_Color..func_itemName_NOCOLOR(204985).."|r", Gray_Color..CharInfo.ItemsInBag[204985].."|r"}
			end
			--
			if CharInfo.ItemsInBag[204715] >= 1 then
				tooltip[#tooltip+1] = {func_itemTexture(204715)..func_itemName(204715), CharInfo.ItemsInBag[204715]}
			else
				tooltip[#tooltip+1] = {func_itemTexture(204715)..Gray_Color..func_itemName_NOCOLOR(204715).."|r", Gray_Color..CharInfo.ItemsInBag[204715].."|r"}
			end
			--
			if CharInfo.ItemsInBag[190456] >= 1 then
				tooltip[#tooltip+1] = {func_itemTexture(190456)..func_itemName(190456), CharInfo.ItemsInBag[190456]}
			else
				tooltip[#tooltip+1] = {func_itemTexture(190456)..Gray_Color..func_itemName_NOCOLOR(190456).."|r", Gray_Color..CharInfo.ItemsInBag[190456].."|r"}
			end
			tooltip[#tooltip+1] = {" 10.1.0",""}
			--
			if CharInfo.ItemsInBag[204440] >= 1 then
				tooltip[#tooltip+1] = {func_itemTexture(204440)..func_itemName(204440),CharInfo.ItemsInBag[204440]}
			else
				tooltip[#tooltip+1] = {func_itemTexture(204440)..Gray_Color..func_itemName_NOCOLOR(204440).."|r",Gray_Color..CharInfo.ItemsInBag[204440].."|r"}
			end
			--
			if CharInfo.ItemsInBag[204717] >= 1 then
				tooltip[#tooltip+1] = {func_itemTexture(204717)..func_itemName(204717),CharInfo.ItemsInBag[204717]}
			else
				tooltip[#tooltip+1] = {func_itemTexture(204717)..Gray_Color..func_itemName_NOCOLOR(204717).."|r",Gray_Color..CharInfo.ItemsInBag[204717].."|r"}
			end
			--
			if CharInfo.ItemsInBag[204681] >= 1 then
				tooltip[#tooltip+1] = {func_itemTexture(204681)..func_itemName(204681),CharInfo.ItemsInBag[204681]}
			else
				tooltip[#tooltip+1] = {func_itemTexture(204681)..Gray_Color..func_itemName_NOCOLOR(204681).."|r",Gray_Color..CharInfo.ItemsInBag[204681].."|r"}
			end
			--
			if CharInfo.ItemsInBag[204682] >= 1 then
				tooltip[#tooltip+1] = {func_itemTexture(204682)..func_itemName(204682),CharInfo.ItemsInBag[204682]}
			else
				tooltip[#tooltip+1] = {func_itemTexture(204682)..Gray_Color..func_itemName_NOCOLOR(204682).."|r",Gray_Color..CharInfo.ItemsInBag[204682].."|r"}
			end
			--
			if CharInfo.ItemsInBag[204697] >= 1 then
				tooltip[#tooltip+1] = {func_itemTexture(204697)..func_itemName(204697),CharInfo.ItemsInBag[204697]}
			else
				tooltip[#tooltip+1] = {func_itemTexture(204697)..Gray_Color..func_itemName_NOCOLOR(204697).."|r",Gray_Color..CharInfo.ItemsInBag[204697].."|r"}
			end
			tooltip[#tooltip+1] = {" PVP",""}
			--
			if CharInfo.ItemsInBag[204186] >= 1 then
				tooltip[#tooltip+1] = {func_itemTexture(204186)..func_itemName(204186), CharInfo.ItemsInBag[204186]} -- PVP
			else
				tooltip[#tooltip+1] = {func_itemTexture(204186)..Gray_Color..func_itemName_NOCOLOR(204186).."|r", Gray_Color..CharInfo.ItemsInBag[204186].."|r"}
			end
			--
			if CharInfo.ItemsInBag[204187] >= 1 then
				tooltip[#tooltip+1] = {func_itemTexture(204187)..func_itemName(204187), CharInfo.ItemsInBag[204187]} -- PVP
			else
				tooltip[#tooltip+1] = {func_itemTexture(204187)..Gray_Color..func_itemName_NOCOLOR(204187).."|r", Gray_Color..CharInfo.ItemsInBag[204187].."|r"}
			end
			--
			if CharInfo.ItemsInBag[204188] >= 1 then
				tooltip[#tooltip+1] = {func_itemTexture(204188)..func_itemName(204188), CharInfo.ItemsInBag[204188]} -- PVP
			else
				tooltip[#tooltip+1] = {func_itemTexture(204188)..Gray_Color..func_itemName_NOCOLOR(204188).."|r", Gray_Color..CharInfo.ItemsInBag[204188].."|r"}
			end
			-- ТЕКСТ В ЦЕНТРЕ
			if CharInfo.profID_prof1.icon ~= 0 then
				VivodCent = CharInfo.profID_prof1.icon
			end
			if CharInfo.profID_prof2.icon ~= 0 then
				VivodCent = VivodCent.. " "..CharInfo.profID_prof2.icon
			end
			return VivodCent, VivodLeft
	end)
	-- MONEY
	tinsert(OctoTable_func_otrisovka,
		function(CharInfo, tooltip, CL, BG)
			local VivodCent, VivodLeft = "", ""
			local curServerShort = GetRealmName()
			local text = (curServerShort):gsub("-", " "):gsub("'", " ")
			local a, b = strsplit(" ", text)
			if b then
				curServerShort = WA_Utf8Sub(a, 1)..WA_Utf8Sub(b, 1):upper() else curServerShort = WA_Utf8Sub(a, 3):lower()
			end
			-- CL:SetFont(curFontTTF, curFontSize-1, curFontOutline)
			if CharInfo.Money then
				VivodLeft = curServerShort..": "..GetCoinTextureString(TotalMoney-TotalMoney % 10000)
			end
			if TotalMoneyAllServer > TotalMoney and CharInfo.Money ~= 0 then
				VivodLeft = VivodLeft.." ("..GetCoinTextureString(TotalMoneyAllServer-TotalMoneyAllServer%10000)..")"
			end
			-- ТЕКСТ В ЦЕНТРЕ
			if CharInfo.Money then
				VivodCent = GetCoinTextureString(CharInfo.Money - CharInfo.Money % 10000)
			end
			if CharInfo.Money - CharInfo.Money % 10000 < 10000000 then -- меньше тысячи
				VivodCent = Gray_Color..VivodCent.."|r"
			end
			if CharInfo.PlayerReagentnumSlots == 0 then VivodCent = VivodCent..Red_Color.."-".."|r" end
			return Yellow_Color..VivodCent.."|r", VivodLeft
	end)
	-- УРОВЕНЬ ПРЕДМЕТОВ / ИТЕМ ЛЕВЕЛЛ
	tinsert(OctoTable_func_otrisovka,
		function(CharInfo, tooltip, CL, BG)
			local VivodCent, VivodLeft = "", ""
			-- CL:SetText(format("|cff%s%.1f|r", CharInfo.avgItemLevel >= 430 and "00ff00" or CharInfo.avgItemLevel >= 400 and "ffff00" or "ff0000", CharInfo.avgItemLevel))
			VivodLeft = LFG_LIST_ITEM_LEVEL_INSTR_SHORT
			local pvpcolor = Red_Color
			if CharInfo.avgItemLevelEquipped and CharInfo.avgItemLevel then
				if CharInfo.avgItemLevelEquipped > 440 then
					pvpcolor = Green_Color
				elseif CharInfo.avgItemLevelEquipped > 400 then
					pvpcolor = Yellow_Color
				end
			end
			-- ТЕКСТ В ЦЕНТРЕ
			if CharInfo.avgItemLevelEquipped and CharInfo.avgItemLevel then
				VivodCent = pvpcolor..CharInfo.avgItemLevelEquipped
				if CharInfo.avgItemLevel > CharInfo.avgItemLevelEquipped then
					VivodCent = VivodCent.."/"..CharInfo.avgItemLevel.."|r"
				end
				if CharInfo.avgItemLevelPvp and CharInfo.avgItemLevelPvp > CharInfo.avgItemLevel then
					VivodCent = VivodCent..Addon_Color.."++|r"
					tooltip[#tooltip+1] = {string.format(LFG_LIST_ITEM_LEVEL_CURRENT_PVP, CharInfo.avgItemLevelPvp)}
				end
			end
			return VivodCent, VivodLeft
	end)
	-- ЛОГИН ТАЙМ
	tinsert(OctoTable_func_otrisovka,
		function(CharInfo, tooltip, CL, BG)
			local VivodCent, VivodLeft = "", ""
			if CharInfo.BindLocation ~= 0 then
				tooltip[#tooltip+1] = {func_texturefromIcon(134414)..L["Bind Location"],CharInfo.BindLocation}
			end
			if CharInfo.CurrentLocation ~= 0 then
				tooltip[#tooltip+1] = {func_texturefromIcon(132319)..L["Current Location"],CharInfo.CurrentLocation}
			end
			if CharInfo.maxNumQuestsCanAccept ~= 0 then
				tooltip[#tooltip+1] = {QUESTS_LABEL,CharInfo.numQuests.."/"..CharInfo.maxNumQuestsCanAccept}
			end
			if CharInfo.totalSlots ~= 0 then
				tooltip[#tooltip+1] = {func_texturefromIcon(133634)..L["Bags"],CharInfo.usedSlots.."/"..CharInfo.totalSlots}
			end
			if CharInfo.totalSlotsBANK ~= 0 then
				tooltip[#tooltip+1] = {func_texturefromIcon(134430)..L["Bank"],CharInfo.usedSlotsBANK.."/"..CharInfo.totalSlotsBANK}
			end
			if CharInfo.currentMountItemID ~= 0 then
				tooltip[#tooltip+1] = {func_itemTexture(CharInfo.currentMountItemID)..func_itemName(CharInfo.currentMountItemID)}
			end
			-- ТЕКСТ В ЦЕНТРЕ
			if CharInfo.loginDay ~= 0 and CharInfo.loginDay ~= 0 then
				CL:SetFont(curFontTTF, curFontSize-1, curFontOutline)
				VivodCent = (CharInfo.needResetDaily and Red_Color or White_Color)..CharInfo.loginHour.."\n"..CharInfo.loginDay
			end
			return VivodCent, VivodLeft
	end)
	-- -- Почта
	-- tinsert(OctoTable_func_otrisovka,
	-- function(CharInfo, tooltip, CL, BG)
	-- local VivodCent, VivodLeft = "", ""
	-- -- ТЕКСТ В ЦЕНТРЕ
	-- if CharInfo.hasMail == true then
	-- VivodCent = "new mail"
	-- end
	-- return VivodCent, VivodLeft
	-- end)
	-- -- -- -
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
end
function Octo_ToDo_DragonflyOnLoad()
	if not OctoFrame_EventFrame then
		OctoFrame_EventFrame = CreateFrame("FRAME", AddonTitle..GenerateUniqueID())
		if Octo_Show_Dev == true then
			print ("OctoFrame_EventFrame = CreateFrame"..GetTime())
		end
	end
	OctoFrame_EventFrame:RegisterEvent("VARIABLES_LOADED")
	OctoFrame_EventFrame:RegisterEvent("PLAYER_LOGIN")
	OctoFrame_EventFrame:RegisterEvent("PLAYER_MONEY")
	OctoFrame_EventFrame:RegisterEvent("UNIT_INVENTORY_CHANGED")
	OctoFrame_EventFrame:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
	OctoFrame_EventFrame:RegisterEvent("PLAYER_AVG_ITEM_LEVEL_UPDATE")
	OctoFrame_EventFrame:RegisterEvent("PLAYER_LEAVING_WORLD")
	OctoFrame_EventFrame:RegisterEvent("BAG_UPDATE")
	OctoFrame_EventFrame:RegisterEvent("TOYS_UPDATED")
	OctoFrame_EventFrame:RegisterEvent("HEARTHSTONE_BOUND")
	OctoFrame_EventFrame:RegisterEvent("ZONE_CHANGED")
	OctoFrame_EventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	OctoFrame_EventFrame:RegisterEvent("QUEST_FINISHED")
	OctoFrame_EventFrame:RegisterEvent("QUEST_TURNED_IN")
	OctoFrame_EventFrame:RegisterEvent("QUEST_REMOVED")
	OctoFrame_EventFrame:RegisterEvent("QUEST_COMPLETE")
	OctoFrame_EventFrame:RegisterEvent("QUEST_LOG_UPDATE")
	OctoFrame_EventFrame:RegisterEvent("PLAYER_STARTED_MOVING")
	OctoFrame_EventFrame:RegisterEvent("PLAYER_LOGOUT")
	OctoFrame_EventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
	OctoFrame_EventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	OctoFrame_EventFrame:RegisterEvent("COVENANT_CHOSEN")
	OctoFrame_EventFrame:RegisterEvent("COVENANT_SANCTUM_RENOWN_LEVEL_CHANGED")
	OctoFrame_EventFrame:RegisterEvent("BANKFRAME_OPENED")
	OctoFrame_EventFrame:RegisterEvent("PLAYERBANKSLOTS_CHANGED")
	OctoFrame_EventFrame:RegisterEvent("VOID_STORAGE_UPDATE")
	OctoFrame_EventFrame:RegisterEvent("VOID_STORAGE_CONTENTS_UPDATE")
	OctoFrame_EventFrame:RegisterEvent("VOID_TRANSFER_DONE")
	OctoFrame_EventFrame:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
	OctoFrame_EventFrame:RegisterEvent("SPELLS_CHANGED")
	OctoFrame_EventFrame:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED")
	OctoFrame_EventFrame:RegisterEvent("AZERITE_ITEM_EXPERIENCE_CHANGED")
	OctoFrame_EventFrame:RegisterEvent("MAIL_INBOX_UPDATE")
	OctoFrame_EventFrame:RegisterEvent("MAIL_SHOW")
	OctoFrame_EventFrame:RegisterEvent("UPDATE_PENDING_MAIL")
	-- OctoFrame_EventFrame:RegisterEvent("UNIT_SPELLCAST_START")
	-- OctoFrame_EventFrame:RegisterEvent("UNIT_SPELLCAST_STOP")
	-- OctoFrame_EventFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
	-- OctoFrame_EventFrame:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED")
	-- -- OctoFrame_EventFrame:RegisterEvent("VARIABLES_LOADED")
	-- OctoFrame_EventFrame:RegisterEvent("ARENA_SEASON_WORLD_STATE")
	-- OctoFrame_EventFrame:RegisterEvent("BATTLEFIELDS_CLOSED")
	-- OctoFrame_EventFrame:RegisterEvent("BATTLEFIELDS_SHOW")
	-- OctoFrame_EventFrame:RegisterEvent("CURRENCY_DISPLAY_UPDATE")
	-- OctoFrame_EventFrame:RegisterEvent("GROUP_ROSTER_UPDATE")
	-- OctoFrame_EventFrame:RegisterEvent("HONOR_LEVEL_UPDATE")
	-- OctoFrame_EventFrame:RegisterEvent("HONOR_XP_UPDATE")
	-- OctoFrame_EventFrame:RegisterEvent("LFG_LIST_ACTIVE_ENTRY_UPDATE")
	-- OctoFrame_EventFrame:RegisterEvent("LFG_LIST_SEARCH_RESULT_UPDATED")
	-- OctoFrame_EventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
	-- OctoFrame_EventFrame:RegisterEvent("PLAYER_LEVEL_UP")
	-- OctoFrame_EventFrame:RegisterEvent("PVP_BRAWL_INFO_UPDATED")
	-- OctoFrame_EventFrame:RegisterEvent("PVP_RATED_STATS_UPDATE")
	-- OctoFrame_EventFrame:RegisterEvent("PVP_REWARDS_UPDATE")
	-- OctoFrame_EventFrame:RegisterEvent("PVP_ROLE_UPDATE")
	-- OctoFrame_EventFrame:RegisterEvent("PVP_TYPES_ENABLED")
	-- OctoFrame_EventFrame:RegisterEvent("PVP_WORLDSTATE_UPDATE")
	-- OctoFrame_EventFrame:RegisterEvent("PVPQUEUE_ANYWHERE_SHOW")
	-- OctoFrame_EventFrame:RegisterEvent("PVPQUEUE_ANYWHERE_UPDATE_AVAILABLE")
	-- OctoFrame_EventFrame:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")
	-- OctoFrame_EventFrame:RegisterEvent("WEEKLY_REWARDS_ITEM_CHANGED")
	-- OctoFrame_EventFrame:RegisterEvent("WEEKLY_REWARDS_UPDATE")
	-- OctoFrame_EventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	-- OctoFrame_EventFrame:RegisterEvent("ZONE_CHANGED")
	local group = OctoFrame_EventFrame:CreateAnimationGroup()
	-- group:SetScript('OnFinished', function() group:Play() end)
	-- group:Play()
	OctoFrame_EventFrame:SetScript("OnEvent", function(...) Octo_ToDo_DragonflyOnEvent(...) end)
end
function Create_UPGRADERANKS_Frame()
	if not OctoFrame_UPGRADERANKS_Frame then
		OctoFrame_UPGRADERANKS_Frame = CreateFrame("Frame", AddonTitle..GenerateUniqueID(), UIParent, "BackdropTemplate")
		if Octo_Show_Dev == true then
			print ("OctoFrame_UPGRADERANKS_Frame = CreateFrame"..GetTime())
		end
	end
	OctoFrame_UPGRADERANKS_Frame:SetFrameStrata("HIGH")
	OctoFrame_UPGRADERANKS_Frame:SetWidth(1024*scale*0.7111111111111111) -- Set these to whatever height/width is needed
	OctoFrame_UPGRADERANKS_Frame:SetHeight(512*scale*0.7111111111111111) -- for your Texture
	OctoFrame_UPGRADERANKS_Frame:SetBackdrop({
			-- bgFile = "Interface\\Addons\\"..GlobalAddonName.."\\Media\\border\\01 Octo.tga",
			edgeFile = "Interface\\Addons\\"..GlobalAddonName.."\\Media\\border\\01 Octo.tga",
			edgeSize = 3,
	})
	OctoFrame_UPGRADERANKS_Frame:SetBackdropColor(bgCr, bgCg, bgCb, bgCa)
	OctoFrame_UPGRADERANKS_Frame:SetBackdropBorderColor(0, 0, 0, 1)
	local t = OctoFrame_UPGRADERANKS_Frame:CreateTexture(nil, "BACKGROUND")
	t:SetTexture("Interface\\AddOns\\"..GlobalAddonName.."\\Media\\UPGRADERANKS.tga")
	t:SetAllPoints(OctoFrame_UPGRADERANKS_Frame)
	OctoFrame_UPGRADERANKS_Frame.texture = t
	OctoFrame_UPGRADERANKS_Frame:SetPoint("CENTER", 0, 0)
	OctoFrame_UPGRADERANKS_Frame:Hide()
end
local function CreateFrameUsableItems_OnEnter(self)
	self.icon:SetVertexColor(1, 1, 1, 1)
	GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT", 0, 10)
	GameTooltip:ClearLines()
	GameTooltip:AddLine(func_itemName(self.itemID))
	GameTooltip:Show()
end
local function CreateFrameUsableItems_OnLeave(self)
	local hasToy = PlayerHasToy(self.itemID)
	local hasItem = GetItemCount(self.itemID, true, true, true) < self.count
	if hasToy == true or hasItem == true then
		self.icon:SetVertexColor(1, 1, 1, 1)
	else
		self.icon:SetVertexColor(1, 1, 1, .2)
	end
	GameTooltip:ClearLines()
	GameTooltip:Hide()
end
local function CreateFrameUsableItems_OnEvent(self,event)
	if event == "BAG_UPDATE" or event == "TOYS_UPDATED" then
		local hasToy = PlayerHasToy(self.itemID)
		local hasItem = GetItemCount(self.itemID, true, true, true) < self.count
		if hasToy == true or hasItem == true then
			self.icon:SetDesaturated(false)
			self.icon:SetAlpha(1)
		else
			self.icon:SetDesaturated(true)
			self.icon:SetAlpha(.1)
		end
	elseif event == "PLAYER_REGEN_DISABLED" then
		self:SetParent(UIParent)
		self:ClearAllPoints()
		self:Hide()
	else
		self:SetParent(OctoFrame_Main_Frame)
		self:SetPoint("BOTTOMLEFT", OctoFrame_Main_Frame, "TOPLEFT", self.Xpos, self.Ypos+1)
		self:Show()
	end
end
local function CreateFrameUsableItems_OnMouseDown(self)
	local hasToy = PlayerHasToy(self.itemID)
	local hasItem = GetItemCount(self.itemID, true, true, true) < self.count
	if hasToy == true or hasItem == true then
		self.icon:SetVertexColor(1, 0, 0, .1)
	else
		self.icon:SetVertexColor(1, 0, 0, 1)
	end
end
local function CreateFrameUsableItems_OnMouseUp(self)
	local hasToy = PlayerHasToy(self.itemID)
	local hasItem = GetItemCount(self.itemID, true, true, true) < self.count
	if hasToy == true or hasItem == true then
		self.icon:SetVertexColor(1, 1, 1, .1)
	else
		self.icon:SetVertexColor(1, 1, 1, 1)
	end
end
local function CreateFrameUsableItems(itemID, Texture, count, Xpos, Ypos, r, g, b, spellID)
	local Button = CreateFrame("Button", AddonTitle..GenerateUniqueID(), OctoFrame_Main_Frame, "SecureActionButtonTemplate,BackDropTemplate")
	if Octo_Show_Dev == true then
		print ("Button = CreateFrame"..GetTime())
	end
	Button.itemID = itemID
	Button.Texture = Texture
	Button.count = count
	Button.Ypos = Ypos
	Button.Xpos = Xpos
	Button.r = r
	Button.g = g
	Button.b = b
	Button.spellID = spellID
	-- local _, _, itemQuality = GetItemInfo(itemID)
	-- if itemQuality then
	-- local ir, ig, ib, iA = GetItemQualityColor(itemQuality)
	-- end
	Button:SetSize(curHeight, curHeight)
	Button:SetPoint("BOTTOMLEFT", OctoFrame_Main_Frame, "TOPLEFT", Xpos, Ypos+1)
	Button:SetBackdrop({ edgeFile = "Interface\\Addons\\"..GlobalAddonName.."\\Media\\border\\01 Octo.tga", edgeSize = 1})
	Button:SetBackdropBorderColor(r, g, b, 1)
	Button:RegisterEvent("PLAYER_REGEN_DISABLED")
	Button:RegisterEvent("PLAYER_REGEN_ENABLED")
	Button:RegisterEvent("BAG_UPDATE")
	Button:RegisterEvent("TOYS_UPDATED")
	Button:HookScript("OnEvent", CreateFrameUsableItems_OnEvent)
	Button:HookScript("OnEnter", CreateFrameUsableItems_OnEnter)
	Button:HookScript("OnLeave", CreateFrameUsableItems_OnLeave)
	Button:HookScript("OnMouseDown", CreateFrameUsableItems_OnMouseDown)
	Button:HookScript("OnMouseUp", CreateFrameUsableItems_OnMouseUp)
	Button:RegisterForClicks("LeftButtonUp", "LeftButtonDown")
	Button:SetAttribute("type", "macro")
	Button:SetAttribute("macrotext", "/use item:"..itemID)
	local t = Button:CreateTexture(nil, "BACKGROUND")
	Button.icon = t
	t:SetTexture(Texture)-- select(10, GetItemInfo(itemID)))
	t:SetVertexColor(1, 1, 1, 1)
	t:SetAllPoints(Button)
	Button:GetScript("OnEvent")(Button, "BAG_UPDATE" or "TOYS_UPDATED")
	return Button
end
function Octo_ToDo_DragonflyCreateAltFrame()
	OctoFrame_Main_Frame = CreateFrame("BUTTON", AddonTitle..GenerateUniqueID(), UIParent, "BackdropTemplate")
	if Octo_Show_Dev == true then
		print ("OctoFrame_Main_Frame = CreateFrame"..GetTime())
	end
	OctoFrame_Main_Frame:SetClampedToScreen(false)
	OctoFrame_Main_Frame:SetFrameStrata("HIGH")
	OctoFrame_Main_Frame:SetPoint("TOP", 0, -257*scale)
	OctoFrame_Main_Frame:SetBackdrop({
			-- elvui
			bgFile = "Interface\\Addons\\"..GlobalAddonName.."\\Media\\border\\01 Octo.tga",
			edgeFile = "Interface\\Addons\\"..GlobalAddonName.."\\Media\\border\\01 Octo.tga",
			edgeSize = 1,
			-- Стандартный
			-- bgFile = "Interface/Tooltips/UI-Tooltip-Background",
			-- edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
			-- edgeSize = 16,
			-- insets = { left = 4, right = 4, top = 4, bottom = 4 },
	})
	OctoFrame_Main_Frame:SetBackdropColor(bgCr, bgCg, bgCb, bgCa)
	-- elvui
	OctoFrame_Main_Frame:SetBackdropBorderColor(0, 0, 0, 1)
	OctoFrame_Main_Frame:SetScript("OnShow", function() Octo_ToDo_DragonflyAddDataToAltFrame()
	end)
	OctoFrame_Main_Frame:EnableMouse(true)
	OctoFrame_Main_Frame:SetMovable(true)
	OctoFrame_Main_Frame:RegisterForDrag("LeftButton")
	OctoFrame_Main_Frame:SetScript("OnDragStart", OctoFrame_Main_Frame.StartMoving)
	OctoFrame_Main_Frame:SetScript("OnDragStop", function() OctoFrame_Main_Frame:StopMovingOrSizing() end)
	OctoFrame_Main_Frame:RegisterForClicks("RightButtonUp")
	OctoFrame_Main_Frame:SetScript("OnClick", function(self) self:Hide() end)
	-- CloseButton
	OctoFrame_Close_Button = CreateFrame("Button", AddonTitle..GenerateUniqueID(), OctoFrame_Main_Frame, "BackDropTemplate")
	if Octo_Show_Dev == true then
		print ("CloseButton = CreateFrame"..GetTime())
	end
	OctoFrame_Close_Button:SetSize(curHeight, curHeight)
	OctoFrame_Close_Button:SetPoint("TOPLEFT", OctoFrame_Main_Frame, "TOPRIGHT", 1, 0)
	OctoFrame_Close_Button:SetBackdrop({ edgeFile = "Interface\\Addons\\"..GlobalAddonName.."\\Media\\border\\01 Octo.tga", edgeSize = 1})
	OctoFrame_Close_Button:SetBackdropBorderColor(1, 0, 0, 0)
	OctoFrame_Close_Button:SetScript("OnEnter", function(self)
			self:SetBackdropBorderColor(1, 0, 0, 1)
			self.icon:SetVertexColor(1, 0, 0, 1)
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 20, -30)
			GameTooltip:ClearLines()
			GameTooltip:AddLine(CLOSE) -- "Title"
			GameTooltip:Show()
	end)
	OctoFrame_Close_Button:SetScript("OnLeave", function(self)
			self:SetBackdropBorderColor(1, 0, 0, 0)
			self.icon:SetVertexColor(1, 1, 1, 1)
			GameTooltip:ClearLines()
			GameTooltip:Hide()
	end)
	OctoFrame_Close_Button:SetScript("OnMouseDown", function(self)
			self:SetBackdropBorderColor(1, 0, 0, .5)
			self.icon:SetVertexColor(1, 0, 0, .5)
	end)
	OctoFrame_Close_Button:SetScript("OnClick", function()
			OctoFrame_Main_Frame:Hide()
	end)
	local t = OctoFrame_Close_Button:CreateTexture(nil, "BACKGROUND")
	OctoFrame_Close_Button.icon = t
	t:SetTexture("Interface\\AddOns\\"..GlobalAddonName.."\\Media\\CloseTest.tga")
	t:SetVertexColor(1, 1, 1, 1)
	t:SetAllPoints(OctoFrame_Close_Button)
	OctoFrame_Close_Button:SetScript("OnKeyDown", function(self, key)
			if key == GetBindingKey("TOGGLEGAMEMENU") then
				self:GetParent():Hide()
				self:SetPropagateKeyboardInput(false)
			else
				self:SetPropagateKeyboardInput(true)
			end
	end)
	if not OctoFrame_Options_Button then
		OctoFrame_Options_Button = CreateFrame("Button", AddonTitle..GenerateUniqueID(), OctoFrame_Main_Frame, "BackDropTemplate")
		if Octo_Show_Dev == true then
			print ("OptionsButton = CreateFrame"..GetTime())
		end
		OctoFrame_Options_Button:SetSize(curHeight, curHeight)
		OctoFrame_Options_Button:SetPoint("TOPLEFT", OctoFrame_Main_Frame, "TOPRIGHT", 1, -30)
		OctoFrame_Options_Button:SetBackdrop({ edgeFile = "Interface\\Addons\\"..GlobalAddonName.."\\Media\\border\\01 Octo.tga", edgeSize = 1})
		OctoFrame_Options_Button:SetBackdropBorderColor(1, 0, 0, 0)
		OctoFrame_Options_Button:SetScript("OnEnter", function(self)
				self:SetBackdropBorderColor(1, 0, 0, 1)
				self.icon:SetVertexColor(1, 0, 0, 1)
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 20, -30)
				-- GameTooltip:ClearLines()
				GameTooltip:AddLine(OPTIONS) -- "Title"
				GameTooltip:Show()
		end)
		OctoFrame_Options_Button:SetScript("OnLeave", function(self)
				self:SetBackdropBorderColor(1, 0, 0, 0)
				self.icon:SetVertexColor(1, 1, 1, 1)
				-- GameTooltip:ClearLines()
				GameTooltip:Hide()
		end)
		OctoFrame_Options_Button:SetScript("OnMouseDown", function(self)
				self:SetBackdropBorderColor(1, 0, 0, .5)
				self.icon:SetVertexColor(1, 0, 0, .5)
		end)
		OctoFrame_Options_Button:SetScript("OnClick", function()
				if OctoFrame_Main_Frame and OctoFrame_Main_Frame:IsShown() then
					OctoFrame_Main_Frame:Hide()
				end
				if SettingsPanel:IsVisible() and self:IsVisible() then
					HideUIPanel(SettingsPanel)
				else
					Settings.OpenToCategory(GlobalAddonName, true)
				end
		end)
		local t = OctoFrame_Options_Button:CreateTexture(nil, "BACKGROUND")
		OctoFrame_Options_Button.icon = t
		t:SetTexture("Interface\\AddOns\\"..GlobalAddonName.."\\Media\\OptionsButton.tga")
		t:SetVertexColor(1, 1, 1, 1)
		t:SetAllPoints(OctoFrame_Options_Button)
	end
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	if not OctoFrame_MarkOfHonor_Button then
		OctoFrame_MarkOfHonor_Button = CreateFrame("Button", AddonTitle..GenerateUniqueID(), OctoFrame_Main_Frame, "BackDropTemplate")
		if Octo_Show_Dev == true then
			print ("MarkOfHonor_Button = CreateFrame"..GetTime())
		end
		OctoFrame_MarkOfHonor_Button:SetSize(curHeight, curHeight)
		OctoFrame_MarkOfHonor_Button:SetPoint("TOPLEFT", OctoFrame_Main_Frame, "TOPRIGHT", 1, -60)
		OctoFrame_MarkOfHonor_Button:SetBackdrop({ edgeFile = "Interface\\Addons\\"..GlobalAddonName.."\\Media\\border\\01 Octo.tga", edgeSize = 1})
		OctoFrame_MarkOfHonor_Button:SetBackdropBorderColor(0, .44, .98, 1)
		OctoFrame_MarkOfHonor_Button:SetScript("OnEnter", function(self)
				local i = 0
				self:SetBackdropBorderColor(1, 0, 0, 1)
				self.icon:SetVertexColor(1, 0, 0, 1)
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 20, -30)
				GameTooltip:ClearLines()
				GameTooltip:AddDoubleLine(" "," ")
				for k, CharInfo in pairs(Octo_ToDo_DragonflyLevels) do
					local classcolor = CreateColor(CharInfo.classColor.r, CharInfo.classColor.g, CharInfo.classColor.b)
					if (CharInfo.ItemsInBag[137642] ~= 0) then
						i = i + 1
						GameTooltip:AddDoubleLine(func_itemTexture(137642)..CharInfo.ItemsInBag[137642], classcolor:WrapTextInColorCode(CharInfo.Name.."("..CharInfo.curServerShort..")"))
					end
					if CharInfo.ItemsInBag[202196] ~= 0 then
						i = i + 1
						GameTooltip:AddDoubleLine(func_itemTexture(202196)..CharInfo.ItemsInBag[202196], classcolor:WrapTextInColorCode(CharInfo.Name.."("..CharInfo.curServerShort..")"))
					end
					if CharInfo.ItemsInBag[86547] ~= 0 then
						i = i + 1
						GameTooltip:AddDoubleLine(func_itemTexture(86547)..CharInfo.ItemsInBag[86547], classcolor:WrapTextInColorCode(CharInfo.Name.."("..CharInfo.curServerShort..")"))
					end
					if CharInfo.ItemsInBag[183616] ~= 0 then
						i = i + 1
						GameTooltip:AddDoubleLine(func_itemTexture(183616)..CharInfo.ItemsInBag[183616], classcolor:WrapTextInColorCode(CharInfo.Name.."("..CharInfo.curServerShort..")"))
					end
					if CharInfo.ItemsInBag[166751] ~= 0 then
						i = i + 1
						GameTooltip:AddDoubleLine(func_itemTexture(166751)..CharInfo.ItemsInBag[166751], classcolor:WrapTextInColorCode(CharInfo.Name.."("..CharInfo.curServerShort..")"))
					end
					if CharInfo.ItemsInBag[122457] ~= 0 then
						i = i + 1
						GameTooltip:AddDoubleLine(func_itemTexture(122457)..CharInfo.ItemsInBag[122457], classcolor:WrapTextInColorCode(CharInfo.Name.."("..CharInfo.curServerShort..")"))
					end
					if CharInfo.ItemsInBag[204464] ~= 0 then
						i = i + 1
						GameTooltip:AddDoubleLine("$$$"..func_itemTexture(204464)..CharInfo.ItemsInBag[204464], classcolor:WrapTextInColorCode(CharInfo.Name.."("..CharInfo.curServerShort..")"))
					end
				end
				if i == 0 then
					GameTooltip:AddLine("No Data")
				end
				GameTooltip:AddDoubleLine(" "," ")
				GameTooltip:Show()
		end)
		OctoFrame_MarkOfHonor_Button:SetScript("OnLeave", function(self)
				self:SetBackdropBorderColor(0, .44, .98, 1)
				self.icon:SetVertexColor(1, 1, 1, 1)
				GameTooltip:ClearLines()
				GameTooltip:Hide()
		end)
		OctoFrame_MarkOfHonor_Button:SetScript("OnMouseDown", function(self)
				self:SetBackdropBorderColor(1, 0, 0, .5)
				self.icon:SetVertexColor(1, 0, 0, .5)
		end)
		OctoFrame_MarkOfHonor_Button:SetScript("OnClick", function()
				OctoFrame_Main_Frame:Hide()
		end)
		local t = OctoFrame_MarkOfHonor_Button:CreateTexture(nil, "BACKGROUND")
		OctoFrame_MarkOfHonor_Button.icon = t
		t:SetTexture(1322720)
		t:SetVertexColor(1, 1, 1, 1)
		t:SetAllPoints(OctoFrame_MarkOfHonor_Button)
	end
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	if not OctoFrame_QuestFeast_Button then
		OctoFrame_QuestFeast_Button = CreateFrame("Button", AddonTitle..GenerateUniqueID(), OctoFrame_Main_Frame, "BackDropTemplate")
		if Octo_Show_Dev == true then
			print ("QuestFeast_Button = CreateFrame"..GetTime())
		end
		OctoFrame_QuestFeast_Button:SetSize(curHeight, curHeight)
		OctoFrame_QuestFeast_Button:SetPoint("TOPLEFT", OctoFrame_Main_Frame, "TOPRIGHT", 1, -90)
		OctoFrame_QuestFeast_Button:SetBackdrop({ edgeFile = "Interface\\Addons\\"..GlobalAddonName.."\\Media\\border\\01 Octo.tga", edgeSize = 1})
		OctoFrame_QuestFeast_Button:SetBackdropBorderColor(.64, .21, .93, 1)
		OctoFrame_QuestFeast_Button:SetScript("OnEnter", function(self)
				local i = 0
				self:SetBackdropBorderColor(1, 0, 0, 1)
				self.icon:SetVertexColor(1, 0, 0, 1)
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 20, -30)
				GameTooltip:ClearLines()
				GameTooltip:AddDoubleLine(" "," ")
				for k, CharInfo in pairs(Octo_ToDo_DragonflyLevels) do
					local classcolor = CreateColor(CharInfo.classColor.r, CharInfo.classColor.g, CharInfo.classColor.b)
					if CharInfo.Octopussy_DF_Weekly_Feast_count ~= DONE and CharInfo.UnitLevel >= 60 then
						i = i +1
						GameTooltip:AddDoubleLine(classcolor:WrapTextInColorCode(CharInfo.Name.."("..CharInfo.curServerShort..")"), CharInfo.Octopussy_DF_Weekly_Feast_count)
					end
					if CharInfo.ItemsInBag[200652] ~= 0 then
						i = i + 1
						GameTooltip:AddDoubleLine("$$$"..func_itemTexture(200652)..CharInfo.ItemsInBag[200652], classcolor:WrapTextInColorCode(CharInfo.Name.."("..CharInfo.curServerShort..")"))
					end
				end
				if i == 0 then
					GameTooltip:AddLine("No Data")
				end
				GameTooltip:AddDoubleLine(" "," ")
				GameTooltip:Show()
		end)
		OctoFrame_QuestFeast_Button:SetScript("OnLeave", function(self)
				self:SetBackdropBorderColor(0, .44, .98, 1)
				self.icon:SetVertexColor(1, 1, 1, 1)
				GameTooltip:ClearLines()
				GameTooltip:Hide()
		end)
		OctoFrame_QuestFeast_Button:SetScript("OnMouseDown", function(self)
				self:SetBackdropBorderColor(1, 0, 0, .5)
				self.icon:SetVertexColor(1, 0, 0, .5)
		end)
		OctoFrame_QuestFeast_Button:SetScript("OnClick", function()
				OctoFrame_Main_Frame:Hide()
		end)
		local t = OctoFrame_QuestFeast_Button:CreateTexture(nil, "BACKGROUND")
		OctoFrame_QuestFeast_Button.icon = t
		t:SetTexture(629056)
		t:SetVertexColor(1, 1, 1, 1)
		t:SetAllPoints(OctoFrame_QuestFeast_Button)
	end
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	if not OctoFrame_AbandonAllQuests_Button then
		local numShownEntries, numQuests = C_QuestLog.GetNumQuestLogEntries()
		StaticPopupDialogs[GlobalAddonName.."Abandon_All_Quests"] = {
			text = Red_Color.."!!! ACHTUNG !!!|r\n".."Отменить все ("..numQuests..") задания?",
			button1 = YES,
			button2 = NO,
			hideOnEscape = 1,
			whileDead = 1,
			OnAccept = function()
				C_Timer.After(1,function()
						for i=1, numShownEntries do
							if numQuests ~= 0 then
								local questInfo = C_QuestLog.GetInfo(i)
								if questInfo then
									if (not questInfo.isHeader and not questInfo.isHidden) then
										print (Blue_Color..L["Abandon"].."|r"..Red_Color..questInfo.title.."|r")
										C_QuestLog.SetSelectedQuest(questInfo.questID)
										C_QuestLog.SetAbandonQuest()
										C_QuestLog.AbandonQuest()
									end
								end
							end
						end
						print (DONE)
				end)
			end,
		}
		OctoFrame_AbandonAllQuests_Button = CreateFrame("Button", AddonTitle..GenerateUniqueID(), OctoFrame_Main_Frame, "BackDropTemplate")
		if Octo_Show_Dev == true then
			print ("AbandonAllQuests = CreateFrame"..GetTime())
		end
		OctoFrame_AbandonAllQuests_Button:SetSize(curHeight, curHeight)
		OctoFrame_AbandonAllQuests_Button:SetPoint("BOTTOMLEFT", OctoFrame_Main_Frame, "BOTTOMRIGHT", 1, 0)
		OctoFrame_AbandonAllQuests_Button:SetBackdrop({ edgeFile = "Interface\\Addons\\"..GlobalAddonName.."\\Media\\border\\01 Octo.tga", edgeSize = 1})
		OctoFrame_AbandonAllQuests_Button:SetBackdropBorderColor(1, 0, 0, 0)
		OctoFrame_AbandonAllQuests_Button:SetScript("OnEnter", function(self)
				self:SetBackdropBorderColor(1, 0, 0, 1)
				self.icon:SetVertexColor(1, 0, 0, 1)
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT", 20, -30)
				GameTooltip:ClearLines()
				GameTooltip:AddLine(L["Abandon All Quests"].." ("..numQuests..")")
				GameTooltip:Show()
		end)
		OctoFrame_AbandonAllQuests_Button:SetScript("OnLeave", function(self)
				self:SetBackdropBorderColor(1, 0, 0, 0)
				self.icon:SetVertexColor(1, 1, 1, 1)
				GameTooltip:ClearLines()
				GameTooltip:Hide()
		end)
		OctoFrame_AbandonAllQuests_Button:SetScript("OnMouseDown", function(self)
				self:SetBackdropBorderColor(1, 0, 0, .5)
				self.icon:SetVertexColor(1, 0, 0, .5)
		end)
		OctoFrame_AbandonAllQuests_Button:SetScript("OnClick", function()
				StaticPopup_Show(GlobalAddonName.."Abandon_All_Quests")
		end)
		local t = OctoFrame_AbandonAllQuests_Button:CreateTexture(nil, "BACKGROUND")
		OctoFrame_AbandonAllQuests_Button.icon = t
		t:SetTexture("Interface\\AddOns\\"..GlobalAddonName.."\\Media\\ElvUI\\SadKitty.tga")
		t:SetVertexColor(1, 1, 1, 1)
		t:SetAllPoints(OctoFrame_AbandonAllQuests_Button)
	end
	-- -- -- --
	-- itemID, Texture, count, Xpos, Ypos, spellID
	local prof1, prof2 = GetProfessions()
	local prof1 = prof1 and select(7, GetProfessionInfo(prof1))
	local prof2 = prof2 and select(7, GetProfessionInfo(prof2))
	if prof1 == 202 or prof2 == 202 then -- ИНЖА
		local Xpos = 21
		local Ypos = 0
		-- DF
		CreateFrameUsableItems(198156, 4548860, 15, Xpos*0, Ypos*0, 0, .43, .86) -- Генератор червоточин: Драконьи острова
		-- SL
		CreateFrameUsableItems(172924, 3610528, 15, Xpos*1, Ypos*1, 0, .43, .86) -- Генератор червоточин: Темные Земли
		-- BFA
		CreateFrameUsableItems(168808, 2000840, 15, Xpos*2, Ypos*2, 0, .43, .86) -- Генератор червоточин: Зандалар
		CreateFrameUsableItems(168807, 2000841, 15, Xpos*3, Ypos*3, 0, .43, .86) -- Генератор червоточин: Кул-Тирас
		-- LEGION
		CreateFrameUsableItems(151652, 237560, 15, Xpos*4, Ypos*4, 0, .43, .86) -- Генератор червоточин: Аргус
		-- WOD
		CreateFrameUsableItems(112059, 892831, 15, Xpos*5, Ypos*5, 0, .43, .86) -- Центрифуга червоточины
		-- PANDA
		CreateFrameUsableItems(87215, 651094, 15, Xpos*6, Ypos*6, 0, .43, .86) -- Генератор червоточин: Пандария
		-- WOTLK
		CreateFrameUsableItems(48933, 135778, 15, Xpos*7, Ypos*7, 0, .43, .86) -- Генератор червоточин: Нордскол
	end
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
	-- local className, classFilename, classId = UnitClass("PLAYER")
	-- local classColor = C_ClassColor.GetClassColor(classFilename)
	-- local r, g, b = classColor:GetRGB()
	local function FrameLine_OnEnter(self)
		self.BG:SetColorTexture(r, g, b, 0.2) -- горизонт
	end
	local function FrameLine_OnLeave(self)
		self.BG:SetColorTexture(0, 0, 0, 0)
	end
	for i = 0, #OctoTable_func_otrisovka do
		local fname, f
		if i ~= 0 then
			fname = "FrameLine"..i
			OctoFrame_Main_Frame[fname] = CreateFrame("Frame", AddonTitle..GenerateUniqueID(), OctoFrame_Main_Frame, "BackdropTemplate")
			if Octo_Show_Dev == true then
				print ("fname] = CreateFrame"..GetTime())
			end
			f = OctoFrame_Main_Frame[fname]
			f:SetHeight(curHeight)
			f:SetPoint("TOPLEFT", OctoFrame_Main_Frame, "TOPLEFT", 0, -curHeight*i)
			-- f:SetPoint("TOPLEFT", OctoFrame_Main_Frame, "TOPLEFT", 0+curWidthTitle, -curHeight*i)
			f:SetPoint("RIGHT")
			f:SetScript("OnEnter", FrameLine_OnEnter)
			f:SetScript("OnLeave", FrameLine_OnLeave)
			f:SetMouseClickEnabled(false)
			f.BG = f:CreateTexture(nil, "BACKGROUND")
			f.BG:SetHeight(curHeight)
			f.BG:SetAllPoints()
			-- Горизонт
			-- f:SetBackdrop({
			-- bgFile = bgFile,
			-- edgeFile = edgeFile,
			-- edgeSize = 1,
			-- })
			-- f:SetBackdropColor(bgCr, bgCg, bgCb, 0)
			-- f:SetBackdropBorderColor(0, 0, 0, 0.15)
		end
		fname = "TextLeft"..i
		OctoFrame_Main_Frame[fname] = OctoFrame_Main_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
		f = OctoFrame_Main_Frame[fname]
		f:SetSize(curWidthTitle, curHeight)
		f:SetPoint("TOPLEFT", OctoFrame_Main_Frame, "TOPLEFT", 6, -curHeight*i)
		f:SetFont(curFontTTF, curFontSize, curFontOutline)
		f:SetJustifyV("MIDDLE")
		f:SetJustifyH("LEFT")
		f:SetTextColor(1, 1, 1, 1)
	end
	Octo_ToDo_DragonflyAddDataToAltFrame()
	OctoFrame_Main_Frame:Hide()
end
function Octo_ToDo_DragonflyAddDataToAltFrame()
	local curGUID = UnitGUID("PLAYER")
	local UnitLevel = UnitLevel("PLAYER")
	-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
	OctoFrame_Main_Frame.AllCharFrames = {}
	local sorted = {}
	for curCharGUID, CharInfo in pairs(Octo_ToDo_DragonflyLevels) do
		sorted[#sorted+1] = CharInfo
	end
	sort(sorted, function(a, b)
			if a and b then
				return
				a.curServer < b.curServer or a.curServer == b.curServer
				and
				a.avgItemLevel < b.avgItemLevel or a.avgItemLevel == b.avgItemLevel
				and
				-- a.Faction < b.Faction or a.Faction == b.Faction
				-- and
				b.Name < a.Name
			end
	end)
	TotalMoney = 0
	TotalMoneyAllServer = 0
	TotalKills = 0
	TotalTransAnima = 0
	for i, CharInfo in pairs(sorted) do
		local curCharGUID = CharInfo.GUID
		local curName = nil
		if CharInfo.Name == nil then
		curName = "UnLogged Char" else
			curName = CharInfo.Name
		end
		if not OctoFrame_Main_Frame[curCharGUID] then
			OctoFrame_Main_Frame[curCharGUID] = CreateFrame("Frame", AddonTitle..GenerateUniqueID(), OctoFrame_Main_Frame, "BackdropTemplate")
			if Octo_Show_Dev == true then
				print ("curCharGUID] = CreateFrame"..GetTime())
			end
			OctoFrame_Char_Frame = OctoFrame_Main_Frame[curCharGUID]
			OctoFrame_Char_Frame:SetPoint("BOTTOM", 0, 0)
			OctoFrame_Char_Frame.BG = OctoFrame_Char_Frame:CreateTexture(nil, "BACKGROUND")
			OctoFrame_Char_Frame.BG:Hide()
			OctoFrame_Char_Frame.BG:SetPoint("TOPLEFT", 0, -curHeight)
			OctoFrame_Char_Frame.BG:SetPoint("BOTTOMRIGHT", 0, 0)
			OctoFrame_Char_Frame.BG:SetColorTexture(r, g, b, 1)
			-- Вертикаль
			-- OctoFrame_Char_Frame:SetBackdrop({
			-- bgFile = bgFile,
			-- edgeFile = edgeFile,
			-- edgeSize = 1 ,
			-- })
			-- OctoFrame_Char_Frame:SetBackdropColor(bgCr, bgCg, bgCb, 0)
			-- OctoFrame_Char_Frame:SetBackdropBorderColor(0, 0, 0, 0.15)
			for i = 1, #OctoTable_func_otrisovka do
				CF = CreateFrame("Frame", AddonTitle..GenerateUniqueID(), OctoFrame_Char_Frame)
				if Octo_Show_Dev == true then
					print ("CF = CreateFrame"..GetTime())
				end
				OctoFrame_Char_Frame["CenterLines"..i] = CF
				CF.index = i
				CF:SetSize(curWidth, curHeight)
				CF:SetPoint("TOP", OctoFrame_Char_Frame, "TOP", 0, -curHeight*i)
				CF:SetScript("OnEnter", Central_Frame_Mouse_OnEnter)
				CF:SetScript("OnLeave", Central_Frame_Mouse_OnLeave)
				CF:SetMouseClickEnabled(false)
				-- if #CF.tooltip == 0 then CF.tooltip = nil end
				local CL = CF:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
				-- OctoFrame_Char_Frame["CenterLines"..i] = CL
				CL:SetAllPoints()
				-- CL:SetSize(curWidth, curHeight)
				-- CL:SetPoint("TOP", OctoFrame_Char_Frame, "TOP", 0, -curHeight*i)
				CL:SetFont(curFontTTF, curFontSize, curFontOutline)
				CL:SetJustifyV("MIDDLE")
				CL:SetJustifyH("CENTER")
				CL:SetTextColor(1, 1, 1, 1)
				OctoFrame_Char_Frame["CenterLines"..i.."BG"] = OctoFrame_Char_Frame:CreateTexture(nil,"BACKGROUND")
				OctoFrame_Char_Frame["CenterLines"..i.."BG"]:SetAllPoints(OctoFrame_Char_Frame["CenterLines"..i])
				OctoFrame_Char_Frame["CenterLines"..i.."BG"]:SetColorTexture(r,g,b,0)
				CF.CL = CL
			end
		else
			OctoFrame_Char_Frame = OctoFrame_Main_Frame[curCharGUID]
		end
		local ShowOnlyCurrentRealm = Octo_ToDo_DragonflyVars.config.ShowOnlyCurrentRealm
		local LevelToShow = Octo_ToDo_DragonflyVars.config.LevelToShow
		TotalMoneyAllServer = TotalMoneyAllServer + CharInfo.Money
		if CharInfo.Shadowland[2] >= 1000 or CharInfo.Shadowland[4] >= 1000 or CharInfo.Shadowland[6] >= 1000 or CharInfo.Shadowland[8] >= 1000 then
			TotalTransAnima = TotalTransAnima +
			math.floor(CharInfo.Shadowland[2]/1000)*1000 +
			math.floor(CharInfo.Shadowland[4]/1000)*1000 +
			math.floor(CharInfo.Shadowland[6]/1000)*1000 +
			math.floor(CharInfo.Shadowland[8]/1000)*1000
		end
		if ((ShowOnlyCurrentRealm == true and (CharInfo.curServer == GetRealmName())) and (CharInfo.UnitLevel >= LevelToShow)) or (ShowOnlyCurrentRealm == false and CharInfo.UnitLevel >= LevelToShow) or (curGUID == CharInfo.GUID) then
			CharInfo.GUID = curCharGUID
			OctoFrame_Char_Frame:SetSize(curWidth, curHeight)
			if #OctoFrame_Main_Frame.AllCharFrames == 0 then
				OctoFrame_Char_Frame:SetPoint("TOPRIGHT", 0, 0)
			else
				OctoFrame_Char_Frame:SetPoint("TOPRIGHT", OctoFrame_Main_Frame.AllCharFrames[#OctoFrame_Main_Frame.AllCharFrames], "TOPLEFT", 0, 0)
			end
			OctoFrame_Main_Frame.AllCharFrames[#OctoFrame_Main_Frame.AllCharFrames + 1] = OctoFrame_Char_Frame
			local curMoney = 0
			if curServer == CharInfo.curServer and CharInfo.Money ~= 0 then
				curMoney = CharInfo.Money
			end
			TotalMoney = TotalMoney + curMoney
			local classcolor = CreateColor(CharInfo.classColor.r, CharInfo.classColor.g, CharInfo.classColor.b)
			if not OctoFrame_Char_FrameDeleteButton then
				for i = 1, #OctoFrame_Main_Frame.AllCharFrames do
					OctoFrame_Char_FrameDeleteButton = CreateFrame("BUTTON", AddonTitle..GenerateUniqueID(), OctoFrame_Char_Frame, "BackDropTemplate")
					if Octo_Show_Dev == true then
						print ("OctoFrame_Char_FrameDeleteButton = CreateFrame"..GetTime())
					end
				end
			end
			OctoFrame_Char_Frame.CharName = OctoFrame_Char_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
			OctoFrame_Char_Frame.curServer = OctoFrame_Char_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
			OctoFrame_Char_Frame.CharNameBG = OctoFrame_Char_Frame:CreateTexture(nil, "BACKGROUND")
			OctoFrame_Char_Frame.CharNameBG:SetAllPoints(OctoFrame_Char_Frame.CharName)
			OctoFrame_Char_Frame.UnitLevel = OctoFrame_Char_Frame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
			OctoFrame_Char_Frame.UnitLevelBG = OctoFrame_Char_Frame:CreateTexture(nil, "BACKGROUND")
			OctoFrame_Char_Frame.UnitLevelBG:SetAllPoints(OctoFrame_Char_Frame.UnitLevel)
			if CharInfo.Faction == "Horde" then
				OctoFrame_Char_Frame.CharNameBG:SetColorTexture(.2, 0, 0, 1)
			else
				OctoFrame_Char_Frame.CharNameBG:SetColorTexture(0, 0, .2, 1)
			end
			OctoFrame_Char_Frame.UnitLevel:SetSize(curWidth, curHeight/2)
			OctoFrame_Char_Frame.UnitLevel:SetPoint("BOTTOM", OctoFrame_Char_Frame, "TOP", 0, 0)
			OctoFrame_Char_Frame.UnitLevel:SetFont(curFontTTF, curFontSize, curFontOutline)
			OctoFrame_Char_Frame.UnitLevel:SetWordWrap(true)
			OctoFrame_Char_Frame.UnitLevel:SetJustifyV("CENTER")
			-- OctoFrame_Char_Frame.UnitLevel:SetText(" ")
			if CharInfo.UnitLevel ~= 70 then
				OctoFrame_Char_Frame.UnitLevelBG:SetColorTexture(bgCr, bgCg, bgCb, 1)
				-- OctoFrame_Char_Frame.UnitLevel:SetText(classcolor:WrapTextInColorCode(CharInfo.UnitLevel.." "..math.floor((CharInfo.currentXP/CharInfo.UnitXPMax)*100).."%"))
				OctoFrame_Char_Frame.UnitLevel:SetText(classcolor:WrapTextInColorCode(CharInfo.UnitLevel))
				OctoFrame_Char_Frame.experience = OctoFrame_Char_Frame:CreateTexture(nil, "ARTWORK")
				if CharInfo.currentXP == 0 then
					OctoFrame_Char_Frame.experience:SetWidth(0.1)
				else
					OctoFrame_Char_Frame.experience:SetWidth(CharInfo.currentXP/CharInfo.UnitXPMax*curWidth)
				end
				OctoFrame_Char_Frame.experience:SetHeight(curHeight/2) -- Высота
				OctoFrame_Char_Frame.experience:SetTexture("Interface\\Addons\\"..GlobalAddonName.."\\Media\\statusbar\\O_03.tga")
				OctoFrame_Char_Frame.experience:SetPoint("BOTTOMLEFT", OctoFrame_Char_Frame, "TOPLEFT")
				OctoFrame_Char_Frame.experience:SetVertexColor(CharInfo.classColor.r, CharInfo.classColor.g, CharInfo.classColor.b, 1)
			elseif CharInfo.UnitLevel == 70 then
				-- OctoFrame_Char_Frame.experience:Hide()
			end
			OctoFrame_Char_Frame.CharName:SetSize(curWidth, curHeight)
			OctoFrame_Char_Frame.CharName:SetFont(curFontTTF, curFontSize, curFontOutline)
			OctoFrame_Char_Frame.CharName:SetPoint("TOP", OctoFrame_Char_Frame, "TOP", 0, 0)
			OctoFrame_Char_Frame.CharName:SetText(classcolor:WrapTextInColorCode(CharInfo.Name))
			OctoFrame_Char_Frame.CharName:SetWordWrap(true)
			OctoFrame_Char_Frame.CharName:SetJustifyV("CENTER")
			if Octo_ToDo_DragonflyVars.config.ShowOnlyCurrentRealm == false then
				OctoFrame_Char_Frame.CharName:SetJustifyV("TOP")
				-- OctoFrame_Char_Frame.CharName:SetPoint("TOP", OctoFrame_Char_Frame, "TOP", 0, 0)
				OctoFrame_Char_Frame.curServer:SetSize(curWidth, curHeight)
				OctoFrame_Char_Frame.curServer:SetPoint("TOP", OctoFrame_Char_Frame, "TOP", 0, 0)
				OctoFrame_Char_Frame.curServer:SetFont(curFontTTF, curFontSize-2, curFontOutline)
				OctoFrame_Char_Frame.curServer:SetText(classcolor:WrapTextInColorCode(CharInfo.curServer))
				OctoFrame_Char_Frame.curServer:SetWordWrap(false)
				OctoFrame_Char_Frame.curServer:SetJustifyV("BOTTOM")
			end
			-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
			-- StaticPopupDialogs[GlobalAddonName.."DELETE_CHARACTER"] = {
			-- text = DELETE.."?",
			-- button1 = YES,
			-- button2 = NO,
			-- hideOnEscape = 1,
			-- whileDead = 1,
			-- OnAccept = function() Octo_ToDo_DragonflyDeleteChar(curCharGUID) end,
			-- }
			-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
			OctoFrame_Char_FrameDeleteButton:SetSize(16, 10)
			OctoFrame_Char_FrameDeleteButton:SetPoint("TOP", OctoFrame_Char_Frame, "BOTTOM", 0, -4)
			OctoFrame_Char_FrameDeleteButton:SetBackdrop({
					edgeFile = "Interface\\Addons\\"..GlobalAddonName.."\\Media\\border\\01 Octo.tga", -- Interface/Addons/"..GlobalAddonName.."/Media/border/01 Octo.tga -- Interface/Buttons/white8x8
					edgeSize = 1,
			})
			OctoFrame_Char_FrameDeleteButton:SetBackdropBorderColor(1, 0, 0, 0)
			OctoFrame_Char_FrameDeleteButton:SetScript("OnEnter", function(self)
					self:SetBackdropBorderColor(1, 0, 0, 1)
					self.icon:SetVertexColor(1, 0, 0, 1)
					GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
					GameTooltip:ClearLines()
					GameTooltip:SetText(DELETE)
					GameTooltip:Show()
			end)
			OctoFrame_Char_FrameDeleteButton:SetScript("OnLeave", function(self)
					self:SetBackdropBorderColor(1, 0, 0, 0)
					self.icon:SetVertexColor(1, 1, 1, 1)
					GameTooltip:ClearLines()
					GameTooltip:Hide()
			end)
			OctoFrame_Char_FrameDeleteButton:SetScript("OnMouseDown", function(self)
					self:SetBackdropBorderColor(1, 0, 0, .5)
					self.icon:SetVertexColor(1, 0, 0, .5)
			end)
			OctoFrame_Char_FrameDeleteButton:SetScript("OnClick", function()
					-- StaticPopup_Show(GlobalAddonName.."DELETE_CHARACTER")
					Octo_ToDo_DragonflyDeleteChar(curCharGUID)
			end)
			local t = OctoFrame_Char_FrameDeleteButton:CreateTexture(nil, "BACKGROUND")
			OctoFrame_Char_FrameDeleteButton.icon = t
			t:SetTexture("Interface\\Addons\\"..GlobalAddonName.."\\Media\\closeWHITE.tga")
			t:SetVertexColor(1, 1, 1, 1)
			t:SetAllPoints(OctoFrame_Char_FrameDeleteButton)
			if curGUID == curCharGUID then
				OctoFrame_Char_Frame.BG:Show()
				OctoFrame_Char_Frame.BG:SetAlpha(.2)
			end
			for i = 1, #OctoTable_func_otrisovka do
				local TEXTLEFT = OctoFrame_Main_Frame["TextLeft"..i]
				local TEXTCENT = OctoFrame_Char_Frame["CenterLines"..i]
				local BG = OctoFrame_Char_Frame["CenterLines"..i.."BG"]
				TEXTCENT.tooltip = {}
				local VivodCent = "C"
				local VivodLeft = "L"
				VivodCent, VivodLeft = OctoTable_func_otrisovka[i](CharInfo, TEXTCENT.tooltip, TEXTCENT.CL, BG)
				TEXTLEFT:SetText(VivodLeft)
				TEXTCENT.CL:SetText(VivodCent)
				if #TEXTCENT.tooltip == 0 or #TEXTCENT.tooltip[1] == 0 then
					TEXTCENT.tooltip = nil
				end
			end
		end
		local curAltFrameWidth = #OctoFrame_Main_Frame.AllCharFrames * curWidth/2
		OctoFrame_Main_Frame:SetSize(curAltFrameWidth*2+curWidthTitle, curHeight*(#OctoTable_func_otrisovka+1))
	end
end
function Octo_ToDo_DragonflyDeleteChar(curGUID)
	Octo_ToDo_DragonflyLevels[curGUID] = nil
	for X, Y in pairs(OctoFrame_Main_Frame.AllCharFrames) do
		-- https://www.wowhead.com/ru/npc=38606/ ДЖАЙНА
		-- https://www.wowhead.com/ru/npc=38609/ СИЛЬВАНА
		PlaySound(11014) -- Джайна стоны
		-- PlaySound(109068) -- Черепаха добралась до воды https://www.wowhead.com/ru/npc=102636/
		if Y == OctoFrame_Main_Frame[curGUID] then
			OctoFrame_Main_Frame.AllCharFrames[X].parent = nil
			OctoFrame_Main_Frame.AllCharFrames[X]:Hide()
			OctoFrame_Main_Frame.AllCharFrames[X] = nil
		end
	end
	Octo_ToDo_DragonflyAddDataToAltFrame()
end
function Octo_ToDo_DragonflyOnEvent(self, event, ...)
	if event == "VARIABLES_LOADED" and not InCombatLockdown() then
		if Octo_ToDo_DragonflyVars == nil then
			Octo_ToDo_DragonflyVars = {}
		end
		if Octo_ToDo_DragonflyVars.config == nil then
			Octo_ToDo_DragonflyVars.config = {}
		end
		if Octo_ToDo_DragonflyLevels == nil then
			Octo_ToDo_DragonflyLevels = {}
		end
		if Octo_ToDo_DragonflyVars.config.CVar == nil then -- RELOAD
			Octo_ToDo_DragonflyVars.config.CVar = false
		end
		if Octo_ToDo_DragonflyVars.config.InputDelete == nil then -- RELOAD
			Octo_ToDo_DragonflyVars.config.InputDelete = true
		end
		if Octo_ToDo_DragonflyVars.config.UsableItems == nil then
			Octo_ToDo_DragonflyVars.config.UsableItems = true
		end
		if Octo_ToDo_DragonflyVars.config.AutoOpen == nil then
			Octo_ToDo_DragonflyVars.config.AutoOpen = true
		end
		if Octo_ToDo_DragonflyVars.config.AutoGossip == nil then
			Octo_ToDo_DragonflyVars.config.AutoGossip = true
		end
		if Octo_ToDo_DragonflyVars.config.TalkingHeadFrame == nil then
			Octo_ToDo_DragonflyVars.config.TalkingHeadFrame = true
		end
		if Octo_ToDo_DragonflyVars.config.HideObjectiveTracker == nil then
			Octo_ToDo_DragonflyVars.config.HideObjectiveTracker = false
		end
		if Octo_ToDo_DragonflyVars.config.HideZoneText == nil then
			Octo_ToDo_DragonflyVars.config.HideZoneText = true
		end
		if Octo_ToDo_DragonflyVars.config.Covenant == nil then
			Octo_ToDo_DragonflyVars.config.Covenant = true
		end
		if Octo_ToDo_DragonflyVars.config.UIErrorsFrameScale == nil then
			Octo_ToDo_DragonflyVars.config.UIErrorsFrameScale = true
		end
		if Octo_ToDo_DragonflyVars.config.RaidBossEmoteFrame == nil then
			Octo_ToDo_DragonflyVars.config.RaidBossEmoteFrame = true
		end
		if Octo_ToDo_DragonflyVars.config.CinematicCanceler == nil then
			Octo_ToDo_DragonflyVars.config.CinematicCanceler = true
		end
		if Octo_ToDo_DragonflyVars.config.BossBanner == nil then
			Octo_ToDo_DragonflyVars.config.BossBanner = true
		end
		if Octo_ToDo_DragonflyVars.config.AnotherAddonsCasual == nil then -- RELOAD
			Octo_ToDo_DragonflyVars.config.AnotherAddonsCasual = false
		end
		if Octo_ToDo_DragonflyVars.config.AnotherAddonsRAID == nil then -- RELOAD
			Octo_ToDo_DragonflyVars.config.AnotherAddonsRAID = false
		end
		if Octo_ToDo_DragonflyVars.config.ClearChat == nil then
			Octo_ToDo_DragonflyVars.config.ClearChat = true
		end
		if Octo_ToDo_DragonflyVars.config.ShowOnlyCurrentRealm == nil then
			Octo_ToDo_DragonflyVars.config.ShowOnlyCurrentRealm = true
		end
		if Octo_ToDo_DragonflyVars.config.LevelToShow == nil then
			Octo_ToDo_DragonflyVars.config.LevelToShow = 60
		end
		if Octo_ToDo_DragonflyVars.config.AutoSellGrey == nil then
			Octo_ToDo_DragonflyVars.config.AutoSellGrey = true
		end
		if Octo_ToDo_DragonflyVars.config.AutoRepair == nil then
			Octo_ToDo_DragonflyVars.config.AutoRepair = true
		end
		if Octo_ToDo_DragonflyVars.config.HideErrorMessages == nil then
			Octo_ToDo_DragonflyVars.config.HideErrorMessages = true
		end
		-- Expansions
		if Octo_ToDo_DragonflyVars.config.LINE_Classic == nil then
			Octo_ToDo_DragonflyVars.config.LINE_Classic = false
		end
		if Octo_ToDo_DragonflyVars.config.LINE_TheBurningCrusade == nil then
			Octo_ToDo_DragonflyVars.config.LINE_TheBurningCrusade = false
		end
		if Octo_ToDo_DragonflyVars.config.LINE_WrathoftheLichKing == nil then
			Octo_ToDo_DragonflyVars.config.LINE_WrathoftheLichKing = false
		end
		if Octo_ToDo_DragonflyVars.config.LINE_Cataclysm == nil then
			Octo_ToDo_DragonflyVars.config.LINE_Cataclysm = false
		end
		if Octo_ToDo_DragonflyVars.config.LINE_MistsofPandaria == nil then
			Octo_ToDo_DragonflyVars.config.LINE_MistsofPandaria = false
		end
		if Octo_ToDo_DragonflyVars.config.LINE_WarlordsofDraenor == nil then
			Octo_ToDo_DragonflyVars.config.LINE_WarlordsofDraenor = false
		end
		if Octo_ToDo_DragonflyVars.config.LINE_Legion == nil then
			Octo_ToDo_DragonflyVars.config.LINE_Legion = false
		end
		if Octo_ToDo_DragonflyVars.config.LINE_BattleforAzeroth == nil then
			Octo_ToDo_DragonflyVars.config.LINE_BattleforAzeroth = false
		end
		if Octo_ToDo_DragonflyVars.config.LINE_Shadowlands == nil then
			Octo_ToDo_DragonflyVars.config.LINE_Shadowlands = false
		end
		if Octo_ToDo_DragonflyVars.config.LINE_Dragonflight == nil then
			Octo_ToDo_DragonflyVars.config.LINE_Dragonflight = true
		end
		if Octo_ToDo_DragonflyVars.config.LINE_OctoDEV == nil then
			Octo_ToDo_DragonflyVars.config.LINE_OctoDEV = false
		end
		for i, func in ipairs(E.modules) do
			func()
		end
		O_otrisovka()
		-- CurrencyTinsert()
		local MinimapName = GlobalAddonName.."Minimap"
		local ldb_icon = ldb:NewDataObject(MinimapName, {
				type = "data source",
				text = MinimapName,
				icon = IconTexture,
				OnClick = function(_, button)
					if not InCombatLockdown() then
						OctoFrame_Main_Frame:SetShown(not OctoFrame_Main_Frame:IsShown())
						if PlayCustomSound == true then
							PlaySoundFile("Interface\\AddOns\\"..GlobalAddonName.."\\Media\\sound\\Memes\\Gnome Woo.ogg", "Master")
						end
						-- Fragments_Earned()
						Collect_All_Reputations()
						Collect_ALL_PVPRaitings()
						-- if OctoFrame_Main_Frame and OctoFrame_Main_Frame:IsShown() then
						-- OctoFrame_Main_Frame:Hide()
						-- end
						-- if SettingsPanel:IsVisible() and self:IsVisible() then
						-- HideUIPanel(SettingsPanel)
						-- else
						-- Settings.OpenToCategory(GlobalAddonName, true)
						-- end
					end
				end,
				OnEnter = function(self)
					GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
					GameTooltip_SetTitle(GameTooltip, AddonTitle.." "..AddonVersion)
					GameTooltip:Show()
				end,
				OnLeave = function()
					GameTooltip:Hide()
				end,
		})
		Octo_ToDo_DragonflyVars.config = Octo_ToDo_DragonflyVars.config or {}
		Octo_ToDo_DragonflyVars.config.minimapPos = Octo_ToDo_DragonflyVars.config.minimapPos or 244
		Octo_ToDo_DragonflyVars.config.AddonVersion = tonumber(AddonVersion)
		ldbi:Register(MinimapName, ldb_icon, Octo_ToDo_DragonflyVars.config)
		ldbi:Show(MinimapName)
	elseif event == "ACTIONBAR_UPDATE_COOLDOWN" and not InCombatLockdown() and OctoFrame_Main_Frame and OctoFrame_Main_Frame:IsShown() then
		Octo_ToDo_DragonflyAddDataToAltFrame()
		Timer_Legion_Invasion()
		Timer_BfA_Invasion()
		Timer_BfA_Assault()
		Timer_DF_ToDragonbaneKeep()
		Timer_DF_GrandHunts()
		Timer_DF_CommunityFeast()
		Timer_DF_PrimalStorms()
		Timer_DF_ResearchersUnderFire()
		Timer_SL_Maw_Assault()
		Collect_All_Professions()
		Collect_ALL_DungeonsRaiting()
		-- Collect_ALL_PVPRaitings()
		Collect_ALL_CurrentKEY()
		Collect_All_Reputations()
		Collect_All_Quests()
		Collect_BfA_QuestsBounties()
		Collect_ALL_UNIVERSALQuestUpdate()
		Collect_BfA_Island()
		Collect_ALL_LoginTime()
	elseif event == "COVENANT_CHOSEN" then
		C_Timer.After(1, function()
				Collect_SL_CovenantAnima()
		end)
	elseif event == "COVENANT_SANCTUM_RENOWN_LEVEL_CHANGED" then
		C_Timer.After(1, function()
				Collect_SL_CovenantAnima()
		end)
	elseif event == "QUEST_FINISHED" then
		Collect_All_Quests()
		Collect_BfA_QuestsBounties()
		Collect_ALL_UNIVERSALQuestUpdate()
		Collect_BfA_Island()
		Octo_ToDo_DragonflyAddDataToAltFrame()
	elseif event == "QUEST_TURNED_IN" then
		Collect_All_Quests()
		Collect_BfA_QuestsBounties()
		Collect_ALL_UNIVERSALQuestUpdate()
		Collect_BfA_Island()
		Octo_ToDo_DragonflyAddDataToAltFrame()
	elseif event == "QUEST_REMOVED" then
		Collect_All_Quests()
		Collect_BfA_QuestsBounties()
		Collect_ALL_UNIVERSALQuestUpdate()
		Collect_BfA_Island()
		Octo_ToDo_DragonflyAddDataToAltFrame()
	elseif event == "QUEST_COMPLETE" then
		Collect_All_Quests()
		Collect_BfA_QuestsBounties()
		Collect_ALL_UNIVERSALQuestUpdate()
		Collect_BfA_Island()
		Octo_ToDo_DragonflyAddDataToAltFrame()
	elseif event == "QUEST_LOG_UPDATE" then
		Collect_All_Quests()
		Collect_BfA_QuestsBounties()
		Collect_ALL_UNIVERSALQuestUpdate()
		Collect_BfA_Island()
		if OctoFrame_Main_Frame and OctoFrame_Main_Frame:IsShown() then
			Octo_ToDo_DragonflyAddDataToAltFrame()
		end
	elseif event == "PLAYER_MONEY" then
		Collect_ALL_MoneyUpdate()
		if OctoFrame_Main_Frame and OctoFrame_Main_Frame:IsShown() then
			Octo_ToDo_DragonflyAddDataToAltFrame()
		end
	elseif event == "CURRENCY_DISPLAY_UPDATE" and not InCombatLockdown() then
		Collect_All_Currency()
		Collect_ALL_KnownSpell()
		Collect_SL_PossibleAnima()
		if OctoFrame_Main_Frame:IsShown() then
			Octo_ToDo_DragonflyAddDataToAltFrame()
		end
	elseif (event == "UNIT_INVENTORY_CHANGED" or event == "PLAYER_EQUIPMENT_CHANGED" or event == "PLAYER_AVG_ITEM_LEVEL_UPDATE") and not InCombatLockdown() then
		Collect_ALL_ItemLevel()
		Collect_ALL_PlayerInfo()
		Collect_BfA_Cloaklvl()
		if OctoFrame_Main_Frame and OctoFrame_Main_Frame:IsShown() then
			Octo_ToDo_DragonflyAddDataToAltFrame()
		end
	elseif event == "PLAYER_LOGIN" then
		-- Collect_ALL_VoidStorage()
		local curGUID = UnitGUID("PLAYER")
		Octo_ToDo_DragonflyLevels[curGUID] = Octo_ToDo_DragonflyLevels[curGUID] or {}
		for k, CharInfo in pairs(Octo_ToDo_DragonflyLevels) do
			checkCharInfo(CharInfo)
		end
		self:RegisterEvent("CURRENCY_DISPLAY_UPDATE")
		self:RegisterEvent("QUEST_LOG_UPDATE")
		self:RegisterEvent("PLAYER_MONEY")
		self:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN")
		self:RegisterEvent("PLAYER_STARTED_MOVING")
		Collect_SL_CovenantAnima()
		Collect_ALL_PlayerInfo()
		Collect_ALL_PVPRaitings()
		Collect_ALL_MoneyUpdate()
		Collect_ALL_ItemLevel()
		Octo_ToDo_DragonflyCreateAltFrame()
		Collect_All_Currency()
		Collect_ALL_KnownSpell()
		Collect_All_Professions()
		Collect_All_Reputations()
		Collect_ALL_DungeonsRaiting()
		Collect_ALL_CurrentKEY()
		Collect_All_Quests()
		Collect_BfA_QuestsBounties()
		Collect_ALL_UNIVERSALQuestUpdate()
		Collect_BfA_Island()
		Create_UPGRADERANKS_Frame()
		Collect_BfA_Azerite()
		Collect_BfA_Cloaklvl()
		Collect_Legion_Artifact()
		C_Timer.After(3, function()
				Octo_ToDo_DragonflyAddDataToAltFrame()
		end)
	elseif event == "PLAYER_LOGOUT" and not InCombatLockdown() then
		Collect_ALL_PVPRaitings()
	elseif event == "PLAYER_LEAVING_WORLD" and not InCombatLockdown() then
		Collect_ALL_DungeonsRaiting()
		Collect_ALL_LoginTime()
	elseif event == "PLAYER_ENTERING_WORLD" and not InCombatLockdown() then
		Collect_ALL_PVPRaitings()
		Collect_ALL_LoginTime()
		Collect_ALL_ItemsInBag()
		Collect_ALL_Locations()
		Collect_ALL_MountEquipmentID()
		Collect_SL_PossibleAnima()
		Collect_BfA_Azerite()
		Collect_BfA_Cloaklvl()
		Collect_Legion_Artifact()
	elseif event == "BAG_UPDATE" and not InCombatLockdown() then
		Collect_ALL_ItemsInBag()
		Collect_SL_PossibleAnima()
		Collect_ALL_CurrentKEY()
	elseif event == "HEARTHSTONE_BOUND" and not InCombatLockdown() then
		Collect_ALL_Locations()
		Collect_SL_PossibleAnima()
		Collect_ALL_LoginTime()
	elseif event == "ZONE_CHANGED" and not InCombatLockdown() then
		Collect_ALL_Locations()
		Collect_SL_PossibleAnima()
		Collect_ALL_LoginTime()
	elseif event == "ZONE_CHANGED_NEW_AREA" and not InCombatLockdown() then
		Collect_ALL_Locations()
		Collect_SL_PossibleAnima()
		Collect_ALL_LoginTime()
	elseif event == "BANKFRAME_OPENED" or event == "PLAYERBANKSLOTS_CHANGED" then
		Collect_ALL_BankInfo()
	elseif event == "BAG_UPDATE" then
		if BankFrame:IsShown() then
			Collect_ALL_BankInfo()
		end
	elseif event == "VOID_STORAGE_UPDATE" or event == "VOID_TRANSFER_DONE" or event == "VOID_STORAGE_CONTENTS_UPDATE" or event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
		Collect_ALL_VoidStorage()
	elseif event == "SPELLS_CHANGED" then
		Collect_ALL_KnownSpell()
	elseif event == "PLAYER_MOUNT_DISPLAY_CHANGED" then
		Collect_ALL_MountEquipmentID()
	elseif event == "AZERITE_ITEM_EXPERIENCE_CHANGED" then
		Collect_BfA_Azerite()
		Collect_BfA_Cloaklvl()
	elseif event == "PLAYER_ENTERING_WORLD" or event == "MAIL_INBOX_UPDATE" or event == "MAIL_SHOW" or event == "UPDATE_PENDING_MAIL" then
		Collect_ALL_Mail()
	end
end
Octo_ToDo_DragonflyOnLoad()
SLASH_Octo1, SLASH_Octo2 = '/Octo', '/OctoDF'
function SlashCmdList.Octo(msg, editBox)
	OctoFrame_Main_Frame:SetShown(not OctoFrame_Main_Frame:IsShown())
	Collect_ALL_ItemsInBag()
	Collect_ALL_Locations()
	Collect_SL_PossibleAnima()
	Collect_All_Reputations()
	Octo_ToDo_DragonflyAddDataToAltFrame()
end
SLASH_GSEARCH1 = "/gsearch"
SlashCmdList.GSEARCH = function(msg)
	print("SEARCH:", msg)
	for i, n in pairs(_G) do
		if type(n) == "string" and n:find(msg) then
			print(i, n)
		end
	end
end
-- local ColorKyrian = CreateColor(1, 1, 1, 1)
-- (KYRIAN_Blue_Color:GetRGB())
-- SetAtlas("Dragonfly-landingbutton-kyrian-highlight")

