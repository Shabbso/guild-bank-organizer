local _, GBO = ...
-- Generated reference payload: records are decoded only on first reference use.
-- Compact text is retained at login; no per-item record tables are allocated.
local packed = [==[
117	Tough Jerky	food	intrinsic item metadata	public
118	Minor Healing Potion	alchemy	intrinsic item metadata	public
159	Refreshing Spring Water	food	intrinsic item metadata	public
414	Dalaran Sharp	food	intrinsic item metadata	public
422	Dwarven Mild	food	intrinsic item metadata	public
723	Goretusk Liver	fish	intrinsic item metadata	public
724	Goretusk Liver Pie	food	intrinsic item metadata	public
729	Stringy Vulture Meat	fish	intrinsic item metadata	public
730	Murloc Eye	fish	intrinsic item metadata	public
731	Goretusk Snout	fish	intrinsic item metadata	public
733	Westfall Stew	food	intrinsic item metadata	public
741	Deprecated Copper Ingot		deprecated client record	excluded
756	Tunnel Pick	weapons	intrinsic item metadata	public
765	Silverleaf	herbs	intrinsic item metadata	public
769	Chunk of Boar Meat	fish	intrinsic item metadata	public
774	Malachite	jewels	intrinsic item metadata	public
778	Kobold Excavation Pick	weapons	intrinsic item metadata	public
783	Light Hide	leather	intrinsic item metadata	public
785	Mageroyal	herbs	intrinsic item metadata	public
786	Deprecated Pure Copper Ingot		deprecated client record	excluded
787	Slitherskin Mackerel	food	intrinsic item metadata	public
807	Deprecated Iron Ingot		deprecated client record	excluded
814	Flask of Oil	engineering	specialized bag and profession data	public
818	Tigerseye	jewels	intrinsic item metadata	public
858	Lesser Healing Potion	alchemy	intrinsic item metadata	public
929	Healing Potion	alchemy	intrinsic item metadata	public
954	Scroll of Strength	inscription	specialized bag and profession data	public
955	Scroll of Intellect	inscription	specialized bag and profession data	public
961	Healing Herb	food	intrinsic item metadata	public
1015	Lean Wolf Flank	fish	intrinsic item metadata	public
1017	Seasoned Wolf Kabob	food	intrinsic item metadata	public
1072	Full Moonshine	food	intrinsic item metadata	public
1080	Tough Condor Meat	fish	intrinsic item metadata	public
1082	Redridge Goulash	food	intrinsic item metadata	public
1119	Bottled Spirits	food	intrinsic item metadata	public
1165	Test Food		internal test item	excluded
1179	Ice Cold Milk	food	intrinsic item metadata	public
1180	Scroll of Stamina	inscription	specialized bag and profession data	public
1181	Scroll of Spirit	inscription	specialized bag and profession data	public
1205	Melon Juice	food	intrinsic item metadata	public
1206	Moss Agate	jewels	intrinsic item metadata	public
1210	Shadowgem	jewels	intrinsic item metadata	public
1251	Linen Bandage	first_aid	intrinsic item metadata	public
1288	Large Venom Sac	first_aid	curated player-facing category	public
1326	Sauteed Sunfish	food	intrinsic item metadata	public
1401	Riverpaw Tea Leaf	food	intrinsic item metadata	public
1450	Potion of Fervor	alchemy	intrinsic item metadata	public
1468	Murloc Fin	fish	intrinsic item metadata	public
1475	Small Venom Sac	first_aid	single profession category	public
1477	Scroll of Agility II	inscription	specialized bag and profession data	public
1478	Scroll of Protection II	inscription	specialized bag and profession data	public
1529	Jade	jewels	intrinsic item metadata	public
1645	Moonberry Juice	food	intrinsic item metadata	public
1705	Lesser Moonstone	jewels	intrinsic item metadata	public
1707	Stormwind Brie	food	intrinsic item metadata	public
1708	Sweet Nectar	food	intrinsic item metadata	public
1710	Greater Healing Potion	alchemy	intrinsic item metadata	public
1711	Scroll of Stamina II	inscription	specialized bag and profession data	public
1712	Scroll of Spirit II	inscription	specialized bag and profession data	public
1819	Gouging Pick	weapons	intrinsic item metadata	public
1950	Deprecated Gold Ingot		deprecated client record	excluded
2050	Deprecated Silver Ingot		deprecated client record	excluded
2070	Darnassian Bleu	food	intrinsic item metadata	public
2251	Gooey Spider Leg	fish	intrinsic item metadata	public
2287	Haunch of Meat	food	intrinsic item metadata	public
2289	Scroll of Strength II	inscription	specialized bag and profession data	public
2290	Scroll of Intellect II	inscription	specialized bag and profession data	public
2300	Embossed Leather Vest	armor	intrinsic item metadata	public
2302	Handstitched Leather Boots	armor	intrinsic item metadata	public
2303	Handstitched Leather Pants	armor	intrinsic item metadata	public
2304	Light Armor Kit	enchanting	intrinsic item metadata	public
2307	Fine Leather Boots	armor	intrinsic item metadata	public
2308	Fine Leather Cloak	armor	intrinsic item metadata	public
2309	Embossed Leather Boots	armor	intrinsic item metadata	public
2310	Embossed Leather Cloak	armor	intrinsic item metadata	public
2311	White Leather Jerkin	armor	intrinsic item metadata	public
2312	Fine Leather Gloves	armor	intrinsic item metadata	public
2313	Medium Armor Kit	enchanting	intrinsic item metadata	public
2314	Toughened Leather Armor	armor	intrinsic item metadata	public
2315	Dark Leather Boots	armor	intrinsic item metadata	public
2316	Dark Leather Cloak	armor	intrinsic item metadata	public
2317	Dark Leather Tunic	armor	intrinsic item metadata	public
2318	Light Leather	leather	intrinsic item metadata	public
2319	Medium Leather	leather	intrinsic item metadata	public
2320	Coarse Thread	cloth	intrinsic item metadata	public
2321	Fine Thread	cloth	intrinsic item metadata	public
2324	Bleach	tailoring	curated player-facing category	public
2325	Black Dye	tailoring	curated player-facing category	public
2404	Deprecated Pattern: Light Winter Cloak		deprecated client record	excluded
2405	Deprecated Pattern: Light Winter Boots		deprecated client record	excluded
2406	Pattern: Fine Leather Boots	leatherworking	intrinsic item metadata	public
2407	Pattern: White Leather Jerkin	leatherworking	intrinsic item metadata	public
2408	Pattern: Fine Leather Gloves	leatherworking	intrinsic item metadata	public
2409	Pattern: Dark Leather Tunic	leatherworking	intrinsic item metadata	public
2447	Peacebloom	herbs	intrinsic item metadata	public
2449	Earthroot	herbs	intrinsic item metadata	public
2450	Briarthorn	herbs	intrinsic item metadata	public
2452	Swiftthistle	herbs	intrinsic item metadata	public
2453	Bruiseweed	herbs	intrinsic item metadata	public
2454	Elixir of Lion's Strength	alchemy	intrinsic item metadata	public
2455	Minor Mana Potion	alchemy	intrinsic item metadata	public
2456	Minor Rejuvenation Potion	alchemy	intrinsic item metadata	public
2457	Elixir of Minor Agility	alchemy	intrinsic item metadata	public
2458	Elixir of Minor Fortitude	alchemy	intrinsic item metadata	public
2459	Swiftness Potion	alchemy	intrinsic item metadata	public
2461	Deprecated Elemental Resistance Potion		deprecated client record	excluded
2462	Deprecated Potion of Lesser Invulnerability (Fix)		deprecated client record	excluded
2553	Recipe: Elixir of Minor Agility	alchemy	intrinsic item metadata	public
2554	Deprecated Recipe: Elixir of Fortitude		deprecated client record	excluded
2555	Recipe: Swiftness Potion	alchemy	intrinsic item metadata	public
2556	Recipe: Elixir of Tongues	alchemy	intrinsic item metadata	public
2568	Brown Linen Vest	armor	intrinsic item metadata	public
2569	Linen Boots	armor	intrinsic item metadata	public
2570	Linen Cloak	armor	intrinsic item metadata	public
2572	Red Linen Robe	armor	intrinsic item metadata	public
2575	Red Linen Shirt	armor	intrinsic item metadata	public
2576	White Linen Shirt	armor	intrinsic item metadata	public
2577	Blue Linen Shirt	armor	intrinsic item metadata	public
2578	Barbaric Linen Vest	armor	intrinsic item metadata	public
2579	Green Linen Shirt	armor	intrinsic item metadata	public
2580	Reinforced Linen Cape	armor	intrinsic item metadata	public
2581	Heavy Linen Bandage	first_aid	intrinsic item metadata	public
2582	Green Woolen Vest	armor	intrinsic item metadata	public
2583	Woolen Boots	armor	intrinsic item metadata	public
2584	Woolen Cape	armor	intrinsic item metadata	public
2585	Gray Woolen Robe	armor	intrinsic item metadata	public
2587	Gray Woolen Shirt	armor	intrinsic item metadata	public
2589	Linen Cloth	cloth	intrinsic item metadata	public
2592	Wool Cloth	cloth	intrinsic item metadata	public
2593	Flask of Stormwind Tawny	food	intrinsic item metadata	public
2594	Flagon of Dwarven Honeymead	food	intrinsic item metadata	public
2595	Jug of Badlands Bourbon	food	intrinsic item metadata	public
2596	Skin of Dwarven Stout	food	intrinsic item metadata	public
2598	Pattern: Red Linen Robe	tailoring	intrinsic item metadata	public
2599	Deprecated Pattern: Forest Silk Gloves		deprecated client record	excluded
2600	Deprecated Pattern: Trogg Vest		deprecated client record	excluded
2601	Pattern: Gray Woolen Robe	tailoring	intrinsic item metadata	public
2602	Deprecated Pattern: Feathered Robe		deprecated client record	excluded
2604	Red Dye	tailoring	curated player-facing category	public
2605	Green Dye	tailoring	curated player-facing category	public
2665	Stormwind Seasoning Herbs	fish	intrinsic item metadata	public
2672	Stringy Wolf Meat	fish	intrinsic item metadata	public
2673	Coyote Meat	fish	intrinsic item metadata	public
2674	Crawler Meat	fish	intrinsic item metadata	public
2675	Crawler Claw	fish	intrinsic item metadata	public
2677	Boar Ribs	fish	intrinsic item metadata	public
2678	Mild Spices	fish	single profession category	public
2679	Charred Wolf Meat	food	intrinsic item metadata	public
2680	Spiced Wolf Meat	food	intrinsic item metadata	public
2681	Roasted Boar Meat	food	intrinsic item metadata	public
2682	Cooked Crab Claw	food	intrinsic item metadata	public
2683	Crab Cake	food	intrinsic item metadata	public
2684	Coyote Steak	food	intrinsic item metadata	public
2685	Succulent Pork Ribs	food	intrinsic item metadata	public
2686	Thunder Ale	food	intrinsic item metadata	public
2687	Dry Pork Ribs	food	intrinsic item metadata	public
2697	Recipe: Goretusk Liver Pie	fish	intrinsic item metadata	public
2699	Recipe: Redridge Goulash	fish	intrinsic item metadata	public
2700	Recipe: Succulent Pork Ribs	fish	intrinsic item metadata	public
2701	Recipe: Seasoned Wolf Kabob	fish	intrinsic item metadata	public
2723	Bottle of Dalaran Noir	food	intrinsic item metadata	public
2770	Copper Ore	ore	intrinsic item metadata	public
2771	Tin Ore	ore	intrinsic item metadata	public
2772	Iron Ore	ore	intrinsic item metadata	public
2775	Silver Ore	ore	intrinsic item metadata	public
2776	Gold Ore	ore	intrinsic item metadata	public
2835	Rough Stone	ore	intrinsic item metadata	public
2836	Coarse Stone	ore	intrinsic item metadata	public
2838	Heavy Stone	ore	intrinsic item metadata	public
2840	Copper Bar	ore	intrinsic item metadata	public
2841	Bronze Bar	ore	intrinsic item metadata	public
2842	Silver Bar	ore	intrinsic item metadata	public
2844	Copper Mace	weapons	intrinsic item metadata	public
2845	Copper Axe	weapons	intrinsic item metadata	public
2847	Copper Shortsword	weapons	intrinsic item metadata	public
2848	Bronze Mace	weapons	intrinsic item metadata	public
2849	Bronze Axe	weapons	intrinsic item metadata	public
2850	Bronze Shortsword	weapons	intrinsic item metadata	public
2851	Copper Chain Belt	armor	intrinsic item metadata	public
2852	Copper Chain Pants	armor	intrinsic item metadata	public
2853	Copper Bracers	armor	intrinsic item metadata	public
2854	Runed Copper Bracers	armor	intrinsic item metadata	public
2857	Runed Copper Belt	armor	intrinsic item metadata	public
2862	Rough Sharpening Stone	blacksmithing	single crafted-product category	public
2863	Coarse Sharpening Stone	blacksmithing	single crafted-product category	public
2864	Runed Copper Breastplate	armor	intrinsic item metadata	public
2865	Rough Bronze Leggings	armor	intrinsic item metadata	public
2866	Rough Bronze Cuirass	armor	intrinsic item metadata	public
2867	Rough Bronze Bracers	armor	intrinsic item metadata	public
2868	Patterned Bronze Bracers	armor	intrinsic item metadata	public
2869	Silvered Bronze Breastplate	armor	intrinsic item metadata	public
2870	Shining Silver Breastplate	armor	intrinsic item metadata	public
2871	Heavy Sharpening Stone	blacksmithing	single crafted-product category	public
2880	Weak Flux	blacksmithing	single profession category	public
2881	Plans: Runed Copper Breastplate	blacksmithing	intrinsic item metadata	public
2882	Plans: Silvered Bronze Shoulders	blacksmithing	intrinsic item metadata	public
2883	Plans: Deadly Bronze Poniard	blacksmithing	intrinsic item metadata	public
2886	Crag Boar Rib	fish	intrinsic item metadata	public
2888	Beer Basted Boar Ribs	food	intrinsic item metadata	public
2889	Recipe: Beer Basted Boar Ribs	fish	intrinsic item metadata	public
2894	Rhapsody Malt	food	intrinsic item metadata	public
2901	Mining Pick	weapons	intrinsic item metadata	public
2924	Crocolisk Meat	fish	intrinsic item metadata	public
2934	Ruined Leather Scraps	leather	intrinsic item metadata	public
2996	Bolt of Linen Cloth	cloth	intrinsic item metadata	public
2997	Bolt of Woolen Cloth	cloth	intrinsic item metadata	public
3012	Scroll of Agility	inscription	specialized bag and profession data	public
3013	Scroll of Protection	inscription	specialized bag and profession data	public
3087	Mug of Shimmer Stout	alchemy	intrinsic item metadata	public
3164	Discolored Worg Heart	alchemy	single profession category	public
3172	Boar Intestines	fish	intrinsic item metadata	public
3173	Bear Meat	fish	intrinsic item metadata	public
3174	Spider Ichor	fish	intrinsic item metadata	public
3182	Spider's Silk	cloth	intrinsic item metadata	public
3220	Blood Sausage	food	intrinsic item metadata	public
3239	Rough Weightstone	blacksmithing	single crafted-product category	public
3240	Coarse Weightstone	blacksmithing	single crafted-product category	public
3241	Heavy Weightstone	blacksmithing	single crafted-product category	public
3355	Wild Steelbloom	herbs	intrinsic item metadata	public
3356	Kingsblood	herbs	intrinsic item metadata	public
3357	Liferoot	herbs	intrinsic item metadata	public
3358	Khadgar's Whisker	herbs	intrinsic item metadata	public
3369	Grave Moss	herbs	intrinsic item metadata	public
3371	Crystal Vial	alchemy	curated player-facing category	public
3372	Cracked Vial	inscription	specialized bag and profession data	public
3382	Weak Troll's Blood Elixir	alchemy	intrinsic item metadata	public
3383	Elixir of Wisdom	alchemy	intrinsic item metadata	public
3385	Lesser Mana Potion	alchemy	intrinsic item metadata	public
3386	Potion of Curing	alchemy	intrinsic item metadata	public
3387	Limited Invulnerability Potion	alchemy	intrinsic item metadata	public
3388	Strong Troll's Blood Elixir	alchemy	intrinsic item metadata	public
3389	Elixir of Defense	alchemy	intrinsic item metadata	public
3390	Elixir of Lesser Agility	alchemy	intrinsic item metadata	public
3391	Elixir of Ogre's Strength	alchemy	intrinsic item metadata	public
3394	Recipe: Potion of Curing	alchemy	intrinsic item metadata	public
3395	Recipe: Limited Invulnerability Potion	alchemy	intrinsic item metadata	public
3396	Recipe: Elixir of Lesser Agility	alchemy	intrinsic item metadata	public
3404	Buzzard Wing	fish	intrinsic item metadata	public
3448	Senggin Root	food	intrinsic item metadata	public
3466	Strong Flux	blacksmithing	single profession category	public
3469	Copper Chain Boots	armor	intrinsic item metadata	public
3470	Rough Grinding Stone	ore	intrinsic item metadata	public
3471	Copper Chain Vest	armor	intrinsic item metadata	public
3472	Runed Copper Gauntlets	armor	intrinsic item metadata	public
3473	Runed Copper Pants	armor	intrinsic item metadata	public
3474	Gemmed Copper Gauntlets	armor	intrinsic item metadata	public
3478	Coarse Grinding Stone	ore	intrinsic item metadata	public
3480	Rough Bronze Shoulders	armor	intrinsic item metadata	public
3481	Silvered Bronze Shoulders	armor	intrinsic item metadata	public
3482	Silvered Bronze Boots	armor	intrinsic item metadata	public
3483	Silvered Bronze Gauntlets	armor	intrinsic item metadata	public
3484	Green Iron Boots	armor	intrinsic item metadata	public
3485	Green Iron Gauntlets	armor	intrinsic item metadata	public
3486	Heavy Grinding Stone	ore	intrinsic item metadata	public
3487	Heavy Copper Broadsword	weapons	intrinsic item metadata	public
3488	Copper Battle Axe	weapons	intrinsic item metadata	public
3489	Thick War Axe	weapons	intrinsic item metadata	public
3490	Deadly Bronze Poniard	weapons	intrinsic item metadata	public
3491	Heavy Bronze Mace	weapons	intrinsic item metadata	public
3492	Mighty Iron Hammer	weapons	intrinsic item metadata	public
3530	Wool Bandage	first_aid	intrinsic item metadata	public
3531	Heavy Wool Bandage	first_aid	intrinsic item metadata	public
3575	Iron Bar	ore	intrinsic item metadata	public
3576	Tin Bar	ore	intrinsic item metadata	public
3577	Gold Bar	ore	intrinsic item metadata	public
3608	Plans: Mighty Iron Hammer	blacksmithing	intrinsic item metadata	public
3609	Plans: Copper Chain Vest	blacksmithing	intrinsic item metadata	public
3610	Plans: Gemmed Copper Gauntlets	blacksmithing	intrinsic item metadata	public
3611	Plans: Green Iron Boots	blacksmithing	intrinsic item metadata	public
3612	Plans: Green Iron Gauntlets	blacksmithing	intrinsic item metadata	public
3662	Crocolisk Steak	food	intrinsic item metadata	public
3663	Murloc Fin Soup	food	intrinsic item metadata	public
3664	Crocolisk Gumbo	food	intrinsic item metadata	public
3665	Curiously Tasty Omelet	food	intrinsic item metadata	public
3666	Gooey Spider Cake	food	intrinsic item metadata	public
3667	Tender Crocolisk Meat	fish	intrinsic item metadata	public
3678	Recipe: Crocolisk Steak	fish	intrinsic item metadata	public
3679	Recipe: Blood Sausage	fish	intrinsic item metadata	public
3680	Recipe: Murloc Fin Soup	fish	intrinsic item metadata	public
3681	Recipe: Crocolisk Gumbo	fish	intrinsic item metadata	public
3682	Recipe: Curiously Tasty Omelet	fish	intrinsic item metadata	public
3683	Recipe: Gooey Spider Cake	fish	intrinsic item metadata	public
3685	Raptor Egg	fish	intrinsic item metadata	public
3703	Southshore Stout	food	intrinsic item metadata	public
3712	Turtle Meat	fish	intrinsic item metadata	public
3719	Hillman's Cloak	armor	intrinsic item metadata	public
3726	Big Bear Steak	food	intrinsic item metadata	public
3727	Hot Lion Chops	food	intrinsic item metadata	public
3728	Tasty Lion Steak	food	intrinsic item metadata	public
3729	Soothing Turtle Bisque	food	intrinsic item metadata	public
3730	Big Bear Meat	fish	intrinsic item metadata	public
3731	Lion Meat	fish	intrinsic item metadata	public
3734	Recipe: Big Bear Steak	fish	intrinsic item metadata	public
3735	Recipe: Hot Lion Chops	fish	intrinsic item metadata	public
3736	Recipe: Tasty Lion Steak	fish	intrinsic item metadata	public
3737	Recipe: Soothing Turtle Bisque	fish	intrinsic item metadata	public
3770	Mutton Chop	food	intrinsic item metadata	public
3771	Wild Hog Shank	food	intrinsic item metadata	public
3818	Fadeleaf	herbs	intrinsic item metadata	public
3819	Dragon's Teeth	herbs	intrinsic item metadata	public
3820	Stranglekelp	herbs	intrinsic item metadata	public
3821	Goldthorn	herbs	intrinsic item metadata	public
3823	Lesser Invisibility Potion	alchemy	intrinsic item metadata	public
3824	Shadow Oil	alchemy	single crafted-product category	public
3825	Elixir of Fortitude	alchemy	intrinsic item metadata	public
3826	Major Troll's Blood Elixir	alchemy	intrinsic item metadata	public
3827	Mana Potion	alchemy	intrinsic item metadata	public
3828	Elixir of Detect Lesser Invisibility	alchemy	intrinsic item metadata	public
3829	Frost Oil	alchemy	single crafted-product category	public
3830	Recipe: Elixir of Fortitude	alchemy	intrinsic item metadata	public
3831	Recipe: Major Troll's Blood Elixir	alchemy	intrinsic item metadata	public
3832	Recipe: Elixir of Detect Lesser Invisibility	alchemy	intrinsic item metadata	public
3835	Green Iron Bracers	armor	intrinsic item metadata	public
3836	Green Iron Helm	armor	intrinsic item metadata	public
3837	Golden Scale Coif	armor	intrinsic item metadata	public
3840	Green Iron Shoulders	armor	intrinsic item metadata	public
3841	Golden Scale Shoulders	armor	intrinsic item metadata	public
3842	Green Iron Leggings	armor	intrinsic item metadata	public
3843	Golden Scale Leggings	armor	intrinsic item metadata	public
3844	Green Iron Hauberk	armor	intrinsic item metadata	public
3845	Golden Scale Cuirass	armor	intrinsic item metadata	public
3846	Polished Steel Boots	armor	intrinsic item metadata	public
3847	Golden Scale Boots	armor	intrinsic item metadata	public
3848	Big Bronze Knife	weapons	intrinsic item metadata	public
3849	Hardened Iron Shortsword	weapons	intrinsic item metadata	public
3850	Jade Serpentblade	weapons	intrinsic item metadata	public
3851	Solid Iron Maul	weapons	intrinsic item metadata	public
3852	Golden Iron Destroyer	weapons	intrinsic item metadata	public
3853	Moonsteel Broadsword	weapons	intrinsic item metadata	public
3854	Frost Tiger Blade	weapons	intrinsic item metadata	public
3855	Massive Iron Axe	weapons	intrinsic item metadata	public
3856	Shadow Crescent Axe	weapons	intrinsic item metadata	public
3857	Coal	ore	intrinsic item metadata	public
3858	Mithril Ore	ore	intrinsic item metadata	public
3859	Steel Bar	ore	intrinsic item metadata	public
3860	Mithril Bar	ore	intrinsic item metadata	public
3861	Blacksteel Bar	ore	intrinsic item metadata	public
3864	Citrine	jewels	intrinsic item metadata	public
3866	Plans: Jade Serpentblade	blacksmithing	intrinsic item metadata	public
3867	Plans: Golden Iron Destroyer	blacksmithing	intrinsic item metadata	public
3868	Plans: Frost Tiger Blade	blacksmithing	intrinsic item metadata	public
3869	Plans: Shadow Crescent Axe	blacksmithing	intrinsic item metadata	public
3870	Plans: Green Iron Shoulders	blacksmithing	intrinsic item metadata	public
3871	Plans: Golden Scale Shoulders	blacksmithing	intrinsic item metadata	public
3872	Plans: Golden Scale Leggings	blacksmithing	intrinsic item metadata	public
3873	Plans: Golden Scale Cuirass	blacksmithing	intrinsic item metadata	public
3874	Plans: Polished Steel Boots	blacksmithing	intrinsic item metadata	public
3875	Plans: Golden Scale Boots	blacksmithing	intrinsic item metadata	public
3927	Fine Aged Cheddar	food	intrinsic item metadata	public
3928	Superior Healing Potion	alchemy	intrinsic item metadata	public
4231	Cured Light Hide	leather	intrinsic item metadata	public
4232	Medium Hide	leather	intrinsic item metadata	public
4233	Cured Medium Hide	leather	intrinsic item metadata	public
4234	Heavy Leather	leather	intrinsic item metadata	public
4235	Heavy Hide	leather	intrinsic item metadata	public
4236	Cured Heavy Hide	leather	intrinsic item metadata	public
4237	Handstitched Leather Belt	armor	intrinsic item metadata	public
4238	Linen Bag	bags	intrinsic item metadata	public
4239	Embossed Leather Gloves	armor	intrinsic item metadata	public
4240	Woolen Bag	bags	intrinsic item metadata	public
4241	Green Woolen Bag	bags	intrinsic item metadata	public
4242	Embossed Leather Pants	armor	intrinsic item metadata	public
4243	Fine Leather Tunic	armor	intrinsic item metadata	public
4244	Hillman's Leather Vest	armor	intrinsic item metadata	public
4245	Small Silk Pack	bags	intrinsic item metadata	public
4246	Fine Leather Belt	armor	intrinsic item metadata	public
4247	Hillman's Leather Gloves	armor	intrinsic item metadata	public
4248	Dark Leather Gloves	armor	intrinsic item metadata	public
4249	Dark Leather Belt	armor	intrinsic item metadata	public
4250	Hillman's Belt	armor	intrinsic item metadata	public
4251	Hillman's Shoulders	armor	intrinsic item metadata	public
4252	Dark Leather Shoulders	armor	intrinsic item metadata	public
4253	Toughened Leather Gloves	armor	intrinsic item metadata	public
4254	Barbaric Gloves	armor	intrinsic item metadata	public
4255	Green Leather Armor	armor	intrinsic item metadata	public
4256	Guardian Armor	armor	intrinsic item metadata	public
4257	Green Leather Belt	armor	intrinsic item metadata	public
4258	Guardian Belt	armor	intrinsic item metadata	public
4259	Green Leather Bracers	armor	intrinsic item metadata	public
4260	Guardian Leather Bracers	armor	intrinsic item metadata	public
4262	Gem-Studded Leather Belt	armor	intrinsic item metadata	public
4264	Barbaric Belt	armor	intrinsic item metadata	public
4265	Heavy Armor Kit	enchanting	intrinsic item metadata	public
4289	Salt	leather	intrinsic item metadata	public
4291	Silken Thread	cloth	intrinsic item metadata	public
4292	Pattern: Green Woolen Bag	tailoring	intrinsic item metadata	public
4293	Pattern: Hillman's Leather Vest	leatherworking	intrinsic item metadata	public
4294	Pattern: Hillman's Belt	leatherworking	intrinsic item metadata	public
4295	Pattern: Double-stitched Leather Gloves OLD	leatherworking	intrinsic item metadata	public
4296	Pattern: Dark Leather Shoulders	leatherworking	intrinsic item metadata	public
4297	Pattern: Barbaric Gloves	leatherworking	intrinsic item metadata	public
4298	Pattern: Guardian Belt	leatherworking	intrinsic item metadata	public
4299	Pattern: Guardian Armor	leatherworking	intrinsic item metadata	public
4300	Pattern: Guardian Leather Bracers	leatherworking	intrinsic item metadata	public
4301	Pattern: Barbaric Belt	leatherworking	intrinsic item metadata	public
4304	Thick Leather	leather	intrinsic item metadata	public
4305	Bolt of Silk Cloth	cloth	intrinsic item metadata	public
4306	Silk Cloth	cloth	intrinsic item metadata	public
4307	Heavy Linen Gloves	armor	intrinsic item metadata	public
4308	Green Linen Bracers	armor	intrinsic item metadata	public
4309	Handstitched Linen Britches	armor	intrinsic item metadata	public
4310	Heavy Woolen Gloves	armor	intrinsic item metadata	public
4311	Heavy Woolen Cloak	armor	intrinsic item metadata	public
4312	Soft-Soled Linen Boots	armor	intrinsic item metadata	public
4313	Red Woolen Boots	armor	intrinsic item metadata	public
4314	Double-Stitched Woolen Shoulders	armor	intrinsic item metadata	public
4315	Reinforced Woolen Shoulders	armor	intrinsic item metadata	public
4316	Heavy Woolen Pants	armor	intrinsic item metadata	public
4317	Phoenix Pants	armor	intrinsic item metadata	public
4318	Gloves of Meditation	armor	intrinsic item metadata	public
4319	Azure Silk Gloves	armor	intrinsic item metadata	public
4320	Spidersilk Boots	armor	intrinsic item metadata	public
4321	Spider Silk Slippers	armor	intrinsic item metadata	public
4322	Enchanter's Cowl	armor	intrinsic item metadata	public
4323	Shadow Hood	armor	intrinsic item metadata	public
4324	Azure Silk Vest	armor	intrinsic item metadata	public
4325	Boots of the Enchanter	armor	intrinsic item metadata	public
4326	Long Silken Cloak	armor	intrinsic item metadata	public
4327	Icy Cloak	armor	intrinsic item metadata	public
4328	Spider Belt	armor	intrinsic item metadata	public
4329	Star Belt	armor	intrinsic item metadata	public
4330	Stylish Red Shirt	armor	intrinsic item metadata	public
4331	Phoenix Gloves	armor	intrinsic item metadata	public
4332	Bright Yellow Shirt	armor	intrinsic item metadata	public
4333	Dark Silk Shirt	armor	intrinsic item metadata	public
4334	Formal White Shirt	armor	intrinsic item metadata	public
4335	Rich Purple Silk Shirt	armor	intrinsic item metadata	public
4336	Black Swashbuckler's Shirt	armor	intrinsic item metadata	public
4337	Thick Spider's Silk	cloth	intrinsic item metadata	public
4338	Mageweave Cloth	cloth	intrinsic item metadata	public
4339	Bolt of Mageweave	cloth	intrinsic item metadata	public
4340	Gray Dye	tailoring	curated player-facing category	public
4341	Yellow Dye	tailoring	single profession category	public
4342	Purple Dye	tailoring	curated player-facing category	public
4343	Brown Linen Pants	armor	intrinsic item metadata	public
4344	Brown Linen Shirt	armor	intrinsic item metadata	public
4345	Pattern: Red Woolen Boots	tailoring	intrinsic item metadata	public
4346	Pattern: Heavy Woolen Cloak	tailoring	intrinsic item metadata	public
4347	Pattern: Reinforced Woolen Shoulders	tailoring	intrinsic item metadata	public
4348	Pattern: Phoenix Gloves	tailoring	intrinsic item metadata	public
4349	Pattern: Phoenix Pants	tailoring	intrinsic item metadata	public
4350	Pattern: Spider Silk Slippers	tailoring	intrinsic item metadata	public
4351	Pattern: Shadow Hood	tailoring	intrinsic item metadata	public
4352	Pattern: Boots of the Enchanter	tailoring	intrinsic item metadata	public
4353	Pattern: Spider Belt	tailoring	intrinsic item metadata	public
4354	Pattern: Rich Purple Silk Shirt	tailoring	intrinsic item metadata	public
4355	Pattern: Icy Cloak	tailoring	intrinsic item metadata	public
4356	Pattern: Star Belt	tailoring	intrinsic item metadata	public
4357	Rough Blasting Powder	engineering	specialized bag and profession data	public
4358	Rough Dynamite	engineering	specialized bag and profession data	public
4359	Handful of Copper Bolts	engineering	specialized bag and profession data	public
4360	Rough Copper Bomb	engineering	specialized bag and profession data	public
4361	Bent Copper Tube	engineering	specialized bag and profession data	public
4362	Rough Boomstick	weapons	intrinsic item metadata	public
4363	Broken Modulator		broken internal record	excluded
4364	Coarse Blasting Powder	engineering	specialized bag and profession data	public
4365	Coarse Dynamite	engineering	specialized bag and profession data	public
4366	Target Dummy	engineering	specialized bag and profession data	public
4367	Small Seaforium Charge	engineering	specialized bag and profession data	public
4368	Flying Tiger Goggles	armor	intrinsic item metadata	public
4369	Deadly Blunderbuss	weapons	intrinsic item metadata	public
4370	Large Copper Bomb	engineering	specialized bag and profession data	public
4371	Bronze Tube	engineering	specialized bag and profession data	public
4372	Lovingly Crafted Boomstick	weapons	intrinsic item metadata	public
4373	Shadow Goggles	armor	intrinsic item metadata	public
4374	Small Bronze Bomb	engineering	specialized bag and profession data	public
4375	Whirring Bronze Gizmo	engineering	specialized bag and profession data	public
4376	Flame Deflector	engineering	specialized bag and profession data	public
4377	Heavy Blasting Powder	engineering	specialized bag and profession data	public
4378	Heavy Dynamite	engineering	specialized bag and profession data	public
4379	Silver-Plated Shotgun	weapons	intrinsic item metadata	public
4380	Big Bronze Bomb	engineering	specialized bag and profession data	public
4381	Minor Recombobulator	trinkets	intrinsic item metadata	public
4382	Bronze Framework	engineering	specialized bag and profession data	public
4383	Moonsight Rifle	weapons	intrinsic item metadata	public
4384	Explosive Sheep	engineering	specialized bag and profession data	public
4385	Green Tinted Goggles	armor	intrinsic item metadata	public
4386	Ice Deflector	engineering	specialized bag and profession data	public
4387	Iron Strut	engineering	specialized bag and profession data	public
4388	Discombobulator Ray	engineering	specialized bag and profession data	public
4389	Gyrochronatom	engineering	specialized bag and profession data	public
4390	Iron Grenade	engineering	specialized bag and profession data	public
4391	Compact Harvest Reaper Kit	engineering	specialized bag and profession data	public
4392	Advanced Target Dummy	engineering	specialized bag and profession data	public
4393	Craftsman's Monocle	armor	intrinsic item metadata	public
4394	Big Iron Bomb	engineering	specialized bag and profession data	public
4395	Goblin Land Mine	engineering	specialized bag and profession data	public
4396	Mechanical Dragonling	trinkets	intrinsic item metadata	public
4397	Gnomish Cloaking Device	trinkets	intrinsic item metadata	public
4398	Large Seaforium Charge	engineering	specialized bag and profession data	public
4399	Wooden Stock	engineering	specialized bag and profession data	public
4400	Heavy Stock	engineering	specialized bag and profession data	public
4401	Mechanical Squirrel Box	battle_pets	intrinsic item metadata	public
4402	Small Flame Sac	profession_supplies	curated shared crafting reagent	public
4403	Portable Bronze Mortar	engineering	specialized bag and profession data	public
4404	Silver Contact	engineering	specialized bag and profession data	public
4405	Crude Scope	engineering	specialized bag and profession data	public
4406	Standard Scope	engineering	specialized bag and profession data	public
4407	Accurate Scope	engineering	specialized bag and profession data	public
4408	Schematic: Mechanical Squirrel Box	engineering	intrinsic item metadata	public
4409	Schematic: Small Seaforium Charge	engineering	intrinsic item metadata	public
4410	Schematic: Shadow Goggles	engineering	intrinsic item metadata	public
4411	Schematic: Flame Deflector	engineering	intrinsic item metadata	public
4412	Schematic: Moonsight Rifle	engineering	intrinsic item metadata	public
4413	Schematic: Discombobulator Ray	engineering	intrinsic item metadata	public
4414	Schematic: Portable Bronze Mortar	engineering	intrinsic item metadata	public
4415	Schematic: Craftsman's Monocle	engineering	intrinsic item metadata	public
4416	Schematic: Goblin Land Mine	engineering	intrinsic item metadata	public
4417	Schematic: Large Seaforium Charge	engineering	intrinsic item metadata	public
4418	Deprecated Creeper Cakes		deprecated client record	excluded
4419	Scroll of Intellect III	inscription	specialized bag and profession data	public
4421	Scroll of Protection III	inscription	specialized bag and profession data	public
4422	Scroll of Stamina III	inscription	specialized bag and profession data	public
4424	Scroll of Spirit III	inscription	specialized bag and profession data	public
4425	Scroll of Agility III	inscription	specialized bag and profession data	public
4426	Scroll of Strength III	inscription	specialized bag and profession data	public
4455	Raptor Hide Harness	armor	intrinsic item metadata	public
4456	Raptor Hide Belt	armor	intrinsic item metadata	public
4457	Barbecued Buzzard Wing	food	intrinsic item metadata	public
4461	Raptor Hide	leather	intrinsic item metadata	public
4470	Simple Wood	enchanting	curated player-facing category	public
4536	Shiny Red Apple	food	intrinsic item metadata	public
4537	Tel'Abim Banana	food	intrinsic item metadata	public
4538	Snapvine Watermelon	food	intrinsic item metadata	public
4539	Goldenbark Apple	food	intrinsic item metadata	public
4540	Tough Hunk of Bread	food	intrinsic item metadata	public
4541	Freshly Baked Bread	food	intrinsic item metadata	public
4542	Moist Cornbread	food	intrinsic item metadata	public
4544	Mulgore Spice Bread	food	intrinsic item metadata	public
4592	Longjaw Mud Snapper	food	intrinsic item metadata	public
4593	Bristle Whisker Catfish	food	intrinsic item metadata	public
4594	Rockscale Cod	food	intrinsic item metadata	public
4595	Junglevine Wine	food	intrinsic item metadata	public
4596	Discolored Healing Potion	alchemy	intrinsic item metadata	public
4597	Recipe: Discolored Healing Potion	alchemy	intrinsic item metadata	public
4599	Cured Ham Steak	food	intrinsic item metadata	public
4600	Cherry Grog	food	intrinsic item metadata	public
4601	Soft Banana Bread	food	intrinsic item metadata	public
4602	Moon Harvest Pumpkin	food	intrinsic item metadata	public
4603	Raw Spotted Yellowtail	fish	intrinsic item metadata	public
4604	Forest Mushroom Cap	food	intrinsic item metadata	public
4605	Red-Speckled Mushroom	food	intrinsic item metadata	public
4606	Spongy Morel	food	intrinsic item metadata	public
4607	Delicious Cave Mold	food	intrinsic item metadata	public
4608	Raw Black Truffle	food	intrinsic item metadata	public
4609	Recipe: Barbecued Buzzard Wing	fish	intrinsic item metadata	public
4611	Blue Pearl	engineering	single profession category	public
4623	Lesser Stoneshield Potion	alchemy	intrinsic item metadata	public
4624	Recipe: Lesser Stoneshield Potion	alchemy	intrinsic item metadata	public
4625	Firebloom	herbs	intrinsic item metadata	public
4655	Giant Clam Meat	fish	intrinsic item metadata	public
4656	Small Pumpkin	food	intrinsic item metadata	public
4791	Enchanted Water	food	intrinsic item metadata	public
4852	Flash Bomb	engineering	specialized bag and profession data	public
4997	Deprecated Recipe: Kodo Skin Bag		deprecated client record	excluded
5013	Fertile Bulb	herbs	specialized bag and profession data	public
5057	Ripe Watermelon	food	intrinsic item metadata	public
5066	Fissure Plant	food	intrinsic item metadata	public
5081	Kodo Hide Bag	bags	intrinsic item metadata	public
5082	Thin Kodo Leather	leather	intrinsic item metadata	public
5083	Pattern: Kodo Hide Bag	leatherworking	intrinsic item metadata	public
5095	Rainbow Fin Albacore	food	intrinsic item metadata	public
5116	Long Tail Feather	leather	intrinsic item metadata	public
5265	Watered-down Beer	food	intrinsic item metadata	public
5342	Raptor Punch	food	intrinsic item metadata	public
5373	Lucky Charm	leatherworking	specialized bag and profession data	public
5465	Small Spider Leg	fish	intrinsic item metadata	public
5466	Scorpid Stinger	fish	intrinsic item metadata	public
5467	Kodo Meat	fish	intrinsic item metadata	public
5468	Soft Frenzy Flesh	fish	intrinsic item metadata	public
5469	Strider Meat	fish	intrinsic item metadata	public
5470	Thunder Lizard Tail	fish	intrinsic item metadata	public
5471	Stag Meat	fish	intrinsic item metadata	public
5472	Kaldorei Spider Kabob	food	intrinsic item metadata	public
5473	Scorpid Surprise	food	intrinsic item metadata	public
5474	Roasted Kodo Meat	food	intrinsic item metadata	public
5476	Fillet of Frenzy	food	intrinsic item metadata	public
5477	Strider Stew	food	intrinsic item metadata	public
5478	Dig Rat Stew	food	intrinsic item metadata	public
5479	Crispy Lizard Tail	food	intrinsic item metadata	public
5480	Lean Venison	food	intrinsic item metadata	public
5482	Recipe: Kaldorei Spider Kabob	fish	intrinsic item metadata	public
5483	Recipe: Scorpid Surprise	fish	intrinsic item metadata	public
5484	Recipe: Roasted Kodo Meat	fish	intrinsic item metadata	public
5485	Recipe: Fillet of Frenzy	fish	intrinsic item metadata	public
5486	Recipe: Strider Stew	fish	intrinsic item metadata	public
5487	Recipe: Dig Rat Stew	fish	intrinsic item metadata	public
5488	Recipe: Crispy Lizard Tail	fish	intrinsic item metadata	public
5489	Recipe: Lean Venison	fish	intrinsic item metadata	public
5498	Small Lustrous Pearl	jewels	intrinsic item metadata	public
5500	Iridescent Pearl	jewels	intrinsic item metadata	public
5503	Clam Meat	fish	intrinsic item metadata	public
5504	Tangy Clam Meat	fish	intrinsic item metadata	public
5507	Ornate Spyglass	engineering	specialized bag and profession data	public
5523	Small Barnacled Clam	fish	specialized bag and profession data	public
5524	Thick-Shelled Clam	fish	specialized bag and profession data	public
5525	Boiled Clams	food	intrinsic item metadata	public
5526	Clam Chowder	food	intrinsic item metadata	public
5527	Goblin Deviled Clams	food	intrinsic item metadata	public
5528	Recipe: Clam Chowder	fish	intrinsic item metadata	public
5540	Pearl-Handled Dagger	weapons	intrinsic item metadata	public
5541	Iridescent Hammer	weapons	intrinsic item metadata	public
5542	Pearl-Clasped Cloak	armor	intrinsic item metadata	public
5543	Plans: Iridescent Hammer	blacksmithing	intrinsic item metadata	public
5577	Plans: Rough Bronze Bracers	blacksmithing	intrinsic item metadata	public
5578	Plans: Silvered Bronze Breastplate	blacksmithing	intrinsic item metadata	public
5631	Rage Potion	alchemy	intrinsic item metadata	public
5632	Deprecated Cowardly Flight Potion		deprecated client record	excluded
5633	Great Rage Potion	alchemy	intrinsic item metadata	public
5634	Free Action Potion	alchemy	intrinsic item metadata	public
5635	Sharp Claw	profession_supplies	curated shared crafting reagent	public
5637	Large Fang	profession_supplies	curated shared crafting reagent	public
5640	Recipe: Rage Potion	alchemy	intrinsic item metadata	public
5641	Recipe: Cowardly Flight Potion	alchemy	intrinsic item metadata	public
5642	Recipe: Free Action Potion	alchemy	intrinsic item metadata	public
5643	Recipe: Great Rage Potion	alchemy	intrinsic item metadata	public
5739	Barbaric Harness	armor	intrinsic item metadata	public
5762	Red Linen Bag	bags	intrinsic item metadata	public
5763	Red Woolen Bag	bags	intrinsic item metadata	public
5764	Green Silk Pack	bags	intrinsic item metadata	public
5765	Black Silk Pack	bags	intrinsic item metadata	public
5766	Lesser Wizard's Robe	armor	intrinsic item metadata	public
5770	Robes of Arcana	armor	intrinsic item metadata	public
5771	Pattern: Red Linen Bag	tailoring	intrinsic item metadata	public
5772	Pattern: Red Woolen Bag	tailoring	intrinsic item metadata	public
5773	Pattern: Robes of Arcana	tailoring	intrinsic item metadata	public
5774	Pattern: Green Silk Pack	tailoring	intrinsic item metadata	public
5775	Pattern: Black Silk Pack	tailoring	intrinsic item metadata	public
5780	Murloc Scale Belt	armor	intrinsic item metadata	public
5781	Murloc Scale Breastplate	armor	intrinsic item metadata	public
5782	Thick Murloc Armor	armor	intrinsic item metadata	public
5783	Murloc Scale Bracers	armor	intrinsic item metadata	public
5784	Slimy Murloc Scale	leather	intrinsic item metadata	public
5785	Thick Murloc Scale	leather	intrinsic item metadata	public
5786	Pattern: Murloc Scale Belt	leatherworking	intrinsic item metadata	public
5787	Pattern: Murloc Scale Breastplate	leatherworking	intrinsic item metadata	public
5788	Pattern: Thick Murloc Armor	leatherworking	intrinsic item metadata	public
5789	Pattern: Murloc Scale Bracers	leatherworking	intrinsic item metadata	public
5956	Blacksmith Hammer	weapons	intrinsic item metadata	public
5957	Handstitched Leather Vest	armor	intrinsic item metadata	public
5958	Fine Leather Pants	armor	intrinsic item metadata	public
5961	Dark Leather Pants	armor	intrinsic item metadata	public
5962	Guardian Pants	armor	intrinsic item metadata	public
5963	Barbaric Leggings	armor	intrinsic item metadata	public
5964	Barbaric Shoulders	armor	intrinsic item metadata	public
5965	Guardian Cloak	armor	intrinsic item metadata	public
5966	Guardian Gloves	armor	intrinsic item metadata	public
5972	Pattern: Fine Leather Pants	leatherworking	intrinsic item metadata	public
5973	Pattern: Barbaric Leggings	leatherworking	intrinsic item metadata	public
5974	Pattern: Guardian Cloak	leatherworking	intrinsic item metadata	public
5996	Elixir of Water Breathing	alchemy	intrinsic item metadata	public
5997	Elixir of Minor Defense	alchemy	intrinsic item metadata	public
6037	Truesilver Bar	ore	intrinsic item metadata	public
6038	Giant Clam Scorcho	food	intrinsic item metadata	public
6039	Recipe: Giant Clam Scorcho	fish	intrinsic item metadata	public
6040	Golden Scale Bracers	armor	intrinsic item metadata	public
6041	Steel Weapon Chain	enchanting	intrinsic item metadata	public
6042	Iron Shield Spike	enchanting	intrinsic item metadata	public
6043	Iron Counterweight	enchanting	intrinsic item metadata	public
6044	Plans: Iron Shield Spike	blacksmithing	intrinsic item metadata	public
6045	Plans: Iron Counterweight	blacksmithing	intrinsic item metadata	public
6046	Plans: Steel Weapon Chain	blacksmithing	intrinsic item metadata	public
6047	Plans: Golden Scale Coif	blacksmithing	intrinsic item metadata	public
6048	Shadow Protection Potion	alchemy	intrinsic item metadata	public
6049	Fire Protection Potion	alchemy	intrinsic item metadata	public
6050	Frost Protection Potion	alchemy	intrinsic item metadata	public
6051	Holy Protection Potion	alchemy	intrinsic item metadata	public
6052	Nature Protection Potion	alchemy	intrinsic item metadata	public
6053	Recipe: Holy Protection Potion	alchemy	intrinsic item metadata	public
6054	Recipe: Shadow Protection Potion	alchemy	intrinsic item metadata	public
6055	Recipe: Fire Protection Potion	alchemy	intrinsic item metadata	public
6056	Recipe: Frost Protection Potion	alchemy	intrinsic item metadata	public
6057	Recipe: Nature Protection Potion	alchemy	intrinsic item metadata	public
6068	Recipe: Shadow Oil	alchemy	intrinsic item metadata	public
6149	Greater Mana Potion	alchemy	intrinsic item metadata	public
6211	Recipe: Elixir of Ogre's Strength	alchemy	intrinsic item metadata	public
6214	Heavy Copper Maul	weapons	intrinsic item metadata	public
6216	Mystical Powder	enchanting	intrinsic item metadata	public
6217	Copper Rod	enchanting	intrinsic item metadata	public
6219	Arclight Spanner	weapons	intrinsic item metadata	public
6222	Formula: Imbue Chest - Minor Spirit	enchanting	intrinsic item metadata	public
6238	Brown Linen Robe	armor	intrinsic item metadata	public
6239	Red Linen Vest	armor	intrinsic item metadata	public
6240	Blue Linen Vest	armor	intrinsic item metadata	public
6241	White Linen Robe	armor	intrinsic item metadata	public
6242	Blue Linen Robe	armor	intrinsic item metadata	public
6243	Green Woolen Robe	armor	intrinsic item metadata	public
6256	Fishing Pole	weapons	intrinsic item metadata	public
6260	Blue Dye	tailoring	curated player-facing category	public
6261	Orange Dye	tailoring	single profession category	public
6263	Blue Overalls	armor	intrinsic item metadata	public
6264	Greater Adept's Robe	armor	intrinsic item metadata	public
6270	Pattern: Blue Linen Vest	tailoring	intrinsic item metadata	public
6271	Pattern: Red Linen Vest	tailoring	intrinsic item metadata	public
6272	Pattern: Blue Linen Robe	tailoring	intrinsic item metadata	public
6273	Pattern: Green Woolen Robe	tailoring	intrinsic item metadata	public
6274	Pattern: Blue Overalls	tailoring	intrinsic item metadata	public
6275	Pattern: Greater Adept's Robe	tailoring	intrinsic item metadata	public
6289	Raw Longjaw Mud Snapper	fish	intrinsic item metadata	public
6290	Brilliant Smallfish	food	intrinsic item metadata	public
6291	Raw Brilliant Smallfish	fish	intrinsic item metadata	public
6292	10 Pound Mud Snapper	fish	specialized bag and profession data	public
6294	12 Pound Mud Snapper	fish	specialized bag and profession data	public
6295	15 Pound Mud Snapper	fish	specialized bag and profession data	public
6297	Old Skull	fish	specialized bag and profession data	public
6299	Sickly Looking Fish	food	intrinsic item metadata	public
6301	Old Teamster's Skull	fish	specialized bag and profession data	public
6303	Raw Slitherskin Mackerel	fish	intrinsic item metadata	public
6304	Damp Diary Page (Day 4)	fish	specialized bag and profession data	public
6305	Damp Diary Page (Day 87)	fish	specialized bag and profession data	public
6306	Damp Diary Page (Day 512)	fish	specialized bag and profession data	public
6307	Message in a Bottle	fish	specialized bag and profession data	public
6308	Raw Bristle Whisker Catfish	fish	intrinsic item metadata	public
6309	17 Pound Catfish	fish	specialized bag and profession data	public
6310	19 Pound Catfish	fish	specialized bag and profession data	public
6311	22 Pound Catfish	fish	specialized bag and profession data	public
6316	Loch Frenzy Delight	food	intrinsic item metadata	public
6317	Raw Loch Frenzy	fish	intrinsic item metadata	public
6325	Recipe: Brilliant Smallfish	fish	intrinsic item metadata	public
6326	Recipe: Slitherskin Mackerel	fish	intrinsic item metadata	public
6328	Recipe: Longjaw Mud Snapper	fish	intrinsic item metadata	public
6329	Recipe: Loch Frenzy Delight	fish	intrinsic item metadata	public
6330	Recipe: Bristle Whisker Catfish	fish	intrinsic item metadata	public
6338	Silver Rod	enchanting	intrinsic item metadata	public
6342	Formula: Enchant Chest - Minor Mana	enchanting	intrinsic item metadata	public
6343	Formula: Imbue Chest - Spirit	enchanting	intrinsic item metadata	public
6344	Formula: Enchant Bracer - Minor Spirit	enchanting	intrinsic item metadata	public
6345	Formula: Imbue Cloak - Protection	enchanting	intrinsic item metadata	public
6346	Formula: Enchant Chest - Lesser Mana	enchanting	intrinsic item metadata	public
6347	Formula: Enchant Bracer - Minor Strength	enchanting	intrinsic item metadata	public
6348	Formula: Enchant Weapon - Minor Beastslayer	enchanting	intrinsic item metadata	public
6349	Formula: Enchant 2H Weapon - Lesser Intellect	enchanting	intrinsic item metadata	public
6350	Rough Bronze Boots	armor	intrinsic item metadata	public
6351	Dented Crate	fish	specialized bag and profession data	public
6352	Waterlogged Crate	fish	specialized bag and profession data	public
6353	Small Chest	fish	specialized bag and profession data	public
6354	Small Locked Chest	lockboxes	intrinsic item metadata	public
6355	Sturdy Locked Chest	lockboxes	intrinsic item metadata	public
6356	Battered Chest	fish	specialized bag and profession data	public
6357	Sealed Crate	fish	specialized bag and profession data	public
6358	Oily Blackmouth	fish	specialized bag and profession data	public
6359	Firefin Snapper	fish	specialized bag and profession data	public
6360	Steelscale Crushfish	weapons	intrinsic item metadata	public
6361	Raw Rainbow Fin Albacore	fish	intrinsic item metadata	public
6362	Raw Rockscale Cod	fish	intrinsic item metadata	public
6363	26 Pound Catfish	fish	specialized bag and profession data	public
6364	32 Pound Catfish	fish	specialized bag and profession data	public
6365	Strong Fishing Pole	weapons	intrinsic item metadata	public
6366	Darkwood Fishing Pole	weapons	intrinsic item metadata	public
6367	Big Iron Fishing Pole	weapons	intrinsic item metadata	public
6368	Recipe: Rainbow Fin Albacore	fish	intrinsic item metadata	public
6369	Recipe: Rockscale Cod	fish	intrinsic item metadata	public
6370	Blackmouth Oil	alchemy	single crafted-product category	public
6371	Fire Oil	alchemy	single crafted-product category	public
6372	Swim Speed Potion	alchemy	intrinsic item metadata	public
6373	Elixir of Firepower	alchemy	intrinsic item metadata	public
6374	Enchanted Powder	enchanting	intrinsic item metadata	public
6375	Formula: Enchant Bracer - Lesser Spirit	enchanting	intrinsic item metadata	public
6376	Formula: Enchant Boots - Minor Stamina	enchanting	intrinsic item metadata	public
6377	Formula: Enchant Boots - Minor Agility	enchanting	intrinsic item metadata	public
6384	Stylish Blue Shirt	armor	intrinsic item metadata	public
6385	Stylish Green Shirt	armor	intrinsic item metadata	public
6390	Pattern: Stylish Blue Shirt	tailoring	intrinsic item metadata	public
6391	Pattern: Stylish Green Shirt	tailoring	intrinsic item metadata	public
6401	Pattern: Dark Silk Shirt	tailoring	intrinsic item metadata	public
6450	Silk Bandage	first_aid	intrinsic item metadata	public
6451	Heavy Silk Bandage	first_aid	intrinsic item metadata	public
6452	Anti-Venom	first_aid	single crafted-product category	public
6453	Strong Anti-Venom	first_aid	single crafted-product category	public
6454	Manual: Strong Anti-Venom	first_aid	intrinsic item metadata	public
6455	Old Wagonwheel	fish	specialized bag and profession data	public
6456	Acidic Slime	fish	specialized bag and profession data	public
6457	Rusted Engineering Parts	fish	specialized bag and profession data	public
6458	Oil Covered Fish	fish	specialized bag and profession data	public
6466	Deviate Scale Cloak	armor	intrinsic item metadata	public
6467	Deviate Scale Gloves	armor	intrinsic item metadata	public
6468	Deviate Scale Belt	armor	intrinsic item metadata	public
6470	Deviate Scale	leather	intrinsic item metadata	public
6471	Perfect Deviate Scale	leather	intrinsic item metadata	public
6474	Pattern: Deviate Scale Cloak	leatherworking	intrinsic item metadata	public
6475	Pattern: Deviate Scale Gloves	leatherworking	intrinsic item metadata	public
6476	Pattern: Deviate Scale Belt	leatherworking	intrinsic item metadata	public
6522	Deviate Fish	food	intrinsic item metadata	public
6529	Shiny Bauble	fish	specialized bag and profession data	public
6530	Nightcrawlers	fish	specialized bag and profession data	public
6532	Bright Baubles	fish	specialized bag and profession data	public
6533	Aquadynamic Fish Attractor	fish	specialized bag and profession data	public
6643	Bloated Smallfish	fish	specialized bag and profession data	public
6644	Bloated Mackerel	fish	specialized bag and profession data	public
6645	Bloated Mud Snapper	fish	specialized bag and profession data	public
6646	Bloated Albacore	fish	specialized bag and profession data	public
6647	Bloated Catfish	fish	specialized bag and profession data	public
6657	Savory Deviate Delight	food	intrinsic item metadata	public
6661	Recipe: Savory Deviate Delight	fish	intrinsic item metadata	public
6662	Elixir of Giant Growth	alchemy	intrinsic item metadata	public
6663	Recipe: Elixir of Giant Growth	alchemy	intrinsic item metadata	public
6672	Schematic: Flash Bomb	engineering	intrinsic item metadata	public
6709	Moonglow Vest	armor	intrinsic item metadata	public
6710	Pattern: Moonglow Vest	leatherworking	intrinsic item metadata	public
6712	Clockwork Box	engineering	specialized bag and profession data	public
6714	Ez-Thro Dynamite	engineering	specialized bag and profession data	public
6715	Ruined Jumper Cables	engineering	specialized bag and profession data	public
6716	Schematic: EZ-Thro Dynamite	engineering	intrinsic item metadata	public
6730	Ironforge Chain	armor	intrinsic item metadata	public
6731	Ironforge Breastplate	armor	intrinsic item metadata	public
6733	Ironforge Gauntlets	armor	intrinsic item metadata	public
6734	Plans: Ironforge Chain	blacksmithing	intrinsic item metadata	public
6735	Plans: Ironforge Breastplate	blacksmithing	intrinsic item metadata	public
6736	Plans: Ironforge Gauntlets	blacksmithing	intrinsic item metadata	public
6786	Simple Dress	armor	intrinsic item metadata	public
6787	White Woolen Dress	armor	intrinsic item metadata	public
6795	White Swashbuckler's Shirt	armor	intrinsic item metadata	public
6796	Red Swashbuckler's Shirt	armor	intrinsic item metadata	public
6807	Frog Leg Stew	food	intrinsic item metadata	public
6811	Aquadynamic Fish Lens	fish	specialized bag and profession data	public
6836	Dress Shoes	armor	intrinsic item metadata	public
6887	Spotted Yellowtail	food	intrinsic item metadata	public
6888	Herb Baked Egg	food	intrinsic item metadata	public
6889	Small Egg	fish	intrinsic item metadata	public
6890	Smoked Bear Meat	food	intrinsic item metadata	public
6891	Recipe: Herb Baked Egg	fish	intrinsic item metadata	public
6892	Recipe: Smoked Bear Meat	fish	intrinsic item metadata	public
6987	Fish Scale	enchanting	intrinsic item metadata	public
7005	Skinning Knife	weapons	intrinsic item metadata	public
7026	Linen Belt	armor	intrinsic item metadata	public
7027	Boots of Darkness	armor	intrinsic item metadata	public
7046	Azure Silk Pants	armor	intrinsic item metadata	public
7047	Hands of Darkness	armor	intrinsic item metadata	public
7048	Azure Silk Hood	armor	intrinsic item metadata	public
7049	Truefaith Gloves	armor	intrinsic item metadata	public
7050	Silk Headband	armor	intrinsic item metadata	public
7051	Earthen Vest	armor	intrinsic item metadata	public
7052	Azure Silk Belt	armor	intrinsic item metadata	public
7053	Azure Silk Cloak	armor	intrinsic item metadata	public
7055	Crimson Silk Belt	armor	intrinsic item metadata	public
7056	Crimson Silk Cloak	armor	intrinsic item metadata	public
7057	Green Silken Shoulders	armor	intrinsic item metadata	public
7058	Crimson Silk Vest	armor	intrinsic item metadata	public
7059	Crimson Silk Shoulders	armor	intrinsic item metadata	public
7060	Azure Shoulders	armor	intrinsic item metadata	public
7061	Earthen Silk Belt	armor	intrinsic item metadata	public
7062	Crimson Silk Pantaloons	armor	intrinsic item metadata	public
7063	Crimson Silk Robe	armor	intrinsic item metadata	public
7064	Crimson Silk Gloves	armor	intrinsic item metadata	public
7065	Green Silk Armor	armor	intrinsic item metadata	public
7067	Elemental Earth	elemental	intrinsic item metadata	public
7068	Elemental Fire	elemental	intrinsic item metadata	public
7069	Elemental Air	elemental	intrinsic item metadata	public
7070	Elemental Water	elemental	intrinsic item metadata	public
7071	Iron Buckle	blacksmithing	single crafted-product category	public
7072	Naga Scale	tailoring	single profession category	public
7075	Core of Earth	elemental	intrinsic item metadata	public
7076	Essence of Earth	elemental	intrinsic item metadata	public
7077	Heart of Fire	elemental	intrinsic item metadata	public
7078	Essence of Fire	elemental	intrinsic item metadata	public
7079	Globe of Water	elemental	intrinsic item metadata	public
7080	Essence of Water	elemental	intrinsic item metadata	public
7081	Breath of Wind	elemental	intrinsic item metadata	public
7082	Essence of Air	elemental	intrinsic item metadata	public
7084	Pattern: Crimson Silk Shoulders	tailoring	intrinsic item metadata	public
7085	Pattern: Azure Shoulders	tailoring	intrinsic item metadata	public
7086	Pattern: Earthen Silk Belt	tailoring	intrinsic item metadata	public
7087	Pattern: Crimson Silk Cloak	tailoring	intrinsic item metadata	public
7088	Pattern: Crimson Silk Robe	tailoring	intrinsic item metadata	public
7089	Pattern: Azure Silk Cloak	tailoring	intrinsic item metadata	public
7090	Pattern: Green Silk Armor	tailoring	intrinsic item metadata	public
7091	Pattern: Truefaith Gloves	tailoring	intrinsic item metadata	public
7092	Pattern: Hands of Darkness	tailoring	intrinsic item metadata	public
7093	Pattern: Boots of Darkness	tailoring	intrinsic item metadata	public
7097	Leg Meat	food	intrinsic item metadata	public
7114	Pattern: Azure Silk Gloves	tailoring	intrinsic item metadata	public
7148	Goblin Jumper Cables	engineering	specialized bag and profession data	public
7166	Copper Dagger	weapons	intrinsic item metadata	public
7187	VanCleef's Boots	armor	intrinsic item metadata	public
7188	Stormwind Guard Shield	armor	intrinsic item metadata	public
7189	Goblin Rocket Boots	armor	intrinsic item metadata	public
7190	Scorched Rocket Boots	engineering	specialized bag and profession data	public
7191	Fused Wiring	engineering	specialized bag and profession data	public
7192	Schematic: Goblin Rocket Boots	engineering	intrinsic item metadata	public
7228	Tigule's Strawberry Ice Cream	food	intrinsic item metadata	public
7276	Handstitched Leather Cloak	armor	intrinsic item metadata	public
7277	Handstitched Leather Bracers	armor	intrinsic item metadata	public
7280	Rugged Leather Pants	armor	intrinsic item metadata	public
7281	Light Leather Bracers	armor	intrinsic item metadata	public
7282	Light Leather Pants	armor	intrinsic item metadata	public
7283	Black Whelp Cloak	armor	intrinsic item metadata	public
7284	Red Whelp Gloves	armor	intrinsic item metadata	public
7285	Nimble Leather Gloves	armor	intrinsic item metadata	public
7286	Black Whelp Scale	leather	intrinsic item metadata	public
7287	Red Whelp Scale	leatherworking	specialized bag and profession data	public
7288	Pattern: Rugged Leather Pants	leatherworking	intrinsic item metadata	public
7289	Pattern: Black Whelp Cloak	leatherworking	intrinsic item metadata	public
7290	Pattern: Red Whelp Gloves	leatherworking	intrinsic item metadata	public
7307	Flesh Eating Worm	fish	specialized bag and profession data	public
7348	Fletcher's Gloves	armor	intrinsic item metadata	public
7349	Herbalist's Gloves	armor	intrinsic item metadata	public
7352	Earthen Leather Shoulders	armor	intrinsic item metadata	public
7358	Pilferer's Gloves	armor	intrinsic item metadata	public
7359	Heavy Earthen Gloves	armor	intrinsic item metadata	public
7360	Pattern: Dark Leather Gloves	leatherworking	intrinsic item metadata	public
7361	Pattern: Herbalist's Gloves	leatherworking	intrinsic item metadata	public
7362	Pattern: Earthen Leather Shoulders	leatherworking	intrinsic item metadata	public
7363	Pattern: Pilferer's Gloves	leatherworking	intrinsic item metadata	public
7364	Pattern: Heavy Earthen Gloves	leatherworking	intrinsic item metadata	public
7373	Dusky Leather Leggings	armor	intrinsic item metadata	public
7374	Dusky Leather Armor	armor	intrinsic item metadata	public
7375	Green Whelp Armor	armor	intrinsic item metadata	public
7377	Frost Leather Cloak	armor	intrinsic item metadata	public
7378	Dusky Bracers	armor	intrinsic item metadata	public
7386	Green Whelp Bracers	armor	intrinsic item metadata	public
7387	Dusky Belt	armor	intrinsic item metadata	public
7390	Dusky Boots	armor	intrinsic item metadata	public
7391	Swift Boots	armor	intrinsic item metadata	public
7392	Green Whelp Scale	leather	intrinsic item metadata	public
7449	Pattern: Dusky Leather Leggings	leatherworking	intrinsic item metadata	public
7450	Pattern: Green Whelp Armor	leatherworking	intrinsic item metadata	public
7451	Pattern: Green Whelp Bracers	leatherworking	intrinsic item metadata	public
7452	Pattern: Dusky Boots	leatherworking	intrinsic item metadata	public
7453	Pattern: Swift Boots	leatherworking	intrinsic item metadata	public
7506	Gnomish Universal Remote	trinkets	intrinsic item metadata	public
7560	Schematic: Gnomish Universal Remote	engineering	intrinsic item metadata	public
7561	Schematic: Goblin Jumper Cables	engineering	intrinsic item metadata	public
7613	Pattern: Green Leather Armor	leatherworking	intrinsic item metadata	public
7676	Thistle Tea	food	intrinsic item metadata	public
7678	Recipe: Thistle Tea	fish	intrinsic item metadata	public
7742	Schematic: Gnomish Cloaking Device	engineering	intrinsic item metadata	public
7806	Lollipop	food	intrinsic item metadata	public
7807	Candy Bar	food	intrinsic item metadata	public
7808	Chocolate Square	food	intrinsic item metadata	public
7909	Aquamarine	jewels	intrinsic item metadata	public
7910	Star Ruby	jewels	intrinsic item metadata	public
7911	Truesilver Ore	ore	intrinsic item metadata	public
7912	Solid Stone	ore	intrinsic item metadata	public
7913	Barbaric Iron Shoulders	armor	intrinsic item metadata	public
7915	Barbaric Iron Helm	armor	intrinsic item metadata	public
7916	Barbaric Iron Boots	armor	intrinsic item metadata	public
7917	Barbaric Iron Gloves	armor	intrinsic item metadata	public
7918	Heavy Mithril Shoulder	armor	intrinsic item metadata	public
7919	Heavy Mithril Gauntlet	armor	intrinsic item metadata	public
7920	Mithril Scale Pants	armor	intrinsic item metadata	public
7921	Heavy Mithril Pants	armor	intrinsic item metadata	public
7922	Steel Plate Helm	armor	intrinsic item metadata	public
7924	Mithril Scale Bracers	armor	intrinsic item metadata	public
7925	Mithril Scale Gloves	armor	intrinsic item metadata	public
7926	Ornate Mithril Pants	armor	intrinsic item metadata	public
7927	Ornate Mithril Gloves	armor	intrinsic item metadata	public
7928	Ornate Mithril Shoulder	armor	intrinsic item metadata	public
7929	Orcish War Leggings	armor	intrinsic item metadata	public
7930	Heavy Mithril Breastplate	armor	intrinsic item metadata	public
7931	Mithril Coif	armor	intrinsic item metadata	public
7932	Mithril Scale Shoulders	armor	intrinsic item metadata	public
7933	Heavy Mithril Boots	armor	intrinsic item metadata	public
7934	Heavy Mithril Helm	armor	intrinsic item metadata	public
7935	Ornate Mithril Breastplate	armor	intrinsic item metadata	public
7936	Ornate Mithril Boots	armor	intrinsic item metadata	public
7937	Ornate Mithril Helm	armor	intrinsic item metadata	public
7938	Truesilver Gauntlets	armor	intrinsic item metadata	public
7939	Truesilver Breastplate	armor	intrinsic item metadata	public
7941	Heavy Mithril Axe	weapons	intrinsic item metadata	public
7942	Blue Glittering Axe	weapons	intrinsic item metadata	public
7943	Wicked Mithril Blade	weapons	intrinsic item metadata	public
7944	Dazzling Mithril Rapier	weapons	intrinsic item metadata	public
7945	Big Black Mace	weapons	intrinsic item metadata	public
7946	Runed Mithril Hammer	weapons	intrinsic item metadata	public
7947	Ebon Shiv	weapons	intrinsic item metadata	public
7954	The Shatterer	weapons	intrinsic item metadata	public
7955	Copper Claymore	weapons	intrinsic item metadata	public
7956	Bronze Warhammer	weapons	intrinsic item metadata	public
7957	Bronze Greatsword	weapons	intrinsic item metadata	public
7958	Bronze Battle Axe	weapons	intrinsic item metadata	public
7959	Blight	weapons	intrinsic item metadata	public
7960	Truesilver Champion	weapons	intrinsic item metadata	public
7961	Phantom Blade	weapons	intrinsic item metadata	public
7963	Steel Breastplate	armor	intrinsic item metadata	public
7964	Solid Sharpening Stone	blacksmithing	single crafted-product category	public
7965	Solid Weightstone	blacksmithing	single crafted-product category	public
7966	Solid Grinding Stone	ore	intrinsic item metadata	public
7967	Mithril Shield Spike	enchanting	intrinsic item metadata	public
7969	Mithril Spurs	enchanting	intrinsic item metadata	public
7971	Black Pearl	jewels	intrinsic item metadata	public
7972	Ichor of Undeath	elemental	intrinsic item metadata	public
7973	Big-Mouth Clam	fish	specialized bag and profession data	public
7974	Zesty Clam Meat	fish	intrinsic item metadata	public
7975	Plans: Heavy Mithril Pants	blacksmithing	intrinsic item metadata	public
7976	Plans: Mithril Shield Spike	blacksmithing	intrinsic item metadata	public
7977	Plans: Mithril Scale Gloves	blacksmithing	intrinsic item metadata	public
7978	Plans: Barbaric Iron Shoulders	blacksmithing	intrinsic item metadata	public
7979	Plans: Barbaric Iron Breastplate	blacksmithing	intrinsic item metadata	public
7980	Plans: Barbaric Iron Helm	blacksmithing	intrinsic item metadata	public
7981	Plans: Barbaric Iron Boots	blacksmithing	intrinsic item metadata	public
7982	Plans: Barbaric Iron Gloves	blacksmithing	intrinsic item metadata	public
7989	Plans: Mithril Spurs	blacksmithing	intrinsic item metadata	public
7990	Plans: Heavy Mithril Helm	blacksmithing	intrinsic item metadata	public
7991	Plans: Mithril Scale Shoulders	blacksmithing	intrinsic item metadata	public
7992	Plans: Blue Glittering Axe	blacksmithing	intrinsic item metadata	public
7993	Plans: Dazzling Mithril Rapier	blacksmithing	intrinsic item metadata	public
7995	Plans: Mithril Scale Bracers	blacksmithing	intrinsic item metadata	public
7996	Worn Fishing Hat	armor	intrinsic item metadata	public
8028	Plans: Runed Mithril Hammer	blacksmithing	intrinsic item metadata	public
8150	Deeprock Salt	leather	intrinsic item metadata	public
8153	Wildvine	herbs	intrinsic item metadata	public
8154	Scorpid Scale	leather	intrinsic item metadata	public
8165	Worn Dragonscale	leather	intrinsic item metadata	public
8167	Turtle Scale	leather	intrinsic item metadata	public
8168	Jet Black Feather	leather	intrinsic item metadata	public
8169	Thick Hide	leather	intrinsic item metadata	public
8170	Rugged Leather	leather	intrinsic item metadata	public
8171	Rugged Hide	leather	intrinsic item metadata	public
8172	Cured Thick Hide	leather	intrinsic item metadata	public
8173	Thick Armor Kit	enchanting	intrinsic item metadata	public
8174	Comfortable Leather Hat	armor	intrinsic item metadata	public
8175	Nightscape Tunic	armor	intrinsic item metadata	public
8176	Nightscape Headband	armor	intrinsic item metadata	public
8185	Turtle Scale Leggings	armor	intrinsic item metadata	public
8187	Turtle Scale Gloves	armor	intrinsic item metadata	public
8189	Turtle Scale Breastplate	armor	intrinsic item metadata	public
8191	Turtle Scale Helm	armor	intrinsic item metadata	public
8192	Nightscape Shoulders	armor	intrinsic item metadata	public
8193	Nightscape Pants	armor	intrinsic item metadata	public
8195	Nightscape Cloak	armor	intrinsic item metadata	public
8197	Nightscape Boots	armor	intrinsic item metadata	public
8198	Turtle Scale Bracers	armor	intrinsic item metadata	public
8200	Big Voodoo Robe	armor	intrinsic item metadata	public
8201	Big Voodoo Mask	armor	intrinsic item metadata	public
8202	Big Voodoo Pants	armor	intrinsic item metadata	public
8203	Tough Scorpid Breastplate	armor	intrinsic item metadata	public
8204	Tough Scorpid Gloves	armor	intrinsic item metadata	public
8205	Tough Scorpid Bracers	armor	intrinsic item metadata	public
8206	Tough Scorpid Leggings	armor	intrinsic item metadata	public
8207	Tough Scorpid Shoulders	armor	intrinsic item metadata	public
8208	Tough Scorpid Helm	armor	intrinsic item metadata	public
8209	Tough Scorpid Boots	armor	intrinsic item metadata	public
8210	Wild Leather Shoulders	armor	intrinsic item metadata	public
8211	Wild Leather Vest	armor	intrinsic item metadata	public
8212	Wild Leather Leggings	armor	intrinsic item metadata	public
8213	Wild Leather Boots	armor	intrinsic item metadata	public
8214	Wild Leather Helmet	armor	intrinsic item metadata	public
8215	Wild Leather Cloak	armor	intrinsic item metadata	public
8216	Big Voodoo Cloak	armor	intrinsic item metadata	public
8243	Scooby Snack	food	intrinsic item metadata	public
8343	Heavy Silken Thread	cloth	intrinsic item metadata	public
8345	Wolfshead Helm	armor	intrinsic item metadata	public
8346	Gauntlets of the Sea	armor	intrinsic item metadata	public
8347	Dragonscale Gauntlets	armor	intrinsic item metadata	public
8348	Helm of Fire	armor	intrinsic item metadata	public
8349	Feathered Breastplate	armor	intrinsic item metadata	public
8350	The 1 Ring	armor	intrinsic item metadata	public
8364	Mithril Head Trout	food	intrinsic item metadata	public
8365	Raw Mithril Head Trout	fish	intrinsic item metadata	public
8366	Bloated Trout	fish	specialized bag and profession data	public
8367	Dragonscale Breastplate	armor	intrinsic item metadata	public
8384	Pattern: Comfortable Leather Hat	leatherworking	intrinsic item metadata	public
8385	Pattern: Turtle Scale Gloves	leatherworking	intrinsic item metadata	public
8386	Pattern: Big Voodoo Robe	leatherworking	intrinsic item metadata	public
8387	Pattern: Big Voodoo Mask	leatherworking	intrinsic item metadata	public
8388	Pattern: Nightscape Cloak	leatherworking	intrinsic item metadata	public
8389	Pattern: Big Voodoo Pants	leatherworking	intrinsic item metadata	public
8390	Pattern: Big Voodoo Cloak	leatherworking	intrinsic item metadata	public
8395	Pattern: Tough Scorpid Breastplate	leatherworking	intrinsic item metadata	public
8397	Pattern: Tough Scorpid Bracers	leatherworking	intrinsic item metadata	public
8398	Pattern: Tough Scorpid Gloves	leatherworking	intrinsic item metadata	public
8399	Pattern: Tough Scorpid Boots	leatherworking	intrinsic item metadata	public
8400	Pattern: Tough Scorpid Shoulders	leatherworking	intrinsic item metadata	public
8401	Pattern: Tough Scorpid Leggings	leatherworking	intrinsic item metadata	public
8402	Pattern: Tough Scorpid Helm	leatherworking	intrinsic item metadata	public
8409	Pattern: Nightscape Shoulders	leatherworking	intrinsic item metadata	public
8508	Large Fin	fish	specialized bag and profession data	public
8543	Underwater Mushroom Cap	food	intrinsic item metadata	public
8544	Mageweave Bandage	first_aid	intrinsic item metadata	public
8545	Heavy Mageweave Bandage	first_aid	intrinsic item metadata	public
8547	Formula: Powerful Smelling Salts [PH]		placeholder item	excluded
8766	Morning Glory Dew	food	intrinsic item metadata	public
8827	Elixir of Water Walking	alchemy	intrinsic item metadata	public
8831	Purple Lotus	herbs	intrinsic item metadata	public
8836	Arthas' Tears	herbs	intrinsic item metadata	public
8838	Sungrass	herbs	intrinsic item metadata	public
8839	Blindweed	herbs	intrinsic item metadata	public
8845	Ghost Mushroom	herbs	intrinsic item metadata	public
8846	Gromsblood	herbs	intrinsic item metadata	public
8925	Tainted Vial	inscription	specialized bag and profession data	public
8932	Alterac Swiss	food	intrinsic item metadata	public
8948	Dried King Bolete	food	intrinsic item metadata	public
8949	Elixir of Agility	alchemy	intrinsic item metadata	public
8950	Homemade Cherry Pie	food	intrinsic item metadata	public
8951	Elixir of Greater Defense	alchemy	intrinsic item metadata	public
8952	Roasted Quail	food	intrinsic item metadata	public
8953	Deep Fried Plantains	food	intrinsic item metadata	public
8956	Oil of Immolation	alchemy	single crafted-product category	public
8957	Spinefin Halibut	food	intrinsic item metadata	public
8959	Raw Spinefin Halibut	fish	intrinsic item metadata	public
9030	Restorative Potion	alchemy	intrinsic item metadata	public
9060	Inlaid Mithril Cylinder	blacksmithing	single crafted-product category	public
9061	Goblin Rocket Fuel	alchemy	single crafted-product category	public
9088	Gift of Arthas	alchemy	intrinsic item metadata	public
9144	Wildvine Potion	alchemy	intrinsic item metadata	public
9154	Elixir of Detect Undead	alchemy	intrinsic item metadata	public
9155	Arcane Elixir	alchemy	intrinsic item metadata	public
9172	Invisibility Potion	alchemy	intrinsic item metadata	public
9179	Elixir of Greater Intellect	alchemy	intrinsic item metadata	public
9187	Elixir of Greater Agility	alchemy	intrinsic item metadata	public
9197	Elixir of Dream Vision	alchemy	intrinsic item metadata	public
9206	Elixir of Giants	alchemy	intrinsic item metadata	public
9210	Ghost Dye	tailoring	curated player-facing category	public
9224	Elixir of Demonslaying	alchemy	intrinsic item metadata	public
9233	Elixir of Detect Demon	alchemy	intrinsic item metadata	public
9260	Volatile Rum	food	intrinsic item metadata	public
9262	Black Vitriol	alchemy	single profession category	public
9264	Elixir of Shadow Power	alchemy	intrinsic item metadata	public
9294	Recipe: Wildvine Potion	alchemy	intrinsic item metadata	public
9295	Recipe: Invisibility Potion	alchemy	intrinsic item metadata	public
9296	Recipe: Gift of Arthas	alchemy	intrinsic item metadata	public
9297	Recipe: Elixir of Dream Vision	alchemy	intrinsic item metadata	public
9298	Recipe: Elixir of Giants	alchemy	intrinsic item metadata	public
9300	Recipe: Elixir of Demonslaying	alchemy	intrinsic item metadata	public
9301	Recipe: Elixir of Shadow Power	alchemy	intrinsic item metadata	public
9302	Recipe: Ghost Dye	alchemy	intrinsic item metadata	public
9303	Recipe: Philosopher's Stone	alchemy	intrinsic item metadata	public
9304	Recipe: Transmute Iron to Gold	alchemy	intrinsic item metadata	public
9305	Recipe: Transmute Mithril to Truesilver	alchemy	intrinsic item metadata	public
9312	Blue Firework	engineering	specialized bag and profession data	public
9313	Green Firework	engineering	specialized bag and profession data	public
9318	Red Firework	engineering	specialized bag and profession data	public
9360	Cuergo's Gold	food	intrinsic item metadata	public
9361	Cuergo's Gold with Worm	food	intrinsic item metadata	public
9366	Golden Scale Gauntlets	armor	intrinsic item metadata	public
9367	Plans: Golden Scale Gauntlets	blacksmithing	intrinsic item metadata	public
9451	Bubbling Water	food	intrinsic item metadata	public
9681	Grilled King Crawler Legs	food	intrinsic item metadata	public
9998	Black Mageweave Vest	armor	intrinsic item metadata	public
9999	Black Mageweave Leggings	armor	intrinsic item metadata	public
10001	Black Mageweave Robe	armor	intrinsic item metadata	public
10002	Shadoweave Pants	armor	intrinsic item metadata	public
10003	Black Mageweave Gloves	armor	intrinsic item metadata	public
10004	Shadoweave Robe	armor	intrinsic item metadata	public
10007	Red Mageweave Vest	armor	intrinsic item metadata	public
10008	White Bandit Mask	armor	intrinsic item metadata	public
10009	Red Mageweave Pants	armor	intrinsic item metadata	public
10010	Stormcloth Pants	armor	intrinsic item metadata	public
10011	Stormcloth Gloves	armor	intrinsic item metadata	public
10018	Red Mageweave Gloves	armor	intrinsic item metadata	public
10019	Dreamweave Gloves	armor	intrinsic item metadata	public
10020	Stormcloth Vest	armor	intrinsic item metadata	public
10021	Dreamweave Vest	armor	intrinsic item metadata	public
10023	Shadoweave Gloves	armor	intrinsic item metadata	public
10024	Black Mageweave Headband	armor	intrinsic item metadata	public
10025	Shadoweave Mask	armor	intrinsic item metadata	public
10026	Black Mageweave Boots	armor	intrinsic item metadata	public
10027	Black Mageweave Shoulders	armor	intrinsic item metadata	public
10028	Shadoweave Shoulders	armor	intrinsic item metadata	public
10029	Red Mageweave Shoulders	armor	intrinsic item metadata	public
10030	Admiral's Hat	armor	intrinsic item metadata	public
10031	Shadoweave Boots	armor	intrinsic item metadata	public
10032	Stormcloth Headband	armor	intrinsic item metadata	public
10033	Red Mageweave Headband	armor	intrinsic item metadata	public
10034	Tuxedo Shirt	armor	intrinsic item metadata	public
10035	Tuxedo Pants	armor	intrinsic item metadata	public
10036	Tuxedo Jacket	armor	intrinsic item metadata	public
10038	Stormcloth Shoulders	armor	intrinsic item metadata	public
10039	Stormcloth Boots	armor	intrinsic item metadata	public
10040	White Wedding Dress	armor	intrinsic item metadata	public
10041	Dreamweave Circlet	armor	intrinsic item metadata	public
10042	Cindercloth Robe	armor	intrinsic item metadata	public
10044	Cindercloth Boots	armor	intrinsic item metadata	public
10045	Simple Linen Pants	armor	intrinsic item metadata	public
10046	Simple Linen Boots	armor	intrinsic item metadata	public
10047	Simple Kilt	armor	intrinsic item metadata	public
10048	Colorful Kilt	armor	intrinsic item metadata	public
10050	Mageweave Bag	bags	intrinsic item metadata	public
10051	Red Mageweave Bag	bags	intrinsic item metadata	public
10052	Orange Martial Shirt	armor	intrinsic item metadata	public
10053	Simple Black Dress	armor	intrinsic item metadata	public
10054	Lavender Mageweave Shirt	armor	intrinsic item metadata	public
10055	Pink Mageweave Shirt	armor	intrinsic item metadata	public
10056	Orange Mageweave Shirt	armor	intrinsic item metadata	public
10285	Shadow Silk	cloth	intrinsic item metadata	public
10286	Heart of the Wild	elemental	intrinsic item metadata	public
10290	Pink Dye	tailoring	single profession category	public
10300	Pattern: Red Mageweave Vest	tailoring	intrinsic item metadata	public
10301	Pattern: White Bandit Mask	tailoring	intrinsic item metadata	public
10302	Pattern: Red Mageweave Pants	tailoring	intrinsic item metadata	public
10303	Pattern: Stormcloth Pants	tailoring	intrinsic item metadata	public
10304	Pattern: Stormcloth Gloves	tailoring	intrinsic item metadata	public
10305	Scroll of Protection IV	inscription	specialized bag and profession data	public
10306	Scroll of Spirit IV	inscription	specialized bag and profession data	public
10307	Scroll of Stamina IV	inscription	specialized bag and profession data	public
10308	Scroll of Intellect IV	inscription	specialized bag and profession data	public
10309	Scroll of Agility IV	inscription	specialized bag and profession data	public
10310	Scroll of Strength IV	inscription	specialized bag and profession data	public
10311	Pattern: Orange Martial Shirt	tailoring	intrinsic item metadata	public
10312	Pattern: Red Mageweave Gloves	tailoring	intrinsic item metadata	public
10313	Pattern: Stormcloth Vest	tailoring	intrinsic item metadata	public
10314	Pattern: Lavender Mageweave Shirt	tailoring	intrinsic item metadata	public
10315	Pattern: Red Mageweave Shoulders	tailoring	intrinsic item metadata	public
10316	Pattern: Colorful Kilt	tailoring	intrinsic item metadata	public
10317	Pattern: Pink Mageweave Shirt	tailoring	intrinsic item metadata	public
10318	Pattern: Admiral's Hat	tailoring	intrinsic item metadata	public
10319	Pattern: Stormcloth Headband	tailoring	intrinsic item metadata	public
10320	Pattern: Red Mageweave Headband	tailoring	intrinsic item metadata	public
10321	Pattern: Tuxedo Shirt	tailoring	intrinsic item metadata	public
10322	Pattern: Stormcloth Shoulders	tailoring	intrinsic item metadata	public
10323	Pattern: Tuxedo Pants	tailoring	intrinsic item metadata	public
10324	Pattern: Stormcloth Boots	tailoring	intrinsic item metadata	public
10325	Pattern: White Wedding Dress	tailoring	intrinsic item metadata	public
10326	Pattern: Tuxedo Jacket	tailoring	intrinsic item metadata	public
10421	Rough Copper Vest	armor	intrinsic item metadata	public
10423	Silvered Bronze Leggings	armor	intrinsic item metadata	public
10424	Plans: Silvered Bronze Leggings	blacksmithing	intrinsic item metadata	public
10463	Pattern: Shadoweave Mask	tailoring	intrinsic item metadata	public
10498	Gyromatic Micro-Adjustor	engineering	specialized bag and profession data	public
10499	Bright-Eye Goggles	armor	intrinsic item metadata	public
10500	Fire Goggles	armor	intrinsic item metadata	public
10501	Catseye Ultra Goggles	armor	intrinsic item metadata	public
10502	Spellpower Goggles Xtreme	armor	intrinsic item metadata	public
10503	Rose Colored Goggles	armor	intrinsic item metadata	public
10504	Green Lens	armor	intrinsic item metadata	public
10505	Solid Blasting Powder	engineering	specialized bag and profession data	public
10506	Deepdive Helmet	armor	intrinsic item metadata	public
10507	Solid Dynamite	engineering	specialized bag and profession data	public
10508	Mithril Blunderbuss	weapons	intrinsic item metadata	public
10510	Mithril Heavy-Bore Rifle	weapons	intrinsic item metadata	public
10514	Mithril Frag Bomb	engineering	specialized bag and profession data	public
10518	Parachute Cloak	armor	intrinsic item metadata	public
10546	Deadly Scope	engineering	specialized bag and profession data	public
10548	Sniper Scope	engineering	specialized bag and profession data	public
10558	Gold Power Core	engineering	specialized bag and profession data	public
10559	Mithril Tube	engineering	specialized bag and profession data	public
10560	Unstable Trigger	engineering	specialized bag and profession data	public
10561	Mithril Casing	engineering	specialized bag and profession data	public
10562	Hi-Explosive Bomb	engineering	specialized bag and profession data	public
10576	Mithril Mechanical Dragonling	trinkets	intrinsic item metadata	public
10577	Goblin Mortar	trinkets	intrinsic item metadata	public
10585	Goblin Radio	trinkets	intrinsic item metadata	public
10586	The Big One	engineering	specialized bag and profession data	public
10588	Goblin Rocket Helmet	armor	intrinsic item metadata	public
10592	Catseye Elixir	alchemy	intrinsic item metadata	public
10601	Schematic: Bright-Eye Goggles	engineering	intrinsic item metadata	public
10602	Schematic: Deadly Scope	engineering	intrinsic item metadata	public
10603	Schematic: Catseye Ultra Goggles	engineering	intrinsic item metadata	public
10604	Schematic: Mithril Heavy-Bore Rifle	engineering	intrinsic item metadata	public
10605	Schematic: Spellpower Goggles Xtreme	engineering	intrinsic item metadata	public
10606	Schematic: Parachute Cloak	engineering	intrinsic item metadata	public
10607	Schematic: Deepdive Helmet	engineering	intrinsic item metadata	public
10608	Schematic: Sniper Scope	engineering	intrinsic item metadata	public
10609	Schematic: Mithril Mechanical Dragonling	engineering	intrinsic item metadata	public
10620	Thorium Ore	ore	intrinsic item metadata	public
10644	Recipe: Goblin Rocket Fuel	alchemy	intrinsic item metadata	public
10646	Goblin Sapper Charge	engineering	specialized bag and profession data	public
10647	Engineer's Ink	engineering	specialized bag and profession data	public
10648	Common Parchment	inscription	curated player-facing category	public
10713	Plans: Inlaid Mithril Cylinder	blacksmithing	intrinsic item metadata	public
10716	Gnomish Shrink Ray	trinkets	intrinsic item metadata	public
10719	Mobile Alarm	engineering	single crafted-product category	public
10720	Gnomish Net-o-Matic Projector	trinkets	intrinsic item metadata	public
10721	Gnomish Harm Prevention Belt	armor	intrinsic item metadata	public
10723	Gnomish Ham Radio	trinkets	intrinsic item metadata	public
10724	Gnomish Rocket Boots	armor	intrinsic item metadata	public
10726	Gnomish Mind Control Cap	armor	intrinsic item metadata	public
10728	Pattern: Black Swashbuckler's Shirt	tailoring	intrinsic item metadata	public
10841	Goldthorn Tea	food	intrinsic item metadata	public
10858	Plans: Solid Iron Maul	blacksmithing	intrinsic item metadata	public
10938	Lesser Magic Essence	enchanting	intrinsic item metadata	public
10939	Greater Magic Essence	enchanting	intrinsic item metadata	public
10940	Strange Dust	enchanting	intrinsic item metadata	public
10978	Small Glimmering Shard	enchanting	intrinsic item metadata	public
10998	Lesser Astral Essence	enchanting	intrinsic item metadata	public
11038	Formula: Enchant 2H Weapon - Lesser Spirit	enchanting	intrinsic item metadata	public
11039	Formula: Enchant Cloak - Minor Agility	enchanting	intrinsic item metadata	public
11081	Formula: Enchant Shield - Lesser Protection	enchanting	intrinsic item metadata	public
11082	Greater Astral Essence	enchanting	intrinsic item metadata	public
11083	Soul Dust	enchanting	intrinsic item metadata	public
11084	Large Glimmering Shard	enchanting	intrinsic item metadata	public
11099	Old Dark Iron Ore	ore	intrinsic item metadata	public
11101	Formula: Enchant Bracer - Lesser Strength	enchanting	intrinsic item metadata	public
11109	Special Chicken Feed	food	intrinsic item metadata	public
11128	Golden Rod	enchanting	intrinsic item metadata	public
11134	Lesser Mystic Essence	enchanting	intrinsic item metadata	public
11135	Greater Mystic Essence	enchanting	intrinsic item metadata	public
11137	Vision Dust	enchanting	intrinsic item metadata	public
11138	Small Glowing Shard	enchanting	intrinsic item metadata	public
11139	Large Glowing Shard	enchanting	intrinsic item metadata	public
11144	Truesilver Rod	enchanting	intrinsic item metadata	public
11150	Formula: Enchant Gloves - Mining	enchanting	intrinsic item metadata	public
11151	Formula: Enchant Gloves - Herbalism	enchanting	intrinsic item metadata	public
11152	Formula: Enchant Gloves - Fishing	enchanting	intrinsic item metadata	public
11163	Formula: Enchant Bracer - Lesser Dodge	enchanting	intrinsic item metadata	public
11164	Formula: Enchant Weapon - Lesser Beastslayer	enchanting	intrinsic item metadata	public
11165	Formula: Enchant Weapon - Lesser Elemental Slayer	enchanting	intrinsic item metadata	public
11166	Formula: Enchant Gloves - Skinning	enchanting	intrinsic item metadata	public
11167	Formula: Enchant Boots - Lesser Spirit	enchanting	intrinsic item metadata	public
11168	Formula: Enchant Shield - Lesser Parry	enchanting	intrinsic item metadata	public
11174	Lesser Nether Essence	enchanting	intrinsic item metadata	public
11175	Greater Nether Essence	enchanting	intrinsic item metadata	public
11176	Dream Dust	enchanting	intrinsic item metadata	public
11177	Small Radiant Shard	enchanting	intrinsic item metadata	public
11178	Large Radiant Shard	enchanting	intrinsic item metadata	public
11202	Formula: Enchant Shield - Stamina	enchanting	intrinsic item metadata	public
11203	Formula: Enchant Gloves - Advanced Mining	enchanting	intrinsic item metadata	public
11204	Formula: Enchant Bracer - Greater Spirit	enchanting	intrinsic item metadata	public
11205	Formula: Enchant Gloves - Advanced Herbalism	enchanting	intrinsic item metadata	public
11206	Formula: Enchant Cloak - Lesser Agility	enchanting	intrinsic item metadata	public
11207	Formula: Enchant Weapon - Fiery Weapon	enchanting	intrinsic item metadata	public
11208	Formula: Enchant Weapon - Demonslaying	enchanting	intrinsic item metadata	public
11223	Formula: Enchant Bracer - Dodge	enchanting	intrinsic item metadata	public
11225	Formula: Enchant Bracer - Greater Stamina	enchanting	intrinsic item metadata	public
11226	Formula: Enchant Gloves - Riding Skill	enchanting	intrinsic item metadata	public
11287	Lesser Magic Wand	weapons	intrinsic item metadata	public
11288	Greater Magic Wand	weapons	intrinsic item metadata	public
11289	Lesser Mystic Wand	weapons	intrinsic item metadata	public
11290	Greater Mystic Wand	weapons	intrinsic item metadata	public
11291	Star Wood	enchanting	curated player-facing category	public
11370	Dark Iron Ore	ore	intrinsic item metadata	public
11371	Dark Iron Bar	ore	intrinsic item metadata	public
11382	Blood of the Mountain	jewels	intrinsic item metadata	public
11415	Mixed Berries	food	intrinsic item metadata	public
11444	Grim Guzzler Boar	food	intrinsic item metadata	public
11584	Cactus Apple Surprise	food	intrinsic item metadata	public
11590	Mechanical Repair Kit	engineering	specialized bag and profession data	public
11605	Dark Iron Shoulders	armor	intrinsic item metadata	public
11606	Dark Iron Mail	armor	intrinsic item metadata	public
11607	Dark Iron Sunderer	weapons	intrinsic item metadata	public
11608	Dark Iron Pulverizer	weapons	intrinsic item metadata	public
11610	Plans: Dark Iron Pulverizer	blacksmithing	intrinsic item metadata	public
11611	Plans: Dark Iron Sunderer	blacksmithing	intrinsic item metadata	public
11612	Plans: Dark Iron Plate	blacksmithing	intrinsic item metadata	public
11813	Formula: Smoking Heart of the Mountain	enchanting	intrinsic item metadata	public
11825	Pet Bombling	battle_pets	intrinsic item metadata	public
11826	Lil' Smoky	battle_pets	intrinsic item metadata	public
11846	Wizbang's Special Brew	food	intrinsic item metadata	public
12003	Dark Dwarven Lager	food	intrinsic item metadata	public
12037	Mystery Meat	fish	intrinsic item metadata	public
12162	Plans: Hardened Iron Shortsword	blacksmithing	intrinsic item metadata	public
12163	Plans: Moonsteel Broadsword	blacksmithing	intrinsic item metadata	public
12164	Plans: Massive Iron Axe	blacksmithing	intrinsic item metadata	public
12184	Raptor Flesh	fish	intrinsic item metadata	public
12190	Dreamless Sleep Potion	alchemy	intrinsic item metadata	public
12202	Tiger Meat	fish	intrinsic item metadata	public
12203	Red Wolf Meat	fish	intrinsic item metadata	public
12204	Heavy Kodo Meat	fish	intrinsic item metadata	public
12205	White Spider Meat	fish	intrinsic item metadata	public
12206	Tender Crab Meat	fish	intrinsic item metadata	public
12207	Giant Egg	fish	intrinsic item metadata	public
12208	Tender Wolf Meat	fish	intrinsic item metadata	public
12209	Lean Wolf Steak	food	intrinsic item metadata	public
12210	Roast Raptor	food	intrinsic item metadata	public
12211	Spiced Wolf Ribs	food	intrinsic item metadata	public
12212	Jungle Stew	food	intrinsic item metadata	public
12213	Carrion Surprise	food	intrinsic item metadata	public
12214	Mystery Stew	food	intrinsic item metadata	public
12215	Heavy Kodo Stew	food	intrinsic item metadata	public
12216	Spiced Chili Crab	food	intrinsic item metadata	public
12217	Dragonbreath Chili	food	intrinsic item metadata	public
12218	Monster Omelet	food	intrinsic item metadata	public
12223	Meaty Bat Wing	fish	intrinsic item metadata	public
12224	Crispy Bat Wing	food	intrinsic item metadata	public
12226	Recipe: Crispy Bat Wing	fish	intrinsic item metadata	public
12227	Recipe: Lean Wolf Steak	fish	intrinsic item metadata	public
12228	Recipe: Roast Raptor	fish	intrinsic item metadata	public
12229	Recipe: Hot Wolf Ribs	fish	intrinsic item metadata	public
12231	Recipe: Jungle Stew	fish	intrinsic item metadata	public
12232	Recipe: Carrion Surprise	fish	intrinsic item metadata	public
12233	Recipe: Mystery Stew	fish	intrinsic item metadata	public
12238	Darkshore Grouper	food	intrinsic item metadata	public
12239	Recipe: Dragonbreath Chili	fish	intrinsic item metadata	public
12240	Recipe: Heavy Kodo Stew	fish	intrinsic item metadata	public
12259	Glinting Steel Dagger	weapons	intrinsic item metadata	public
12260	Searing Golden Blade	weapons	intrinsic item metadata	public
12261	Plans: Searing Golden Blade	blacksmithing	intrinsic item metadata	public
12359	Thorium Bar	ore	intrinsic item metadata	public
12360	Arcanite Bar	ore	intrinsic item metadata	public
12361	Blue Sapphire	jewels	intrinsic item metadata	public
12363	Arcane Crystal	jewels	intrinsic item metadata	public
12364	Huge Emerald	jewels	intrinsic item metadata	public
12365	Dense Stone	ore	intrinsic item metadata	public
12404	Dense Sharpening Stone	blacksmithing	single crafted-product category	public
12405	Thorium Armor	armor	intrinsic item metadata	public
12406	Thorium Belt	armor	intrinsic item metadata	public
12408	Thorium Bracers	armor	intrinsic item metadata	public
12409	Thorium Boots	armor	intrinsic item metadata	public
12410	Thorium Helm	armor	intrinsic item metadata	public
12414	Thorium Leggings	armor	intrinsic item metadata	public
12415	Radiant Breastplate	armor	intrinsic item metadata	public
12416	Radiant Belt	armor	intrinsic item metadata	public
12417	Radiant Circlet	armor	intrinsic item metadata	public
12418	Radiant Gloves	armor	intrinsic item metadata	public
12419	Radiant Boots	armor	intrinsic item metadata	public
12420	Radiant Leggings	armor	intrinsic item metadata	public
12422	Imperial Plate Chest	armor	intrinsic item metadata	public
12424	Imperial Plate Belt	armor	intrinsic item metadata	public
12425	Imperial Plate Bracers	armor	intrinsic item metadata	public
12426	Imperial Plate Boots	armor	intrinsic item metadata	public
12427	Imperial Plate Helm	armor	intrinsic item metadata	public
12428	Imperial Plate Shoulders	armor	intrinsic item metadata	public
12429	Imperial Plate Leggings	armor	intrinsic item metadata	public
12610	Runic Plate Shoulders	armor	intrinsic item metadata	public
12611	Runic Plate Boots	armor	intrinsic item metadata	public
12612	Runic Plate Helm	armor	intrinsic item metadata	public
12613	Runic Breastplate	armor	intrinsic item metadata	public
12614	Runic Plate Leggings	armor	intrinsic item metadata	public
12618	Enchanted Thorium Breastplate	armor	intrinsic item metadata	public
12619	Enchanted Thorium Leggings	armor	intrinsic item metadata	public
12620	Enchanted Thorium Helm	armor	intrinsic item metadata	public
12624	Wildthorn Mail	armor	intrinsic item metadata	public
12625	Dawnbringer Shoulders	armor	intrinsic item metadata	public
12628	Demon Forged Breastplate	armor	intrinsic item metadata	public
12631	Fiery Plate Gauntlets	armor	intrinsic item metadata	public
12632	Storm Gauntlets	armor	intrinsic item metadata	public
12633	Whitesoul Helm	armor	intrinsic item metadata	public
12636	Helm of the Great Chief	armor	intrinsic item metadata	public
12639	Stronghold Gauntlets	armor	intrinsic item metadata	public
12640	Lionheart Helm	armor	intrinsic item metadata	public
12641	Invulnerable Mail	armor	intrinsic item metadata	public
12643	Dense Weightstone	blacksmithing	single crafted-product category	public
12644	Dense Grinding Stone	ore	intrinsic item metadata	public
12645	Thorium Shield Spike	enchanting	intrinsic item metadata	public
12655	Enchanted Thorium Bar	ore	intrinsic item metadata	public
12682	Plans: Thorium Armor	blacksmithing	intrinsic item metadata	public
12683	Plans: Thorium Belt	blacksmithing	intrinsic item metadata	public
12684	Plans: Thorium Bracers	blacksmithing	intrinsic item metadata	public
12685	Plans: Radiant Belt	blacksmithing	intrinsic item metadata	public
12689	Plans: Radiant Breastplate	blacksmithing	intrinsic item metadata	public
12691	Plans: Wildthorn Mail	blacksmithing	intrinsic item metadata	public
12692	Plans: Thorium Shield Spike	blacksmithing	intrinsic item metadata	public
12693	Plans: Thorium Boots	blacksmithing	intrinsic item metadata	public
12694	Plans: Thorium Helm	blacksmithing	intrinsic item metadata	public
12695	Plans: Radiant Gloves	blacksmithing	intrinsic item metadata	public
12697	Plans: Radiant Boots	blacksmithing	intrinsic item metadata	public
12698	Plans: Dawnbringer Shoulders	blacksmithing	intrinsic item metadata	public
12702	Plans: Radiant Circlet	blacksmithing	intrinsic item metadata	public
12703	Plans: Storm Gauntlets	blacksmithing	intrinsic item metadata	public
12704	Plans: Thorium Leggings	blacksmithing	intrinsic item metadata	public
12706	Plans: Runic Plate Shoulders	blacksmithing	intrinsic item metadata	public
12707	Plans: Runic Plate Boots	blacksmithing	intrinsic item metadata	public
12711	Plans: Whitesoul Helm	blacksmithing	intrinsic item metadata	public
12713	Plans: Radiant Leggings	blacksmithing	intrinsic item metadata	public
12714	Plans: Runic Plate Helm	blacksmithing	intrinsic item metadata	public
12716	Plans: Helm of the Great Chief	blacksmithing	intrinsic item metadata	public
12717	Plans: Lionheart Helm	blacksmithing	intrinsic item metadata	public
12719	Plans: Runic Plate Leggings	blacksmithing	intrinsic item metadata	public
12720	Plans: Stronghold Gauntlets	blacksmithing	intrinsic item metadata	public
12728	Plans: Invulnerable Mail	blacksmithing	intrinsic item metadata	public
12763	Un'Goro Etherfruit	food	intrinsic item metadata	public
12764	Thorium Greatsword	weapons	intrinsic item metadata	public
12769	Bleakwood Hew	weapons	intrinsic item metadata	public
12772	Inlaid Thorium Hammer	weapons	intrinsic item metadata	public
12774	Dawn's Edge	weapons	intrinsic item metadata	public
12775	Huge Thorium Battleaxe	weapons	intrinsic item metadata	public
12776	Enchanted Battlehammer	weapons	intrinsic item metadata	public
12777	Blazing Rapier	weapons	intrinsic item metadata	public
12781	Serenity	weapons	intrinsic item metadata	public
12783	Heartseeker	weapons	intrinsic item metadata	public
12784	Arcanite Reaper	weapons	intrinsic item metadata	public
12790	Arcanite Champion	weapons	intrinsic item metadata	public
12792	Volcanic Hammer	weapons	intrinsic item metadata	public
12794	Masterwork Stormhammer	weapons	intrinsic item metadata	public
12796	Hammer of the Titans	weapons	intrinsic item metadata	public
12797	Frostguard	weapons	intrinsic item metadata	public
12798	Annihilator	weapons	intrinsic item metadata	public
12799	Large Opal	jewels	intrinsic item metadata	public
12800	Azerothian Diamond	jewels	intrinsic item metadata	public
12802	Darkspear	weapons	intrinsic item metadata	public
12803	Living Essence	elemental	intrinsic item metadata	public
12804	Powerful Mojo	elemental	curated player-facing category	public
12808	Essence of Undeath	elemental	intrinsic item metadata	public
12809	Guardian Stone	ore	intrinsic item metadata	public
12810	Enchanted Leather	leather	intrinsic item metadata	public
12811	Righteous Orb	profession_supplies	curated shared crafting reagent	public
12816	Plans: Thorium Greatsword	blacksmithing	intrinsic item metadata	public
12817	Plans: Bleakwood Hew	blacksmithing	intrinsic item metadata	public
12820	Winterfall Firewater	alchemy	intrinsic item metadata	public
12821	Plans: Dawn's Edge	blacksmithing	intrinsic item metadata	public
12824	Plans: Enchanted Battlehammer	blacksmithing	intrinsic item metadata	public
12825	Plans: Blazing Rapier	blacksmithing	intrinsic item metadata	public
12826	Plans: Rune Edge	blacksmithing	intrinsic item metadata	public
12827	Plans: Serenity	blacksmithing	intrinsic item metadata	public
12828	Plans: Volcanic Hammer	blacksmithing	intrinsic item metadata	public
12830	Plans: Corruption	blacksmithing	intrinsic item metadata	public
12831	Plans: Blood Talon	blacksmithing	intrinsic item metadata	public
12832	Plans: Darkspear	blacksmithing	intrinsic item metadata	public
12833	Plans: Hammer of the Titans	blacksmithing	intrinsic item metadata	public
12834	Plans: Arcanite Champion	blacksmithing	intrinsic item metadata	public
12835	Plans: Annihilator	blacksmithing	intrinsic item metadata	public
12836	Plans: Frostguard	blacksmithing	intrinsic item metadata	public
12837	Plans: Masterwork Stormhammer	blacksmithing	intrinsic item metadata	public
12838	Plans: Arcanite Reaper	blacksmithing	intrinsic item metadata	public
12839	Plans: Heartseeker	blacksmithing	intrinsic item metadata	public
12958	Recipe: Transmute Arcanite	alchemy	intrinsic item metadata	public
13287	Pattern: Raptor Hide Harness	leatherworking	intrinsic item metadata	public
13288	Pattern: Raptor Hide Belt	leatherworking	intrinsic item metadata	public
13308	Schematic: Ice Deflector	engineering	intrinsic item metadata	public
13309	Schematic: Lovingly Crafted Boomstick	engineering	intrinsic item metadata	public
13310	Schematic: Accurate Scope	engineering	intrinsic item metadata	public
13311	Schematic: Mechanical Dragonling	engineering	intrinsic item metadata	public
13342	Pet Fish	battle_pets	intrinsic item metadata	public
13422	Stonescale Eel	fish	specialized bag and profession data	public
13423	Stonescale Oil	fish	specialized bag and profession data	public
13442	Mighty Rage Potion	alchemy	intrinsic item metadata	public
13443	Superior Mana Potion	alchemy	intrinsic item metadata	public
13444	Major Mana Potion	alchemy	intrinsic item metadata	public
13445	Elixir of Superior Defense	alchemy	intrinsic item metadata	public
13446	Major Healing Potion	alchemy	intrinsic item metadata	public
13447	Elixir of the Sages	alchemy	intrinsic item metadata	public
13452	Elixir of the Mongoose	alchemy	intrinsic item metadata	public
13453	Elixir of Brute Force	alchemy	intrinsic item metadata	public
13454	Greater Arcane Elixir	alchemy	intrinsic item metadata	public
13455	Greater Stoneshield Potion	alchemy	intrinsic item metadata	public
13456	Greater Frost Protection Potion	alchemy	intrinsic item metadata	public
13457	Greater Fire Protection Potion	alchemy	intrinsic item metadata	public
13458	Greater Nature Protection Potion	alchemy	intrinsic item metadata	public
13459	Greater Shadow Protection Potion	alchemy	intrinsic item metadata	public
13460	Greater Holy Protection Potion	alchemy	intrinsic item metadata	public
13461	Greater Arcane Protection Potion	alchemy	intrinsic item metadata	public
13462	Purification Potion	alchemy	intrinsic item metadata	public
13463	Dreamfoil	herbs	intrinsic item metadata	public
13464	Golden Sansam	herbs	intrinsic item metadata	public
13465	Mountain Silversage	herbs	intrinsic item metadata	public
13466	Sorrowmoss	herbs	intrinsic item metadata	public
13467	Icecap	herbs	intrinsic item metadata	public
13468	Black Lotus	herbs	intrinsic item metadata	public
13476	Recipe: Mighty Rage Potion	alchemy	intrinsic item metadata	public
13477	Recipe: Superior Mana Potion	alchemy	intrinsic item metadata	public
13478	Recipe: Elixir of Superior Defense	alchemy	intrinsic item metadata	public
13479	Recipe: Elixir of the Sages	alchemy	intrinsic item metadata	public
13480	Recipe: Major Healing Potion	alchemy	intrinsic item metadata	public
13481	Recipe: Elixir of Brute Force	alchemy	intrinsic item metadata	public
13486	Recipe: Transmute Undeath to Water	alchemy	intrinsic item metadata	public
13487	Recipe: Transmute Water to Undeath	alchemy	intrinsic item metadata	public
13488	Recipe: Transmute Life to Earth	alchemy	intrinsic item metadata	public
13489	Recipe: Transmute Earth to Life	alchemy	intrinsic item metadata	public
13490	Recipe: Greater Stoneshield Potion	alchemy	intrinsic item metadata	public
13491	Recipe: Elixir of the Mongoose	alchemy	intrinsic item metadata	public
13492	Recipe: Purification Potion	alchemy	intrinsic item metadata	public
13493	Recipe: Greater Arcane Elixir	alchemy	intrinsic item metadata	public
13494	Recipe: Greater Fire Protection Potion	alchemy	intrinsic item metadata	public
13495	Recipe: Greater Frost Protection Potion	alchemy	intrinsic item metadata	public
13496	Recipe: Greater Nature Protection Potion	alchemy	intrinsic item metadata	public
13497	Recipe: Greater Arcane Protection Potion	alchemy	intrinsic item metadata	public
13499	Recipe: Greater Shadow Protection Potion	alchemy	intrinsic item metadata	public
13500	Recipe: Greater Holy Protection Potion	alchemy	intrinsic item metadata	public
13506	Potion of Petrification	alchemy	intrinsic item metadata	public
13510	Flask of the Titans	alchemy	intrinsic item metadata	public
13511	Flask of Distilled Wisdom	alchemy	intrinsic item metadata	public
13512	Flask of Supreme Power	alchemy	intrinsic item metadata	public
13518	Recipe: Potion of Petrification	alchemy	intrinsic item metadata	public
13519	Recipe: Flask of the Titans	alchemy	intrinsic item metadata	public
13520	Recipe: Flask of Distilled Wisdom	alchemy	intrinsic item metadata	public
13521	Recipe: Flask of Supreme Power	alchemy	intrinsic item metadata	public
13546	Bloodbelly Fish	food	intrinsic item metadata	public
13642	Level 15 Test Gear Cloth - Mage/Priest/Warlock		internal test item	excluded
13643	Level 15 Test Gear Leather - Druid/Shaman		internal test item	excluded
13644	Level 15 Test Gear Leather - Hunter/Rogue		internal test item	excluded
13645	Level 15 Test Gear Mail - Paladin/Warrior		internal test item	excluded
13646	Level 20 Test Gear Cloth - Mage/Priest/Warlock		internal test item	excluded
13647	Level 25 Test Gear Cloth - Mage/Priest/Warlock		internal test item	excluded
13648	Level 30 Test Gear Cloth - Mage/Priest/Warlock		internal test item	excluded
13649	Level 35 Test Gear Cloth - Mage/Priest/Warlock		internal test item	excluded
13650	Level 40 Test Gear Cloth - Mage/Priest/Warlock		internal test item	excluded
13651	Level 45 Test Gear Cloth - Mage/Priest/Warlock		internal test item	excluded
13652	Level 50 Test Gear Cloth - Mage/Priest/Warlock		internal test item	excluded
13653	Level 55 Test Gear Cloth - Mage/Priest/Warlock		internal test item	excluded
13654	Level 60 Test Gear Cloth - Mage/Priest/Warlock		internal test item	excluded
13655	Level 65 Test Gear Cloth - Mage		internal test item	excluded
13656	Level 20 Test Gear Mail - Paladin/Warrior		internal test item	excluded
13657	Level 25 Test Gear Mail - Paladin/Warrior		internal test item	excluded
13658	Level 30 Test Gear Mail - Paladin/Warrior		internal test item	excluded
13659	Level 35 Test Gear Mail - Paladin/Warrior		internal test item	excluded
13660	Level 20 Test Gear Leather - Druid/Shaman		internal test item	excluded
13661	Level 25 Test Gear Leather - Druid/Shaman		internal test item	excluded
13662	Level 30 Test Gear Leather - Druid/Shaman		internal test item	excluded
13663	Level 35 Test Gear Leather - Druid/Shaman		internal test item	excluded
13664	Level 20 Test Gear Leather - Hunter/Rogue		internal test item	excluded
13665	Level 25 Test Gear Leather - Hunter/Rogue		internal test item	excluded
13666	Level 30 Test Gear Leather - Hunter/Rogue		internal test item	excluded
13667	Level 35 Test Gear Leather - Hunter/Rogue		internal test item	excluded
13668	Level 40 Test Gear Leather - Druid		internal test item	excluded
13669	Level 45 Test Gear Leather - Druid		internal test item	excluded
13670	Level 50 Test Gear Leather - Druid		internal test item	excluded
13671	Level 55 Test Gear Leather - Druid		internal test item	excluded
13672	Level 60 Test Gear Leather - Druid		internal test item	excluded
13673	Level 65 Test Gear Leather - Druid		internal test item	excluded
13674	Level 40 Test Gear Leather - Rogue		internal test item	excluded
13675	Level 45 Test Gear Leather - Rogue		internal test item	excluded
13676	Level 50 Test Gear Leather - Rogue		internal test item	excluded
13677	Level 55 Test Gear Leather - Rogue		internal test item	excluded
13678	Level 60 Test Gear Leather - Rogue		internal test item	excluded
13679	Level 65 Test Gear Leather - Rogue		internal test item	excluded
13680	Level 40 Test Gear Plate - Paladin/Warrior		internal test item	excluded
13681	Level 45 Test Gear Plate - Paladin/Warrior		internal test item	excluded
13682	Level 50 Test Gear Plate - Paladin/Warrior		internal test item	excluded
13683	Level 55 Test Gear Plate - Paladin/Warrior		internal test item	excluded
13684	Level 60 Test Gear Plate - Paladin/Warrior		internal test item	excluded
13685	Level 65 Test Gear Plate - Paladin		internal test item	excluded
13686	Level 40 Test Gear Mail - Hunter		internal test item	excluded
13687	Level 45 Test Gear Mail - Hunter		internal test item	excluded
13688	Level 50 Test Gear Mail - Hunter		internal test item	excluded
13689	Level 55 Test Gear Mail - Hunter		internal test item	excluded
13690	Level 60 Test Gear Mail - Hunter		internal test item	excluded
13691	Level 65 Test Gear Mail - Hunter		internal test item	excluded
13692	Level 40 Test Gear Mail - Shaman		internal test item	excluded
13693	Level 45 Test Gear Mail - Shaman		internal test item	excluded
13694	Level 50 Test Gear Mail - Shaman		internal test item	excluded
13695	Level 55 Test Gear Mail - Shaman		internal test item	excluded
13696	Level 60 Test Gear Mail - Shaman		internal test item	excluded
13697	Level 65 Test Gear Mail - Shaman		internal test item	excluded
13724	Enriched Manna Biscuit	food	intrinsic item metadata	public
13754	Raw Glossy Mightfish	fish	intrinsic item metadata	public
13755	Winter Squid	food	intrinsic item metadata	public
13756	Raw Summer Bass	fish	intrinsic item metadata	public
13757	Lightning Eel	fish	specialized bag and profession data	public
13758	Raw Redgill	fish	intrinsic item metadata	public
13759	Raw Nightfin Snapper	fish	intrinsic item metadata	public
13760	Raw Sunscale Salmon	fish	intrinsic item metadata	public
13851	Hot Wolf Ribs	food	intrinsic item metadata	public
13856	Runecloth Belt	armor	intrinsic item metadata	public
13857	Runecloth Tunic	armor	intrinsic item metadata	public
13858	Runecloth Robe	armor	intrinsic item metadata	public
13860	Runecloth Cloak	armor	intrinsic item metadata	public
13863	Runecloth Gloves	armor	intrinsic item metadata	public
13864	Runecloth Boots	armor	intrinsic item metadata	public
13865	Runecloth Pants	armor	intrinsic item metadata	public
13866	Runecloth Headband	armor	intrinsic item metadata	public
13867	Runecloth Shoulders	armor	intrinsic item metadata	public
13868	Frostweave Robe	armor	intrinsic item metadata	public
13869	Frostweave Tunic	armor	intrinsic item metadata	public
13870	Frostweave Gloves	armor	intrinsic item metadata	public
13871	Frostweave Pants	armor	intrinsic item metadata	public
13874	Heavy Crate	fish	specialized bag and profession data	public
13875	Ironbound Locked Chest	lockboxes	intrinsic item metadata	public
13876	40 Pound Grouper	fish	specialized bag and profession data	public
13877	47 Pound Grouper	fish	specialized bag and profession data	public
13878	53 Pound Grouper	fish	specialized bag and profession data	public
13879	59 Pound Grouper	fish	specialized bag and profession data	public
13880	68 Pound Grouper	fish	specialized bag and profession data	public
13881	Bloated Redgill	fish	specialized bag and profession data	public
13882	42 Pound Redgill	fish	specialized bag and profession data	public
13883	45 Pound Redgill	fish	specialized bag and profession data	public
13884	49 Pound Redgill	fish	specialized bag and profession data	public
13885	34 Pound Redgill	fish	specialized bag and profession data	public
13886	37 Pound Redgill	fish	specialized bag and profession data	public
13887	52 Pound Redgill	fish	specialized bag and profession data	public
13888	Darkclaw Lobster	fish	intrinsic item metadata	public
13889	Raw Whitescale Salmon	fish	intrinsic item metadata	public
13890	Plated Armorfish	fish	specialized bag and profession data	public
13891	Bloated Salmon	fish	specialized bag and profession data	public
13893	Large Raw Mightfish	food	intrinsic item metadata	public
13901	15 Pound Salmon	fish	specialized bag and profession data	public
13902	18 Pound Salmon	fish	specialized bag and profession data	public
13903	22 Pound Salmon	fish	specialized bag and profession data	public
13904	25 Pound Salmon	fish	specialized bag and profession data	public
13905	29 Pound Salmon	fish	specialized bag and profession data	public
13906	32 Pound Salmon	fish	specialized bag and profession data	public
13907	7 Pound Lobster	fish	specialized bag and profession data	public
13908	9 Pound Lobster	fish	specialized bag and profession data	public
13909	12 Pound Lobster	fish	specialized bag and profession data	public
13910	15 Pound Lobster	fish	specialized bag and profession data	public
13911	19 Pound Lobster	fish	specialized bag and profession data	public
13912	21 Pound Lobster	fish	specialized bag and profession data	public
13913	22 Pound Lobster	fish	specialized bag and profession data	public
13914	70 Pound Mightfish	fish	specialized bag and profession data	public
13915	85 Pound Mightfish	fish	specialized bag and profession data	public
13916	92 Pound Mightfish	fish	specialized bag and profession data	public
13917	103 Pound Mightfish	fish	specialized bag and profession data	public
13918	Reinforced Locked Chest	fish	specialized bag and profession data	public
13926	Golden Pearl	jewels	intrinsic item metadata	public
13927	Cooked Glossy Mightfish	food	intrinsic item metadata	public
13928	Grilled Squid	food	intrinsic item metadata	public
13929	Hot Smoked Bass	food	intrinsic item metadata	public
13930	Filet of Redgill	food	intrinsic item metadata	public
13931	Nightfin Soup	food	intrinsic item metadata	public
13932	Poached Sunscale Salmon	food	intrinsic item metadata	public
13933	Lobster Stew	food	intrinsic item metadata	public
13934	Mightfish Steak	food	intrinsic item metadata	public
13935	Baked Salmon	food	intrinsic item metadata	public
13939	Recipe: Spotted Yellowtail	fish	intrinsic item metadata	public
13940	Recipe: Cooked Glossy Mightfish	fish	intrinsic item metadata	public
13941	Recipe: Filet of Redgill	fish	intrinsic item metadata	public
13942	Recipe: Grilled Squid	fish	intrinsic item metadata	public
13943	Recipe: Hot Smoked Bass	fish	intrinsic item metadata	public
13945	Recipe: Nightfin Soup	fish	intrinsic item metadata	public
13946	Recipe: Poached Sunscale Salmon	fish	intrinsic item metadata	public
13947	Recipe: Lobster Stew	fish	intrinsic item metadata	public
13948	Recipe: Mightfish Steak	fish	intrinsic item metadata	public
13949	Recipe: Baked Salmon	fish	intrinsic item metadata	public
14042	Cindercloth Vest	armor	intrinsic item metadata	public
14043	Cindercloth Gloves	armor	intrinsic item metadata	public
14044	Cindercloth Cloak	armor	intrinsic item metadata	public
14045	Cindercloth Pants	armor	intrinsic item metadata	public
14046	Runecloth Bag	bags	intrinsic item metadata	public
14047	Runecloth	cloth	intrinsic item metadata	public
14048	Bolt of Runecloth	cloth	intrinsic item metadata	public
14100	Brightcloth Robe	armor	intrinsic item metadata	public
14101	Brightcloth Gloves	armor	intrinsic item metadata	public
14103	Brightcloth Cloak	armor	intrinsic item metadata	public
14104	Brightcloth Pants	armor	intrinsic item metadata	public
14106	Felcloth Robe	armor	intrinsic item metadata	public
14107	Felcloth Pants	armor	intrinsic item metadata	public
14108	Felcloth Boots	armor	intrinsic item metadata	public
14111	Felcloth Hood	armor	intrinsic item metadata	public
14112	Felcloth Shoulders	armor	intrinsic item metadata	public
14128	Wizardweave Robe	armor	intrinsic item metadata	public
14130	Wizardweave Turban	armor	intrinsic item metadata	public
14132	Wizardweave Leggings	armor	intrinsic item metadata	public
14134	Cloak of Fire	armor	intrinsic item metadata	public
14136	Robe of Winter Night	armor	intrinsic item metadata	public
14137	Mooncloth Leggings	armor	intrinsic item metadata	public
14138	Mooncloth Vest	armor	intrinsic item metadata	public
14139	Mooncloth Shoulders	armor	intrinsic item metadata	public
14140	Mooncloth Circlet	armor	intrinsic item metadata	public
14141	Ghostweave Vest	armor	intrinsic item metadata	public
14142	Ghostweave Gloves	armor	intrinsic item metadata	public
14143	Ghostweave Belt	armor	intrinsic item metadata	public
14144	Ghostweave Pants	armor	intrinsic item metadata	public
14146	Gloves of Spell Mastery	armor	intrinsic item metadata	public
14155	Mooncloth Bag	bags	intrinsic item metadata	public
14156	Bottomless Bag	bags	intrinsic item metadata	public
14227	Ironweb Spider Silk	cloth	intrinsic item metadata	public
14256	Felcloth	cloth	intrinsic item metadata	public
14341	Rune Thread	cloth	intrinsic item metadata	public
14342	Mooncloth	cloth	intrinsic item metadata	public
14343	Small Brilliant Shard	enchanting	intrinsic item metadata	public
14344	Large Brilliant Shard	enchanting	intrinsic item metadata	public
14466	Pattern: Frostweave Tunic	tailoring	intrinsic item metadata	public
14467	Pattern: Frostweave Robe	tailoring	intrinsic item metadata	public
14468	Pattern: Runecloth Bag	tailoring	intrinsic item metadata	public
14469	Pattern: Runecloth Robe	tailoring	intrinsic item metadata	public
14470	Pattern: Runecloth Tunic	tailoring	intrinsic item metadata	public
14471	Pattern: Cindercloth Vest	tailoring	intrinsic item metadata	public
14473	Pattern: Ghostweave Belt	tailoring	intrinsic item metadata	public
14474	Pattern: Frostweave Gloves	tailoring	intrinsic item metadata	public
14476	Pattern: Cindercloth Gloves	tailoring	intrinsic item metadata	public
14477	Pattern: Ghostweave Gloves	tailoring	intrinsic item metadata	public
14478	Pattern: Brightcloth Robe	tailoring	intrinsic item metadata	public
14479	Pattern: Brightcloth Gloves	tailoring	intrinsic item metadata	public
14480	Pattern: Ghostweave Vest	tailoring	intrinsic item metadata	public
14481	Pattern: Runecloth Gloves	tailoring	intrinsic item metadata	public
14482	Pattern: Cindercloth Cloak	tailoring	intrinsic item metadata	public
14483	Pattern: Felcloth Pants	tailoring	intrinsic item metadata	public
14484	Pattern: Brightcloth Cloak	tailoring	intrinsic item metadata	public
14485	Pattern: Wizardweave Leggings	tailoring	intrinsic item metadata	public
14488	Pattern: Runecloth Boots	tailoring	intrinsic item metadata	public
14489	Pattern: Frostweave Pants	tailoring	intrinsic item metadata	public
14490	Pattern: Cindercloth Pants	tailoring	intrinsic item metadata	public
14491	Pattern: Runecloth Pants	tailoring	intrinsic item metadata	public
14492	Pattern: Felcloth Boots	tailoring	intrinsic item metadata	public
14494	Pattern: Brightcloth Pants	tailoring	intrinsic item metadata	public
14495	Pattern: Ghostweave Pants	tailoring	intrinsic item metadata	public
14496	Pattern: Felcloth Hood	tailoring	intrinsic item metadata	public
14497	Pattern: Mooncloth Leggings	tailoring	intrinsic item metadata	public
14498	Pattern: Runecloth Headband	tailoring	intrinsic item metadata	public
14499	Pattern: Mooncloth Bag	tailoring	intrinsic item metadata	public
14500	Pattern: Wizardweave Robe	tailoring	intrinsic item metadata	public
14501	Pattern: Mooncloth Vest	tailoring	intrinsic item metadata	public
14504	Pattern: Runecloth Shoulders	tailoring	intrinsic item metadata	public
14505	Pattern: Wizardweave Turban	tailoring	intrinsic item metadata	public
14506	Pattern: Felcloth Robe	tailoring	intrinsic item metadata	public
14507	Pattern: Mooncloth Shoulders	tailoring	intrinsic item metadata	public
14508	Pattern: Felcloth Shoulders	tailoring	intrinsic item metadata	public
14509	Pattern: Mooncloth Circlet	tailoring	intrinsic item metadata	public
14510	Pattern: Bottomless Bag	tailoring	intrinsic item metadata	public
14511	Pattern: Gloves of Spell Mastery	tailoring	intrinsic item metadata	public
14512	Pattern: Truefaith Vestments	tailoring	intrinsic item metadata	public
14513	Pattern: Robe of the Archmage	tailoring	intrinsic item metadata	public
14514	Pattern: Robe of the Void	tailoring	intrinsic item metadata	public
14526	Pattern: Mooncloth	tailoring	intrinsic item metadata	public
14529	Runecloth Bandage	first_aid	intrinsic item metadata	public
14530	Heavy Runecloth Bandage	first_aid	intrinsic item metadata	public
14627	Pattern: Bright Yellow Shirt	tailoring	intrinsic item metadata	public
14630	Pattern: Enchanter's Cowl	tailoring	intrinsic item metadata	public
14634	Recipe: Frost Oil	alchemy	intrinsic item metadata	public
14635	Pattern: Gem-Studded Leather Belt	leatherworking	intrinsic item metadata	public
14639	Schematic: Minor Recombobulator	engineering	intrinsic item metadata	public
15045	Green Dragonscale Breastplate	armor	intrinsic item metadata	public
15046	Green Dragonscale Leggings	armor	intrinsic item metadata	public
15047	Red Dragonscale Breastplate	armor	intrinsic item metadata	public
15048	Blue Dragonscale Breastplate	armor	intrinsic item metadata	public
15049	Blue Dragonscale Shoulders	armor	intrinsic item metadata	public
15050	Black Dragonscale Breastplate	armor	intrinsic item metadata	public
15051	Black Dragonscale Shoulders	armor	intrinsic item metadata	public
15052	Black Dragonscale Leggings	armor	intrinsic item metadata	public
15053	Volcanic Breastplate	armor	intrinsic item metadata	public
15054	Volcanic Leggings	armor	intrinsic item metadata	public
15055	Volcanic Shoulders	armor	intrinsic item metadata	public
15056	Stormshroud Armor	armor	intrinsic item metadata	public
15057	Stormshroud Pants	armor	intrinsic item metadata	public
15058	Stormshroud Shoulders	armor	intrinsic item metadata	public
15059	Living Breastplate	armor	intrinsic item metadata	public
15060	Living Leggings	armor	intrinsic item metadata	public
15061	Living Shoulders	armor	intrinsic item metadata	public
15062	Devilsaur Leggings	armor	intrinsic item metadata	public
15063	Devilsaur Gauntlets	armor	intrinsic item metadata	public
15064	Warbear Harness	armor	intrinsic item metadata	public
15065	Warbear Woolies	armor	intrinsic item metadata	public
15066	Ironfeather Breastplate	armor	intrinsic item metadata	public
15067	Ironfeather Shoulders	armor	intrinsic item metadata	public
15068	Frostsaber Tunic	armor	intrinsic item metadata	public
15069	Frostsaber Leggings	armor	intrinsic item metadata	public
15070	Frostsaber Gloves	armor	intrinsic item metadata	public
15071	Frostsaber Boots	armor	intrinsic item metadata	public
15072	Chimeric Leggings	armor	intrinsic item metadata	public
15073	Chimeric Boots	armor	intrinsic item metadata	public
15074	Chimeric Gloves	armor	intrinsic item metadata	public
15075	Chimeric Vest	armor	intrinsic item metadata	public
15076	Heavy Scorpid Vest	armor	intrinsic item metadata	public
15077	Heavy Scorpid Bracers	armor	intrinsic item metadata	public
15078	Heavy Scorpid Gauntlets	armor	intrinsic item metadata	public
15079	Heavy Scorpid Leggings	armor	intrinsic item metadata	public
15080	Heavy Scorpid Helm	armor	intrinsic item metadata	public
15081	Heavy Scorpid Shoulders	armor	intrinsic item metadata	public
15082	Heavy Scorpid Belt	armor	intrinsic item metadata	public
15083	Wicked Leather Gauntlets	armor	intrinsic item metadata	public
15084	Wicked Leather Bracers	armor	intrinsic item metadata	public
15085	Wicked Leather Armor	armor	intrinsic item metadata	public
15086	Wicked Leather Headband	armor	intrinsic item metadata	public
15087	Wicked Leather Pants	armor	intrinsic item metadata	public
15088	Wicked Leather Belt	armor	intrinsic item metadata	public
15090	Runic Leather Armor	armor	intrinsic item metadata	public
15091	Runic Leather Gauntlets	armor	intrinsic item metadata	public
15092	Runic Leather Bracers	armor	intrinsic item metadata	public
15093	Runic Leather Belt	armor	intrinsic item metadata	public
15094	Runic Leather Headband	armor	intrinsic item metadata	public
15095	Runic Leather Pants	armor	intrinsic item metadata	public
15096	Runic Leather Shoulders	armor	intrinsic item metadata	public
15138	Onyxia Scale Cloak	armor	intrinsic item metadata	public
15141	Onyxia Scale Breastplate	armor	intrinsic item metadata	public
15407	Cured Rugged Hide	leather	intrinsic item metadata	public
15408	Heavy Scorpid Scale	leather	intrinsic item metadata	public
15409	Refined Deeprock Salt	leather	intrinsic item metadata	public
15410	Scale of Onyxia	leather	intrinsic item metadata	public
15412	Green Dragonscale	leather	intrinsic item metadata	public
15414	Red Dragonscale	leather	intrinsic item metadata	public
15415	Blue Dragonscale	leather	intrinsic item metadata	public
15416	Black Dragonscale	leather	intrinsic item metadata	public
15417	Devilsaur Leather	leather	intrinsic item metadata	public
15419	Warbear Leather	leather	intrinsic item metadata	public
15564	Rugged Armor Kit	enchanting	intrinsic item metadata	public
15724	Pattern: Heavy Scorpid Bracers	leatherworking	intrinsic item metadata	public
15725	Pattern: Wicked Leather Gauntlets	leatherworking	intrinsic item metadata	public
15726	Pattern: Green Dragonscale Breastplate	leatherworking	intrinsic item metadata	public
15727	Pattern: Heavy Scorpid Vest	leatherworking	intrinsic item metadata	public
15728	Pattern: Wicked Leather Bracers	leatherworking	intrinsic item metadata	public
15729	Pattern: Chimeric Gloves	leatherworking	intrinsic item metadata	public
15731	Pattern: Runic Leather Gauntlets	leatherworking	intrinsic item metadata	public
15732	Pattern: Volcanic Leggings	leatherworking	intrinsic item metadata	public
15733	Pattern: Green Dragonscale Leggings	leatherworking	intrinsic item metadata	public
15734	Pattern: Living Shoulders	leatherworking	intrinsic item metadata	public
15735	Pattern: Ironfeather Shoulders	leatherworking	intrinsic item metadata	public
15737	Pattern: Chimeric Boots	leatherworking	intrinsic item metadata	public
15738	Pattern: Heavy Scorpid Gauntlets	leatherworking	intrinsic item metadata	public
15739	Pattern: Runic Leather Bracers	leatherworking	intrinsic item metadata	public
15740	Pattern: Frostsaber Boots	leatherworking	intrinsic item metadata	public
15741	Pattern: Stormshroud Pants	leatherworking	intrinsic item metadata	public
15742	Pattern: Warbear Harness	leatherworking	intrinsic item metadata	public
15743	Pattern: Heavy Scorpid Belt	leatherworking	intrinsic item metadata	public
15744	Pattern: Wicked Leather Headband	leatherworking	intrinsic item metadata	public
15745	Pattern: Runic Leather Belt	leatherworking	intrinsic item metadata	public
15746	Pattern: Chimeric Leggings	leatherworking	intrinsic item metadata	public
15747	Pattern: Frostsaber Leggings	leatherworking	intrinsic item metadata	public
15748	Pattern: Heavy Scorpid Leggings	leatherworking	intrinsic item metadata	public
15749	Pattern: Volcanic Breastplate	leatherworking	intrinsic item metadata	public
15751	Pattern: Blue Dragonscale Breastplate	leatherworking	intrinsic item metadata	public
15752	Pattern: Living Leggings	leatherworking	intrinsic item metadata	public
15753	Pattern: Stormshroud Armor	leatherworking	intrinsic item metadata	public
15755	Pattern: Chimeric Vest	leatherworking	intrinsic item metadata	public
15756	Pattern: Runic Leather Headband	leatherworking	intrinsic item metadata	public
15757	Pattern: Wicked Leather Pants	leatherworking	intrinsic item metadata	public
15758	Pattern: Devilsaur Gauntlets	leatherworking	intrinsic item metadata	public
15759	Pattern: Black Dragonscale Breastplate	leatherworking	intrinsic item metadata	public
15760	Pattern: Ironfeather Breastplate	leatherworking	intrinsic item metadata	public
15761	Pattern: Frostsaber Gloves	leatherworking	intrinsic item metadata	public
15762	Pattern: Heavy Scorpid Helm	leatherworking	intrinsic item metadata	public
15763	Pattern: Blue Dragonscale Shoulders	leatherworking	intrinsic item metadata	public
15764	Pattern: Stormshroud Shoulders	leatherworking	intrinsic item metadata	public
15765	Pattern: Runic Leather Pants	leatherworking	intrinsic item metadata	public
15768	Pattern: Wicked Leather Belt	leatherworking	intrinsic item metadata	public
15769	Pattern: Onyxia Scale Cloak	leatherworking	intrinsic item metadata	public
15770	Pattern: Black Dragonscale Shoulders	leatherworking	intrinsic item metadata	public
15771	Pattern: Living Breastplate	leatherworking	intrinsic item metadata	public
15772	Pattern: Devilsaur Leggings	leatherworking	intrinsic item metadata	public
15773	Pattern: Wicked Leather Armor	leatherworking	intrinsic item metadata	public
15774	Pattern: Heavy Scorpid Shoulders	leatherworking	intrinsic item metadata	public
15775	Pattern: Volcanic Shoulders	leatherworking	intrinsic item metadata	public
15776	Pattern: Runic Leather Armor	leatherworking	intrinsic item metadata	public
15777	Pattern: Runic Leather Shoulders	leatherworking	intrinsic item metadata	public
15779	Pattern: Frostsaber Tunic	leatherworking	intrinsic item metadata	public
15781	Pattern: Black Dragonscale Leggings	leatherworking	intrinsic item metadata	public
15802	Mooncloth Boots	armor	intrinsic item metadata	public
15846	Salt Shaker	engineering	specialized bag and profession data	public
15869	Silver Skeleton Key	blacksmithing	single crafted-product category	public
15870	Golden Skeleton Key	blacksmithing	single crafted-product category	public
15871	Truesilver Skeleton Key	blacksmithing	single crafted-product category	public
15872	Arcanite Skeleton Key	blacksmithing	single crafted-product category	public
15992	Dense Blasting Powder	engineering	specialized bag and profession data	public
15993	Thorium Grenade	engineering	specialized bag and profession data	public
15994	Thorium Widget	engineering	specialized bag and profession data	public
15995	Thorium Rifle	weapons	intrinsic item metadata	public
15996	Lifelike Mechanical Toad	battle_pets	intrinsic item metadata	public
15999	Spellpower Goggles Xtreme Plus	armor	intrinsic item metadata	public
16000	Thorium Tube	engineering	specialized bag and profession data	public
16004	Dark Iron Rifle	weapons	intrinsic item metadata	public
16005	Dark Iron Bomb	engineering	specialized bag and profession data	public
16006	Delicate Arcanite Converter	engineering	specialized bag and profession data	public
16007	Flawless Arcanite Rifle	weapons	intrinsic item metadata	public
16008	Master Engineer's Goggles	armor	intrinsic item metadata	public
16009	Voice Amplification Modulator	armor	intrinsic item metadata	public
16022	Arcanite Dragonling	trinkets	intrinsic item metadata	public
16023	Masterwork Target Dummy	engineering	specialized bag and profession data	public
16040	Arcane Bomb	engineering	specialized bag and profession data	public
16041	Schematic: Thorium Grenade	engineering	intrinsic item metadata	public
16042	Schematic: Thorium Widget	engineering	intrinsic item metadata	public
16043	Schematic: Thorium Rifle	engineering	intrinsic item metadata	public
16044	Schematic: Lifelike Mechanical Toad	engineering	intrinsic item metadata	public
16045	Schematic: Spellpower Goggles Xtreme Plus	engineering	intrinsic item metadata	public
16046	Schematic: Masterwork Target Dummy	engineering	intrinsic item metadata	public
16047	Schematic: Thorium Tube	engineering	intrinsic item metadata	public
16048	Schematic: Dark Iron Rifle	engineering	intrinsic item metadata	public
16049	Schematic: Dark Iron Bomb	engineering	intrinsic item metadata	public
16050	Schematic: Delicate Arcanite Converter	engineering	intrinsic item metadata	public
16051	Ruined Schematic: Thorium Shells	engineering	specialized bag and profession data	public
16052	Schematic: Voice Amplification Modulator	engineering	intrinsic item metadata	public
16053	Schematic: Master Engineer's Goggles	engineering	intrinsic item metadata	public
16054	Schematic: Arcanite Dragonling	engineering	intrinsic item metadata	public
16055	Schematic: Arcane Bomb	engineering	intrinsic item metadata	public
16056	Schematic: Flawless Arcanite Rifle	engineering	intrinsic item metadata	public
16072	Expert Cookbook	fish	intrinsic item metadata	public
16073	Artisan Cookbook	fish	intrinsic item metadata	public
16082	Artisan Fishing - The Way of the Lure	fish	intrinsic item metadata	public
16083	Expert Fishing - The Bass and You	fish	intrinsic item metadata	public
16084	Expert First Aid - Under Wraps	first_aid	intrinsic item metadata	public
16085	Artisan First Aid - Heal Thyself	first_aid	intrinsic item metadata	public
16110	Recipe: Monster Omelet	fish	intrinsic item metadata	public
16111	Recipe: Spiced Chili Crab	fish	intrinsic item metadata	public
16112	Manual: Heavy Silk Bandage	first_aid	intrinsic item metadata	public
16113	Manual: Mageweave Bandage	first_aid	intrinsic item metadata	public
16166	Bean Soup	food	intrinsic item metadata	public
16167	Versicolor Treat	food	intrinsic item metadata	public
16168	Heaven Peach	food	intrinsic item metadata	public
16169	Wild Ricecake	food	intrinsic item metadata	public
16170	Steamed Mandu	food	intrinsic item metadata	public
16171	Shinsollo	food	intrinsic item metadata	public
16202	Lesser Eternal Essence	enchanting	intrinsic item metadata	public
16203	Greater Eternal Essence	enchanting	intrinsic item metadata	public
16204	Illusion Dust	enchanting	intrinsic item metadata	public
16206	Arcanite Rod	enchanting	intrinsic item metadata	public
16214	Formula: Enchant Bracer - Greater Intellect	enchanting	intrinsic item metadata	public
16215	Formula: Enchant Boots - Greater Stamina	enchanting	intrinsic item metadata	public
16218	Formula: Enchant Bracer - Superior Spirit	enchanting	intrinsic item metadata	public
16219	Formula: Enchant Gloves - Greater Agility	enchanting	intrinsic item metadata	public
16220	Formula: Enchant Boots - Spirit	enchanting	intrinsic item metadata	public
16221	Formula: Enchant Chest - Major Health	enchanting	intrinsic item metadata	public
16222	Formula: Enchant Shield - Superior Spirit	enchanting	intrinsic item metadata	public
16223	Formula: Enchant Weapon - Icy Chill	enchanting	intrinsic item metadata	public
16224	Formula: Enchant Cloak - Superior Defense	enchanting	intrinsic item metadata	public
16242	Formula: Enchant Chest - Major Mana	enchanting	intrinsic item metadata	public
16244	Formula: Enchant Gloves - Greater Strength	enchanting	intrinsic item metadata	public
16245	Formula: Enchant Boots - Greater Agility	enchanting	intrinsic item metadata	public
16246	Formula: Enchant Bracer - Superior Strength	enchanting	intrinsic item metadata	public
16247	Formula: Enchant 2H Weapon - Superior Impact	enchanting	intrinsic item metadata	public
16248	Formula: Enchant Weapon - Unholy	enchanting	intrinsic item metadata	public
16249	Formula: Enchant 2H Weapon - Major Intellect	enchanting	intrinsic item metadata	public
16250	Formula: Enchant Weapon - Superior Striking	enchanting	intrinsic item metadata	public
16251	Formula: Enchant Bracer - Superior Stamina	enchanting	intrinsic item metadata	public
16252	Formula: Enchant Weapon - Crusader	enchanting	intrinsic item metadata	public
16253	Formula: Enchant Chest - Greater Stats	enchanting	intrinsic item metadata	public
16254	Formula: Enchant Weapon - Lifestealing	enchanting	intrinsic item metadata	public
16255	Formula: Enchant 2H Weapon - Major Spirit	enchanting	intrinsic item metadata	public
16766	Undermine Clam Chowder	food	intrinsic item metadata	public
16767	Recipe: Undermine Clam Chowder	fish	intrinsic item metadata	public
16971	Clamlette Surprise	food	intrinsic item metadata	public
16979	Flarecore Gloves	armor	intrinsic item metadata	public
16980	Flarecore Mantle	armor	intrinsic item metadata	public
16982	Corehound Boots	armor	intrinsic item metadata	public
16983	Molten Helm	armor	intrinsic item metadata	public
16984	Black Dragonscale Boots	armor	intrinsic item metadata	public
16988	Fiery Chain Shoulders	armor	intrinsic item metadata	public
16989	Fiery Chain Girdle	armor	intrinsic item metadata	public
17010	Fiery Core	elemental	curated player-facing category	public
17011	Lava Core	elemental	curated player-facing category	public
17012	Core Leather	leather	intrinsic item metadata	public
17013	Dark Iron Leggings	armor	intrinsic item metadata	public
17014	Dark Iron Bracers	armor	intrinsic item metadata	public
17015	Dark Iron Reaver	weapons	intrinsic item metadata	public
17016	Dark Iron Destroyer	weapons	intrinsic item metadata	public
17034	Maple Seed	herbs	specialized bag and profession data	public
17035	Stranglethorn Seed	herbs	specialized bag and profession data	public
17036	Ashwood Seed	herbs	specialized bag and profession data	public
17037	Hornbeam Seed	herbs	specialized bag and profession data	public
17038	Ironwood Seed	herbs	specialized bag and profession data	public
17056	Light Feather	leatherworking	specialized bag and profession data	public
17062	Recipe: Mithril Head Trout	fish	intrinsic item metadata	public
17119	Deeprun Rat Kabob	food	intrinsic item metadata	public
17193	Sulfuron Hammer	weapons	intrinsic item metadata	public
17194	Holiday Spices	fish	single profession category	public
17196	Holiday Spirits	food	intrinsic item metadata	public
17197	Gingerbread Cookie	food	intrinsic item metadata	public
17198	Winter Veil Egg Nog	food	intrinsic item metadata	public
17199	Bad Egg Nog	food	intrinsic item metadata	public
17200	Recipe: Gingerbread Cookie	fish	intrinsic item metadata	public
17201	Recipe: Winter Veil Egg Nog	fish	intrinsic item metadata	public
17202	Snowball	engineering	single profession category	public
17203	Sulfuron Ingot	ore	intrinsic item metadata	public
17222	Spider Sausage	food	intrinsic item metadata	public
17344	Candy Cane	food	intrinsic item metadata	public
17402	Greatfather's Winter Ale	food	intrinsic item metadata	public
17403	Steamwheedle Fizzy Spirits	food	intrinsic item metadata	public
17404	Blended Bean Brew	food	intrinsic item metadata	public
17406	Holiday Cheesewheel	food	intrinsic item metadata	public
17407	Graccu's Homemade Meat Pie	food	intrinsic item metadata	public
17408	Spicy Beefstick	food	intrinsic item metadata	public
17704	Edge of Winter	weapons	intrinsic item metadata	public
17706	Plans: Edge of Winter	blacksmithing	intrinsic item metadata	public
17708	Elixir of Frost Power	alchemy	intrinsic item metadata	public
17709	Recipe: Elixir of Frost Power	alchemy	intrinsic item metadata	public
17716	Snowmaster 9000	engineering	specialized bag and profession data	public
17720	Schematic: Snowmaster 9000	engineering	intrinsic item metadata	public
17721	Gloves of the Greatfather	armor	intrinsic item metadata	public
17722	Pattern: Gloves of the Greatfather	leatherworking	intrinsic item metadata	public
17723	Green Holiday Shirt	armor	intrinsic item metadata	public
17724	Pattern: Green Holiday Shirt	tailoring	intrinsic item metadata	public
17725	Formula: Enchant Weapon - Winter's Might	enchanting	intrinsic item metadata	public
17771	Enchanted Elementium Bar	ore	intrinsic item metadata	public
17967	Refined Scale of Onyxia	leather	intrinsic item metadata	public
17968	Charged Scale of Onyxia	leatherworking	specialized bag and profession data	public
18045	Tender Wolf Steak	food	intrinsic item metadata	public
18046	Recipe: Tender Wolf Steak	fish	intrinsic item metadata	public
18168	Force Reactive Disk	armor	intrinsic item metadata	public
18232	Field Repair Bot 74A	engineering	specialized bag and profession data	public
18235	Schematic: Field Repair Bot 74A	engineering	intrinsic item metadata	public
18238	Shadowskin Gloves	armor	intrinsic item metadata	public
18239	Pattern: Shadowskin Gloves	leatherworking	intrinsic item metadata	public
18251	Core Armor Kit	enchanting	intrinsic item metadata	public
18253	Major Rejuvenation Potion	alchemy	intrinsic item metadata	public
18254	Runn Tum Tuber Surprise	food	intrinsic item metadata	public
18255	Runn Tum Tuber	food	intrinsic item metadata	public
18256	Melted Vial	inscription	specialized bag and profession data	public
18257	Recipe: Major Rejuvenation Potion	alchemy	intrinsic item metadata	public
18259	Formula: Enchant Weapon - Spellpower	enchanting	intrinsic item metadata	public
18260	Formula: Enchant Weapon - Healing Power	enchanting	intrinsic item metadata	public
18262	Elemental Sharpening Stone	blacksmithing	single crafted-product category	public
18263	Flarecore Wraps	armor	intrinsic item metadata	public
18265	Pattern: Flarecore Wraps	tailoring	intrinsic item metadata	public
18282	Core Marksman Rifle	weapons	intrinsic item metadata	public
18283	Biznicks 247x128 Accurascope	engineering	specialized bag and profession data	public
18287	Evermurky	food	intrinsic item metadata	public
18288	Molasses Firewater	food	intrinsic item metadata	public
18294	Elixir of Greater Water Breathing	alchemy	intrinsic item metadata	public
18300	Hyjal Nectar	food	intrinsic item metadata	public
18405	Belt of the Archmage	armor	intrinsic item metadata	public
18407	Felcloth Gloves	armor	intrinsic item metadata	public
18408	Inferno Gloves	armor	intrinsic item metadata	public
18409	Mooncloth Gloves	armor	intrinsic item metadata	public
18413	Cloak of Warding	armor	intrinsic item metadata	public
18414	Pattern: Belt of the Archmage	tailoring	intrinsic item metadata	public
18486	Mooncloth Robe	armor	intrinsic item metadata	public
18487	Pattern: Mooncloth Robe	tailoring	intrinsic item metadata	public
18504	Girdle of Insight	armor	intrinsic item metadata	public
18506	Mongoose Boots	armor	intrinsic item metadata	public
18508	Swift Flight Bracers	armor	intrinsic item metadata	public
18509	Chromatic Cloak	armor	intrinsic item metadata	public
18510	Hide of the Wild	armor	intrinsic item metadata	public
18511	Shifting Cloak	armor	intrinsic item metadata	public
18517	Pattern: Chromatic Cloak	leatherworking	intrinsic item metadata	public
18518	Pattern: Hide of the Wild	leatherworking	intrinsic item metadata	public
18519	Pattern: Shifting Cloak	leatherworking	intrinsic item metadata	public
18562	Elementium Ingot	ore	intrinsic item metadata	public
18567	Elemental Flux	ore	intrinsic item metadata	public
18587	Goblin Jumper Cables XL	engineering	specialized bag and profession data	public
18588	Ez-Thro Dynamite II	engineering	specialized bag and profession data	public
18592	Plans: Sulfuron Hammer	blacksmithing	intrinsic item metadata	public
18594	Powerful Seaforium Charge	engineering	specialized bag and profession data	public
18631	Truesilver Transformer	engineering	specialized bag and profession data	public
18632	Moonbrook Riot Taffy	food	intrinsic item metadata	public
18633	Styleen's Sour Suckerpop	food	intrinsic item metadata	public
18634	Gyrofreeze Ice Reflector	trinkets	intrinsic item metadata	public
18635	Bellara's Nutterbar	food	intrinsic item metadata	public
18636	Ruined Jumper Cables XL	engineering	specialized bag and profession data	public
18637	Major Recombobulator	trinkets	intrinsic item metadata	public
18638	Hyper-Radiant Flame Reflector	trinkets	intrinsic item metadata	public
18639	Ultra-Flash Shadow Reflector	trinkets	intrinsic item metadata	public
18641	Dense Dynamite	engineering	specialized bag and profession data	public
18645	Gnomish Alarm-o-Bot	engineering	specialized bag and profession data	public
18647	Schematic: Red Firework	engineering	intrinsic item metadata	public
18648	Schematic: Green Firework	engineering	intrinsic item metadata	public
18649	Schematic: Blue Firework	engineering	intrinsic item metadata	public
18650	Schematic: EZ-Thro Dynamite II	engineering	intrinsic item metadata	public
18651	Schematic: Truesilver Transformer	engineering	intrinsic item metadata	public
18652	Schematic: Gyrofreeze Ice Reflector	engineering	intrinsic item metadata	public
18653	Schematic: Goblin Jumper Cables XL	engineering	intrinsic item metadata	public
18654	Schematic: Gnomish Alarm-o-Bot	engineering	intrinsic item metadata	public
18655	Schematic: Major Recombobulator	engineering	intrinsic item metadata	public
18656	Schematic: Powerful Seaforium Charge	engineering	intrinsic item metadata	public
18657	Schematic: Hyper-Radiant Flame Reflector	engineering	intrinsic item metadata	public
18658	Schematic: Ultra-Flash Shadow Reflector	engineering	intrinsic item metadata	public
18660	World Enlarger	engineering	specialized bag and profession data	public
18661	Schematic: World Enlarger	engineering	intrinsic item metadata	public
18662	Heavy Leather Ball	leatherworking	specialized bag and profession data	public
18731	Pattern: Heavy Leather Ball	leatherworking	intrinsic item metadata	public
18948	Barbaric Bracers	armor	intrinsic item metadata	public
18949	Pattern: Barbaric Bracers	leatherworking	intrinsic item metadata	public
18984	Dimensional Ripper - Everlook	engineering	specialized bag and profession data	public
18986	Ultrasafe Transporter: Gadgetzan	engineering	specialized bag and profession data	public
19026	Snake Burst Firework	engineering	specialized bag and profession data	public
19043	Heavy Timbermaw Belt	armor	intrinsic item metadata	public
19044	Might of the Timbermaw	armor	intrinsic item metadata	public
19047	Wisdom of the Timbermaw	armor	intrinsic item metadata	public
19048	Heavy Timbermaw Boots	armor	intrinsic item metadata	public
19049	Timbermaw Brawlers	armor	intrinsic item metadata	public
19050	Mantle of the Timbermaw	armor	intrinsic item metadata	public
19051	Girdle of the Dawn	armor	intrinsic item metadata	public
19052	Dawn Treaders	armor	intrinsic item metadata	public
19056	Argent Boots	armor	intrinsic item metadata	public
19057	Gloves of the Dawn	armor	intrinsic item metadata	public
19058	Golden Mantle of the Dawn	armor	intrinsic item metadata	public
19059	Argent Shoulders	armor	intrinsic item metadata	public
19148	Dark Iron Helm	armor	intrinsic item metadata	public
19149	Lava Belt	armor	intrinsic item metadata	public
19156	Flarecore Robe	armor	intrinsic item metadata	public
19157	Chromatic Gauntlets	armor	intrinsic item metadata	public
19162	Corehound Belt	armor	intrinsic item metadata	public
19163	Molten Belt	armor	intrinsic item metadata	public
19164	Dark Iron Gauntlets	armor	intrinsic item metadata	public
19165	Flarecore Leggings	armor	intrinsic item metadata	public
19166	Black Amnesty	weapons	intrinsic item metadata	public
19167	Blackfury	weapons	intrinsic item metadata	public
19168	Blackguard	weapons	intrinsic item metadata	public
19169	Nightfall	weapons	intrinsic item metadata	public
19170	Ebon Hand	weapons	intrinsic item metadata	public
19221	Darkmoon Special Reserve	food	intrinsic item metadata	public
19222	Cheap Beer	food	intrinsic item metadata	public
19223	Darkmoon Dog	food	intrinsic item metadata	public
19224	Red Hot Wings	food	intrinsic item metadata	public
19225	Deep Fried Candybar	food	intrinsic item metadata	public
19299	Fizzy Faire Drink	food	intrinsic item metadata	public
19300	Bottled Winterspring Water	food	intrinsic item metadata	public
19304	Spiced Beef Jerky	food	intrinsic item metadata	public
19305	Pickled Kodo Foot	food	intrinsic item metadata	public
19306	Crunchy Frog	food	intrinsic item metadata	public
19440	Powerful Anti-Venom	first_aid	single crafted-product category	public
19441	Huge Venom Sac	first_aid	single profession category	public
19682	Bloodvine Vest	armor	intrinsic item metadata	public
19683	Bloodvine Leggings	armor	intrinsic item metadata	public
19684	Bloodvine Boots	armor	intrinsic item metadata	public
19685	Primal Batskin Jerkin	armor	intrinsic item metadata	public
19686	Primal Batskin Gloves	armor	intrinsic item metadata	public
19687	Primal Batskin Bracers	armor	intrinsic item metadata	public
19688	Blood Tiger Breastplate	armor	intrinsic item metadata	public
19689	Blood Tiger Shoulders	armor	intrinsic item metadata	public
19690	Bloodsoul Breastplate	armor	intrinsic item metadata	public
19691	Bloodsoul Shoulders	armor	intrinsic item metadata	public
19692	Bloodsoul Gauntlets	armor	intrinsic item metadata	public
19693	Darksoul Breastplate	armor	intrinsic item metadata	public
19694	Darksoul Leggings	armor	intrinsic item metadata	public
19695	Darksoul Shoulders	armor	intrinsic item metadata	public
19726	Bloodvine	herbs	intrinsic item metadata	public
19767	Primal Bat Leather	leather	intrinsic item metadata	public
19768	Primal Tiger Leather	leather	intrinsic item metadata	public
19774	Souldarite	jewels	intrinsic item metadata	public
19808	Rockhide Strongfish	weapons	intrinsic item metadata	public
19943	Massive Mojo	alchemy	single profession category	public
19978	Fishing Tournament!	fish	specialized bag and profession data	public
19998	Bloodvine Lens	armor	intrinsic item metadata	public
19999	Bloodvine Goggles	armor	intrinsic item metadata	public
20002	Greater Dreamless Sleep Potion	alchemy	intrinsic item metadata	public
20004	Mighty Troll's Blood Elixir	alchemy	intrinsic item metadata	public
20007	Mageblood Elixir	alchemy	intrinsic item metadata	public
20008	Living Action Potion	alchemy	intrinsic item metadata	public
20039	Dark Iron Boots	armor	intrinsic item metadata	public
20074	Heavy Crocolisk Stew	food	intrinsic item metadata	public
20075	Recipe: Heavy Crocolisk Stew	fish	intrinsic item metadata	public
20295	Blue Dragonscale Leggings	armor	intrinsic item metadata	public
20296	Green Dragonscale Gauntlets	armor	intrinsic item metadata	public
20380	Dreamscale Breastplate	armor	intrinsic item metadata	public
20381	Dreamscale	leather	intrinsic item metadata	public
20424	Sandworm Meat	fish	intrinsic item metadata	public
20452	Smoked Desert Dumplings	food	intrinsic item metadata	public
20475	Adamantite Arrow Maker	engineering	specialized bag and profession data	public
20476	Sandstalker Bracers	armor	intrinsic item metadata	public
20477	Sandstalker Gauntlets	armor	intrinsic item metadata	public
20478	Sandstalker Breastplate	armor	intrinsic item metadata	public
20479	Spitfire Breastplate	armor	intrinsic item metadata	public
20480	Spitfire Gauntlets	armor	intrinsic item metadata	public
20481	Spitfire Bracers	armor	intrinsic item metadata	public
20499	Broken Silithid Chitin		broken internal record	excluded
20520	Dark Rune	elemental	curated player-facing category	public
20537	Runed Stygian Boots	armor	intrinsic item metadata	public
20538	Runed Stygian Leggings	armor	intrinsic item metadata	public
20539	Runed Stygian Belt	armor	intrinsic item metadata	public
20546	Pattern: Runed Stygian Leggings	tailoring	intrinsic item metadata	public
20547	Pattern: Runed Stygian Boots	tailoring	intrinsic item metadata	public
20548	Pattern: Runed Stygian Belt	tailoring	intrinsic item metadata	public
20549	Darkrune Gauntlets	armor	intrinsic item metadata	public
20550	Darkrune Breastplate	armor	intrinsic item metadata	public
20551	Darkrune Helm	armor	intrinsic item metadata	public
20553	Plans: Darkrune Gauntlets	blacksmithing	intrinsic item metadata	public
20554	Plans: Darkrune Breastplate	blacksmithing	intrinsic item metadata	public
20555	Plans: Darkrune Helm	blacksmithing	intrinsic item metadata	public
20575	Black Whelp Tunic	armor	intrinsic item metadata	public
20576	Pattern: Black Whelp Tunic	leatherworking	intrinsic item metadata	public
20708	Tightly Sealed Trunk	fish	specialized bag and profession data	public
20709	Rumsey Rum Light	food	intrinsic item metadata	public
20725	Nexus Crystal	enchanting	intrinsic item metadata	public
20744	Minor Wizard Oil	enchanting	single crafted-product category	public
20745	Minor Mana Oil	enchanting	single crafted-product category	public
20746	Lesser Wizard Oil	enchanting	single crafted-product category	public
20747	Lesser Mana Oil	enchanting	single crafted-product category	public
20748	Brilliant Mana Oil	enchanting	single crafted-product category	public
20749	Brilliant Wizard Oil	enchanting	single crafted-product category	public
20750	Wizard Oil	enchanting	single crafted-product category	public
20752	Formula: Minor Mana Oil	enchanting	intrinsic item metadata	public
20753	Formula: Lesser Wizard Oil	enchanting	intrinsic item metadata	public
20754	Formula: Lesser Mana Oil	enchanting	intrinsic item metadata	public
20755	Formula: Wizard Oil	enchanting	intrinsic item metadata	public
20758	Formula: Minor Wizard Oil	enchanting	intrinsic item metadata	public
20815	Jeweler's Kit	jewels	specialized bag and profession data	public
20816	Delicate Copper Wire	jewels	intrinsic item metadata	public
20817	Bronze Setting	jewels	intrinsic item metadata	public
20818	Elegant Silver Ring	armor	intrinsic item metadata	public
20819	Cut Malachite	jewels	intrinsic item metadata	public
20820	Simple Pearl Ring	armor	intrinsic item metadata	public
20821	Inlaid Malachite Ring	armor	intrinsic item metadata	public
20822	Cut Tigerseye	jewels	intrinsic item metadata	public
20823	Gloom Band	armor	intrinsic item metadata	public
20824	Simple Grinder	jewels	intrinsic item metadata	public
20825	Cut Shadowgem	jewels	intrinsic item metadata	public
20826	Heavy Silver Ring	armor	intrinsic item metadata	public
20827	Ring of Silver Might	armor	intrinsic item metadata	public
20828	Ring of Twilight Shadows	armor	intrinsic item metadata	public
20829	Cut Moonstone	jewels	intrinsic item metadata	public
20830	Amulet of the Moon	armor	intrinsic item metadata	public
20831	Heavy Golden Necklace of Battle	armor	intrinsic item metadata	public
20832	Moonsoul Crown	armor	intrinsic item metadata	public
20833	Wicked Moonstone Ring	armor	intrinsic item metadata	public
20834	Ornate Spyglass XT	engineering	specialized bag and profession data	public
20854	Design: Amulet of the Moon	jewels	intrinsic item metadata	public
20855	Design: Wicked Moonstone Ring	jewels	intrinsic item metadata	public
20856	Design: Heavy Golden Necklace of Battle	jewels	intrinsic item metadata	public
20857	Honey Bread	food	intrinsic item metadata	public
20906	Braided Copper Ring	armor	intrinsic item metadata	public
20907	Solid Bronze Ring	armor	intrinsic item metadata	public
20909	Barbaric Iron Collar	armor	intrinsic item metadata	public
20950	Pendant of the Agate Shield	armor	intrinsic item metadata	public
20952	Cut Agate	jewels	intrinsic item metadata	public
20953	Cut Jade	jewels	intrinsic item metadata	public
20954	Heavy Iron Knuckles	weapons	intrinsic item metadata	public
20955	Golden Dragon Ring	armor	intrinsic item metadata	public
20956	Silver Rose Pendant	armor	intrinsic item metadata	public
20957	Cut Citrine	jewels	intrinsic item metadata	public
20958	Blazing Citrine Ring	armor	intrinsic item metadata	public
20959	The Jade Eye	armor	intrinsic item metadata	public
20960	Engraved Truesilver Ring	armor	intrinsic item metadata	public
20961	Citrine Ring of Rapid Healing	armor	intrinsic item metadata	public
20962	Cut Aquamarine	jewels	intrinsic item metadata	public
20963	Mithril Filigree	jewels	intrinsic item metadata	public
20964	Aquamarine Signet	armor	intrinsic item metadata	public
20965	Cut Ruby	jewels	intrinsic item metadata	public
20966	Jade Pendant of Blasting	armor	intrinsic item metadata	public
20967	Citrine Pendant of Golden Healing	armor	intrinsic item metadata	public
20969	Ruby Crown of Restoration	armor	intrinsic item metadata	public
20970	Design: Pendant of the Agate Shield	jewels	intrinsic item metadata	public
20971	Design: Heavy Iron Knuckles	jewels	intrinsic item metadata	public
20972	Design: Silver Rose Pendant	jewels	intrinsic item metadata	public
20973	Design: Blazing Citrine Ring	jewels	intrinsic item metadata	public
20974	Design: Jade Pendant of Blasting	jewels	intrinsic item metadata	public
20975	Design: The Jade Eye	jewels	intrinsic item metadata	public
21023	Dirge's Kickin' Chimaerok Chops	food	intrinsic item metadata	public
21024	Chimaerok Tenderloin	fish	intrinsic item metadata	public
21025	Recipe: Dirge's Kickin' Chimaerok Chops	fish	intrinsic item metadata	public
21030	Darnassus Kimchi Pie	food	intrinsic item metadata	public
21031	Cabbage Kimchi	food	intrinsic item metadata	public
21033	Radish Kimchi	food	intrinsic item metadata	public
21071	Raw Sagefish	fish	intrinsic item metadata	public
21072	Smoked Sagefish	food	intrinsic item metadata	public
21099	Recipe: Smoked Sagefish	fish	intrinsic item metadata	public
21113	Watertight Trunk	fish	specialized bag and profession data	public
21114	Rumsey Rum Dark	food	intrinsic item metadata	public
21150	Iron Bound Trunk	fish	specialized bag and profession data	public
21151	Rumsey Rum Black Label	food	intrinsic item metadata	public
21153	Raw Greater Sagefish	fish	intrinsic item metadata	public
21154	Festival Dress	armor	intrinsic item metadata	public
21162	Bloated Oily Blackmouth	fish	specialized bag and profession data	public
21163	Bloated Firefin	fish	specialized bag and profession data	public
21164	Bloated Rockscale Cod	fish	specialized bag and profession data	public
21215	Graccu's Mince Meat Fruitcake	food	intrinsic item metadata	public
21217	Sagefish Delight	food	intrinsic item metadata	public
21219	Recipe: Sagefish Delight	fish	intrinsic item metadata	public
21228	Mithril Bound Trunk	fish	specialized bag and profession data	public
21243	Bloated Mightfish	fish	specialized bag and profession data	public
21277	Tranquil Mechanical Yeti	battle_pets	intrinsic item metadata	public
21278	Stormshroud Gloves	armor	intrinsic item metadata	public
21340	Soul Pouch	bags	intrinsic item metadata	public
21341	Felcloth Bag	bags	intrinsic item metadata	public
21342	Core Felcloth Bag	bags	intrinsic item metadata	public
21358	Pattern: Soul Pouch	tailoring	intrinsic item metadata	public
21369	Pattern: Felcloth Bag	tailoring	intrinsic item metadata	public
21371	Pattern: Core Felcloth Bag	tailoring	intrinsic item metadata	public
21542	Festival Suit	armor	intrinsic item metadata	public
21546	Elixir of Greater Firepower	alchemy	intrinsic item metadata	public
21547	Recipe: Elixir of Greater Firepower	alchemy	intrinsic item metadata	public
21548	Pattern: Stormshroud Gloves	leatherworking	intrinsic item metadata	public
21552	Striped Yellowtail	food	intrinsic item metadata	public
21557	Small Red Rocket	engineering	specialized bag and profession data	public
21558	Small Blue Rocket	engineering	specialized bag and profession data	public
21559	Small Green Rocket	engineering	specialized bag and profession data	public
21560	Small Purple Rocket	engineering	specialized bag and profession data	public
21561	Small White Rocket	engineering	specialized bag and profession data	public
21562	Small Yellow Rocket	engineering	specialized bag and profession data	public
21569	Firework Launcher	engineering	specialized bag and profession data	public
21570	Cluster Launcher	engineering	specialized bag and profession data	public
21571	Blue Rocket Cluster	engineering	specialized bag and profession data	public
21574	Green Rocket Cluster	engineering	specialized bag and profession data	public
21575	Purple Rocket Cluster	engineering	specialized bag and profession data	public
21576	Red Rocket Cluster	engineering	specialized bag and profession data	public
21577	White Rocket Cluster	engineering	specialized bag and profession data	public
21578	Yellow Rocket Cluster	engineering	specialized bag and profession data	public
21589	Large Blue Rocket	engineering	specialized bag and profession data	public
21590	Large Green Rocket	engineering	specialized bag and profession data	public
21591	Large Purple Rocket	engineering	specialized bag and profession data	public
21592	Large Red Rocket	engineering	specialized bag and profession data	public
21593	Large White Rocket	engineering	specialized bag and profession data	public
21595	Large Yellow Rocket	engineering	specialized bag and profession data	public
21714	Large Blue Rocket Cluster	engineering	specialized bag and profession data	public
21716	Large Green Rocket Cluster	engineering	specialized bag and profession data	public
21717	Large Purple Rocket Cluster	engineering	specialized bag and profession data	public
21718	Large Red Rocket Cluster	engineering	specialized bag and profession data	public
21719	Large White Rocket Cluster	engineering	specialized bag and profession data	public
21720	Large Yellow Rocket Cluster	engineering	specialized bag and profession data	public
21721	Moonglow	food	intrinsic item metadata	public
21722	Pattern: Festival Dress	tailoring	intrinsic item metadata	public
21723	Pattern: Festival Suit	tailoring	intrinsic item metadata	public
21737	Schematic: Cluster Launcher	engineering	intrinsic item metadata	public
21738	Schematic: Firework Launcher	engineering	intrinsic item metadata	public
21752	Thorium Setting	jewels	intrinsic item metadata	public
21753	Gem Studded Band	armor	intrinsic item metadata	public
21754	The Aquamarine Ward	armor	intrinsic item metadata	public
21755	Aquamarine Pendant of the Warrior	armor	intrinsic item metadata	public
21764	Ruby Pendant of Fire	armor	intrinsic item metadata	public
21765	Truesilver Healing Ring	armor	intrinsic item metadata	public
21766	Opal Necklace of Impact	armor	intrinsic item metadata	public
21767	Simple Opal Ring	armor	intrinsic item metadata	public
21768	Sapphire Signet	armor	intrinsic item metadata	public
21772	Cut Sapphire	jewels	intrinsic item metadata	public
21773	Cut Opal	jewels	intrinsic item metadata	public
21774	Emerald Crown of Destruction	armor	intrinsic item metadata	public
21775	Onslaught Ring	armor	intrinsic item metadata	public
21778	Ring of Bitter Shadows	armor	intrinsic item metadata	public
21779	Band of Natural Fire	armor	intrinsic item metadata	public
21780	Blood Crown	armor	intrinsic item metadata	public
21785	Cut Emerald	jewels	intrinsic item metadata	public
21786	Cut Azerothian Diamond	jewels	intrinsic item metadata	public
21790	Sapphire Pendant of Winter Night	armor	intrinsic item metadata	public
21792	Necklace of the Diamond Tower	armor	intrinsic item metadata	public
21793	Arcanite Sword Pendant	armor	intrinsic item metadata	public
21840	Bolt of Netherweave	cloth	intrinsic item metadata	public
21841	Netherweave Bag	bags	intrinsic item metadata	public
21842	Bolt of Imbued Netherweave	cloth	intrinsic item metadata	public
21843	Imbued Netherweave Bag	bags	intrinsic item metadata	public
21844	Bolt of Soulcloth	cloth	intrinsic item metadata	public
21845	Primal Mooncloth	cloth	intrinsic item metadata	public
21846	Spellfire Belt	armor	intrinsic item metadata	public
21847	Spellfire Gloves	armor	intrinsic item metadata	public
21848	Spellfire Robe	armor	intrinsic item metadata	public
21849	Netherweave Bracers	armor	intrinsic item metadata	public
21850	Netherweave Belt	armor	intrinsic item metadata	public
21851	Netherweave Gloves	armor	intrinsic item metadata	public
21852	Netherweave Pants	armor	intrinsic item metadata	public
21853	Netherweave Boots	armor	intrinsic item metadata	public
21854	Netherweave Robe	armor	intrinsic item metadata	public
21855	Netherweave Tunic	armor	intrinsic item metadata	public
21858	Spellfire Bag	bags	intrinsic item metadata	public
21859	Imbued Netherweave Pants	armor	intrinsic item metadata	public
21860	Imbued Netherweave Boots	armor	intrinsic item metadata	public
21861	Imbued Netherweave Robe	armor	intrinsic item metadata	public
21862	Imbued Netherweave Tunic	armor	intrinsic item metadata	public
21863	Soulcloth Gloves	armor	intrinsic item metadata	public
21864	Soulcloth Shoulders	armor	intrinsic item metadata	public
21865	Soulcloth Vest	armor	intrinsic item metadata	public
21866	Arcanoweave Bracers	armor	intrinsic item metadata	public
21867	Arcanoweave Boots	armor	intrinsic item metadata	public
21868	Arcanoweave Robe	armor	intrinsic item metadata	public
21869	Frozen Shadoweave Shoulders	armor	intrinsic item metadata	public
21870	Frozen Shadoweave Boots	armor	intrinsic item metadata	public
21871	Frozen Shadoweave Robe	armor	intrinsic item metadata	public
21872	Ebon Shadowbag	bags	intrinsic item metadata	public
21873	Primal Mooncloth Belt	armor	intrinsic item metadata	public
21874	Primal Mooncloth Shoulders	armor	intrinsic item metadata	public
21875	Primal Mooncloth Robe	armor	intrinsic item metadata	public
21876	Primal Mooncloth Bag	bags	intrinsic item metadata	public
21877	Netherweave Cloth	cloth	intrinsic item metadata	public
21881	Netherweb Spider Silk	cloth	intrinsic item metadata	public
21882	Soul Essence	tailoring	single profession category	public
21883	Ebon Felcloth	cloth	intrinsic item metadata	public
21884	Primal Fire	elemental	intrinsic item metadata	public
21885	Primal Water	elemental	intrinsic item metadata	public
21886	Primal Life	elemental	intrinsic item metadata	public
21887	Knothide Leather	leather	intrinsic item metadata	public
21892	Pattern: Bolt of Imbued Netherweave	tailoring	intrinsic item metadata	public
21893	Pattern: Imbued Netherweave Bag	tailoring	intrinsic item metadata	public
21894	Pattern: Bolt of Soulcloth	tailoring	intrinsic item metadata	public
21895	Pattern: Primal Mooncloth	tailoring	intrinsic item metadata	public
21896	Pattern: Netherweave Robe	tailoring	intrinsic item metadata	public
21897	Pattern: Netherweave Tunic	tailoring	intrinsic item metadata	public
21898	Pattern: Imbued Netherweave Pants	tailoring	intrinsic item metadata	public
21899	Pattern: Imbued Netherweave Boots	tailoring	intrinsic item metadata	public
21900	Pattern: Imbued Netherweave Robe	tailoring	intrinsic item metadata	public
21901	Pattern: Imbued Netherweave Tunic	tailoring	intrinsic item metadata	public
21902	Pattern: Soulcloth Gloves	tailoring	intrinsic item metadata	public
21924	Pattern: Runecloth Robe	tailoring	intrinsic item metadata	public
21929	Flame Spessarite	jewels	intrinsic item metadata	public
21931	Woven Copper Ring	armor	intrinsic item metadata	public
21932	Heavy Copper Ring	armor	intrinsic item metadata	public
21933	Thick Bronze Necklace	armor	intrinsic item metadata	public
21934	Ornate Tigerseye Necklace	armor	intrinsic item metadata	public
21940	Design: Golden Hare	jewels	intrinsic item metadata	public
21941	Design: Black Pearl Panther	jewels	intrinsic item metadata	public
21942	Design: Ruby Crown of Restoration	jewels	intrinsic item metadata	public
21943	Design: Truesilver Crab	jewels	intrinsic item metadata	public
21944	Design: Truesilver Boar	jewels	intrinsic item metadata	public
21945	Design: The Aquamarine Ward	jewels	intrinsic item metadata	public
21947	Design: Gem Studded Band	jewels	intrinsic item metadata	public
21948	Design: Opal Necklace of Impact	jewels	intrinsic item metadata	public
21949	Design: Ruby Serpent	jewels	intrinsic item metadata	public
21950	Design: Cut Emerald - Deprecated		deprecated client record	excluded
21951	Design: Cut Azerothian Diamond	jewels	intrinsic item metadata	public
21952	Design: Emerald Crown of Destruction	jewels	intrinsic item metadata	public
21953	Design: Emerald Owl	jewels	intrinsic item metadata	public
21954	Design: Ring of Bitter Shadows	jewels	intrinsic item metadata	public
21957	Design: Necklace of the Diamond Tower	jewels	intrinsic item metadata	public
21958	Design: Arcanite Sword Pendant	jewels	intrinsic item metadata	public
21959	Design: Blood Crown	jewels	intrinsic item metadata	public
21990	Netherweave Bandage	first_aid	intrinsic item metadata	public
21991	Heavy Netherweave Bandage	first_aid	intrinsic item metadata	public
21992	Manual: Netherweave Bandage	first_aid	intrinsic item metadata	public
21993	Manual: Heavy Netherweave Bandage	first_aid	intrinsic item metadata	public
22012	Master First Aid - Doctor in the House	first_aid	intrinsic item metadata	public
22147	Flintweed Seed	herbs	specialized bag and profession data	public
22191	Obsidian Mail Tunic	armor	intrinsic item metadata	public
22194	Black Grasp of the Destroyer	armor	intrinsic item metadata	public
22195	Light Obsidian Belt	armor	intrinsic item metadata	public
22196	Thick Obsidian Breastplate	armor	intrinsic item metadata	public
22197	Heavy Obsidian Belt	armor	intrinsic item metadata	public
22198	Jagged Obsidian Shield	armor	intrinsic item metadata	public
22202	Small Obsidian Shard	ore	intrinsic item metadata	public
22203	Large Obsidian Shard	ore	intrinsic item metadata	public
22220	Plans: Black Grasp of the Destroyer	blacksmithing	intrinsic item metadata	public
22222	Plans: Thick Obsidian Breastplate	blacksmithing	intrinsic item metadata	public
22246	Enchanted Mageweave Pouch	bags	intrinsic item metadata	public
22248	Enchanted Runecloth Bag	bags	intrinsic item metadata	public
22249	Big Bag of Enchantment	bags	intrinsic item metadata	public
22251	Cenarion Herb Bag	bags	intrinsic item metadata	public
22252	Satchel of Cenarius	bags	intrinsic item metadata	public
22307	Pattern: Enchanted Mageweave Pouch	tailoring	intrinsic item metadata	public
22308	Pattern: Enchanted Runecloth Bag	tailoring	intrinsic item metadata	public
22309	Pattern: Big Bag of Enchantment	tailoring	intrinsic item metadata	public
22324	Winter Kimchi	food	intrinsic item metadata	public
22383	Sageblade	weapons	intrinsic item metadata	public
22384	Persuader	weapons	intrinsic item metadata	public
22385	Titanic Leggings	armor	intrinsic item metadata	public
22388	Plans: Titanic Leggings	blacksmithing	intrinsic item metadata	public
22389	Plans: Sageblade	blacksmithing	intrinsic item metadata	public
22390	Plans: Persuader	blacksmithing	intrinsic item metadata	public
22445	Arcane Dust	enchanting	intrinsic item metadata	public
22446	Greater Planar Essence	enchanting	intrinsic item metadata	public
22447	Lesser Planar Essence	enchanting	intrinsic item metadata	public
22448	Small Prismatic Shard	enchanting	intrinsic item metadata	public
22449	Large Prismatic Shard	enchanting	intrinsic item metadata	public
22450	Void Crystal	enchanting	intrinsic item metadata	public
22451	Primal Air	elemental	intrinsic item metadata	public
22452	Primal Earth	elemental	intrinsic item metadata	public
22456	Primal Shadow	elemental	intrinsic item metadata	public
22457	Primal Mana	elemental	intrinsic item metadata	public
22459	Void Sphere	jewels	intrinsic item metadata	public
22460	Prismatic Sphere	jewels	intrinsic item metadata	public
22521	Superior Mana Oil	enchanting	single crafted-product category	public
22522	Superior Wizard Oil	enchanting	single crafted-product category	public
22532	Formula: Enchant Bracer - Restore Mana Prime	enchanting	intrinsic item metadata	public
22539	Formula: Enchant Shield - Intellect	enchanting	intrinsic item metadata	public
22540	Formula: Enchant Shield - Parry	enchanting	intrinsic item metadata	public
22542	Formula: Enchant Boots - Vitality	enchanting	intrinsic item metadata	public
22553	Formula: Enchant Weapon - Potency	enchanting	intrinsic item metadata	public
22557	Formula: Enchant Weapon - Battlemaster	enchanting	intrinsic item metadata	public
22558	Formula: Enchant Weapon - Spellsurge	enchanting	intrinsic item metadata	public
22562	Formula: Superior Mana Oil	enchanting	intrinsic item metadata	public
22563	Formula: Superior Wizard Oil	enchanting	intrinsic item metadata	public
22564	Formula: Arcane Dust	enchanting	intrinsic item metadata	public
22565	Formula: Large Prismatic Shard	enchanting	intrinsic item metadata	public
22572	Mote of Air	elemental	intrinsic item metadata	public
22573	Mote of Earth	elemental	intrinsic item metadata	public
22574	Mote of Fire	elemental	intrinsic item metadata	public
22575	Mote of Life	elemental	intrinsic item metadata	public
22576	Mote of Mana	elemental	intrinsic item metadata	public
22577	Mote of Shadow	elemental	intrinsic item metadata	public
22578	Mote of Water	elemental	intrinsic item metadata	public
22644	Crunchy Spider Leg	fish	intrinsic item metadata	public
22645	Crunchy Spider Surprise	food	intrinsic item metadata	public
22647	Recipe: Crunchy Spider Surprise	fish	intrinsic item metadata	public
22652	Glacial Vest	armor	intrinsic item metadata	public
22654	Glacial Gloves	armor	intrinsic item metadata	public
22655	Glacial Wrists	armor	intrinsic item metadata	public
22658	Glacial Cloak	armor	intrinsic item metadata	public
22660	Gaea's Embrace	armor	intrinsic item metadata	public
22661	Polar Tunic	armor	intrinsic item metadata	public
22662	Polar Gloves	armor	intrinsic item metadata	public
22663	Polar Bracers	armor	intrinsic item metadata	public
22664	Icy Scale Breastplate	armor	intrinsic item metadata	public
22665	Icy Scale Bracers	armor	intrinsic item metadata	public
22666	Icy Scale Gauntlets	armor	intrinsic item metadata	public
22669	Icebane Breastplate	armor	intrinsic item metadata	public
22670	Icebane Gauntlets	armor	intrinsic item metadata	public
22671	Icebane Bracers	armor	intrinsic item metadata	public
22682	Frozen Rune	elemental	curated player-facing category	public
22710	Bloodthistle	herbs	intrinsic item metadata	public
22728	Steam Tonk Controller	engineering	specialized bag and profession data	public
22756	Sylvan Vest	armor	intrinsic item metadata	public
22757	Sylvan Crown	armor	intrinsic item metadata	public
22758	Sylvan Shoulders	armor	intrinsic item metadata	public
22759	Bramblewood Helm	armor	intrinsic item metadata	public
22760	Bramblewood Boots	armor	intrinsic item metadata	public
22761	Bramblewood Belt	armor	intrinsic item metadata	public
22762	Ironvine Breastplate	armor	intrinsic item metadata	public
22763	Ironvine Gloves	armor	intrinsic item metadata	public
22764	Ironvine Belt	armor	intrinsic item metadata	public
22785	Felweed	herbs	intrinsic item metadata	public
22786	Dreaming Glory	herbs	intrinsic item metadata	public
22787	Ragveil	herbs	intrinsic item metadata	public
22788	Flame Cap	herbs	intrinsic item metadata	public
22789	Terocone	herbs	intrinsic item metadata	public
22790	Ancient Lichen	herbs	intrinsic item metadata	public
22791	Netherbloom	herbs	intrinsic item metadata	public
22792	Nightmare Vine	herbs	intrinsic item metadata	public
22793	Mana Thistle	herbs	intrinsic item metadata	public
22794	Fel Lotus	herbs	intrinsic item metadata	public
22795	Fel Blossom	herbs	specialized bag and profession data	public
22797	Nightmare Seed	herbs	intrinsic item metadata	public
22823	Elixir of Camouflage	alchemy	intrinsic item metadata	public
22824	Elixir of Major Strength	alchemy	intrinsic item metadata	public
22825	Elixir of Healing Power	alchemy	intrinsic item metadata	public
22826	Sneaking Potion	alchemy	intrinsic item metadata	public
22827	Elixir of Major Frost Power	alchemy	intrinsic item metadata	public
22828	Insane Strength Potion	alchemy	intrinsic item metadata	public
22829	Super Healing Potion	alchemy	intrinsic item metadata	public
22830	Elixir of the Searching Eye	alchemy	intrinsic item metadata	public
22831	Elixir of Major Agility	alchemy	intrinsic item metadata	public
22832	Super Mana Potion	alchemy	intrinsic item metadata	public
22833	Elixir of Major Firepower	alchemy	intrinsic item metadata	public
22834	Elixir of Major Defense	alchemy	intrinsic item metadata	public
22835	Elixir of Major Shadow Power	alchemy	intrinsic item metadata	public
22836	Major Dreamless Sleep Potion	alchemy	intrinsic item metadata	public
22837	Heroic Potion	alchemy	intrinsic item metadata	public
22838	Haste Potion	alchemy	intrinsic item metadata	public
22839	Destruction Potion	alchemy	intrinsic item metadata	public
22840	Elixir of Major Mageblood	alchemy	intrinsic item metadata	public
22841	Major Fire Protection Potion	alchemy	intrinsic item metadata	public
22842	Major Frost Protection Potion	alchemy	intrinsic item metadata	public
22844	Major Nature Protection Potion	alchemy	intrinsic item metadata	public
22845	Major Arcane Protection Potion	alchemy	intrinsic item metadata	public
22846	Major Shadow Protection Potion	alchemy	intrinsic item metadata	public
22847	Major Holy Protection Potion	alchemy	intrinsic item metadata	public
22848	Elixir of Empowerment	alchemy	intrinsic item metadata	public
22849	Ironshield Potion	alchemy	intrinsic item metadata	public
22850	Super Rejuvenation Potion	alchemy	intrinsic item metadata	public
22851	Flask of Fortification	alchemy	intrinsic item metadata	public
22853	Flask of Mighty Restoration	alchemy	intrinsic item metadata	public
22854	Flask of Relentless Assault	alchemy	intrinsic item metadata	public
22861	Flask of Blinding Light	alchemy	intrinsic item metadata	public
22866	Flask of Pure Death	alchemy	intrinsic item metadata	public
22871	Shrouding Potion	alchemy	intrinsic item metadata	public
22901	Recipe: Sneaking Potion	alchemy	intrinsic item metadata	public
22902	Recipe: Elixir of Major Frost Power	alchemy	intrinsic item metadata	public
22903	Recipe: Insane Strength Potion	alchemy	intrinsic item metadata	public
22904	Recipe: Elixir of the Searching Eye	alchemy	intrinsic item metadata	public
22912	Recipe: Heroic Potion	alchemy	intrinsic item metadata	public
22913	Recipe: Haste Potion	alchemy	intrinsic item metadata	public
22914	Recipe: Destruction Potion	alchemy	intrinsic item metadata	public
22919	Recipe: Elixir of Major Mageblood	alchemy	intrinsic item metadata	public
22926	Recipe: Elixir of Empowerment	alchemy	intrinsic item metadata	public
23077	Blood Garnet	jewels	intrinsic item metadata	public
23079	Deep Peridot	jewels	intrinsic item metadata	public
23094	Brilliant Blood Garnet	jewels	intrinsic item metadata	public
23095	Bold Blood Garnet	jewels	intrinsic item metadata	public
23096	Brilliant Blood Garnet	jewels	intrinsic item metadata	public
23097	Delicate Blood Garnet	jewels	intrinsic item metadata	public
23098	Inscribed Flame Spessarite	jewels	intrinsic item metadata	public
23099	Reckless Flame Spessarite	jewels	intrinsic item metadata	public
23100	Glinting Shadow Draenite	jewels	intrinsic item metadata	public
23101	Potent Flame Spessarite	jewels	intrinsic item metadata	public
23103	Radiant Deep Peridot	jewels	intrinsic item metadata	public
23104	Jagged Deep Peridot	jewels	intrinsic item metadata	public
23105	Regal Deep Peridot	jewels	intrinsic item metadata	public
23106	Purified Shadow Draenite	jewels	intrinsic item metadata	public
23107	Shadow Draenite	jewels	intrinsic item metadata	public
23108	Timeless Shadow Draenite	jewels	intrinsic item metadata	public
23109	Purified Shadow Draenite	jewels	intrinsic item metadata	public
23110	Shifting Shadow Draenite	jewels	intrinsic item metadata	public
23111	Sovereign Shadow Draenite	jewels	intrinsic item metadata	public
23112	Golden Draenite	jewels	intrinsic item metadata	public
23113	Brilliant Blood Garnet	jewels	intrinsic item metadata	public
23114	Smooth Golden Draenite	jewels	intrinsic item metadata	public
23115	Subtle Golden Draenite	jewels	intrinsic item metadata	public
23116	Rigid Azure Moonstone	jewels	intrinsic item metadata	public
23117	Azure Moonstone	jewels	intrinsic item metadata	public
23118	Solid Azure Moonstone	jewels	intrinsic item metadata	public
23119	Sparkling Azure Moonstone	jewels	intrinsic item metadata	public
23120	Stormy Azure Moonstone	jewels	intrinsic item metadata	public
23121	Sparkling Azure Moonstone	jewels	intrinsic item metadata	public
23131	Design: Bold Blood Garnet	jewels	intrinsic item metadata	public
23135	Design: Inscribed Flame Spessarite	jewels	intrinsic item metadata	public
23137	Design: Glinting Shadow Draenite	jewels	intrinsic item metadata	public
23140	Design: Radiant Deep Peridot	jewels	intrinsic item metadata	public
23141	Design: Jagged Deep Peridot	jewels	intrinsic item metadata	public
23144	Design: Timeless Shadow Draenite	jewels	intrinsic item metadata	public
23147	Design: Sovereign Shadow Draenite	jewels	intrinsic item metadata	public
23148	Design: Brilliant Blood Garnet	jewels	intrinsic item metadata	public
23151	Design: Rigid Azure Moonstone	jewels	intrinsic item metadata	public
23152	Design: Solid Azure Moonstone	jewels	intrinsic item metadata	public
23153	Design: Sparkling Azure Moonstone	jewels	intrinsic item metadata	public
23154	Design: Stormy Azure Moonstone	jewels	intrinsic item metadata	public
23157	Thick Citrine	jewels	intrinsic item metadata	public
23158	Solid Aquamarine	jewels	intrinsic item metadata	public
23159	Sparkling Aquamarine	jewels	intrinsic item metadata	public
23236	Meta Bryanite	jewels	intrinsic item metadata	public
23329	Enriched Lasher Root	herbs	specialized bag and profession data	public
23364	zzDEPRECATEDHeart of the Sky		deprecated client record	excluded
23366	zzDEPRECATEDPerfect Diamond		deprecated client record	excluded
23418	Test Sapper Charge		internal test item	excluded
23424	Fel Iron Ore	ore	intrinsic item metadata	public
23425	Adamantite Ore	ore	intrinsic item metadata	public
23426	Khorium Ore	ore	intrinsic item metadata	public
23427	Eternium Ore	ore	intrinsic item metadata	public
23436	Living Ruby	jewels	intrinsic item metadata	public
23437	Talasite	jewels	intrinsic item metadata	public
23438	Star of Elune	jewels	intrinsic item metadata	public
23439	Noble Topaz	jewels	intrinsic item metadata	public
23440	Dawnstone	jewels	intrinsic item metadata	public
23441	Nightseye	jewels	intrinsic item metadata	public
23445	Fel Iron Bar	ore	intrinsic item metadata	public
23446	Adamantite Bar	ore	intrinsic item metadata	public
23447	Eternium Bar	ore	intrinsic item metadata	public
23448	Felsteel Bar	ore	intrinsic item metadata	public
23449	Khorium Bar	ore	intrinsic item metadata	public
23482	Fel Iron Plate Gloves	armor	intrinsic item metadata	public
23484	Fel Iron Plate Belt	armor	intrinsic item metadata	public
23487	Fel Iron Plate Boots	armor	intrinsic item metadata	public
23488	Fel Iron Plate Pants	armor	intrinsic item metadata	public
23489	Fel Iron Breastplate	armor	intrinsic item metadata	public
23490	Fel Iron Chain Tunic	armor	intrinsic item metadata	public
23491	Fel Iron Chain Gloves	armor	intrinsic item metadata	public
23493	Fel Iron Chain Coif	armor	intrinsic item metadata	public
23494	Fel Iron Chain Bracers	armor	intrinsic item metadata	public
23497	Fel Iron Hatchet	weapons	intrinsic item metadata	public
23498	Fel Iron Hammer	weapons	intrinsic item metadata	public
23499	Fel Iron Greatsword	weapons	intrinsic item metadata	public
23502	Adamantite Maul	weapons	intrinsic item metadata	public
23503	Adamantite Cleaver	weapons	intrinsic item metadata	public
23504	Adamantite Dagger	weapons	intrinsic item metadata	public
23505	Adamantite Rapier	weapons	intrinsic item metadata	public
23506	Adamantite Plate Bracers	armor	intrinsic item metadata	public
23507	Adamantite Breastplate	armor	intrinsic item metadata	public
23508	Adamantite Plate Gloves	armor	intrinsic item metadata	public
23509	Enchanted Adamantite Breastplate	armor	intrinsic item metadata	public
23510	Enchanted Adamantite Belt	armor	intrinsic item metadata	public
23511	Enchanted Adamantite Boots	armor	intrinsic item metadata	public
23512	Enchanted Adamantite Leggings	armor	intrinsic item metadata	public
23513	Flamebane Breastplate	armor	intrinsic item metadata	public
23514	Flamebane Gloves	armor	intrinsic item metadata	public
23515	Flamebane Bracers	armor	intrinsic item metadata	public
23516	Flamebane Helm	armor	intrinsic item metadata	public
23517	Felsteel Gloves	armor	intrinsic item metadata	public
23518	Felsteel Leggings	armor	intrinsic item metadata	public
23519	Felsteel Helm	armor	intrinsic item metadata	public
23520	Ragesteel Gloves	armor	intrinsic item metadata	public
23521	Ragesteel Helm	armor	intrinsic item metadata	public
23522	Ragesteel Breastplate	armor	intrinsic item metadata	public
23523	Khorium Pants	armor	intrinsic item metadata	public
23524	Khorium Belt	armor	intrinsic item metadata	public
23525	Khorium Boots	armor	intrinsic item metadata	public
23526	Swiftsteel Gloves	armor	intrinsic item metadata	public
23527	Earthpeace Breastplate	armor	intrinsic item metadata	public
23528	Fel Sharpening Stone	blacksmithing	single crafted-product category	public
23529	Adamantite Sharpening Stone	blacksmithing	single crafted-product category	public
23530	Felsteel Shield Spike	enchanting	intrinsic item metadata	public
23531	Felfury Gauntlets	armor	intrinsic item metadata	public
23532	Gauntlets of the Iron Tower	armor	intrinsic item metadata	public
23533	Steelgrip Gauntlets	armor	intrinsic item metadata	public
23534	Storm Helm	armor	intrinsic item metadata	public
23535	Helm of the Stalwart Defender	armor	intrinsic item metadata	public
23536	Oathkeeper's Helm	armor	intrinsic item metadata	public
23537	Black Felsteel Bracers	armor	intrinsic item metadata	public
23538	Bracers of the Green Fortress	armor	intrinsic item metadata	public
23539	Blessed Bracers	armor	intrinsic item metadata	public
23540	Felsteel Longblade	weapons	intrinsic item metadata	public
23541	Khorium Champion	weapons	intrinsic item metadata	public
23542	Fel Edged Battleaxe	weapons	intrinsic item metadata	public
23543	Felsteel Reaper	weapons	intrinsic item metadata	public
23544	Runic Hammer	weapons	intrinsic item metadata	public
23546	Fel Hardened Maul	weapons	intrinsic item metadata	public
23554	Eternium Runed Blade	weapons	intrinsic item metadata	public
23555	Dirge	weapons	intrinsic item metadata	public
23556	Hand of Eternity	weapons	intrinsic item metadata	public
23559	Lesser Rune of Warding	blacksmithing	single crafted-product category	public
23571	Primal Might	elemental	intrinsic item metadata	public
23572	Primal Nether	profession_supplies	curated shared crafting reagent	public
23573	Hardened Adamantite Bar	ore	intrinsic item metadata	public
23575	Lesser Ward of Shielding	blacksmithing	single crafted-product category	public
23576	Greater Ward of Shielding	blacksmithing	single crafted-product category	public
23578	Diet McWeaksauce	alchemy	intrinsic item metadata	public
23579	The McWeaksauce Classic	alchemy	intrinsic item metadata	public
23590	Plans: Adamantite Maul	blacksmithing	intrinsic item metadata	public
23591	Plans: Adamantite Cleaver	blacksmithing	intrinsic item metadata	public
23592	Plans: Adamantite Dagger	blacksmithing	intrinsic item metadata	public
23593	Plans: Adamantite Rapier	blacksmithing	intrinsic item metadata	public
23594	Plans: Adamantite Plate Bracers	blacksmithing	intrinsic item metadata	public
23595	Plans: Adamantite Plate Gloves	blacksmithing	intrinsic item metadata	public
23596	Plans: Adamantite Breastplate	blacksmithing	intrinsic item metadata	public
23620	Plans: Felfury Gauntlets	blacksmithing	intrinsic item metadata	public
23621	Plans: Gauntlets of the Iron Tower	blacksmithing	intrinsic item metadata	public
23622	Plans: Steelgrip Gauntlets	blacksmithing	intrinsic item metadata	public
23623	Plans: Storm Helm	blacksmithing	intrinsic item metadata	public
23624	Plans: Helm of the Stalwart Defender	blacksmithing	intrinsic item metadata	public
23625	Plans: Oathkeeper's Helm	blacksmithing	intrinsic item metadata	public
23626	Plans: Black Felsteel Bracers	blacksmithing	intrinsic item metadata	public
23627	Plans: Bracers of the Green Fortress	blacksmithing	intrinsic item metadata	public
23628	Plans: Blessed Bracers	blacksmithing	intrinsic item metadata	public
23629	Plans: Felsteel Longblade	blacksmithing	intrinsic item metadata	public
23630	Plans: Khorium Champion	blacksmithing	intrinsic item metadata	public
23631	Plans: Fel Edged Battleaxe	blacksmithing	intrinsic item metadata	public
23632	Plans: Felsteel Reaper	blacksmithing	intrinsic item metadata	public
23633	Plans: Runic Hammer	blacksmithing	intrinsic item metadata	public
23634	Plans: Fel Hardened Maul	blacksmithing	intrinsic item metadata	public
23635	Plans: Eternium Runed Blade	blacksmithing	intrinsic item metadata	public
23636	Plans: Dirge	blacksmithing	intrinsic item metadata	public
23637	Plans: Hand of Eternity	blacksmithing	intrinsic item metadata	public
23638	Plans: Lesser Ward of Shielding	blacksmithing	intrinsic item metadata	public
23676	Moongraze Stag Tenderloin	fish	intrinsic item metadata	public
23684	Crystal Infused Bandage [PH]		placeholder item	excluded
23696	[PH] Potion of Heightened Senses [DEP]		placeholder item	excluded
23698	[PH] Nature Resist Potion [DEP]		placeholder item	excluded
23704	Eversong Port	food	intrinsic item metadata	public
23736	Fel Iron Bomb	engineering	specialized bag and profession data	public
23737	Adamantite Grenade	engineering	specialized bag and profession data	public
23742	Fel Iron Musket	weapons	intrinsic item metadata	public
23746	Adamantite Rifle	weapons	intrinsic item metadata	public
23747	Felsteel Boomstick	weapons	intrinsic item metadata	public
23748	Ornate Khorium Rifle	weapons	intrinsic item metadata	public
23756	Cookie's Jumbo Gumbo	food	intrinsic item metadata	public
23758	Cogspinner Goggles	armor	intrinsic item metadata	public
23761	Power Amplification Goggles	armor	intrinsic item metadata	public
23762	Ultra-Spectropic Detection Goggles	armor	intrinsic item metadata	public
23763	Hyper-Vision Goggles	armor	intrinsic item metadata	public
23764	Adamantite Scope	engineering	specialized bag and profession data	public
23765	Khorium Scope	engineering	specialized bag and profession data	public
23766	Stabilized Eternium Scope	engineering	specialized bag and profession data	public
23767	Crashin' Thrashin' Robot	engineering	specialized bag and profession data	public
23768	White Smoke Flare	engineering	specialized bag and profession data	public
23769	Red Smoke Flare	engineering	specialized bag and profession data	public
23770	Blue Smoke Flare	engineering	specialized bag and profession data	public
23771	Green Smoke Flare	engineering	specialized bag and profession data	public
23774	Fel Iron Toolbox	bags	intrinsic item metadata	public
23775	Titanium Toolbox	bags	intrinsic item metadata	public
23781	Elemental Blasting Powder	engineering	specialized bag and profession data	public
23782	Fel Iron Casing	engineering	single crafted-product category	public
23783	Handful of Fel Iron Bolts	engineering	specialized bag and profession data	public
23784	Adamantite Frame	engineering	specialized bag and profession data	public
23785	Hardened Adamantite Tube	engineering	specialized bag and profession data	public
23786	Khorium Power Core	engineering	specialized bag and profession data	public
23787	Felsteel Stabilizer	engineering	specialized bag and profession data	public
23793	Heavy Knothide Leather	leather	intrinsic item metadata	public
23799	Schematic: Adamantite Rifle	engineering	intrinsic item metadata	public
23802	Schematic: Ornate Khorium Rifle	engineering	intrinsic item metadata	public
23803	Schematic: Cogspinner Goggles	engineering	intrinsic item metadata	public
23804	Schematic: Power Amplification Goggles	engineering	intrinsic item metadata	public
23805	Schematic: Ultra-Spectropic Detection Goggles	engineering	intrinsic item metadata	public
23807	Schematic: Adamantite Scope	engineering	intrinsic item metadata	public
23810	Schematic: Crashin' Thrashin' Robot	engineering	intrinsic item metadata	public
23811	Schematic: White Smoke Flare	engineering	intrinsic item metadata	public
23815	Ruined Schematic	engineering	specialized bag and profession data	public
23816	Schematic: Fel Iron Toolbox	engineering	intrinsic item metadata	public
23817	Schematic: Titanium Toolbox	engineering	intrinsic item metadata	public
23819	Elemental Seaforium Charge	engineering	specialized bag and profession data	public
23820	Critter Enlarger	engineering	specialized bag and profession data	public
23821	Zapthrottle Mote Extractor	engineering	specialized bag and profession data	public
23822	Healing Potion Injector	alchemy	intrinsic item metadata	public
23823	Mana Potion Injector	alchemy	intrinsic item metadata	public
23824	Rocket Boots Xtreme	armor	intrinsic item metadata	public
23825	Nigh-Invulnerability Belt	armor	intrinsic item metadata	public
23826	The Bigger One	engineering	specialized bag and profession data	public
23827	Super Sapper Charge	engineering	specialized bag and profession data	public
23831	Goblin Tonk Controller	engineering	specialized bag and profession data	public
23832	Gnomish Tonk Controller	engineering	specialized bag and profession data	public
23835	Gnomish Poultryizer	trinkets	intrinsic item metadata	public
23836	Goblin Rocket Launcher	trinkets	intrinsic item metadata	public
23840	Remote Mail Terminal	engineering	specialized bag and profession data	public
23841	Gnomish Flame Turret	engineering	specialized bag and profession data	public
23848	Nethergarde Bitter	food	intrinsic item metadata	public
23854	Shadoweave Cloth	cloth	intrinsic item metadata	public
23855	Spellfire Cloth	cloth	intrinsic item metadata	public
23883	Schematic: Healing Potion Injector	engineering	intrinsic item metadata	public
23884	Schematic: Mana Potion Injector	engineering	intrinsic item metadata	public
23885	Schematic: Remote Mail Terminal	engineering	intrinsic item metadata	public
24027	Bold Living Ruby	jewels	intrinsic item metadata	public
24028	Delicate Living Ruby	jewels	intrinsic item metadata	public
24029	Brilliant Living Ruby	jewels	intrinsic item metadata	public
24030	Brilliant Living Ruby	jewels	intrinsic item metadata	public
24031	Delicate Living Ruby	jewels	intrinsic item metadata	public
24032	Subtle Dawnstone	jewels	intrinsic item metadata	public
24033	Solid Star of Elune	jewels	intrinsic item metadata	public
24035	Sparkling Star of Elune	jewels	intrinsic item metadata	public
24036	Flashing Living Ruby	jewels	intrinsic item metadata	public
24037	Sparkling Star of Elune	jewels	intrinsic item metadata	public
24039	Stormy Star of Elune	jewels	intrinsic item metadata	public
24047	Brilliant Living Ruby	jewels	intrinsic item metadata	public
24048	Smooth Dawnstone	jewels	intrinsic item metadata	public
24050	Smooth Dawnstone	jewels	intrinsic item metadata	public
24051	Rigid Star of Elune	jewels	intrinsic item metadata	public
24052	Subtle Dawnstone	jewels	intrinsic item metadata	public
24053	Mystic Dawnstone	jewels	intrinsic item metadata	public
24054	Sovereign Nightseye	jewels	intrinsic item metadata	public
24055	Shifting Nightseye	jewels	intrinsic item metadata	public
24056	Timeless Nightseye	jewels	intrinsic item metadata	public
24057	Purified Nightseye	jewels	intrinsic item metadata	public
24058	Inscribed Noble Topaz	jewels	intrinsic item metadata	public
24059	Potent Noble Topaz	jewels	intrinsic item metadata	public
24060	Reckless Noble Topaz	jewels	intrinsic item metadata	public
24061	Glinting Nightseye	jewels	intrinsic item metadata	public
24062	Regal Talasite	jewels	intrinsic item metadata	public
24065	Purified Nightseye	jewels	intrinsic item metadata	public
24066	Radiant Talasite	jewels	intrinsic item metadata	public
24067	Jagged Talasite	jewels	intrinsic item metadata	public
24072	Sand Pear Pie	food	intrinsic item metadata	public
24074	Fel Iron Blood Ring	armor	intrinsic item metadata	public
24075	Golden Draenite Ring	armor	intrinsic item metadata	public
24076	Azure Moonstone Ring	armor	intrinsic item metadata	public
24077	Thick Adamantite Necklace	armor	intrinsic item metadata	public
24078	Heavy Adamantite Ring	armor	intrinsic item metadata	public
24079	Khorium Band of Shadows	armor	intrinsic item metadata	public
24080	Khorium Band of Frost	armor	intrinsic item metadata	public
24082	Khorium Inferno Band	armor	intrinsic item metadata	public
24085	Khorium Band of Leaves	armor	intrinsic item metadata	public
24086	Arcane Khorium Band	armor	intrinsic item metadata	public
24087	Heavy Felsteel Ring	armor	intrinsic item metadata	public
24088	Delicate Eternium Ring	armor	intrinsic item metadata	public
24089	Blazing Eternium Band	armor	intrinsic item metadata	public
24092	Pendant of Frozen Flame	armor	intrinsic item metadata	public
24093	Pendant of Thawing	armor	intrinsic item metadata	public
24095	Pendant of Withering	armor	intrinsic item metadata	public
24097	Pendant of Shadow's End	armor	intrinsic item metadata	public
24098	Pendant of the Null Rune	armor	intrinsic item metadata	public
24105	Roasted Moongraze Tenderloin	food	intrinsic item metadata	public
24106	Thick Felsteel Necklace	armor	intrinsic item metadata	public
24110	Living Ruby Pendant	armor	intrinsic item metadata	public
24114	Braided Eternium Chain	armor	intrinsic item metadata	public
24116	Eye of the Night	armor	intrinsic item metadata	public
24117	Embrace of the Dawn	armor	intrinsic item metadata	public
24121	Chain of the Twilight Owl	armor	intrinsic item metadata	public
24122	Coronet of Verdant Flame	armor	intrinsic item metadata	public
24123	Circlet of Arcane Might	armor	intrinsic item metadata	public
24163	Design: Heavy Felsteel Ring	jewels	intrinsic item metadata	public
24164	Design: Delicate Eternium Ring	jewels	intrinsic item metadata	public
24165	Design: Blazing Eternium Band	jewels	intrinsic item metadata	public
24166	Design: Thick Felsteel Necklace	jewels	intrinsic item metadata	public
24167	Design: Living Ruby Pendant	jewels	intrinsic item metadata	public
24168	Design: Braided Eternium Chain	jewels	intrinsic item metadata	public
24169	Design: Eye of the Night	jewels	intrinsic item metadata	public
24170	Design: Embrace of the Dawn	jewels	intrinsic item metadata	public
24171	Design: Chain of the Twilight Owl	jewels	intrinsic item metadata	public
24186	Copper Powder	jewels	curated player-facing category	public
24188	Tin Powder	jewels	curated player-facing category	public
24190	Iron Powder	jewels	curated player-facing category	public
24192	Design: Delicate Living Ruby	jewels	intrinsic item metadata	public
24193	Design: Bold Living Ruby	jewels	intrinsic item metadata	public
24194	Design: Delicate Living Ruby	jewels	intrinsic item metadata	public
24195	Design: Brilliant Living Ruby	jewels	intrinsic item metadata	public
24196	Design: Brilliant Living Ruby	jewels	intrinsic item metadata	public
24197	Design: Subtle Dawnstone	jewels	intrinsic item metadata	public
24198	Design: Flashing Living Ruby	jewels	intrinsic item metadata	public
24199	Design: Solid Star of Elune	jewels	intrinsic item metadata	public
24200	Design: Sparkling Star of Elune	jewels	intrinsic item metadata	public
24201	Design: Sparkling Star of Elune	jewels	intrinsic item metadata	public
24202	Design: Stormy Star of Elune	jewels	intrinsic item metadata	public
24203	Design: Brilliant Living Ruby	jewels	intrinsic item metadata	public
24204	Design: Smooth Dawnstone	jewels	intrinsic item metadata	public
24205	Design: Rigid Star of Elune	jewels	intrinsic item metadata	public
24206	Design: Smooth Dawnstone	jewels	intrinsic item metadata	public
24207	Design: Subtle Dawnstone	jewels	intrinsic item metadata	public
24209	Design: Sovereign Nightseye	jewels	intrinsic item metadata	public
24210	Design: Shifting Nightseye	jewels	intrinsic item metadata	public
24211	Design: Timeless Nightseye	jewels	intrinsic item metadata	public
24212	Design: Purified Nightseye	jewels	intrinsic item metadata	public
24213	Design: Inscribed Noble Topaz	jewels	intrinsic item metadata	public
24214	Design: Potent Noble Topaz	jewels	intrinsic item metadata	public
24215	Design: Reckless Noble Topaz	jewels	intrinsic item metadata	public
24216	Design: Glinting Nightseye	jewels	intrinsic item metadata	public
24217	Design: Regal Talasite	jewels	intrinsic item metadata	public
24218	Design: Radiant Talasite	jewels	intrinsic item metadata	public
24219	Design: Purified Nightseye	jewels	intrinsic item metadata	public
24220	Design: Jagged Talasite	jewels	intrinsic item metadata	public
24234	Mithril Powder	jewels	curated player-facing category	public
24235	Thorium Powder	jewels	curated player-facing category	public
24242	Fel Iron Powder	jewels	curated player-facing category	public
24243	Adamantite Powder	jewels	intrinsic item metadata	public
24249	Unyielding Bracers	armor	intrinsic item metadata	public
24250	Bracers of Havok	armor	intrinsic item metadata	public
24251	Blackstrike Bracers	armor	intrinsic item metadata	public
24252	Cloak of the Black Void	armor	intrinsic item metadata	public
24253	Cloak of Eternity	armor	intrinsic item metadata	public
24254	White Remedy Cape	armor	intrinsic item metadata	public
24255	Unyielding Girdle	armor	intrinsic item metadata	public
24256	Girdle of Ruination	armor	intrinsic item metadata	public
24257	Black Belt of Knowledge	armor	intrinsic item metadata	public
24258	Resolute Cape	armor	intrinsic item metadata	public
24259	Vengeance Wrap	armor	intrinsic item metadata	public
24260	Manaweave Cloak	armor	intrinsic item metadata	public
24261	Whitemend Pants	armor	intrinsic item metadata	public
24262	Spellstrike Pants	armor	intrinsic item metadata	public
24263	Battlecast Pants	armor	intrinsic item metadata	public
24264	Whitemend Hood	armor	intrinsic item metadata	public
24266	Spellstrike Hood	armor	intrinsic item metadata	public
24267	Battlecast Hood	armor	intrinsic item metadata	public
24268	Netherweave Net	tailoring	single crafted-product category	public
24269	Heavy Netherweave Net	tailoring	single crafted-product category	public
24270	Bag of Jewels	bags	intrinsic item metadata	public
24271	Spellcloth	cloth	intrinsic item metadata	public
24272	Shadowcloth	cloth	intrinsic item metadata	public
24273	Mystic Spellthread	enchanting	intrinsic item metadata	public
24274	Runic Spellthread	enchanting	intrinsic item metadata	public
24275	Silver Spellthread	enchanting	intrinsic item metadata	public
24276	Golden Spellthread	enchanting	intrinsic item metadata	public
24296	Pattern: Unyielding Bracers	tailoring	intrinsic item metadata	public
24297	Pattern: Bracers of Havok	tailoring	intrinsic item metadata	public
24298	Pattern: Blackstrike Bracers	tailoring	intrinsic item metadata	public
24299	Pattern: Cloak of the Black Void	tailoring	intrinsic item metadata	public
24300	Pattern: Cloak of Eternity	tailoring	intrinsic item metadata	public
24301	Pattern: White Remedy Cape	tailoring	intrinsic item metadata	public
24302	Pattern: Unyielding Girdle	tailoring	intrinsic item metadata	public
24303	Pattern: Girdle of Ruination	tailoring	intrinsic item metadata	public
24304	Pattern: Black Belt of Knowledge	tailoring	intrinsic item metadata	public
24305	Pattern: Resolute Cape	tailoring	intrinsic item metadata	public
24306	Pattern: Vengeance Wrap	tailoring	intrinsic item metadata	public
24307	Pattern: Manaweave Cloak	tailoring	intrinsic item metadata	public
24316	Pattern: Spellcloth	tailoring	intrinsic item metadata	public
24338	Hellfire Spineleaf	food	intrinsic item metadata	public
24476	Jaggal Clam	fish	specialized bag and profession data	public
24477	Jaggal Clam Meat	fish	intrinsic item metadata	public
24478	Jaggal Pearl	jewels	intrinsic item metadata	public
24479	Shadow Pearl	jewels	intrinsic item metadata	public
24507	Elemental Shard	elemental	curated player-facing category	public
24539	Marsh Lichen	food	intrinsic item metadata	public
25429	Grime-Encrusted Scale	fish	specialized bag and profession data	public
25430	Glimmering Scale	fish	specialized bag and profession data	public
25431	Ripped Fin	fish	specialized bag and profession data	public
25432	Pristine Fin	fish	specialized bag and profession data	public
25438	Malachite Pendant	armor	intrinsic item metadata	public
25439	Tigerseye Band	armor	intrinsic item metadata	public
25521	Greater Rune of Warding	blacksmithing	single crafted-product category	public
25649	Knothide Leather Scraps	leather	intrinsic item metadata	public
25650	Knothide Armor Kit	enchanting	intrinsic item metadata	public
25651	Vindicator's Armor Kit	enchanting	intrinsic item metadata	public
25652	Magister's Armor Kit	enchanting	intrinsic item metadata	public
25653	Riding Crop	trinkets	intrinsic item metadata	public
25654	Felscale Gloves	armor	intrinsic item metadata	public
25655	Felscale Boots	armor	intrinsic item metadata	public
25656	Felscale Pants	armor	intrinsic item metadata	public
25657	Felscale Breastplate	armor	intrinsic item metadata	public
25659	Scaled Draenic Boots	armor	intrinsic item metadata	public
25660	Scaled Draenic Vest	armor	intrinsic item metadata	public
25661	Scaled Draenic Gloves	armor	intrinsic item metadata	public
25662	Scaled Draenic Pants	armor	intrinsic item metadata	public
25668	Thick Draenic Boots	armor	intrinsic item metadata	public
25669	Thick Draenic Gloves	armor	intrinsic item metadata	public
25670	Thick Draenic Pants	armor	intrinsic item metadata	public
25671	Thick Draenic Vest	armor	intrinsic item metadata	public
25673	Wild Draenish Boots	armor	intrinsic item metadata	public
25674	Wild Draenish Gloves	armor	intrinsic item metadata	public
25675	Wild Draenish Leggings	armor	intrinsic item metadata	public
25676	Wild Draenish Vest	armor	intrinsic item metadata	public
25679	Comfortable Insoles	leatherworking	single crafted-product category	public
25680	Stylin' Purple Hat	armor	intrinsic item metadata	public
25681	Stylin' Adventure Hat	armor	intrinsic item metadata	public
25682	Stylin' Jungle Hat	armor	intrinsic item metadata	public
25683	Stylin' Crimson Hat	armor	intrinsic item metadata	public
25685	Fel Leather Gloves	armor	intrinsic item metadata	public
25686	Fel Leather Boots	armor	intrinsic item metadata	public
25687	Fel Leather Leggings	armor	intrinsic item metadata	public
25689	Heavy Clefthoof Vest	armor	intrinsic item metadata	public
25690	Heavy Clefthoof Leggings	armor	intrinsic item metadata	public
25691	Heavy Clefthoof Boots	armor	intrinsic item metadata	public
25692	Netherfury Leggings	armor	intrinsic item metadata	public
25693	Netherfury Boots	armor	intrinsic item metadata	public
25694	Netherfury Belt	armor	intrinsic item metadata	public
25695	Felstalker Belt	armor	intrinsic item metadata	public
25696	Felstalker Breastplate	armor	intrinsic item metadata	public
25697	Felstalker Bracers	armor	intrinsic item metadata	public
25699	Crystal Infused Leather	leather	intrinsic item metadata	public
25700	Fel Scales	leather	intrinsic item metadata	public
25707	Fel Hide	leather	intrinsic item metadata	public
25708	Thick Clefthoof Leather	leather	intrinsic item metadata	public
25720	Pattern: Heavy Knothide Leather	leatherworking	intrinsic item metadata	public
25725	Pattern: Riding Crop	leatherworking	intrinsic item metadata	public
25726	Pattern: Comfortable Insoles	leatherworking	intrinsic item metadata	public
25843	Fel Iron Rod	enchanting	intrinsic item metadata	public
25844	Adamantite Rod	enchanting	intrinsic item metadata	public
25845	Eternium Rod	enchanting	intrinsic item metadata	public
25867	Earthstorm Diamond	jewels	intrinsic item metadata	public
25868	Skyfire Diamond	jewels	intrinsic item metadata	public
25886	Purple Smoke Flare	engineering	specialized bag and profession data	public
25887	Schematic: Purple Smoke Flare	engineering	intrinsic item metadata	public
25890	Destructive Skyfire Diamond	jewels	intrinsic item metadata	public
25893	Mystical Skyfire Diamond	jewels	intrinsic item metadata	public
25894	Swift Skyfire Diamond	jewels	intrinsic item metadata	public
25895	Enigmatic Skyfire Diamond	jewels	intrinsic item metadata	public
25896	Powerful Earthstorm Diamond	jewels	intrinsic item metadata	public
25897	Bracing Earthstorm Diamond	jewels	intrinsic item metadata	public
25898	Tenacious Earthstorm Diamond	jewels	intrinsic item metadata	public
25899	Brutal Earthstorm Diamond	jewels	intrinsic item metadata	public
25901	Insightful Earthstorm Diamond	jewels	intrinsic item metadata	public
25905	Design: Tenacious Earthstorm Diamond	jewels	intrinsic item metadata	public
25906	Design: Brutal Earthstorm Diamond	jewels	intrinsic item metadata	public
25907	Design: Destructive Skyfire Diamond	jewels	intrinsic item metadata	public
25909	Design: Mystical Skyfire Diamond	jewels	intrinsic item metadata	public
27422	Barbed Gill Trout	fish	intrinsic item metadata	public
27425	Spotted Feltail	fish	intrinsic item metadata	public
27429	Zangarian Sporefish	fish	intrinsic item metadata	public
27435	Figluster's Mudfish	fish	intrinsic item metadata	public
27437	Icefin Bluefish	fish	intrinsic item metadata	public
27438	Golden Darter	fish	intrinsic item metadata	public
27439	Furious Crawdad	fish	intrinsic item metadata	public
27441	Felblood Snapper	fish	specialized bag and profession data	public
27442	Goldenscale Vendorfish	fish	specialized bag and profession data	public
27443	Steam Pump Debris	fish	specialized bag and profession data	public
27444	Foulfin	fish	intrinsic item metadata	public
27446	Mr. Pinchy's Gift	fish	specialized bag and profession data	public
27481	Heavy Supply Crate	fish	specialized bag and profession data	public
27498	Scroll of Agility V	inscription	specialized bag and profession data	public
27499	Scroll of Intellect V	inscription	specialized bag and profession data	public
27500	Scroll of Protection V	inscription	specialized bag and profession data	public
27501	Scroll of Spirit V	inscription	specialized bag and profession data	public
27502	Scroll of Stamina V	inscription	specialized bag and profession data	public
27503	Scroll of Strength V	inscription	single crafted-product category	public
27511	Inscribed Scrollcase	fish	specialized bag and profession data	public
27513	Curious Crate	fish	specialized bag and profession data	public
27515	Huge Spotted Feltail	fish	intrinsic item metadata	public
27516	Enormous Barbed Gill Trout	fish	intrinsic item metadata	public
27532	Master Fishing - The Art of Angling	fish	intrinsic item metadata	public
27635	Lynx Steak	food	intrinsic item metadata	public
27636	Bat Bites	food	intrinsic item metadata	public
27651	Buzzard Bites	food	intrinsic item metadata	public
27655	Ravager Dog	food	intrinsic item metadata	public
27657	Blackened Basilisk	food	intrinsic item metadata	public
27658	Roasted Clefthoof	food	intrinsic item metadata	public
27659	Warp Burger	food	intrinsic item metadata	public
27660	Talbuk Steak	food	intrinsic item metadata	public
27661	Blackened Trout	food	intrinsic item metadata	public
27662	Feltail Delight	food	intrinsic item metadata	public
27663	Blackened Sporefish	food	intrinsic item metadata	public
27664	Grilled Mudfish	food	intrinsic item metadata	public
27665	Poached Bluefish	food	intrinsic item metadata	public
27666	Golden Fish Sticks	food	intrinsic item metadata	public
27667	Spicy Crawdad	food	intrinsic item metadata	public
27668	Lynx Meat	fish	intrinsic item metadata	public
27669	Bat Flesh	fish	intrinsic item metadata	public
27671	Buzzard Meat	fish	intrinsic item metadata	public
27674	Ravager Flesh	fish	intrinsic item metadata	public
27677	Chunk o' Basilisk	fish	intrinsic item metadata	public
27678	Clefthoof Meat	fish	intrinsic item metadata	public
27681	Warped Flesh	fish	intrinsic item metadata	public
27682	Talbuk Venison	fish	intrinsic item metadata	public
27684	Recipe: Buzzard Bites	fish	intrinsic item metadata	public
27685	Recipe: Lynx Steak	fish	intrinsic item metadata	public
27686	Recipe: Roasted Moongraze Tenderloin	fish	intrinsic item metadata	public
27687	Recipe: Bat Bites	fish	intrinsic item metadata	public
27688	Recipe: Ravager Dog	fish	intrinsic item metadata	public
27690	Recipe: Blackened Basilisk	fish	intrinsic item metadata	public
27691	Recipe: Roasted Clefthoof	fish	intrinsic item metadata	public
27692	Recipe: Warp Burger	fish	intrinsic item metadata	public
27693	Recipe: Talbuk Steak	fish	intrinsic item metadata	public
27694	Recipe: Blackened Trout	fish	intrinsic item metadata	public
27695	Recipe: Feltail Delight	fish	intrinsic item metadata	public
27696	Recipe: Blackened Sporefish	fish	intrinsic item metadata	public
27697	Recipe: Grilled Mudfish	fish	intrinsic item metadata	public
27698	Recipe: Poached Bluefish	fish	intrinsic item metadata	public
27699	Recipe: Golden Fish Sticks	fish	intrinsic item metadata	public
27700	Recipe: Spicy Crawdad	fish	intrinsic item metadata	public
27736	Master Cookbook	fish	intrinsic item metadata	public
27774	zzOLDMighty Blood Garnet		obsolete client record	excluded
27811	zzOLDMighty Blood Garnet		obsolete client record	excluded
27854	Smoked Talbuk Venison	food	intrinsic item metadata	public
27855	Mag'har Grainbread	food	intrinsic item metadata	public
27856	Skethyl Berries	food	intrinsic item metadata	public
27857	Garadar Sharp	food	intrinsic item metadata	public
27858	Sunspring Carp	food	intrinsic item metadata	public
27859	Zangar Caps	food	intrinsic item metadata	public
27860	Purified Draenic Water	food	intrinsic item metadata	public
27863	Extended Cost Bryanite	jewels	intrinsic item metadata	public
27864	Extended Cost Copying Bryanite	jewels	intrinsic item metadata	public
28100	Volatile Healing Potion	alchemy	intrinsic item metadata	public
28101	Unstable Mana Potion	alchemy	intrinsic item metadata	public
28102	Onslaught Elixir	alchemy	intrinsic item metadata	public
28103	Adept's Elixir	alchemy	intrinsic item metadata	public
28104	Elixir of Mastery	alchemy	intrinsic item metadata	public
28117	zzOLDBold Ornate Ruby		obsolete client record	excluded
28118	Brilliant Ornate Ruby	jewels	intrinsic item metadata	public
28119	Smooth Ornate Dawnstone	jewels	intrinsic item metadata	public
28120	Smooth Ornate Dawnstone	jewels	intrinsic item metadata	public
28122	zzOLDEnscribed Ornate Topaz		obsolete client record	excluded
28123	Potent Ornate Topaz	jewels	intrinsic item metadata	public
28270	Formula: Enchant Chest - Major Resilience	enchanting	intrinsic item metadata	public
28279	Formula: Enchant Boots - Cat's Swiftness	enchanting	intrinsic item metadata	public
28280	Formula: Enchant Boots - Boar's Speed	enchanting	intrinsic item metadata	public
28282	Formula: Enchant Shield - Major Stamina	enchanting	intrinsic item metadata	public
28284	Don Carlos Tequila	food	intrinsic item metadata	public
28290	Smooth Golden Draenite	jewels	intrinsic item metadata	public
28291	Design: Smooth Golden Draenite	jewels	intrinsic item metadata	public
28362	Delicate Ornate Ruby	jewels	intrinsic item metadata	public
28363	Deadly Ornate Topaz	jewels	intrinsic item metadata	public
28388	TCHILTON TEST RUBY		internal test item	excluded
28389	TCHILTON TEST DAWNSTONE		internal test item	excluded
28399	Filtered Draenic Water	food	intrinsic item metadata	public
28420	Fel Weightstone	blacksmithing	single crafted-product category	public
28421	Adamantite Weightstone	blacksmithing	single crafted-product category	public
28458	Bold Tourmaline	jewels	intrinsic item metadata	public
28459	Delicate Tourmaline	jewels	intrinsic item metadata	public
28460	Brilliant Tourmaline	jewels	intrinsic item metadata	public
28461	Brilliant Tourmaline	jewels	intrinsic item metadata	public
28462	Delicate Tourmaline	jewels	intrinsic item metadata	public
28463	Solid Zircon	jewels	intrinsic item metadata	public
28464	Sparkling Zircon	jewels	intrinsic item metadata	public
28465	Sparkling Zircon	jewels	intrinsic item metadata	public
28466	Brilliant Tourmaline	jewels	intrinsic item metadata	public
28467	Smooth Amber	jewels	intrinsic item metadata	public
28468	Rigid Zircon	jewels	intrinsic item metadata	public
28469	Smooth Amber	jewels	intrinsic item metadata	public
28470	Subtle Amber	jewels	intrinsic item metadata	public
28486	Moser's Magnificent Muffin	food	intrinsic item metadata	public
28501	Ravager Egg Omelet	food	intrinsic item metadata	public
28595	Delicate Blood Garnet	jewels	intrinsic item metadata	public
28596	Design: Delicate Blood Garnet	jewels	intrinsic item metadata	public
29112	Cenarion Spirits	food	intrinsic item metadata	public
29120	Pattern: Truefaith Vestments	tailoring	intrinsic item metadata	public
29157	Golden Ring of Power	armor	intrinsic item metadata	public
29158	Truesilver Commander's Ring	armor	intrinsic item metadata	public
29159	Glowing Thorium Band	armor	intrinsic item metadata	public
29160	Emerald Lion Ring	armor	intrinsic item metadata	public
29292	Helboar Bacon	food	intrinsic item metadata	public
29293	Bonestripper Buzzard Hotwings	food	intrinsic item metadata	public
29393	Diamond Berries	food	intrinsic item metadata	public
29394	Lyribread	food	intrinsic item metadata	public
29395	Ethermead	food	intrinsic item metadata	public
29401	Sparkling Southshore Cider	food	intrinsic item metadata	public
29402	Jessen's Special Slop OLD	food	intrinsic item metadata	public
29412	Jessen's Special Slop	food	intrinsic item metadata	public
29448	Mag'har Mild Cheese	food	intrinsic item metadata	public
29449	Bladespire Bagel	food	intrinsic item metadata	public
29450	Telaari Grapes	food	intrinsic item metadata	public
29451	Clefthoof Ribs	food	intrinsic item metadata	public
29452	Zangar Trout	food	intrinsic item metadata	public
29453	Sporeggar Mushroom	food	intrinsic item metadata	public
29454	Silverwine	food	intrinsic item metadata	public
29489	Enchanted Felscale Leggings	armor	intrinsic item metadata	public
29490	Enchanted Felscale Gloves	armor	intrinsic item metadata	public
29491	Enchanted Felscale Boots	armor	intrinsic item metadata	public
29492	Flamescale Leggings	armor	intrinsic item metadata	public
29493	Flamescale Boots	armor	intrinsic item metadata	public
29494	Flamescale Belt	armor	intrinsic item metadata	public
29495	Enchanted Clefthoof Leggings	armor	intrinsic item metadata	public
29496	Enchanted Clefthoof Gloves	armor	intrinsic item metadata	public
29497	Enchanted Clefthoof Boots	armor	intrinsic item metadata	public
29498	Blastguard Pants	armor	intrinsic item metadata	public
29499	Blastguard Boots	armor	intrinsic item metadata	public
29500	Blastguard Belt	armor	intrinsic item metadata	public
29502	Cobrascale Hood	armor	intrinsic item metadata	public
29503	Cobrascale Gloves	armor	intrinsic item metadata	public
29504	Windscale Hood	armor	intrinsic item metadata	public
29505	Hood of Primal Life	armor	intrinsic item metadata	public
29506	Gloves of the Living Touch	armor	intrinsic item metadata	public
29507	Windslayer Wraps	armor	intrinsic item metadata	public
29508	Living Dragonscale Helm	armor	intrinsic item metadata	public
29509	Windstrike Gloves	armor	intrinsic item metadata	public
29510	Netherdrake Helm	armor	intrinsic item metadata	public
29511	Netherdrake Gloves	armor	intrinsic item metadata	public
29512	Earthen Netherscale Boots	armor	intrinsic item metadata	public
29514	Thick Netherscale Breastplate	armor	intrinsic item metadata	public
29528	Drums of War	leatherworking	specialized bag and profession data	public
29529	Drums of Battle	leatherworking	specialized bag and profession data	public
29530	Drums of Speed	leatherworking	specialized bag and profession data	public
29531	Drums of Restoration	leatherworking	specialized bag and profession data	public
29532	Drums of Panic	leatherworking	specialized bag and profession data	public
29533	Cobrahide Leg Armor	enchanting	intrinsic item metadata	public
29534	Clefthide Leg Armor	enchanting	intrinsic item metadata	public
29535	Nethercobra Leg Armor	enchanting	intrinsic item metadata	public
29536	Nethercleft Leg Armor	enchanting	intrinsic item metadata	public
29539	Cobra Scales	leather	intrinsic item metadata	public
29540	Reinforced Mining Bag	bags	intrinsic item metadata	public
29547	Wind Scales	leather	intrinsic item metadata	public
29548	Nether Dragonscales	leather	intrinsic item metadata	public
29714	Pattern: Drums of Restoration	leatherworking	intrinsic item metadata	public
29718	Pattern: Drums of Speed	leatherworking	intrinsic item metadata	public
29723	Pattern: Cobrascale Hood	leatherworking	intrinsic item metadata	public
29724	Pattern: Cobrascale Gloves	leatherworking	intrinsic item metadata	public
29725	Pattern: Windscale Hood	leatherworking	intrinsic item metadata	public
29726	Pattern: Hood of Primal Life	leatherworking	intrinsic item metadata	public
29727	Pattern: Gloves of the Living Touch	leatherworking	intrinsic item metadata	public
29728	Pattern: Windslayer Wraps	leatherworking	intrinsic item metadata	public
29729	Pattern: Living Dragonscale Helm	leatherworking	intrinsic item metadata	public
29730	Pattern: Earthen Netherscale Boots	leatherworking	intrinsic item metadata	public
29731	Pattern: Windstrike Gloves	leatherworking	intrinsic item metadata	public
29732	Pattern: Netherdrake Helm	leatherworking	intrinsic item metadata	public
29733	Pattern: Netherdrake Gloves	leatherworking	intrinsic item metadata	public
29734	Pattern: Thick Netherscale Breastplate	leatherworking	intrinsic item metadata	public
30032	Red Belt of Battle	armor	intrinsic item metadata	public
30034	Belt of the Guardian	armor	intrinsic item metadata	public
30036	Belt of the Long Road	armor	intrinsic item metadata	public
30038	Belt of Blasting	armor	intrinsic item metadata	public
30040	Belt of Deep Shadow	armor	intrinsic item metadata	public
30042	Belt of Natural Power	armor	intrinsic item metadata	public
30044	Monsoon Belt	armor	intrinsic item metadata	public
30046	Belt of the Black Eagle	armor	intrinsic item metadata	public
30155	Clam Bar	food	intrinsic item metadata	public
30156	Recipe: Clam Bar	fish	intrinsic item metadata	public
30183	Nether Vortex	profession_supplies	curated shared crafting reagent	public
30282	Pattern: Boots of Blasting	tailoring	intrinsic item metadata	public
30283	Pattern: Boots of the Long Road	tailoring	intrinsic item metadata	public
30305	Pattern: Boots of Natural Grace	leatherworking	intrinsic item metadata	public
30306	Pattern: Boots of Utter Darkness	leatherworking	intrinsic item metadata	public
30307	Pattern: Boots of the Crimson Hawk	leatherworking	intrinsic item metadata	public
30308	Pattern: Hurricane Boots	leatherworking	intrinsic item metadata	public
30323	Plans: Boots of the Protector	blacksmithing	intrinsic item metadata	public
30324	Plans: Red Havoc Boots	blacksmithing	intrinsic item metadata	public
30355	Grilled Shadowmoon Tuber	food	intrinsic item metadata	public
30419	Brilliant Necklace	armor	intrinsic item metadata	public
30420	Heavy Jade Ring	armor	intrinsic item metadata	public
30421	Red Ring of Destruction	armor	intrinsic item metadata	public
30422	Diamond Focus Ring	armor	intrinsic item metadata	public
30457	Gilneas Sparkling Water	food	intrinsic item metadata	public
30458	Stromgarde Muenster	food	intrinsic item metadata	public
30459	Netherflame Robe	armor	intrinsic item metadata	public
30460	Netherflame Belt	armor	intrinsic item metadata	public
30461	Netherflame Boots	armor	intrinsic item metadata	public
30463	Lifeblood Belt	armor	intrinsic item metadata	public
30464	Lifeblood Bracers	armor	intrinsic item metadata	public
30465	Lifeblood Leggings	armor	intrinsic item metadata	public
30483	Pattern: Shadowcloth	tailoring	intrinsic item metadata	public
30542	Dimensional Ripper - Area 52	engineering	specialized bag and profession data	public
30544	Ultrasafe Transporter: Toshley's Station	engineering	specialized bag and profession data	public
30610	Smoked Black Bear Meat	food	intrinsic item metadata	public
30793	Skettis See Invis Potion	alchemy	intrinsic item metadata	public
30804	Bronze Band of Force	armor	intrinsic item metadata	public
30816	Spice Bread	food	intrinsic item metadata	public
30817	Simple Flour	fish	single profession category	public
30825	Ring of Arcane Shielding	armor	intrinsic item metadata	public
30831	Cloak of Arcane Evasion	armor	intrinsic item metadata	public
30837	Flameheart Bracers	armor	intrinsic item metadata	public
30838	Flameheart Gloves	armor	intrinsic item metadata	public
30839	Flameheart Vest	armor	intrinsic item metadata	public
31079	Mercurial Adamantite	jewels	intrinsic item metadata	public
31080	Mercurial Stone	trinkets	intrinsic item metadata	public
31154	Bronze Torc	armor	intrinsic item metadata	public
31364	Wildguard Breastplate	armor	intrinsic item metadata	public
31367	Wildguard Leggings	armor	intrinsic item metadata	public
31368	Wildguard Helm	armor	intrinsic item metadata	public
31369	Iceguard Breastplate	armor	intrinsic item metadata	public
31370	Iceguard Leggings	armor	intrinsic item metadata	public
31371	Iceguard Helm	armor	intrinsic item metadata	public
31398	The Frozen Eye	armor	intrinsic item metadata	public
31399	The Natural Ward	armor	intrinsic item metadata	public
31670	Raptor Ribs	fish	intrinsic item metadata	public
31671	Serpent Flesh	fish	intrinsic item metadata	public
31672	Mok'Nathal Shortribs	food	intrinsic item metadata	public
31673	Crunchy Serpent	food	intrinsic item metadata	public
31676	Fel Regeneration Potion	alchemy	intrinsic item metadata	public
31677	Fel Mana Potion	alchemy	intrinsic item metadata	public
31679	Fel Strength Elixir	alchemy	intrinsic item metadata	public
31860	Rigid Azure Moonstone	jewels	intrinsic item metadata	public
31861	Rigid Star of Elune	jewels	intrinsic item metadata	public
31862	Shifting Shadow Draenite	jewels	intrinsic item metadata	public
31863	Shifting Nightseye	jewels	intrinsic item metadata	public
31864	Shifting Shadow Draenite	jewels	intrinsic item metadata	public
31865	Glinting Nightseye	jewels	intrinsic item metadata	public
31866	Veiled Shadow Draenite	jewels	intrinsic item metadata	public
31867	Veiled Nightseye	jewels	intrinsic item metadata	public
31868	Deadly Noble Topaz	jewels	intrinsic item metadata	public
31869	Deadly Flame Spessarite	jewels	intrinsic item metadata	public
31870	Design: Rigid Azure Moonstone	jewels	intrinsic item metadata	public
31871	Design: Shifting Shadow Draenite	jewels	intrinsic item metadata	public
31872	Design: Shifting Shadow Draenite	jewels	intrinsic item metadata	public
31873	Design: Veiled Shadow Draenite	jewels	intrinsic item metadata	public
31874	Design: Deadly Flame Spessarite	jewels	intrinsic item metadata	public
31875	Design: Rigid Star of Elune	jewels	intrinsic item metadata	public
31876	Design: Shifting Nightseye	jewels	intrinsic item metadata	public
31877	Design: Glinting Nightseye	jewels	intrinsic item metadata	public
31878	Design: Veiled Nightseye	jewels	intrinsic item metadata	public
31879	Design: Deadly Noble Topaz	jewels	intrinsic item metadata	public
32062	Elixir of Major Fortitude	alchemy	intrinsic item metadata	public
32063	Earthen Elixir	alchemy	intrinsic item metadata	public
32067	Elixir of Draenic Wisdom	alchemy	intrinsic item metadata	public
32068	Elixir of Ironskin	alchemy	intrinsic item metadata	public
32193	Bold Crimson Spinel	jewels	intrinsic item metadata	public
32194	Delicate Crimson Spinel	jewels	intrinsic item metadata	public
32195	Brilliant Crimson Spinel	jewels	intrinsic item metadata	public
32196	Brilliant Crimson Spinel	jewels	intrinsic item metadata	public
32197	Delicate Crimson Spinel	jewels	intrinsic item metadata	public
32198	Subtle Lionseye	jewels	intrinsic item metadata	public
32199	Flashing Crimson Spinel	jewels	intrinsic item metadata	public
32200	Solid Empyrean Sapphire	jewels	intrinsic item metadata	public
32201	Sparkling Empyrean Sapphire	jewels	intrinsic item metadata	public
32202	Sparkling Empyrean Sapphire	jewels	intrinsic item metadata	public
32203	Stormy Empyrean Sapphire	jewels	intrinsic item metadata	public
32204	Brilliant Crimson Spinel	jewels	intrinsic item metadata	public
32205	Smooth Lionseye	jewels	intrinsic item metadata	public
32206	Rigid Empyrean Sapphire	jewels	intrinsic item metadata	public
32207	Smooth Lionseye	jewels	intrinsic item metadata	public
32208	Subtle Lionseye	jewels	intrinsic item metadata	public
32209	Mystic Lionseye	jewels	intrinsic item metadata	public
32210	Rigid Empyrean Sapphire	jewels	intrinsic item metadata	public
32211	Sovereign Shadowsong Amethyst	jewels	intrinsic item metadata	public
32212	Shifting Shadowsong Amethyst	jewels	intrinsic item metadata	public
32213	Shifting Shadowsong Amethyst	jewels	intrinsic item metadata	public
32214	Glinting Shadowsong Amethyst	jewels	intrinsic item metadata	public
32215	Timeless Shadowsong Amethyst	jewels	intrinsic item metadata	public
32216	Purified Shadowsong Amethyst	jewels	intrinsic item metadata	public
32217	Inscribed Pyrestone	jewels	intrinsic item metadata	public
32218	Potent Pyrestone	jewels	intrinsic item metadata	public
32219	Reckless Pyrestone	jewels	intrinsic item metadata	public
32220	Glinting Shadowsong Amethyst	jewels	intrinsic item metadata	public
32221	Veiled Shadowsong Amethyst	jewels	intrinsic item metadata	public
32222	Deadly Pyrestone	jewels	intrinsic item metadata	public
32223	Regal Seaspray Emerald	jewels	intrinsic item metadata	public
32224	Radiant Seaspray Emerald	jewels	intrinsic item metadata	public
32225	Purified Shadowsong Amethyst	jewels	intrinsic item metadata	public
32226	Jagged Seaspray Emerald	jewels	intrinsic item metadata	public
32227	Crimson Spinel	jewels	intrinsic item metadata	public
32228	Empyrean Sapphire	jewels	intrinsic item metadata	public
32229	Lionseye	jewels	intrinsic item metadata	public
32230	Shadowsong Amethyst	jewels	intrinsic item metadata	public
32231	Pyrestone	jewels	intrinsic item metadata	public
32249	Seaspray Emerald	jewels	intrinsic item metadata	public
32381	Schematic: Fused Wiring	engineering	intrinsic item metadata	public
32389	Soulguard Leggings	armor	intrinsic item metadata	public
32390	Soulguard Girdle	armor	intrinsic item metadata	public
32391	Soulguard Slippers	armor	intrinsic item metadata	public
32392	Soulguard Bracers	armor	intrinsic item metadata	public
32393	Redeemed Soul Cinch	armor	intrinsic item metadata	public
32394	Redeemed Soul Moccasins	armor	intrinsic item metadata	public
32395	Redeemed Soul Wristguards	armor	intrinsic item metadata	public
32396	Redeemed Soul Legguards	armor	intrinsic item metadata	public
32397	Waistguard of Shackled Souls	armor	intrinsic item metadata	public
32398	Boots of Shackled Souls	armor	intrinsic item metadata	public
32399	Bracers of Shackled Souls	armor	intrinsic item metadata	public
32400	Greaves of Shackled Souls	armor	intrinsic item metadata	public
32401	Shadesteel Girdle	armor	intrinsic item metadata	public
32402	Shadesteel Sabots	armor	intrinsic item metadata	public
32403	Shadesteel Bracers	armor	intrinsic item metadata	public
32404	Shadesteel Greaves	armor	intrinsic item metadata	public
32409	Relentless Earthstorm Diamond	jewels	intrinsic item metadata	public
32410	Thundering Skyfire Diamond	jewels	intrinsic item metadata	public
32411	Design: Thundering Skyfire Diamond	jewels	intrinsic item metadata	public
32413	Frost Grenade	engineering	specialized bag and profession data	public
32420	Night's End	armor	intrinsic item metadata	public
32423	Icy Blasting Primers	engineering	specialized bag and profession data	public
32428	Heart of Darkness	profession_supplies	curated shared crafting reagent	public
32453	Star's Tears	food	intrinsic item metadata	public
32455	Star's Lament	food	intrinsic item metadata	public
32508	Necklace of the Deep	armor	intrinsic item metadata	public
32568	Swiftsteel Bracers	armor	intrinsic item metadata	public
32571	Dawnsteel Bracers	armor	intrinsic item metadata	public
32574	Bindings of Lightning Reflexes	armor	intrinsic item metadata	public
32577	Living Earth Bindings	armor	intrinsic item metadata	public
32580	Swiftstrike Bracers	armor	intrinsic item metadata	public
32582	Bracers of Renewed Life	armor	intrinsic item metadata	public
32584	Swiftheal Wraps	armor	intrinsic item metadata	public
32586	Bracers of Nimble Thought	armor	intrinsic item metadata	public
32596	Unstable Flask of the Elder	alchemy	intrinsic item metadata	public
32597	Unstable Flask of the Soldier	alchemy	intrinsic item metadata	public
32598	Unstable Flask of the Beast	alchemy	intrinsic item metadata	public
32599	Unstable Flask of the Bandit	alchemy	intrinsic item metadata	public
32600	Unstable Flask of the Physician	alchemy	intrinsic item metadata	public
32601	Unstable Flask of the Sorcerer	alchemy	intrinsic item metadata	public
32667	Bash Ale	food	intrinsic item metadata	public
32668	Dos Ogris	food	intrinsic item metadata	public
32685	Ogri'la Chicken Fingers	food	intrinsic item metadata	public
32686	Mingo's Fortune Giblets	food	intrinsic item metadata	public
32722	Enriched Terocone Juice	food	intrinsic item metadata	public
32737	Plans: Swiftsteel Shoulders	blacksmithing	intrinsic item metadata	public
32739	Plans: Dawnsteel Shoulders	blacksmithing	intrinsic item metadata	public
32745	Pattern: Shoulderpads of Renewed Life	leatherworking	intrinsic item metadata	public
32747	Pattern: Swiftstrike Shoulders	leatherworking	intrinsic item metadata	public
32749	Pattern: Shoulders of Lightning Reflexes	leatherworking	intrinsic item metadata	public
32751	Pattern: Living Earth Shoulders	leatherworking	intrinsic item metadata	public
32753	Pattern: Swiftheal Mantle	tailoring	intrinsic item metadata	public
32755	Pattern: Mantle of Nimble Thought	tailoring	intrinsic item metadata	public
32756	Gyro-Balanced Khorium Destroyer	weapons	intrinsic item metadata	public
32762	Rulkster's Brain Juice	alchemy	intrinsic item metadata	public
32763	Rulkster's Secret Sauce	alchemy	intrinsic item metadata	public
32764	Flaskataur's Celestial Brew	alchemy	intrinsic item metadata	public
32765	Flaskataur's Tears	alchemy	intrinsic item metadata	public
32766	Flaskataur's Flask of Flaskocity	alchemy	intrinsic item metadata	public
32767	Flaskataur's Flask of Pretty Good Power	alchemy	intrinsic item metadata	public
32772	Brilliant Pearl Band	armor	intrinsic item metadata	public
32774	The Black Pearl	armor	intrinsic item metadata	public
32775	Deepdiving Pearl	jewels	specialized bag and profession data	public
32776	Crown of the Sea Witch	armor	intrinsic item metadata	public
32833	Purified Jaggal Pearl	jewels	intrinsic item metadata	public
32836	Purified Shadow Pearl	jewels	intrinsic item metadata	public
32839	Cauldron of Major Arcane Protection	alchemy	single crafted-product category	public
32849	Cauldron of Major Fire Protection	alchemy	single crafted-product category	public
32850	Cauldron of Major Frost Protection	alchemy	single crafted-product category	public
32851	Cauldron of Major Nature Protection	alchemy	single crafted-product category	public
32852	Cauldron of Major Shadow Protection	alchemy	single crafted-product category	public
32854	Hammer of Righteous Might	weapons	intrinsic item metadata	public
32902	Bottled Nethergon Energy	alchemy	intrinsic item metadata	public
32905	Bottled Nethergon Vapor	alchemy	intrinsic item metadata	public
32947	Auchenai Healing Potion	alchemy	intrinsic item metadata	public
32948	Auchenai Mana Potion	alchemy	intrinsic item metadata	public
33042	Black Coffee	food	intrinsic item metadata	public
33048	Stewed Trout	food	intrinsic item metadata	public
33052	Fisherman's Feast	food	intrinsic item metadata	public
33053	Hot Buttered Trout	food	intrinsic item metadata	public
33092	Healing Potion Injector	alchemy	intrinsic item metadata	public
33093	Mana Potion Injector	alchemy	intrinsic item metadata	public
33122	Cloak of Darkness	armor	intrinsic item metadata	public
33173	Ragesteel Shoulders	armor	intrinsic item metadata	public
33185	Adamantite Weapon Chain	enchanting	intrinsic item metadata	public
33186	Plans: Adamantite Weapon Chain	blacksmithing	intrinsic item metadata	public
33204	Shadowprowler's Chestguard	armor	intrinsic item metadata	public
33443	Sour Goat Cheese	food	intrinsic item metadata	public
33444	Pungent Seal Whey	food	intrinsic item metadata	public
33445	Honeymint Tea	food	intrinsic item metadata	public
33447	Runic Healing Potion	alchemy	intrinsic item metadata	public
33448	Runic Mana Potion	alchemy	intrinsic item metadata	public
33449	Crusty Flatbread	food	intrinsic item metadata	public
33451	Fillet of Icefin	food	intrinsic item metadata	public
33452	Honey-Spiced Lichen	food	intrinsic item metadata	public
33454	Salted Venison	food	intrinsic item metadata	public
33457	Scroll of Agility VI	inscription	specialized bag and profession data	public
33458	Scroll of Intellect VI	inscription	specialized bag and profession data	public
33459	Scroll of Protection VI	inscription	specialized bag and profession data	public
33460	Scroll of Spirit VI	inscription	specialized bag and profession data	public
33461	Scroll of Stamina VI	inscription	specialized bag and profession data	public
33462	Scroll of Strength VI	inscription	specialized bag and profession data	public
33470	Frostweave Cloth	cloth	intrinsic item metadata	public
33567	Borean Leather Scraps	leather	intrinsic item metadata	public
33568	Borean Leather	leather	intrinsic item metadata	public
33633	Forceful Earthstorm Diamond	jewels	intrinsic item metadata	public
33782	Steady Talasite	jewels	intrinsic item metadata	public
33791	Heavy Copper Longsword	weapons	intrinsic item metadata	public
33792	Plans: Heavy Copper Longsword	blacksmithing	intrinsic item metadata	public
33804	Ruined Schematic	engineering	specialized bag and profession data	public
33823	Bloodfin Catfish	fish	intrinsic item metadata	public
33824	Crescent-Tail Skullfish	fish	intrinsic item metadata	public
33825	Skullfish Soup	food	intrinsic item metadata	public
33866	Stormchops	food	intrinsic item metadata	public
33867	Broiled Bloodfin	food	intrinsic item metadata	public
33872	Spicy Hot Talbuk	food	intrinsic item metadata	public
33874	Kibler's Bits	food	intrinsic item metadata	public
33924	Delicious Chocolate Cake	food	intrinsic item metadata	public
33954	Plans: Hammer of Righteous Might	blacksmithing	intrinsic item metadata	public
34052	Dream Shard	enchanting	intrinsic item metadata	public
34053	Small Dream Shard	enchanting	intrinsic item metadata	public
34054	Infinite Dust	enchanting	intrinsic item metadata	public
34055	Greater Cosmic Essence	enchanting	intrinsic item metadata	public
34056	Lesser Cosmic Essence	enchanting	intrinsic item metadata	public
34057	Abyss Crystal	enchanting	intrinsic item metadata	public
34060	Flying Machine	engineering	specialized bag and profession data	public
34061	Turbo-Charged Flying Machine	engineering	specialized bag and profession data	public
34085	Red Winter Clothes	armor	intrinsic item metadata	public
34086	Winter Boots	armor	intrinsic item metadata	public
34087	Green Winter Clothes	armor	intrinsic item metadata	public
34105	Quiver of a Thousand Feathers	bags	intrinsic item metadata	public
34113	Field Repair Bot 110G	engineering	specialized bag and profession data	public
34125	Shoveltusk Soup	food	intrinsic item metadata	public
34142	Infinite Sphere	jewels	intrinsic item metadata	public
34143	Chromatic Sphere	jewels	intrinsic item metadata	public
34200	Ruined Pattern	leatherworking	specialized bag and profession data	public
34207	Glove Reinforcements	enchanting	intrinsic item metadata	public
34220	Chaotic Skyfire Diamond	jewels	intrinsic item metadata	public
34221	Design: Chaotic Skyfire Diamond	jewels	intrinsic item metadata	public
34249	Hula Girl Doll	armor	intrinsic item metadata	public
34330	Heavy Knothide Armor Kit	enchanting	intrinsic item metadata	public
34361	Hard Khorium Band	armor	intrinsic item metadata	public
34362	Loop of Forged Power	armor	intrinsic item metadata	public
34363	Ring of Flowing Life	armor	intrinsic item metadata	public
34366	Sunfire Handwraps	armor	intrinsic item metadata	public
34367	Hands of Eternal Light	armor	intrinsic item metadata	public
34370	Gloves of Immortal Dusk	armor	intrinsic item metadata	public
34372	Leather Gauntlets of the Sun	armor	intrinsic item metadata	public
34374	Fletcher's Gloves of the Phoenix	armor	intrinsic item metadata	public
34376	Sun-Drenched Scale Gloves	armor	intrinsic item metadata	public
34378	Hard Khorium Battlefists	armor	intrinsic item metadata	public
34380	Sunblessed Gauntlets	armor	intrinsic item metadata	public
34411	Hot Apple Cider	food	intrinsic item metadata	public
34412	Sparkling Apple Cider	fish	single profession category	public
34440	Mad Alchemist's Potion	alchemy	intrinsic item metadata	public
34465	Test Firebloom		internal test item	excluded
34467	Test Handful of Fel Iron Bolts		internal test item	excluded
34476	Broken Engine Part		broken internal record	excluded
34482	Leatherworker's Satchel	bags	intrinsic item metadata	public
34490	Bag of Many Hides	bags	intrinsic item metadata	public
34503	Box of Adamantite Shells	engineering	specialized bag and profession data	public
34504	Adamantite Shell Machine	engineering	specialized bag and profession data	public
34537	Bloodberry Elixir	alchemy	intrinsic item metadata	public
34626	Prototype Tonk Controller	trinkets	intrinsic item metadata	public
34627	Heavy Tonk Armor	jewels	intrinsic item metadata	public
34645	Deprecated Earthen Ink		deprecated client record	excluded
34647	Scribe's Parchment	inscription	specialized bag and profession data	public
34660	Silver Writing Nib DEPRECATED		deprecated client record	excluded
34664	Sunmote	profession_supplies	curated shared crafting reagent	public
34721	Frostweave Bandage	first_aid	intrinsic item metadata	public
34722	Heavy Frostweave Bandage	first_aid	intrinsic item metadata	public
34735	Northrend Meat 01	fish	intrinsic item metadata	public
34736	Chunk o' Mammoth	fish	intrinsic item metadata	public
34737	Northrend Meat 03	fish	intrinsic item metadata	public
34738	Northrend Meat 04	fish	intrinsic item metadata	public
34739	Northrend Meat 05	fish	intrinsic item metadata	public
34740	Northrend Meat 06	fish	intrinsic item metadata	public
34741	Northrend Meat 07	fish	intrinsic item metadata	public
34742	Northrend Meat 08	fish	intrinsic item metadata	public
34743	Northrend Meat 09	fish	intrinsic item metadata	public
34744	Northrend Meat 10	fish	intrinsic item metadata	public
34745	Northrend Meat 11	fish	intrinsic item metadata	public
34746	Northrend Meat 12	fish	intrinsic item metadata	public
34747	Northern Stew	food	intrinsic item metadata	public
34748	Mammoth Meal	food	intrinsic item metadata	public
34749	Shoveltusk Steak	food	intrinsic item metadata	public
34750	Worm Delight	food	intrinsic item metadata	public
34751	Roasted Worg	food	intrinsic item metadata	public
34752	Rhino Dogs	food	intrinsic item metadata	public
34753	Great Feast	food	intrinsic item metadata	public
34754	Mega Mammoth Meal	food	intrinsic item metadata	public
34755	Tender Shoveltusk Steak	food	intrinsic item metadata	public
34756	Spiced Worm Burger	food	intrinsic item metadata	public
34757	Very Burnt Worg	food	intrinsic item metadata	public
34758	Mighty Rhino Dogs	food	intrinsic item metadata	public
34759	Smoked Rockfin	food	intrinsic item metadata	public
34760	Grilled Bonescale	food	intrinsic item metadata	public
34761	Sauteed Goby	food	intrinsic item metadata	public
34762	Grilled Sculpin	food	intrinsic item metadata	public
34763	Smoked Salmon	food	intrinsic item metadata	public
34764	Poached Nettlefish	food	intrinsic item metadata	public
34765	Pickled Fangtooth	food	intrinsic item metadata	public
34766	Poached Northern Sculpin	food	intrinsic item metadata	public
34767	Firecracker Salmon	food	intrinsic item metadata	public
34768	Spicy Blue Nettlefish	food	intrinsic item metadata	public
34769	Imperial Manta Steak	food	intrinsic item metadata	public
34822	Ancient Coin	fish	specialized bag and profession data	public
34823	Beautiful Glass Eye	fish	specialized bag and profession data	public
34824	Silver Statuette	fish	specialized bag and profession data	public
34825	Mithril Shaving Razor	fish	specialized bag and profession data	public
34826	Gold Wedding Band	armor	intrinsic item metadata	public
34827	Noble's Monocle	armor	intrinsic item metadata	public
34828	Antique Silver Cufflinks	armor	intrinsic item metadata	public
34829	Ornate Drinking Stein	armor	intrinsic item metadata	public
34831	Eye of the Sea	jewels	intrinsic item metadata	public
34832	Captain Rumsey's Lager	food	intrinsic item metadata	public
34837	The 2 Ring	armor	intrinsic item metadata	public
34838	Mariner's Log	fish	specialized bag and profession data	public
34839	Piece of Polished Driftwood	fish	specialized bag and profession data	public
34840	Broken Spyglass		broken internal record	excluded
34841	Salvaged Scrap Metal	fish	specialized bag and profession data	public
34843	Giant Shark Tooth	fish	specialized bag and profession data	public
34859	Razor Sharp Fillet Knife	weapons	intrinsic item metadata	public
34860	Rusted Lock	fish	specialized bag and profession data	public
34861	Sharpened Fish Hook	fish	specialized bag and profession data	public
35128	Hardened Khorium	ore	intrinsic item metadata	public
35186	Schematic: Annihilator Holo-Gogs	engineering	intrinsic item metadata	public
35187	Schematic: Justicebringer 3000 Specs	engineering	intrinsic item metadata	public
35189	Schematic: Powerheal 9000 Lens	engineering	intrinsic item metadata	public
35190	Schematic: Hyper-Magnified Moon Specs	engineering	intrinsic item metadata	public
35191	Schematic: Wonderheal XT68 Shades	engineering	intrinsic item metadata	public
35192	Schematic: Primal-Attuned Goggles	engineering	intrinsic item metadata	public
35193	Schematic: Lightning Etched Specs	engineering	intrinsic item metadata	public
35194	Schematic: Surestrike Goggles v3.0	engineering	intrinsic item metadata	public
35195	Schematic: Mayhem Projection Goggles	engineering	intrinsic item metadata	public
35196	Schematic: Hard Khorium Goggles	engineering	intrinsic item metadata	public
35197	Schematic: Quad Deathblow X44 Goggles	engineering	intrinsic item metadata	public
35201	Design: Pendant of Sunfire	jewels	intrinsic item metadata	public
35202	Design: Amulet of Flowing Life	jewels	intrinsic item metadata	public
35203	Design: Hard Khorium Choker	jewels	intrinsic item metadata	public
35206	Pattern: Sunfire Robe	tailoring	intrinsic item metadata	public
35207	Pattern: Robe of Eternal Light	tailoring	intrinsic item metadata	public
35210	Plans: Sunblessed Breastplate	blacksmithing	intrinsic item metadata	public
35211	Plans: Hard Khorium Battleplate	blacksmithing	intrinsic item metadata	public
35216	Pattern: Leather Chestguard of the Sun	leatherworking	intrinsic item metadata	public
35217	Pattern: Embrace of the Phoenix	leatherworking	intrinsic item metadata	public
35218	Pattern: Carapace of Sun and Shadow	leatherworking	intrinsic item metadata	public
35219	Pattern: Sun-Drenched Scale Chestguard	leatherworking	intrinsic item metadata	public
35285	Giant Sunfish	fish	intrinsic item metadata	public
35286	Bloated Giant Sunfish	fish	specialized bag and profession data	public
35287	Luminous Bluetail	alchemy	intrinsic item metadata	public
35315	Quick Dawnstone	jewels	intrinsic item metadata	public
35316	Reckless Noble Topaz	jewels	intrinsic item metadata	public
35318	Forceful Talasite	jewels	intrinsic item metadata	public
35485	Goblin Rocket Launcher [PH]		placeholder item	excluded
35499	Ninja Grenade [PH]		placeholder item	excluded
35501	Eternal Earthstorm Diamond	jewels	intrinsic item metadata	public
35503	Ember Skyfire Diamond	jewels	intrinsic item metadata	public
35517	Pattern: Bindings of Lightning Reflexes	leatherworking	intrinsic item metadata	public
35518	Pattern: Bracers of Nimble Thought	tailoring	intrinsic item metadata	public
35519	Pattern: Bracers of Renewed Life	leatherworking	intrinsic item metadata	public
35520	Pattern: Living Earth Bindings	leatherworking	intrinsic item metadata	public
35521	Pattern: Living Earth Shoulders	leatherworking	intrinsic item metadata	public
35522	Pattern: Mantle of Nimble Thought	tailoring	intrinsic item metadata	public
35523	Pattern: Shoulderpads of Renewed Life	leatherworking	intrinsic item metadata	public
35524	Pattern: Shoulders of Lightning Reflexes	leatherworking	intrinsic item metadata	public
35525	Pattern: Swiftheal Mantle	tailoring	intrinsic item metadata	public
35526	Pattern: Swiftheal Wraps	tailoring	intrinsic item metadata	public
35527	Pattern: Swiftstrike Bracers	leatherworking	intrinsic item metadata	public
35528	Pattern: Swiftstrike Shoulders	leatherworking	intrinsic item metadata	public
35529	Plans: Dawnsteel Bracers	blacksmithing	intrinsic item metadata	public
35530	Plans: Dawnsteel Shoulders	blacksmithing	intrinsic item metadata	public
35531	Plans: Swiftsteel Bracers	blacksmithing	intrinsic item metadata	public
35532	Plans: Swiftsteel Shoulders	blacksmithing	intrinsic item metadata	public
35533	Design: Amulet of Flowing Life	jewels	intrinsic item metadata	public
35534	Design: Hard Khorium Band	jewels	intrinsic item metadata	public
35535	Design: Hard Khorium Choker	jewels	intrinsic item metadata	public
35536	Design: Loop of Forged Power	jewels	intrinsic item metadata	public
35537	Design: Pendant of Sunfire	jewels	intrinsic item metadata	public
35538	Design: Ring of Flowing Life	jewels	intrinsic item metadata	public
35539	Pattern: Carapace of Sun and Shadow	leatherworking	intrinsic item metadata	public
35540	Pattern: Embrace of the Phoenix	leatherworking	intrinsic item metadata	public
35541	Pattern: Fletcher's Gloves of the Phoenix	leatherworking	intrinsic item metadata	public
35542	Pattern: Gloves of Immortal Dusk	leatherworking	intrinsic item metadata	public
35544	Pattern: Hands of Eternal Light	tailoring	intrinsic item metadata	public
35545	Pattern: Leather Chestguard of the Sun	leatherworking	intrinsic item metadata	public
35546	Pattern: Leather Gauntlets of the Sun	leatherworking	intrinsic item metadata	public
35548	Pattern: Robe of Eternal Light	tailoring	intrinsic item metadata	public
35549	Pattern: Sun-Drenched Scale Chestguard	leatherworking	intrinsic item metadata	public
35550	Pattern: Sun-Drenched Scale Gloves	leatherworking	intrinsic item metadata	public
35551	Pattern: Sunfire Handwraps	tailoring	intrinsic item metadata	public
35552	Pattern: Sunfire Robe	tailoring	intrinsic item metadata	public
35553	Plans: Hard Khorium Battlefists	blacksmithing	intrinsic item metadata	public
35554	Plans: Hard Khorium Battleplate	blacksmithing	intrinsic item metadata	public
35555	Plans: Sunblessed Breastplate	blacksmithing	intrinsic item metadata	public
35556	Plans: Sunblessed Gauntlets	blacksmithing	intrinsic item metadata	public
35562	Bear Flank	fish	intrinsic item metadata	public
35563	Charred Bear Kabobs	food	intrinsic item metadata	public
35564	Recipe: Charred Bear Kabobs	fish	intrinsic item metadata	public
35565	Juicy Bear Burger	food	intrinsic item metadata	public
35566	Recipe: Juicy Bear Burger	fish	intrinsic item metadata	public
35581	Rocket Boots Xtreme Lite	armor	intrinsic item metadata	public
35621	Eternal Power	elemental	intrinsic item metadata	public
35622	Eternal Water	elemental	intrinsic item metadata	public
35623	Eternal Air	elemental	intrinsic item metadata	public
35624	Eternal Earth	elemental	intrinsic item metadata	public
35625	Eternal Life	elemental	intrinsic item metadata	public
35626	Eternal Mana [PH]		placeholder item	excluded
35627	Eternal Shadow	elemental	intrinsic item metadata	public
35691	Ruined Metal Parts	engineering	single crafted-product category	public
35707	Regal Talasite	jewels	intrinsic item metadata	public
35710	Delicious Baked Ham	food	intrinsic item metadata	public
35715	Deprecated Glyph of Venomous Mana [PH]		placeholder item	excluded
35720	Lord of Frost's Private Label	food	intrinsic item metadata	public
35758	Steady Seaspray Emerald	jewels	intrinsic item metadata	public
35759	Forceful Seaspray Emerald	jewels	intrinsic item metadata	public
35760	Reckless Pyrestone	jewels	intrinsic item metadata	public
35761	Quick Lionseye	jewels	intrinsic item metadata	public
35794	Silvercoat Stag Meat	fish	intrinsic item metadata	public
35947	Sparkling Frostcap	food	intrinsic item metadata	public
35948	Savory Snowplum	food	intrinsic item metadata	public
35949	Tundra Berries	food	intrinsic item metadata	public
35950	Sweet Potato Bread	food	intrinsic item metadata	public
35951	Poached Emperor Salmon	food	intrinsic item metadata	public
35952	Briny Hardcheese	food	intrinsic item metadata	public
35953	Mead Basted Caribou	food	intrinsic item metadata	public
35954	Sweetened Goat's Milk	food	intrinsic item metadata	public
36781	Darkwater Clam	fish	specialized bag and profession data	public
36782	Succulent Clam Meat	fish	intrinsic item metadata	public
36783	Northsea Pearl	jewels	intrinsic item metadata	public
36784	Siren's Tear	jewels	intrinsic item metadata	public
36794	Scoured Fishbones	fish	specialized bag and profession data	public
36831	Stolen Ribs	food	intrinsic item metadata	public
36837	Formula: 02 Enchanting Recipe Template (Good)	enchanting	intrinsic item metadata	public
36838	Formula: 03 Enchanting Recipe Template (Superior)	enchanting	intrinsic item metadata	public
36839	Formula: 04 Enchanting Recipe Template (Epic)	enchanting	intrinsic item metadata	public
36840	Formula: 01 Enchanting Recipe Template (Standard)	enchanting	intrinsic item metadata	public
36841	Recipe: Alchemy Recipe Template 01 (Standard)	alchemy	intrinsic item metadata	public
36842	Recipe: Alchemy Recipe Template 02 (Good)	alchemy	intrinsic item metadata	public
36843	Recipe: Alchemy Recipe Template 03 (Superior)	alchemy	intrinsic item metadata	public
36844	Recipe: Alchemy Recipe Template 04 (Epic)	alchemy	intrinsic item metadata	public
36845	Deprecated Alchemy Elixir Template		deprecated client record	excluded
36860	Eternal Fire	elemental	intrinsic item metadata	public
36901	Goldclover	herbs	intrinsic item metadata	public
36902	Constrictor Grass	herbs	intrinsic item metadata	public
36903	Adder's Tongue	herbs	intrinsic item metadata	public
36904	Tiger Lily	herbs	intrinsic item metadata	public
36905	Lichbloom	herbs	intrinsic item metadata	public
36906	Icethorn	herbs	intrinsic item metadata	public
36907	Talandra's Rose	herbs	intrinsic item metadata	public
36908	Frost Lotus	herbs	intrinsic item metadata	public
36909	Cobalt Ore	ore	intrinsic item metadata	public
36910	Titanium Ore	ore	intrinsic item metadata	public
36911	Azurite Ore	ore	intrinsic item metadata	public
36912	Saronite Ore	ore	intrinsic item metadata	public
36913	Saronite Bar	ore	intrinsic item metadata	public
36914	Azurite Bar	ore	intrinsic item metadata	public
36915	Froststeel Bar	ore	intrinsic item metadata	public
36916	Cobalt Bar	ore	intrinsic item metadata	public
36917	Bloodstone	jewels	intrinsic item metadata	public
36918	Scarlet Ruby	jewels	intrinsic item metadata	public
36919	Cardinal Ruby	jewels	intrinsic item metadata	public
36920	Sun Crystal	jewels	intrinsic item metadata	public
36921	Autumn's Glow	jewels	intrinsic item metadata	public
36922	King's Amber	jewels	intrinsic item metadata	public
36923	Chalcedony	jewels	intrinsic item metadata	public
36924	Sky Sapphire	jewels	intrinsic item metadata	public
36925	Majestic Zircon	jewels	intrinsic item metadata	public
36926	Shadow Crystal	jewels	intrinsic item metadata	public
36927	Twilight Opal	jewels	intrinsic item metadata	public
36928	Dreadstone	jewels	intrinsic item metadata	public
36929	Huge Citrine	jewels	intrinsic item metadata	public
36930	Monarch Topaz	jewels	intrinsic item metadata	public
36931	Ametrine	jewels	intrinsic item metadata	public
36932	Dark Jade	jewels	intrinsic item metadata	public
36933	Forest Emerald	jewels	intrinsic item metadata	public
36934	Eye of Zul	jewels	intrinsic item metadata	public
36987	Hardened Bone Fragments	leather	intrinsic item metadata	public
37091	Scroll of Intellect VII	inscription	specialized bag and profession data	public
37092	Scroll of Intellect VIII	inscription	specialized bag and profession data	public
37093	Scroll of Stamina VII	inscription	specialized bag and profession data	public
37094	Scroll of Stamina VIII	inscription	specialized bag and profession data	public
37097	Scroll of Spirit VII	inscription	specialized bag and profession data	public
37098	Scroll of Spirit VIII	inscription	specialized bag and profession data	public
37100	Silver Ink	inscription	specialized bag and profession data	public
37101	Ivory Ink	inscription	specialized bag and profession data	public
37102	Deprecated Emerald Ink		deprecated client record	excluded
37118	Scroll of Recall	inscription	specialized bag and profession data	public
37168	Mysterious Tarot	inscription	single crafted-product category	public
37252	Frostberries	food	intrinsic item metadata	public
37253	Frostberry Juice	food	intrinsic item metadata	public
37301	Deprecated Test Glyph		internal test item	excluded
37326	Formula: Enchant Bracer - Major Spirit	enchanting	intrinsic item metadata	public
37327	DEPRECATED Formula: Enchant Weapon - Scourgebane		deprecated client record	excluded
37328	Formula: Enchant Weapon - Exceptional Intellect	enchanting	intrinsic item metadata	public
37329	Formula: Enchant Weapon - Exceptional Spirit	enchanting	intrinsic item metadata	public
37335	Formula: Enchant Cloak - Superior Agility	enchanting	intrinsic item metadata	public
37336	Formula: Enchant Chest - Greater Dodge	enchanting	intrinsic item metadata	public
37337	Formula: Enchant Bracer - Greater Stats	enchanting	intrinsic item metadata	public
37338	Formula: Enchant Weapon - Greater Savagery	enchanting	intrinsic item metadata	public
37341	Formula: Enchant Boots - Superior Agility	enchanting	intrinsic item metadata	public
37342	Formula: Enchant Gloves - Greater Blasting	enchanting	intrinsic item metadata	public
37343	Formula: Enchant Weapon - Exceptional Agility	enchanting	intrinsic item metadata	public
37345	Formula: Enchant Gloves - Greater Assault	enchanting	intrinsic item metadata	public
37346	Formula: Enchant Bracer - Expertise	enchanting	intrinsic item metadata	public
37348	Formula: Enchant Cloak - Haste	enchanting	intrinsic item metadata	public
37430	Solid Sky Sapphire	jewels	intrinsic item metadata	public
37452	Fatty Bluefin	food	intrinsic item metadata	public
37503	Purified Shadowsong Amethyst	jewels	intrinsic item metadata	public
37550	DEPRECATED Test Glyph 2		internal test item	excluded
37551	DEPRECATED Test Glyph 3 [PH]		placeholder item	excluded
37567	Healing Injector Kit	engineering	specialized bag and profession data	public
37588	Mostly Digested Fish	fish	intrinsic item metadata	public
37589	Hyper-Powered Mote Extractor	engineering	specialized bag and profession data	public
37602	Ruined Vellum	enchanting	curated player-facing category	public
37603	Enchant Boots - Dexterity	enchanting	intrinsic item metadata	public
37663	Titansteel Bar	ore	intrinsic item metadata	public
37700	Crystallized Air	elemental	intrinsic item metadata	public
37701	Crystallized Earth	elemental	intrinsic item metadata	public
37702	Crystallized Fire	elemental	intrinsic item metadata	public
37703	Crystallized Shadow	elemental	intrinsic item metadata	public
37704	Crystallized Life	elemental	intrinsic item metadata	public
37705	Crystallized Water	elemental	intrinsic item metadata	public
37706	Reforged Saronite	ore	intrinsic item metadata	public
37915	Pattern: Dress Shoes	tailoring	intrinsic item metadata	public
37921	Deadnettle	herbs	intrinsic item metadata	public
37926	DEPCREATED Epic Mana Potion	alchemy	intrinsic item metadata	public
38225	Mycah's Botanical Bag	bags	intrinsic item metadata	public
38270	Slab of Blubber	fish	intrinsic item metadata	public
38271	Lean Flank	fish	intrinsic item metadata	public
38272	Bloody Giblets	fish	intrinsic item metadata	public
38277	Haliscan Jacket	armor	intrinsic item metadata	public
38278	Haliscan Pantaloons	armor	intrinsic item metadata	public
38292	Test Living Ruby		internal test item	excluded
38322	Iron-Bound Tome	armor	intrinsic item metadata	public
38327	Pattern: Haliscan Jacket	tailoring	intrinsic item metadata	public
38328	Pattern: Haliscan Pantaloons	tailoring	intrinsic item metadata	public
38347	Mammoth Mining Bag	bags	intrinsic item metadata	public
38350	Winterfin "Depth Charge"	food	intrinsic item metadata	public
38371	Jormungar Leg Armor	enchanting	intrinsic item metadata	public
38372	Nerubian Leg Armor	enchanting	intrinsic item metadata	public
38373	Frosthide Leg Armor	enchanting	intrinsic item metadata	public
38374	Icescale Leg Armor	enchanting	intrinsic item metadata	public
38375	Borean Armor Kit	enchanting	intrinsic item metadata	public
38376	Heavy Borean Armor Kit	enchanting	intrinsic item metadata	public
38399	Trapper's Traveling Pack	bags	intrinsic item metadata	public
38400	Arctic Chestpiece	armor	intrinsic item metadata	public
38401	Arctic Leggings	armor	intrinsic item metadata	public
38402	Arctic Shoulderpads	armor	intrinsic item metadata	public
38403	Arctic Gloves	armor	intrinsic item metadata	public
38404	Arctic Boots	armor	intrinsic item metadata	public
38405	Arctic Belt	armor	intrinsic item metadata	public
38406	Iceborne Belt	armor	intrinsic item metadata	public
38407	Iceborne Boots	armor	intrinsic item metadata	public
38408	Iceborne Chestguard	armor	intrinsic item metadata	public
38409	Iceborne Gloves	armor	intrinsic item metadata	public
38410	Iceborne Leggings	armor	intrinsic item metadata	public
38411	Iceborne Shoulderpads	armor	intrinsic item metadata	public
38412	Frostscale Belt	armor	intrinsic item metadata	public
38413	Frostscale Boots	armor	intrinsic item metadata	public
38414	Frostscale Chestguard	armor	intrinsic item metadata	public
38415	Frostscale Gloves	armor	intrinsic item metadata	public
38416	Frostscale Leggings	armor	intrinsic item metadata	public
38417	Nerubian Shoulders	armor	intrinsic item metadata	public
38418	Nerubian Belt	armor	intrinsic item metadata	public
38419	Nerubian Boots	armor	intrinsic item metadata	public
38420	Nerubian Chestguard	armor	intrinsic item metadata	public
38421	Nerubian Gloves	armor	intrinsic item metadata	public
38422	Nerubian Legguards	armor	intrinsic item metadata	public
38424	Frostscale Shoulders	armor	intrinsic item metadata	public
38425	Heavy Borean Leather	leather	intrinsic item metadata	public
38426	Eternium Thread	cloth	intrinsic item metadata	public
38427	Pickled Egg	food	intrinsic item metadata	public
38428	Rock-Salted Pretzel	food	intrinsic item metadata	public
38429	Blackrock Spring Water	food	intrinsic item metadata	public
38430	Blackrock Mineral Water	food	intrinsic item metadata	public
38431	Blackrock Fortified Water	food	intrinsic item metadata	public
38432	Plugger's Blackrock Ale	food	intrinsic item metadata	public
38433	Arctic Wristguards	armor	intrinsic item metadata	public
38434	Iceborne Wristguards	armor	intrinsic item metadata	public
38435	Nerubian Bracers	armor	intrinsic item metadata	public
38436	Frostscale Bracers	armor	intrinsic item metadata	public
38437	Arctic Helm	armor	intrinsic item metadata	public
38438	Iceborne Helm	armor	intrinsic item metadata	public
38439	Nerubian Helm	armor	intrinsic item metadata	public
38440	Frostscale Helm	armor	intrinsic item metadata	public
38441	Cloak of Harsh Winds	armor	intrinsic item metadata	public
38466	Sulfuron Slammer	food	intrinsic item metadata	public
38474	Drums of Great Battle	leatherworking	specialized bag and profession data	public
38475	Drums of Major Restoration	leatherworking	specialized bag and profession data	public
38476	Drums of Dark War	leatherworking	specialized bag and profession data	public
38478	Drums of Precision	leatherworking	specialized bag and profession data	public
38498	QA Test Blank Purple Gem		internal test item	excluded
38499	QA Test Blank Blue Gem		internal test item	excluded
38500	QA Test Blank Red Gem		internal test item	excluded
38501	QA Test Blank Yellow Gem		internal test item	excluded
38502	QA Test Blank Orange Gem		internal test item	excluded
38503	QA Test Blank Green Gem		internal test item	excluded
38538	Riding Crop	jewels	intrinsic item metadata	public
38557	Icy Dragonscale	leather	intrinsic item metadata	public
38558	Nerubian Chitin	leather	intrinsic item metadata	public
38561	Jormungar Scale	leather	intrinsic item metadata	public
38590	Black Chitinguard Boots	armor	intrinsic item metadata	public
38591	Dark Arctic Leggings	armor	intrinsic item metadata	public
38592	Dark Arctic Chestpiece	armor	intrinsic item metadata	public
38593	Pattern: Leatherworking Template 01 (Standard)	leatherworking	intrinsic item metadata	public
38594	Pattern: Leatherworking Template 02 (Uncommon)	leatherworking	intrinsic item metadata	public
38595	Pattern: Leatherworking Template 03 (Superior)	leatherworking	intrinsic item metadata	public
38596	Pattern: Leatherworking Template 04 (Epic)	leatherworking	intrinsic item metadata	public
38597	Pattern: Dark Arctic Boots	leatherworking	intrinsic item metadata	public
38598	Pattern: Dark Arctic Leggings	leatherworking	intrinsic item metadata	public
38599	Pattern: Dark Arctic Chestpiece	leatherworking	intrinsic item metadata	public
38625	Northern Icelip	fish	intrinsic item metadata	public
38640	Dense Frostweave Bandage	first_aid	intrinsic item metadata	public
38641	Deprecated Frostweave Bandage [PH]		placeholder item	excluded
38643	Thick Frostweave Bandage	first_aid	intrinsic item metadata	public
38679	Enchant Bracer - Minor Health	enchanting	intrinsic item metadata	public
38682	Enchanting Vellum	enchanting	intrinsic item metadata	public
38685	Teleport Scroll: Zul'Farrak	inscription	specialized bag and profession data	public
38698	Bitter Plasma	food	intrinsic item metadata	public
38706	Bowels 'n' Brains	food	intrinsic item metadata	public
38724	Deprecated Glyph of Natural Force		deprecated client record	excluded
38766	Enchant Chest - Minor Health	enchanting	intrinsic item metadata	public
38767	Enchant Chest - Minor Absorption	enchanting	intrinsic item metadata	public
38768	Enchant Bracer - Minor Dodge	enchanting	intrinsic item metadata	public
38769	Enchant Chest - Minor Mana	enchanting	intrinsic item metadata	public
38771	Enchant Bracer - Minor Stamina	enchanting	intrinsic item metadata	public
38772	Enchant 2H Weapon - Minor Impact	enchanting	intrinsic item metadata	public
38773	Enchant Chest - Lesser Health	enchanting	intrinsic item metadata	public
38774	Enchant Bracer - Minor Spirit	enchanting	intrinsic item metadata	public
38775	Enchant Cloak - Minor Protection	enchanting	intrinsic item metadata	public
38776	Enchant Chest - Lesser Mana	enchanting	intrinsic item metadata	public
38777	Enchant Bracer - Minor Agility	enchanting	intrinsic item metadata	public
38778	Enchant Bracer - Minor Strength	enchanting	intrinsic item metadata	public
38779	Enchant Weapon - Minor Beastslayer	enchanting	intrinsic item metadata	public
38780	Enchant Weapon - Minor Striking	enchanting	intrinsic item metadata	public
38781	Enchant 2H Weapon - Lesser Intellect	enchanting	intrinsic item metadata	public
38782	Enchant Chest - Health	enchanting	intrinsic item metadata	public
38783	Enchant Bracer - Lesser Spirit	enchanting	intrinsic item metadata	public
38785	Enchant Boots - Minor Stamina	enchanting	intrinsic item metadata	public
38786	Enchant Boots - Minor Agility	enchanting	intrinsic item metadata	public
38787	Enchant Shield - Minor Stamina	enchanting	intrinsic item metadata	public
38788	Enchant 2H Weapon - Lesser Spirit	enchanting	intrinsic item metadata	public
38789	Enchant Cloak - Minor Agility	enchanting	intrinsic item metadata	public
38790	Enchant Cloak - Lesser Protection	enchanting	intrinsic item metadata	public
38791	Enchant Shield - Lesser Protection	enchanting	intrinsic item metadata	public
38792	Enchant Shield - Lesser Spirit	enchanting	intrinsic item metadata	public
38793	Enchant Bracer - Lesser Stamina	enchanting	intrinsic item metadata	public
38794	Enchant Weapon - Lesser Striking	enchanting	intrinsic item metadata	public
38796	Enchant 2H Weapon - Lesser Impact	enchanting	intrinsic item metadata	public
38797	Enchant Bracer - Lesser Strength	enchanting	intrinsic item metadata	public
38798	Enchant Chest - Lesser Absorption	enchanting	intrinsic item metadata	public
38799	Enchant Chest - Mana	enchanting	intrinsic item metadata	public
38800	Enchant Gloves - Mining	enchanting	intrinsic item metadata	public
38801	Enchant Gloves - Herbalism	enchanting	intrinsic item metadata	public
38802	Enchant Gloves - Fishing	enchanting	intrinsic item metadata	public
38803	Enchant Bracer - Lesser Intellect	enchanting	intrinsic item metadata	public
38804	Enchant Chest - Minor Stats	enchanting	intrinsic item metadata	public
38805	Enchant Shield - Lesser Stamina	enchanting	intrinsic item metadata	public
38806	Enchant Cloak - Defense	enchanting	intrinsic item metadata	public
38807	Enchant Boots - Lesser Agility	enchanting	intrinsic item metadata	public
38808	Enchant Chest - Greater Health	enchanting	intrinsic item metadata	public
38809	Enchant Bracer - Spirit	enchanting	intrinsic item metadata	public
38810	Enchant Boots - Lesser Stamina	enchanting	intrinsic item metadata	public
38811	Enchant Bracer - Lesser Dodge	enchanting	intrinsic item metadata	public
38812	Enchant Bracer - Stamina	enchanting	intrinsic item metadata	public
38813	Enchant Weapon - Lesser Beastslayer	enchanting	intrinsic item metadata	public
38814	Enchant Weapon - Lesser Elemental Slayer	enchanting	intrinsic item metadata	public
38816	Enchant Shield - Spirit	enchanting	intrinsic item metadata	public
38817	Enchant Bracer - Strength	enchanting	intrinsic item metadata	public
38818	Enchant Chest - Greater Mana	enchanting	intrinsic item metadata	public
38819	Enchant Boots - Lesser Spirit	enchanting	intrinsic item metadata	public
38820	Enchant Shield - Lesser Parry	enchanting	intrinsic item metadata	public
38821	Enchant Weapon - Striking	enchanting	intrinsic item metadata	public
38822	Enchant 2H Weapon - Impact	enchanting	intrinsic item metadata	public
38823	Enchant Gloves - Skinning	enchanting	intrinsic item metadata	public
38824	Enchant Chest - Lesser Stats	enchanting	intrinsic item metadata	public
38825	Enchant Cloak - Greater Defense	enchanting	intrinsic item metadata	public
38827	Enchant Gloves - Agility	enchanting	intrinsic item metadata	public
38828	Enchant Shield - Stamina	enchanting	intrinsic item metadata	public
38829	Enchant Bracer - Intellect	enchanting	intrinsic item metadata	public
38830	Enchant Boots - Stamina	enchanting	intrinsic item metadata	public
38831	Enchant Gloves - Advanced Mining	enchanting	intrinsic item metadata	public
38832	Enchant Bracer - Greater Spirit	enchanting	intrinsic item metadata	public
38833	Enchant Chest - Superior Health	enchanting	intrinsic item metadata	public
38834	Enchant Gloves - Advanced Herbalism	enchanting	intrinsic item metadata	public
38835	Enchant Cloak - Lesser Agility	enchanting	intrinsic item metadata	public
38836	Enchant Gloves - Strength	enchanting	intrinsic item metadata	public
38837	Enchant Boots - Minor Speed	enchanting	intrinsic item metadata	public
38838	Enchant Weapon - Fiery Weapon	enchanting	intrinsic item metadata	public
38839	Enchant Shield - Greater Spirit	enchanting	intrinsic item metadata	public
38840	Enchant Weapon - Demonslaying	enchanting	intrinsic item metadata	public
38841	Enchant Chest - Superior Mana	enchanting	intrinsic item metadata	public
38842	Enchant Bracer - Dodge	enchanting	intrinsic item metadata	public
38844	Enchant Boots - Agility	enchanting	intrinsic item metadata	public
38845	Enchant 2H Weapon - Greater Impact	enchanting	intrinsic item metadata	public
38846	Enchant Bracer - Greater Strength	enchanting	intrinsic item metadata	public
38847	Enchant Chest - Stats	enchanting	intrinsic item metadata	public
38848	Enchant Weapon - Greater Striking	enchanting	intrinsic item metadata	public
38849	Enchant Bracer - Greater Stamina	enchanting	intrinsic item metadata	public
38850	Enchant Gloves - Riding Skill	enchanting	intrinsic item metadata	public
38851	Enchant Gloves - Minor Haste	enchanting	intrinsic item metadata	public
38852	Enchant Bracer - Greater Intellect	enchanting	intrinsic item metadata	public
38853	Enchant Bracer - Superior Spirit	enchanting	intrinsic item metadata	public
38854	Enchant Bracer - Superior Strength	enchanting	intrinsic item metadata	public
38855	Enchant Bracer - Superior Stamina	enchanting	intrinsic item metadata	public
38856	Enchant Gloves - Greater Agility	enchanting	intrinsic item metadata	public
38857	Enchant Gloves - Greater Strength	enchanting	intrinsic item metadata	public
38859	Enchant Cloak - Superior Defense	enchanting	intrinsic item metadata	public
38860	Enchant Shield - Vitality	enchanting	intrinsic item metadata	public
38861	Enchant Shield - Greater Stamina	enchanting	intrinsic item metadata	public
38862	Enchant Boots - Greater Stamina	enchanting	intrinsic item metadata	public
38863	Enchant Boots - Greater Agility	enchanting	intrinsic item metadata	public
38864	Enchant Boots - Spirit	enchanting	intrinsic item metadata	public
38865	Enchant Chest - Greater Stats	enchanting	intrinsic item metadata	public
38866	Enchant Chest - Major Health	enchanting	intrinsic item metadata	public
38867	Enchant Chest - Major Mana	enchanting	intrinsic item metadata	public
38868	Enchant Weapon - Icy Chill	enchanting	intrinsic item metadata	public
38869	Enchant 2H Weapon - Superior Impact	enchanting	intrinsic item metadata	public
38870	Enchant Weapon - Superior Striking	enchanting	intrinsic item metadata	public
38871	Enchant Weapon - Lifestealing	enchanting	intrinsic item metadata	public
38872	Enchant Weapon - Unholy Weapon	enchanting	intrinsic item metadata	public
38873	Enchant Weapon - Crusader	enchanting	intrinsic item metadata	public
38874	Enchant 2H Weapon - Major Spirit	enchanting	intrinsic item metadata	public
38875	Enchant 2H Weapon - Major Intellect	enchanting	intrinsic item metadata	public
38876	Enchant Weapon - Winter's Might	enchanting	intrinsic item metadata	public
38877	Enchant Weapon - Spellpower	enchanting	intrinsic item metadata	public
38878	Enchant Weapon - Healing Power	enchanting	intrinsic item metadata	public
38879	Enchant Weapon - Strength	enchanting	intrinsic item metadata	public
38880	Enchant Weapon - Agility	enchanting	intrinsic item metadata	public
38881	Enchant Bracer - Mana Regeneration	enchanting	intrinsic item metadata	public
38882	Enchant Bracer - Healing Power	enchanting	intrinsic item metadata	public
38883	Enchant Weapon - Mighty Spirit	enchanting	intrinsic item metadata	public
38884	Enchant Weapon - Mighty Intellect	enchanting	intrinsic item metadata	public
38885	Enchant Gloves - Threat	enchanting	intrinsic item metadata	public
38886	Enchant Gloves - Shadow Power	enchanting	intrinsic item metadata	public
38887	Enchant Gloves - Frost Power	enchanting	intrinsic item metadata	public
38888	Enchant Gloves - Fire Power	enchanting	intrinsic item metadata	public
38889	Enchant Gloves - Healing Power	enchanting	intrinsic item metadata	public
38890	Enchant Gloves - Superior Agility	enchanting	intrinsic item metadata	public
38893	Enchant Cloak - Stealth	enchanting	intrinsic item metadata	public
38894	Enchant Cloak - Subtlety	enchanting	intrinsic item metadata	public
38895	Enchant Cloak - Dodge	enchanting	intrinsic item metadata	public
38896	Enchant 2H Weapon - Agility	enchanting	intrinsic item metadata	public
38897	Enchant Bracer - Brawn	enchanting	intrinsic item metadata	public
38898	Enchant Bracer - Stats	enchanting	intrinsic item metadata	public
38899	Enchant Bracer - Greater Dodge	enchanting	intrinsic item metadata	public
38900	Enchant Bracer - Superior Healing	enchanting	intrinsic item metadata	public
38901	Enchant Bracer - Restore Mana Prime	enchanting	intrinsic item metadata	public
38902	Enchant Bracer - Fortitude	enchanting	intrinsic item metadata	public
38903	Enchant Bracer - Spellpower	enchanting	intrinsic item metadata	public
38904	Enchant Shield - Lesser Dodge	enchanting	intrinsic item metadata	public
38905	Enchant Shield - Intellect	enchanting	intrinsic item metadata	public
38906	Enchant Shield - Parry	enchanting	intrinsic item metadata	public
38908	Enchant Boots - Vitality	enchanting	intrinsic item metadata	public
38909	Enchant Boots - Fortitude	enchanting	intrinsic item metadata	public
38910	Enchant Boots - Surefooted	enchanting	intrinsic item metadata	public
38911	Enchant Chest - Exceptional Health	enchanting	intrinsic item metadata	public
38912	Enchant Chest - Exceptional Mana	enchanting	intrinsic item metadata	public
38913	Enchant Chest - Exceptional Stats	enchanting	intrinsic item metadata	public
38914	Enchant Cloak - Major Armor	enchanting	intrinsic item metadata	public
38916	Enchant Weapon - Major Spirit	enchanting	intrinsic item metadata	public
38917	Enchant Weapon - Major Striking	enchanting	intrinsic item metadata	public
38918	Enchant Weapon - Major Intellect	enchanting	intrinsic item metadata	public
38919	Enchant 2H Weapon - Savagery	enchanting	intrinsic item metadata	public
38920	Enchant Weapon - Potency	enchanting	intrinsic item metadata	public
38921	Enchant Weapon - Major Spellpower	enchanting	intrinsic item metadata	public
38922	Enchant 2H Weapon - Major Agility	enchanting	intrinsic item metadata	public
38923	Enchant Weapon - Sunfire	enchanting	intrinsic item metadata	public
38924	Enchant Weapon - Soulfrost	enchanting	intrinsic item metadata	public
38925	Enchant Weapon - Mongoose	enchanting	intrinsic item metadata	public
38926	Enchant Weapon - Spellsurge	enchanting	intrinsic item metadata	public
38927	Enchant Weapon - Battlemaster	enchanting	intrinsic item metadata	public
38928	Enchant Chest - Major Spirit	enchanting	intrinsic item metadata	public
38929	Enchant Chest - Restore Mana Prime	enchanting	intrinsic item metadata	public
38930	Enchant Chest - Major Resilience	enchanting	intrinsic item metadata	public
38931	Enchant Gloves - Blasting	enchanting	intrinsic item metadata	public
38932	Enchant Gloves - Precise Strikes	enchanting	intrinsic item metadata	public
38933	Enchant Gloves - Major Strength	enchanting	intrinsic item metadata	public
38934	Enchant Gloves - Assault	enchanting	intrinsic item metadata	public
38935	Enchant Gloves - Major Spellpower	enchanting	intrinsic item metadata	public
38936	Enchant Gloves - Major Healing	enchanting	intrinsic item metadata	public
38937	Enchant Bracer - Major Intellect	enchanting	intrinsic item metadata	public
38938	Enchant Bracer - Lesser Assault	enchanting	intrinsic item metadata	public
38939	Enchant Cloak - PvP Power	enchanting	intrinsic item metadata	public
38940	Enchant Cloak - Greater Agility	enchanting	intrinsic item metadata	public
38943	Enchant Boots - Cat's Swiftness	enchanting	intrinsic item metadata	public
38944	Enchant Boots - Boar's Speed	enchanting	intrinsic item metadata	public
38945	Enchant Shield - Major Stamina	enchanting	intrinsic item metadata	public
38946	Enchant Weapon - Major Healing	enchanting	intrinsic item metadata	public
38947	Enchant Weapon - Greater Agility	enchanting	intrinsic item metadata	public
38948	Enchant Weapon - Executioner	enchanting	intrinsic item metadata	public
38949	Enchant Shield - Resilience	enchanting	intrinsic item metadata	public
38951	Enchant Gloves - Expertise	enchanting	intrinsic item metadata	public
38952	Deprecated Scroll of Enchant Bracer - Major Stamina		deprecated client record	excluded
38953	Enchant Gloves - Precision	enchanting	intrinsic item metadata	public
38954	Enchant Shield - Dodge	enchanting	intrinsic item metadata	public
38955	Enchant Chest - Mighty Health	enchanting	intrinsic item metadata	public
38959	Enchant Cloak - Superior Agility	enchanting	intrinsic item metadata	public
38960	Enchant Gloves - Gatherer	enchanting	intrinsic item metadata	public
38961	Enchant Boots - Greater Spirit	enchanting	intrinsic item metadata	public
38962	Enchant Chest - Greater Mana Restoration	enchanting	intrinsic item metadata	public
38963	Enchant Weapon - Exceptional Spirit	enchanting	intrinsic item metadata	public
38964	Enchant Gloves - Greater Assault	enchanting	intrinsic item metadata	public
38965	Enchant Weapon - Icebreaker	enchanting	intrinsic item metadata	public
38966	Enchant Boots - Greater Fortitude	enchanting	intrinsic item metadata	public
38967	Enchant Gloves - Major Agility	enchanting	intrinsic item metadata	public
38968	Enchant Bracer - Exceptional Intellect	enchanting	intrinsic item metadata	public
38971	Enchant Bracer - Assault	enchanting	intrinsic item metadata	public
38972	Enchant Weapon - Lifeward	enchanting	intrinsic item metadata	public
38973	Enchant Cloak - Minor Power	enchanting	intrinsic item metadata	public
38974	Enchant Boots - Greater Vitality	enchanting	intrinsic item metadata	public
38975	Enchant Chest - Exceptional Resilience	enchanting	intrinsic item metadata	public
38976	Enchant Boots - Superior Agility	enchanting	intrinsic item metadata	public
38978	Enchant Cloak - Superior Dodge	enchanting	intrinsic item metadata	public
38979	Enchant Gloves - Exceptional Spellpower	enchanting	intrinsic item metadata	public
38980	Enchant Bracer - Major Spirit	enchanting	intrinsic item metadata	public
38981	Enchant 2H Weapon - Scourgebane	enchanting	intrinsic item metadata	public
38984	Enchant Bracer - Expertise	enchanting	intrinsic item metadata	public
38985	Enchant Gloves - Greater Blasting	enchanting	intrinsic item metadata	public
38986	Enchant Boots - Icewalker	enchanting	intrinsic item metadata	public
38987	Enchant Bracer - Greater Stats	enchanting	intrinsic item metadata	public
38988	Enchant Weapon - Giant Slayer	enchanting	intrinsic item metadata	public
38989	Enchant Chest - Super Stats	enchanting	intrinsic item metadata	public
38990	Enchant Gloves - Armsman	enchanting	intrinsic item metadata	public
38991	Enchant Weapon - Exceptional Spellpower	enchanting	intrinsic item metadata	public
38992	Enchant 2H Weapon - Greater Savagery	enchanting	intrinsic item metadata	public
38993	Enchant Cloak - Shadow Armor	enchanting	intrinsic item metadata	public
38995	Enchant Weapon - Exceptional Agility	enchanting	intrinsic item metadata	public
38997	Enchant Bracer - Greater Spellpower	enchanting	intrinsic item metadata	public
38998	Enchant Weapon - Deathfrost	enchanting	intrinsic item metadata	public
38999	Enchant Chest - Dodge	enchanting	intrinsic item metadata	public
39000	Enchant Cloak - Greater Dodge	enchanting	intrinsic item metadata	public
39001	Enchant Cloak - Mighty Stamina	enchanting	intrinsic item metadata	public
39002	Enchant Chest - Greater Dodge	enchanting	intrinsic item metadata	public
39003	Enchant Cloak - Greater Speed	enchanting	intrinsic item metadata	public
39004	Enchant Cloak - Wisdom	enchanting	intrinsic item metadata	public
39005	Enchant Chest - Super Health	enchanting	intrinsic item metadata	public
39006	Enchant Boots - Tuskarr's Vitality	enchanting	intrinsic item metadata	public
39014	Floral Foundations	inscription	specialized bag and profession data	public
39083	Cobalt Shoulders	armor	intrinsic item metadata	public
39084	Cobalt Helm	armor	intrinsic item metadata	public
39085	Cobalt Chestpiece	armor	intrinsic item metadata	public
39086	Cobalt Legplates	armor	intrinsic item metadata	public
39087	Cobalt Belt	armor	intrinsic item metadata	public
39088	Cobalt Boots	armor	intrinsic item metadata	public
39147	113 Pound Swordfish	fish	specialized bag and profession data	public
39148	Baby Coralshell Turtle	battle_pets	intrinsic item metadata	public
39151	Alabaster Pigment	inscription	specialized bag and profession data	public
39153	Manual: Dense Frostweave Bandage	first_aid	intrinsic item metadata	public
39213	Massive Seaforium Charge	engineering	specialized bag and profession data	public
39300	Spring Loaded Cloak Expander DEPRECATED		deprecated client record	excluded
39302	Glyph of the Penguin	inscription	specialized bag and profession data	public
39304	Glyph of Natural Force [PH]		placeholder item	excluded
39334	Dusky Pigment	inscription	specialized bag and profession data	public
39338	Golden Pigment	inscription	specialized bag and profession data	public
39339	Emerald Pigment	inscription	specialized bag and profession data	public
39340	Violet Pigment	inscription	specialized bag and profession data	public
39341	Silvery Pigment	inscription	specialized bag and profession data	public
39342	Nether Pigment	inscription	specialized bag and profession data	public
39343	Azure Pigment	inscription	specialized bag and profession data	public
39349	Ruined Vellum	enchanting	curated player-facing category	public
39350	Ruined Vellum	enchanting	curated player-facing category	public
39352	Deprecated Ebon Ink		deprecated client record	excluded
39354	Light Parchment	inscription	curated player-facing category	public
39469	Moonglow Ink	inscription	specialized bag and profession data	public
39501	Heavy Parchment	inscription	curated player-facing category	public
39502	Resilient Parchment	inscription	curated player-facing category	public
39505	Virtuoso Inking Set	inscription	specialized bag and profession data	public
39520	Kungaloosh	food	intrinsic item metadata	public
39526	Coral Crusher	fish	intrinsic item metadata	public
39527	Plated Darkfish	fish	intrinsic item metadata	public
39584	Deprecated Glyph of Thorns		deprecated client record	excluded
39585	Deprecated Glyph of Wild Endurance [PH]		placeholder item	excluded
39586	Derecated Glyph of Moonfire (Kyle Test) [PH]		placeholder item	excluded
39587	Deprecated Glyph of Savage Mauling		deprecated client record	excluded
39666	Elixir of Mighty Agility	alchemy	intrinsic item metadata	public
39671	Resurgent Healing Potion	alchemy	intrinsic item metadata	public
39681	Handful of Cobalt Bolts	engineering	specialized bag and profession data	public
39682	Overcharged Capacitor	engineering	specialized bag and profession data	public
39683	Froststeel Tube	engineering	specialized bag and profession data	public
39684	Hair Trigger	engineering	specialized bag and profession data	public
39685	Indestructible Frame	engineering	specialized bag and profession data	public
39686	Neo-Dynamic Gear Assembly	engineering	specialized bag and profession data	public
39687	Saronite Grenade	engineering	specialized bag and profession data	public
39690	Volatile Blasting Trigger	engineering	specialized bag and profession data	public
39691	Succulent Orca Stew	food	intrinsic item metadata	public
39774	Midnight Ink	inscription	specialized bag and profession data	public
39900	Bold Bloodstone	jewels	intrinsic item metadata	public
39905	Delicate Bloodstone	jewels	intrinsic item metadata	public
39906	Delicate Bloodstone	jewels	intrinsic item metadata	public
39907	Subtle Sun Crystal	jewels	intrinsic item metadata	public
39908	Flashing Bloodstone	jewels	intrinsic item metadata	public
39909	Smooth Sun Crystal	jewels	intrinsic item metadata	public
39910	Precise Bloodstone	jewels	intrinsic item metadata	public
39911	Brilliant Bloodstone	jewels	intrinsic item metadata	public
39912	Brilliant Bloodstone	jewels	intrinsic item metadata	public
39914	Smooth Sun Crystal	jewels	intrinsic item metadata	public
39915	Rigid Chalcedony	jewels	intrinsic item metadata	public
39916	Subtle Sun Crystal	jewels	intrinsic item metadata	public
39917	Mystic Sun Crystal	jewels	intrinsic item metadata	public
39918	Quick Sun Crystal	jewels	intrinsic item metadata	public
39919	Solid Chalcedony	jewels	intrinsic item metadata	public
39920	Sparkling Chalcedony	jewels	intrinsic item metadata	public
39927	Sparkling Chalcedony	jewels	intrinsic item metadata	public
39932	Stormy Chalcedony	jewels	intrinsic item metadata	public
39933	Jagged Dark Jade	jewels	intrinsic item metadata	public
39934	Sovereign Shadow Crystal	jewels	intrinsic item metadata	public
39935	Shifting Shadow Crystal	jewels	intrinsic item metadata	public
39936	Timeless Shadow Crystal	jewels	intrinsic item metadata	public
39937	Shifting Shadow Crystal	jewels	intrinsic item metadata	public
39938	Regal Dark Jade	jewels	intrinsic item metadata	public
39939	Defender's Shadow Crystal	jewels	intrinsic item metadata	public
39940	Guardian's Shadow Crystal	jewels	intrinsic item metadata	public
39941	Purified Shadow Crystal	jewels	intrinsic item metadata	public
39942	Glinting Shadow Crystal	jewels	intrinsic item metadata	public
39943	Purified Shadow Crystal	jewels	intrinsic item metadata	public
39944	Glinting Shadow Crystal	jewels	intrinsic item metadata	public
39945	Mysterious Shadow Crystal	jewels	intrinsic item metadata	public
39946	Reckless Huge Citrine	jewels	intrinsic item metadata	public
39947	Inscribed Huge Citrine	jewels	intrinsic item metadata	public
39948	Etched Shadow Crystal	jewels	intrinsic item metadata	public
39949	Champion's Huge Citrine	jewels	intrinsic item metadata	public
39950	Resplendent Huge Citrine	jewels	intrinsic item metadata	public
39951	Fierce Huge Citrine	jewels	intrinsic item metadata	public
39952	Deadly Huge Citrine	jewels	intrinsic item metadata	public
39953	Glinting Shadow Crystal	jewels	intrinsic item metadata	public
39954	Lucent Huge Citrine	jewels	intrinsic item metadata	public
39955	Deft Huge Citrine	jewels	intrinsic item metadata	public
39956	Potent Huge Citrine	jewels	intrinsic item metadata	public
39957	Veiled Shadow Crystal	jewels	intrinsic item metadata	public
39958	Willful Huge Citrine	jewels	intrinsic item metadata	public
39959	Reckless Huge Citrine	jewels	intrinsic item metadata	public
39960	Deadly Huge Citrine	jewels	intrinsic item metadata	public
39961	Glinting Shadow Crystal	jewels	intrinsic item metadata	public
39962	Lucent Huge Citrine	jewels	intrinsic item metadata	public
39963	Deft Huge Citrine	jewels	intrinsic item metadata	public
39964	Stalwart Huge Citrine	jewels	intrinsic item metadata	public
39965	Stalwart Huge Citrine	jewels	intrinsic item metadata	public
39966	Accurate Shadow Crystal	jewels	intrinsic item metadata	public
39967	Resolute Huge Citrine	jewels	intrinsic item metadata	public
39968	Timeless Shadow Crystal	jewels	intrinsic item metadata	public
39969	Fire Seed	herbs	specialized bag and profession data	public
39970	Fire Leaf	herbs	intrinsic item metadata	public
39972	Drums	leatherworking	specialized bag and profession data	public
39974	Jagged Dark Jade	jewels	intrinsic item metadata	public
39975	Nimble Dark Jade	jewels	intrinsic item metadata	public
39976	Regal Dark Jade	jewels	intrinsic item metadata	public
39977	Steady Dark Jade	jewels	intrinsic item metadata	public
39978	Forceful Dark Jade	jewels	intrinsic item metadata	public
39979	Purified Shadow Crystal	jewels	intrinsic item metadata	public
39980	Misty Dark Jade	jewels	intrinsic item metadata	public
39981	Lightning Dark Jade	jewels	intrinsic item metadata	public
39982	Turbid Dark Jade	jewels	intrinsic item metadata	public
39983	Energized Dark Jade	jewels	intrinsic item metadata	public
39984	Purified Shadow Crystal	jewels	intrinsic item metadata	public
39985	Misty Dark Jade	jewels	intrinsic item metadata	public
39986	Lightning Dark Jade	jewels	intrinsic item metadata	public
39988	Turbid Dark Jade	jewels	intrinsic item metadata	public
39989	Energized Dark Jade	jewels	intrinsic item metadata	public
39990	Radiant Dark Jade	jewels	intrinsic item metadata	public
39991	Radiant Dark Jade	jewels	intrinsic item metadata	public
39992	Shattered Dark Jade	jewels	intrinsic item metadata	public
39996	Bold Scarlet Ruby	jewels	intrinsic item metadata	public
39997	Delicate Scarlet Ruby	jewels	intrinsic item metadata	public
39998	Brilliant Scarlet Ruby	jewels	intrinsic item metadata	public
39999	Delicate Scarlet Ruby	jewels	intrinsic item metadata	public
40000	Subtle Autumn's Glow	jewels	intrinsic item metadata	public
40001	Flashing Scarlet Ruby	jewels	intrinsic item metadata	public
40002	Smooth Autumn's Glow	jewels	intrinsic item metadata	public
40003	Precise Scarlet Ruby	jewels	intrinsic item metadata	public
40008	Solid Sky Sapphire	jewels	intrinsic item metadata	public
40009	Sparkling Sky Sapphire	jewels	intrinsic item metadata	public
40010	Sparkling Sky Sapphire	jewels	intrinsic item metadata	public
40011	Stormy Sky Sapphire	jewels	intrinsic item metadata	public
40012	Brilliant Scarlet Ruby	jewels	intrinsic item metadata	public
40013	Smooth Autumn's Glow	jewels	intrinsic item metadata	public
40014	Rigid Sky Sapphire	jewels	intrinsic item metadata	public
40015	Subtle Autumn's Glow	jewels	intrinsic item metadata	public
40016	Mystic Autumn's Glow	jewels	intrinsic item metadata	public
40017	Quick Autumn's Glow	jewels	intrinsic item metadata	public
40022	Sovereign Twilight Opal	jewels	intrinsic item metadata	public
40023	Shifting Twilight Opal	jewels	intrinsic item metadata	public
40024	Glinting Twilight Opal	jewels	intrinsic item metadata	public
40025	Timeless Twilight Opal	jewels	intrinsic item metadata	public
40026	Purified Twilight Opal	jewels	intrinsic item metadata	public
40027	Purified Twilight Opal	jewels	intrinsic item metadata	public
40028	Mysterious Twilight Opal	jewels	intrinsic item metadata	public
40029	Shifting Twilight Opal	jewels	intrinsic item metadata	public
40030	Glinting Twilight Opal	jewels	intrinsic item metadata	public
40031	Regal Forest Emerald	jewels	intrinsic item metadata	public
40032	Defender's Twilight Opal	jewels	intrinsic item metadata	public
40033	Jagged Forest Emerald	jewels	intrinsic item metadata	public
40034	Guardian's Twilight Opal	jewels	intrinsic item metadata	public
40035	Northrend Honey Mead	food	intrinsic item metadata	public
40036	Snowplum Brandy	food	intrinsic item metadata	public
40037	Inscribed Monarch Topaz	jewels	intrinsic item metadata	public
40038	Etched Twilight Opal	jewels	intrinsic item metadata	public
40039	Champion's Monarch Topaz	jewels	intrinsic item metadata	public
40040	Resplendent Monarch Topaz	jewels	intrinsic item metadata	public
40041	Fierce Monarch Topaz	jewels	intrinsic item metadata	public
40042	Caraway Burnwine	food	intrinsic item metadata	public
40043	Deadly Monarch Topaz	jewels	intrinsic item metadata	public
40044	Glinting Twilight Opal	jewels	intrinsic item metadata	public
40045	Lucent Monarch Topaz	jewels	intrinsic item metadata	public
40046	Deft Monarch Topaz	jewels	intrinsic item metadata	public
40047	Reckless Monarch Topaz	jewels	intrinsic item metadata	public
40048	Potent Monarch Topaz	jewels	intrinsic item metadata	public
40049	Veiled Twilight Opal	jewels	intrinsic item metadata	public
40050	Willful Monarch Topaz	jewels	intrinsic item metadata	public
40051	Reckless Monarch Topaz	jewels	intrinsic item metadata	public
40052	Deadly Monarch Topaz	jewels	intrinsic item metadata	public
40053	Glinting Twilight Opal	jewels	intrinsic item metadata	public
40054	Lucent Monarch Topaz	jewels	intrinsic item metadata	public
40055	Deft Monarch Topaz	jewels	intrinsic item metadata	public
40056	Stalwart Monarch Topaz	jewels	intrinsic item metadata	public
40057	Stalwart Monarch Topaz	jewels	intrinsic item metadata	public
40058	Accurate Twilight Opal	jewels	intrinsic item metadata	public
40059	Resolute Monarch Topaz	jewels	intrinsic item metadata	public
40067	Icy Mana Potion	alchemy	intrinsic item metadata	public
40068	Wrath Elixir	alchemy	intrinsic item metadata	public
40070	Spellpower Elixir	alchemy	intrinsic item metadata	public
40072	Elixir of Spirit	alchemy	intrinsic item metadata	public
40073	Elixir of Mighty Strength	alchemy	intrinsic item metadata	public
40076	Guru's Elixir	alchemy	intrinsic item metadata	public
40077	Crazy Alchemist's Potion	alchemy	intrinsic item metadata	public
40078	Elixir of Mighty Fortitude	alchemy	intrinsic item metadata	public
40079	Lesser Flask of Toughness	alchemy	intrinsic item metadata	public
40081	Potion of Nightmares	alchemy	intrinsic item metadata	public
40082	Mixture of the Frost Wyrm	alchemy	intrinsic item metadata	public
40083	Mixture of Stoneblood	alchemy	intrinsic item metadata	public
40084	Mixture of Endless Rage	alchemy	intrinsic item metadata	public
40085	Timeless Twilight Opal	jewels	intrinsic item metadata	public
40086	Jagged Forest Emerald	jewels	intrinsic item metadata	public
40087	Powerful Rejuvenation Potion	alchemy	intrinsic item metadata	public
40088	Nimble Forest Emerald	jewels	intrinsic item metadata	public
40089	Regal Forest Emerald	jewels	intrinsic item metadata	public
40090	Steady Forest Emerald	jewels	intrinsic item metadata	public
40091	Forceful Forest Emerald	jewels	intrinsic item metadata	public
40092	Purified Twilight Opal	jewels	intrinsic item metadata	public
40093	Indestructible Potion	alchemy	intrinsic item metadata	public
40094	Purified Twilight Opal	jewels	intrinsic item metadata	public
40095	Misty Forest Emerald	jewels	intrinsic item metadata	public
40096	Misty Forest Emerald	jewels	intrinsic item metadata	public
40097	Elixir of Protection	alchemy	intrinsic item metadata	public
40098	Radiant Forest Emerald	jewels	intrinsic item metadata	public
40099	Lightning Forest Emerald	jewels	intrinsic item metadata	public
40100	Lightning Forest Emerald	jewels	intrinsic item metadata	public
40101	Radiant Forest Emerald	jewels	intrinsic item metadata	public
40102	Turbid Forest Emerald	jewels	intrinsic item metadata	public
40103	Turbid Forest Emerald	jewels	intrinsic item metadata	public
40104	Energized Forest Emerald	jewels	intrinsic item metadata	public
40105	Energized Forest Emerald	jewels	intrinsic item metadata	public
40106	Shattered Forest Emerald	jewels	intrinsic item metadata	public
40109	Elixir of Mighty Mageblood	alchemy	intrinsic item metadata	public
40111	Bold Cardinal Ruby	jewels	intrinsic item metadata	public
40112	Delicate Cardinal Ruby	jewels	intrinsic item metadata	public
40113	Brilliant Cardinal Ruby	jewels	intrinsic item metadata	public
40114	Delicate Cardinal Ruby	jewels	intrinsic item metadata	public
40115	Subtle King's Amber	jewels	intrinsic item metadata	public
40116	Flashing Cardinal Ruby	jewels	intrinsic item metadata	public
40117	Smooth King's Amber	jewels	intrinsic item metadata	public
40118	Precise Cardinal Ruby	jewels	intrinsic item metadata	public
40119	Solid Majestic Zircon	jewels	intrinsic item metadata	public
40120	Sparkling Majestic Zircon	jewels	intrinsic item metadata	public
40121	Sparkling Majestic Zircon	jewels	intrinsic item metadata	public
40122	Stormy Majestic Zircon	jewels	intrinsic item metadata	public
40123	Brilliant Cardinal Ruby	jewels	intrinsic item metadata	public
40124	Smooth King's Amber	jewels	intrinsic item metadata	public
40125	Rigid Majestic Zircon	jewels	intrinsic item metadata	public
40126	Subtle King's Amber	jewels	intrinsic item metadata	public
40127	Mystic King's Amber	jewels	intrinsic item metadata	public
40128	Quick King's Amber	jewels	intrinsic item metadata	public
40129	Sovereign Dreadstone	jewels	intrinsic item metadata	public
40130	Shifting Dreadstone	jewels	intrinsic item metadata	public
40131	Glinting Dreadstone	jewels	intrinsic item metadata	public
40132	Timeless Dreadstone	jewels	intrinsic item metadata	public
40133	Purified Dreadstone	jewels	intrinsic item metadata	public
40134	Purified Dreadstone	jewels	intrinsic item metadata	public
40135	Mysterious Dreadstone	jewels	intrinsic item metadata	public
40136	Shifting Dreadstone	jewels	intrinsic item metadata	public
40137	Glinting Dreadstone	jewels	intrinsic item metadata	public
40138	Regal Eye of Zul	jewels	intrinsic item metadata	public
40139	Defender's Dreadstone	jewels	intrinsic item metadata	public
40140	Jagged Eye of Zul	jewels	intrinsic item metadata	public
40141	Guardian's Dreadstone	jewels	intrinsic item metadata	public
40142	Inscribed Ametrine	jewels	intrinsic item metadata	public
40143	Etched Dreadstone	jewels	intrinsic item metadata	public
40144	Champion's Ametrine	jewels	intrinsic item metadata	public
40145	Resplendent Ametrine	jewels	intrinsic item metadata	public
40146	Fierce Ametrine	jewels	intrinsic item metadata	public
40147	Deadly Ametrine	jewels	intrinsic item metadata	public
40148	Glinting Dreadstone	jewels	intrinsic item metadata	public
40149	Lucent Ametrine	jewels	intrinsic item metadata	public
40150	Deft Ametrine	jewels	intrinsic item metadata	public
40151	Purified Dreadstone	jewels	intrinsic item metadata	public
40152	Potent Ametrine	jewels	intrinsic item metadata	public
40153	Veiled Dreadstone	jewels	intrinsic item metadata	public
40154	Willful Ametrine	jewels	intrinsic item metadata	public
40155	Reckless Ametrine	jewels	intrinsic item metadata	public
40156	Deadly Ametrine	jewels	intrinsic item metadata	public
40157	Glinting Dreadstone	jewels	intrinsic item metadata	public
40158	Lucent Ametrine	jewels	intrinsic item metadata	public
40159	Deft Ametrine	jewels	intrinsic item metadata	public
40160	Stalwart Ametrine	jewels	intrinsic item metadata	public
40161	Stalwart Ametrine	jewels	intrinsic item metadata	public
40162	Accurate Dreadstone	jewels	intrinsic item metadata	public
40163	Resolute Ametrine	jewels	intrinsic item metadata	public
40164	Timeless Dreadstone	jewels	intrinsic item metadata	public
40165	Jagged Eye of Zul	jewels	intrinsic item metadata	public
40166	Nimble Eye of Zul	jewels	intrinsic item metadata	public
40167	Regal Eye of Zul	jewels	intrinsic item metadata	public
40168	Steady Eye of Zul	jewels	intrinsic item metadata	public
40169	Forceful Eye of Zul	jewels	intrinsic item metadata	public
40170	Purified Dreadstone	jewels	intrinsic item metadata	public
40171	Misty Eye of Zul	jewels	intrinsic item metadata	public
40172	Lightning Eye of Zul	jewels	intrinsic item metadata	public
40173	Turbid Eye of Zul	jewels	intrinsic item metadata	public
40174	Energized Eye of Zul	jewels	intrinsic item metadata	public
40175	Purified Dreadstone	jewels	intrinsic item metadata	public
40176	Misty Eye of Zul	jewels	intrinsic item metadata	public
40177	Lightning Eye of Zul	jewels	intrinsic item metadata	public
40178	Turbid Eye of Zul	jewels	intrinsic item metadata	public
40179	Energized Eye of Zul	jewels	intrinsic item metadata	public
40180	Radiant Eye of Zul	jewels	intrinsic item metadata	public
40181	Radiant Eye of Zul	jewels	intrinsic item metadata	public
40182	Shattered Eye of Zul	jewels	intrinsic item metadata	public
40195	Pygmy Oil	fish	specialized bag and profession data	public
40199	Pygmy Suckerfish	fish	specialized bag and profession data	public
40202	Sizzling Grizzly Flank	food	intrinsic item metadata	public
40211	Potion of Speed	alchemy	intrinsic item metadata	public
40212	Potion of Wild Magic	alchemy	intrinsic item metadata	public
40213	Mighty Arcane Protection Potion	alchemy	intrinsic item metadata	public
40214	Mighty Fire Protection Potion	alchemy	intrinsic item metadata	public
40215	Mighty Frost Protection Potion	alchemy	intrinsic item metadata	public
40216	Mighty Nature Protection Potion	alchemy	intrinsic item metadata	public
40217	Mighty Shadow Protection Potion	alchemy	intrinsic item metadata	public
40248	Eternal Might	elemental	intrinsic item metadata	public
40356	Grizzleberries	food	intrinsic item metadata	public
40357	Grizzleberry Juice	food	intrinsic item metadata	public
40358	Raw Tallhorn Chunk	food	intrinsic item metadata	public
40359	Fresh Eagle Meat	food	intrinsic item metadata	public
40392	Cracked Diamond	jewels	specialized bag and profession data	public
40404	Mixture of Pure Mojo	alchemy	intrinsic item metadata	public
40411	Shattered Vial	inscription	specialized bag and profession data	public
40413	Deprecated Elixir of Mighty Nothing		deprecated client record	excluded
40484	Deprecated Glyph of the White Bear		deprecated client record	excluded
40533	Walnut Stock	engineering	specialized bag and profession data	public
40536	Explosive Decoy	engineering	specialized bag and profession data	public
40538	DEPRECATED Remote Detonator		deprecated client record	excluded
40668	Cobalt Triangle Shield	armor	intrinsic item metadata	public
40669	Tempered Saronite Belt	armor	intrinsic item metadata	public
40670	Saronite Defender	armor	intrinsic item metadata	public
40671	Tempered Saronite Boots	armor	intrinsic item metadata	public
40672	Tempered Saronite Breastplate	armor	intrinsic item metadata	public
40673	Tempered Saronite Helm	armor	intrinsic item metadata	public
40674	Tempered Saronite Legplates	armor	intrinsic item metadata	public
40675	Tempered Saronite Shoulders	armor	intrinsic item metadata	public
40677	Crafty Potion PLACEHOLDER		placeholder item	excluded
40727	Gnomish Gravity Well	engineering	specialized bag and profession data	public
40754	DEPRECATED Flame Red Ejector Seat		deprecated client record	excluded
40767	Sonic Booster	trinkets	intrinsic item metadata	public
40768	MOLL-E	engineering	specialized bag and profession data	public
40769	Scrapbot Construction Kit	engineering	specialized bag and profession data	public
40771	Cobalt Frag Bomb	engineering	specialized bag and profession data	public
40772	Gnomish Army Knife	engineering	specialized bag and profession data	public
40776	Personal Electromagnetic Pulse Generator	enchanting	intrinsic item metadata	public
40800	Belt-Clipped Spynoculars [DEPRECATED]		deprecated client record	excluded
40865	Noise Machine	trinkets	intrinsic item metadata	public
40892	Hammer Pick	engineering	specialized bag and profession data	public
40893	Bladed Pickaxe	engineering	specialized bag and profession data	public
40896	Glyph of Frenzied Regeneration	inscription	intrinsic item metadata	public
40897	Glyph of Maul	inscription	intrinsic item metadata	public
40899	Glyph of Omens	inscription	intrinsic item metadata	public
40900	Glyph of the Stag	inscription	intrinsic item metadata	public
40901	Glyph of Shred	inscription	intrinsic item metadata	public
40902	Glyph of Prowl	inscription	intrinsic item metadata	public
40903	Glyph of Pounce	inscription	intrinsic item metadata	public
40906	Glyph of Stampede	inscription	intrinsic item metadata	public
40908	Glyph of Innervate	inscription	intrinsic item metadata	public
40909	Glyph of Rebirth	inscription	intrinsic item metadata	public
40912	Glyph of Regrowth	inscription	intrinsic item metadata	public
40913	Glyph of Rejuvenation	inscription	intrinsic item metadata	public
40914	Glyph of Healing Touch	inscription	intrinsic item metadata	public
40915	Glyph of Efflorescence	inscription	intrinsic item metadata	public
40916	Glyph of Guided Stars	inscription	intrinsic item metadata	public
40919	Glyph of the Orca	inscription	intrinsic item metadata	public
40920	Glyph of Hurricane	inscription	intrinsic item metadata	public
40921	Glyph of Skull Bash	inscription	intrinsic item metadata	public
40922	Glyph of Nature's Grasp	inscription	intrinsic item metadata	public
40923	Glyph of Savagery	inscription	intrinsic item metadata	public
40924	Glyph of Entangling Roots	inscription	intrinsic item metadata	public
40942	Spiked Cobalt Helm	armor	intrinsic item metadata	public
40943	Spiked Cobalt Legplates	armor	intrinsic item metadata	public
40948	Deprecated Glyph of the Red Lynx		deprecated client record	excluded
40949	Spiked Cobalt Boots	armor	intrinsic item metadata	public
40950	Spiked Cobalt Shoulders	armor	intrinsic item metadata	public
40951	Spiked Cobalt Chestpiece	armor	intrinsic item metadata	public
40952	Spiked Cobalt Gauntlets	armor	intrinsic item metadata	public
40953	Spiked Cobalt Belt	armor	intrinsic item metadata	public
40954	Spiked Cobalt Bracers	armor	intrinsic item metadata	public
40955	Horned Cobalt Helm	armor	intrinsic item metadata	public
40956	Reinforced Cobalt Shoulders	armor	intrinsic item metadata	public
40957	Reinforced Cobalt Helm	armor	intrinsic item metadata	public
40958	Reinforced Cobalt Legplates	armor	intrinsic item metadata	public
40959	Reinforced Cobalt Chestpiece	armor	intrinsic item metadata	public
41091	Hand-Mounted Pyro Rocket	enchanting	intrinsic item metadata	public
41092	Glyph of Double Jeopardy	inscription	intrinsic item metadata	public
41093	Hyperspeed Accelerators	enchanting	intrinsic item metadata	public
41094	Glyph of Devotion Aura	inscription	intrinsic item metadata	public
41095	Glyph of Holy Wrath	inscription	intrinsic item metadata	public
41096	Glyph of Divine Protection	inscription	intrinsic item metadata	public
41097	Glyph of Templar's Verdict	inscription	intrinsic item metadata	public
41098	Glyph of Avenging Wrath	inscription	intrinsic item metadata	public
41099	Glyph of Consecration	inscription	intrinsic item metadata	public
41100	Glyph of the Luminous Charger	inscription	intrinsic item metadata	public
41101	Glyph of Focused Shield	inscription	intrinsic item metadata	public
41102	Glyph of Burden of Guilt	inscription	intrinsic item metadata	public
41103	Glyph of Blinding Light	inscription	intrinsic item metadata	public
41104	Glyph of Final Wrath	inscription	intrinsic item metadata	public
41105	Glyph of Word of Glory	inscription	intrinsic item metadata	public
41106	Glyph of Illumination	inscription	intrinsic item metadata	public
41107	Glyph of Harsh Words	inscription	intrinsic item metadata	public
41108	Glyph of Divinity	inscription	intrinsic item metadata	public
41109	Glyph of Light of Dawn	inscription	intrinsic item metadata	public
41110	Glyph of Blessed Life	inscription	intrinsic item metadata	public
41111	Flexweave Underlay	enchanting	intrinsic item metadata	public
41112	Mechanized Snow Goggles	armor	intrinsic item metadata	public
41113	Saronite Bulwark	armor	intrinsic item metadata	public
41114	Tempered Saronite Gauntlets	armor	intrinsic item metadata	public
41116	Tempered Saronite Bracers	armor	intrinsic item metadata	public
41117	Saronite Protector	armor	intrinsic item metadata	public
41118	Nitro Boosts	enchanting	intrinsic item metadata	public
41119	Saronite Bomb	engineering	specialized bag and profession data	public
41126	Brilliant Saronite Legplates	armor	intrinsic item metadata	public
41127	Brilliant Saronite Gauntlets	armor	intrinsic item metadata	public
41128	Brilliant Saronite Boots	armor	intrinsic item metadata	public
41129	Brilliant Saronite Breastplate	armor	intrinsic item metadata	public
41146	Sun Scope	engineering	specialized bag and profession data	public
41147	Barrel o' Fun	engineering	specialized bag and profession data	public
41163	Titanium Bar	ore	intrinsic item metadata	public
41166	Runic Healing Injector	alchemy	intrinsic item metadata	public
41167	Heartseeker Scope	engineering	specialized bag and profession data	public
41168	Armor Plated Combat Shotgun	weapons	intrinsic item metadata	public
41178	ZX-5103 Mechanical Suit		internal test item	excluded
41181	Honed Cobalt Cleaver	weapons	intrinsic item metadata	public
41182	Savage Cobalt Slicer	weapons	intrinsic item metadata	public
41183	Saronite Ambusher	weapons	intrinsic item metadata	public
41184	Saronite Shiv	weapons	intrinsic item metadata	public
41185	Furious Saronite Beatstick	weapons	intrinsic item metadata	public
41238	Cloak of Tormented Skies	armor	intrinsic item metadata	public
41239	Sturdy Cobalt Quickblade	weapons	intrinsic item metadata	public
41240	Cobalt Tenderizer	weapons	intrinsic item metadata	public
41242	Forged Cobalt Claymore	weapons	intrinsic item metadata	public
41243	Notched Cobalt War Axe	weapons	intrinsic item metadata	public
41245	Deadly Saronite Dirk	weapons	intrinsic item metadata	public
41247	Titansteel (DEPRECATED)		deprecated client record	excluded
41248	Red Lumberjack Shirt	armor	intrinsic item metadata	public
41249	Blue Lumberjack Shirt	armor	intrinsic item metadata	public
41250	Green Lumberjack Shirt	armor	intrinsic item metadata	public
41251	Yellow Lumberjack Shirt	armor	intrinsic item metadata	public
41252	Red Workman's Shirt	armor	intrinsic item metadata	public
41253	Blue Workman's Shirt	armor	intrinsic item metadata	public
41254	Rustic Workman's Shirt	armor	intrinsic item metadata	public
41255	Green Workman's Shirt	armor	intrinsic item metadata	public
41257	Titansteel Destroyer	weapons	intrinsic item metadata	public
41266	Skyflare Diamond	jewels	intrinsic item metadata	public
41285	Chaotic Skyflare Diamond	jewels	intrinsic item metadata	public
41307	Destructive Skyflare Diamond	jewels	intrinsic item metadata	public
41333	Ember Skyflare Diamond	jewels	intrinsic item metadata	public
41334	Earthsiege Diamond	jewels	intrinsic item metadata	public
41335	Enigmatic Skyflare Diamond	jewels	intrinsic item metadata	public
41339	Swift Skyflare Diamond	jewels	intrinsic item metadata	public
41344	Helm of Command	armor	intrinsic item metadata	public
41345	Daunting Legplates	armor	intrinsic item metadata	public
41346	Righteous Greaves	armor	intrinsic item metadata	public
41347	Savage Saronite Legplates	armor	intrinsic item metadata	public
41348	Savage Saronite Walkers	armor	intrinsic item metadata	public
41349	Savage Saronite Gauntlets	armor	intrinsic item metadata	public
41350	Savage Saronite Skullshield	armor	intrinsic item metadata	public
41351	Savage Saronite Pauldrons	armor	intrinsic item metadata	public
41352	Savage Saronite Waistguard	armor	intrinsic item metadata	public
41353	Savage Saronite Hauberk	armor	intrinsic item metadata	public
41354	Savage Saronite Bracers	armor	intrinsic item metadata	public
41355	Vengeance Bindings	armor	intrinsic item metadata	public
41356	Righteous Gauntlets	armor	intrinsic item metadata	public
41357	Daunting Handguards	armor	intrinsic item metadata	public
41367	Dark Jade Focusing Lens	jewels	specialized bag and profession data	public
41374	[PH] Glass of Red Wine		placeholder item	excluded
41375	Tireless Skyflare Diamond	jewels	intrinsic item metadata	public
41376	Revitalizing Skyflare Diamond	jewels	intrinsic item metadata	public
41377	Shielded Skyflare Diamond	jewels	intrinsic item metadata	public
41378	Forlorn Skyflare Diamond	jewels	intrinsic item metadata	public
41379	Impassive Skyflare Diamond	jewels	intrinsic item metadata	public
41380	Austere Earthsiege Diamond	jewels	intrinsic item metadata	public
41381	Persistent Earthsiege Diamond	jewels	intrinsic item metadata	public
41382	Trenchant Earthsiege Diamond	jewels	intrinsic item metadata	public
41383	Titansteel Bonecrusher	weapons	intrinsic item metadata	public
41384	Titansteel Guardian	weapons	intrinsic item metadata	public
41385	Invigorating Earthsiege Diamond	jewels	intrinsic item metadata	public
41386	Spiked Titansteel Helm	armor	intrinsic item metadata	public
41387	Tempered Titansteel Helm	armor	intrinsic item metadata	public
41388	Brilliant Titansteel Helm	armor	intrinsic item metadata	public
41389	Beaming Earthsiege Diamond	jewels	intrinsic item metadata	public
41391	Spiked Titansteel Treads	armor	intrinsic item metadata	public
41392	Tempered Titansteel Treads	armor	intrinsic item metadata	public
41394	Brilliant Titansteel Treads	armor	intrinsic item metadata	public
41395	Bracing Earthsiege Diamond	jewels	intrinsic item metadata	public
41396	Eternal Earthsiege Diamond	jewels	intrinsic item metadata	public
41397	Powerful Earthsiege Diamond	jewels	intrinsic item metadata	public
41398	Relentless Earthsiege Diamond	jewels	intrinsic item metadata	public
41400	Thundering Skyflare Diamond	jewels	intrinsic item metadata	public
41401	Insightful Earthsiege Diamond	jewels	intrinsic item metadata	public
41403	ZZOLD Design: Insightful Earthsiege Diamond		obsolete client record	excluded
41404	ZZOLD Design: Bracing Earthsiege Diamond		obsolete client record	excluded
41405	ZZOLD Design: Eternal Earthsiege Diamond		obsolete client record	excluded
41406	ZZOLD Design: Powerful Earthsiege Diamond		obsolete client record	excluded
41407	ZZOLD Design: Relentless Earthsiege Diamond		obsolete client record	excluded
41408	ZZOLD Design: Austere Earthsiege Diamond		obsolete client record	excluded
41409	ZZOLD Design: Persistent Earthsiege Diamond		obsolete client record	excluded
41410	ZZOLD Design: Trenchant Earthsiege Diamond		obsolete client record	excluded
41411	ZZOLD Design: Invigorating Earthsiege Diamond		obsolete client record	excluded
41412	ZZOLD Design: Beaming Earthsiege Diamond		obsolete client record	excluded
41413	ZZOLD Design: Revitalizing Skyflare Diamond		obsolete client record	excluded
41414	ZZOLD Design: Effulgent Skyflare Diamond		obsolete client record	excluded
41415	ZZOLD Design: Tireless Skyflare Diamond		obsolete client record	excluded
41416	ZZOLD Design: Forlorn Skyflare Diamond		obsolete client record	excluded
41417	ZZOLD Design: Impassive Skyflare Diamond		obsolete client record	excluded
41418	ZZOLD Design: Chaotic Skyflare Diamond		obsolete client record	excluded
41419	ZZOLD Design: Destructive Skyflare Diamond		obsolete client record	excluded
41420	ZZOLD Design: Ember Skyflare Diamond		obsolete client record	excluded
41421	ZZOLD Design: Enigmatic Skyflare Diamond		obsolete client record	excluded
41422	ZZOLD Design: Swift Skyflare Diamond		obsolete client record	excluded
41423	ZZOLDDesign: Thundering Skyflare Diamond		obsolete client record	excluded
41429	Perfect Deadly Huge Citrine	jewels	intrinsic item metadata	public
41432	Perfect Bold Bloodstone	jewels	intrinsic item metadata	public
41433	Perfect Delicate Bloodstone	jewels	intrinsic item metadata	public
41434	Perfect Delicate Bloodstone	jewels	intrinsic item metadata	public
41435	Perfect Flashing Bloodstone	jewels	intrinsic item metadata	public
41436	Perfect Smooth Sun Crystal	jewels	intrinsic item metadata	public
41437	Perfect Precise Bloodstone	jewels	intrinsic item metadata	public
41438	Perfect Brilliant Bloodstone	jewels	intrinsic item metadata	public
41439	Perfect Subtle Sun Crystal	jewels	intrinsic item metadata	public
41440	Perfect Sparkling Chalcedony	jewels	intrinsic item metadata	public
41441	Perfect Solid Chalcedony	jewels	intrinsic item metadata	public
41442	Perfect Sparkling Chalcedony	jewels	intrinsic item metadata	public
41443	Perfect Stormy Chalcedony	jewels	intrinsic item metadata	public
41444	Perfect Brilliant Bloodstone	jewels	intrinsic item metadata	public
41445	Perfect Mystic Sun Crystal	jewels	intrinsic item metadata	public
41446	Perfect Quick Sun Crystal	jewels	intrinsic item metadata	public
41447	Perfect Rigid Chalcedony	jewels	intrinsic item metadata	public
41448	Perfect Smooth Sun Crystal	jewels	intrinsic item metadata	public
41449	Perfect Subtle Sun Crystal	jewels	intrinsic item metadata	public
41450	Perfect Shifting Shadow Crystal	jewels	intrinsic item metadata	public
41451	Perfect Defender's Shadow Crystal	jewels	intrinsic item metadata	public
41452	Perfect Timeless Shadow Crystal	jewels	intrinsic item metadata	public
41453	Perfect Guardian's Shadow Crystal	jewels	intrinsic item metadata	public
41454	Perfect Glinting Shadow Crystal	jewels	intrinsic item metadata	public
41455	Perfect Mysterious Shadow Crystal	jewels	intrinsic item metadata	public
41456	Perfect Jagged Dark Jade	jewels	intrinsic item metadata	public
41457	Perfect Purified Shadow Crystal	jewels	intrinsic item metadata	public
41458	Perfect Regal Dark Jade	jewels	intrinsic item metadata	public
41459	Perfect Purified Shadow Crystal	jewels	intrinsic item metadata	public
41460	Perfect Shifting Shadow Crystal	jewels	intrinsic item metadata	public
41461	Perfect Sovereign Shadow Crystal	jewels	intrinsic item metadata	public
41462	Perfect Glinting Shadow Crystal	jewels	intrinsic item metadata	public
41463	Perfect Purified Shadow Crystal	jewels	intrinsic item metadata	public
41464	Perfect Regal Dark Jade	jewels	intrinsic item metadata	public
41465	Perfect Energized Dark Jade	jewels	intrinsic item metadata	public
41466	Perfect Forceful Dark Jade	jewels	intrinsic item metadata	public
41467	Perfect Energized Dark Jade	jewels	intrinsic item metadata	public
41468	Perfect Jagged Dark Jade	jewels	intrinsic item metadata	public
41469	Perfect Lightning Dark Jade	jewels	intrinsic item metadata	public
41470	Perfect Misty Dark Jade	jewels	intrinsic item metadata	public
41471	Perfect Turbid Dark Jade	jewels	intrinsic item metadata	public
41472	Perfect Radiant Dark Jade	jewels	intrinsic item metadata	public
41473	Perfect Purified Shadow Crystal	jewels	intrinsic item metadata	public
41474	Perfect Shattered Dark Jade	jewels	intrinsic item metadata	public
41475	Perfect Lightning Dark Jade	jewels	intrinsic item metadata	public
41476	Perfect Steady Dark Jade	jewels	intrinsic item metadata	public
41477	Perfect Misty Dark Jade	jewels	intrinsic item metadata	public
41478	Perfect Radiant Dark Jade	jewels	intrinsic item metadata	public
41479	Perfect Timeless Shadow Crystal	jewels	intrinsic item metadata	public
41480	Perfect Turbid Dark Jade	jewels	intrinsic item metadata	public
41481	Perfect Nimble Dark Jade	jewels	intrinsic item metadata	public
41482	Perfect Accurate Shadow Crystal	jewels	intrinsic item metadata	public
41483	Perfect Champion's Huge Citrine	jewels	intrinsic item metadata	public
41484	Perfect Deadly Huge Citrine	jewels	intrinsic item metadata	public
41485	Perfect Deft Huge Citrine	jewels	intrinsic item metadata	public
41486	Perfect Willful Huge Citrine	jewels	intrinsic item metadata	public
41487	Perfect Lucent Huge Citrine	jewels	intrinsic item metadata	public
41488	Perfect Etched Shadow Crystal	jewels	intrinsic item metadata	public
41489	Perfect Fierce Huge Citrine	jewels	intrinsic item metadata	public
41490	Perfect Stalwart Huge Citrine	jewels	intrinsic item metadata	public
41491	Perfect Glinting Shadow Crystal	jewels	intrinsic item metadata	public
41492	Perfect Inscribed Huge Citrine	jewels	intrinsic item metadata	public
41493	Perfect Lucent Huge Citrine	jewels	intrinsic item metadata	public
41494	Perfect Purified Shadow Crystal	jewels	intrinsic item metadata	public
41495	Perfect Potent Huge Citrine	jewels	intrinsic item metadata	public
41496	Perfect Glinting Shadow Crystal	jewels	intrinsic item metadata	public
41497	Perfect Reckless Huge Citrine	jewels	intrinsic item metadata	public
41498	Perfect Resolute Huge Citrine	jewels	intrinsic item metadata	public
41499	Perfect Resplendent Huge Citrine	jewels	intrinsic item metadata	public
41500	Perfect Stalwart Huge Citrine	jewels	intrinsic item metadata	public
41501	Perfect Deft Huge Citrine	jewels	intrinsic item metadata	public
41502	Perfect Veiled Shadow Crystal	jewels	intrinsic item metadata	public
41508	Mechano-Hog	engineering	specialized bag and profession data	public
41509	Frostweave Net	tailoring	single crafted-product category	public
41510	Bolt of Frostweave	cloth	intrinsic item metadata	public
41511	Bolt of Imbued Frostweave	cloth	intrinsic item metadata	public
41512	Frostwoven Wristwraps	armor	intrinsic item metadata	public
41513	Frostwoven Shoulders	armor	intrinsic item metadata	public
41515	Frostwoven Robe	armor	intrinsic item metadata	public
41516	Frostsavage Gloves	armor	intrinsic item metadata	public
41517	Glyph of Unstable Earth	inscription	intrinsic item metadata	public
41518	Glyph of Chain Lightning	inscription	intrinsic item metadata	public
41519	Frostwoven Leggings	armor	intrinsic item metadata	public
41520	Frostwoven Boots	armor	intrinsic item metadata	public
41521	Frostwoven Cowl	armor	intrinsic item metadata	public
41522	Frostwoven Belt	armor	intrinsic item metadata	public
41523	Mystic Frostwoven Shoulders	armor	intrinsic item metadata	public
41524	Glyph of Spirit Walk	inscription	intrinsic item metadata	public
41525	Mystic Frostwoven Robe	armor	intrinsic item metadata	public
41526	Glyph of Capacitor Totem	inscription	intrinsic item metadata	public
41527	Glyph of Purge	inscription	intrinsic item metadata	public
41528	Mystic Frostwoven Wristwraps	armor	intrinsic item metadata	public
41529	Glyph of Fire Elemental Totem	inscription	intrinsic item metadata	public
41530	Glyph of Fire Nova	inscription	intrinsic item metadata	public
41531	Glyph of Flame Shock	inscription	intrinsic item metadata	public
41532	Glyph of Wind Shear	inscription	intrinsic item metadata	public
41533	Glyph of Healing Stream Totem	inscription	intrinsic item metadata	public
41534	Glyph of Healing Wave	inscription	intrinsic item metadata	public
41535	Glyph of Totemic Recall	inscription	intrinsic item metadata	public
41536	Glyph of Telluric Currents	inscription	intrinsic item metadata	public
41537	Glyph of the Lakestrider	inscription	intrinsic item metadata	public
41538	Glyph of Grounding Totem	inscription	intrinsic item metadata	public
41539	Glyph of Spiritwalker's Grace	inscription	intrinsic item metadata	public
41540	Glyph of Lava Lash	inscription	intrinsic item metadata	public
41541	Glyph of Water Shield	inscription	intrinsic item metadata	public
41542	Glyph of Cleansing Waters	inscription	intrinsic item metadata	public
41543	Duskweave Belt	armor	intrinsic item metadata	public
41544	Duskweave Boots	armor	intrinsic item metadata	public
41545	Duskweave Gloves	armor	intrinsic item metadata	public
41546	Duskweave Cowl	armor	intrinsic item metadata	public
41547	Glyph of Frost Shock	inscription	intrinsic item metadata	public
41548	Duskweave Leggings	armor	intrinsic item metadata	public
41549	Duskweave Robe	armor	intrinsic item metadata	public
41550	Duskweave Shoulders	armor	intrinsic item metadata	public
41551	Duskweave Wristwraps	armor	intrinsic item metadata	public
41552	Glyph of Chaining	inscription	intrinsic item metadata	public
41553	Black Duskweave Leggings	armor	intrinsic item metadata	public
41554	Black Duskweave Robe	armor	intrinsic item metadata	public
41555	Black Duskweave Wristwraps	armor	intrinsic item metadata	public
41593	Ebonweave	cloth	intrinsic item metadata	public
41594	Moonshroud	cloth	intrinsic item metadata	public
41595	Spellweave	cloth	intrinsic item metadata	public
41597	Abyssal Bag	bags	intrinsic item metadata	public
41598	Mysterious Bag	bags	intrinsic item metadata	public
41599	Frostweave Bag	bags	intrinsic item metadata	public
41600	Glacial Bag	bags	intrinsic item metadata	public
41601	Shining Spellthread	enchanting	intrinsic item metadata	public
41602	Brilliant Spellthread	enchanting	intrinsic item metadata	public
41603	Azure Spellthread	enchanting	intrinsic item metadata	public
41604	Sapphire Spellthread	enchanting	intrinsic item metadata	public
41607	Cloak of the Moon	armor	intrinsic item metadata	public
41608	Cloak of Frozen Spirits	armor	intrinsic item metadata	public
41609	Wispcloak	armor	intrinsic item metadata	public
41610	Deathchill Cloak	armor	intrinsic item metadata	public
41611	Eternal Belt Buckle	enchanting	intrinsic item metadata	public
41729	Stewed Drakeflesh	food	intrinsic item metadata	public
41731	Yeti Milk	food	intrinsic item metadata	public
41741	Cobalt Rod	enchanting	intrinsic item metadata	public
41745	Titanium Rod	enchanting	intrinsic item metadata	public
41751	Black Mushroom	food	intrinsic item metadata	public
41777	Design: Etched Twilight Opal	jewels	intrinsic item metadata	public
41778	Design: Resolute Monarch Topaz	jewels	intrinsic item metadata	public
41779	Design: Stalwart Monarch Topaz	jewels	intrinsic item metadata	public
41780	Design: Champion's Monarch Topaz	jewels	intrinsic item metadata	public
41781	Design: Misty Forest Emerald	jewels	intrinsic item metadata	public
41782	Design: Lightning Forest Emerald	jewels	intrinsic item metadata	public
41783	Design: Purified Twilight Opal	jewels	intrinsic item metadata	public
41784	Design: Sovereign Twilight Opal	jewels	intrinsic item metadata	public
41785	Design: Glinting Twilight Opal	jewels	intrinsic item metadata	public
41786	Design: Destructive Skyflare Diamond	jewels	intrinsic item metadata	public
41787	Design: Thundering Skyflare Diamond	jewels	intrinsic item metadata	public
41788	Design: Beaming Earthsiege Diamond	jewels	intrinsic item metadata	public
41789	Design: Inscribed Monarch Topaz	jewels	intrinsic item metadata	public
41800	Deep Sea Monsterbelly	fish	intrinsic item metadata	public
41801	Moonglow Cuttlefish	fish	intrinsic item metadata	public
41802	Imperial Manta Ray	fish	intrinsic item metadata	public
41803	Rockfin Grouper	fish	intrinsic item metadata	public
41804	Icemouth Waveskipper	fish	intrinsic item metadata	public
41805	Borean Man O' War	fish	intrinsic item metadata	public
41806	Musselback Sculpin	fish	intrinsic item metadata	public
41807	Dragonfin Angelfish	fish	intrinsic item metadata	public
41808	Bonescale Snapper	fish	intrinsic item metadata	public
41809	Glacial Salmon	fish	intrinsic item metadata	public
41810	Fangtooth Herring	fish	intrinsic item metadata	public
41811	Meltwater Beardfish	fish	intrinsic item metadata	public
41812	Barrelhead Goby	fish	intrinsic item metadata	public
41813	Nettlefish	fish	intrinsic item metadata	public
41814	Glassfin Minnow	fish	intrinsic item metadata	public
41974	Cobalt Bracers	armor	intrinsic item metadata	public
41975	Cobalt Gauntlets	armor	intrinsic item metadata	public
41976	Titanium Weapon Chain	enchanting	intrinsic item metadata	public
41984	Hat of Wintry Doom	armor	intrinsic item metadata	public
41985	Silky Iceshard Boots	armor	intrinsic item metadata	public
41986	Deep Frozen Cord	armor	intrinsic item metadata	public
42093	Frostmoon Pants	armor	intrinsic item metadata	public
42095	Light Blessed Mittens	armor	intrinsic item metadata	public
42096	Aurora Slippers	armor	intrinsic item metadata	public
42100	Moonshroud Robe	armor	intrinsic item metadata	public
42101	Ebonweave Robe	armor	intrinsic item metadata	public
42102	Spellweave Robe	armor	intrinsic item metadata	public
42103	Moonshroud Gloves	armor	intrinsic item metadata	public
42111	Ebonweave Gloves	armor	intrinsic item metadata	public
42113	Spellweave Gloves	armor	intrinsic item metadata	public
42172	Pattern: Red Lumberjack Shirt	tailoring	intrinsic item metadata	public
42173	Pattern: Blue Lumberjack Shirt	tailoring	intrinsic item metadata	public
42174	Pattern: Yellow Lumberjack Shirt	tailoring	intrinsic item metadata	public
42175	Pattern: Green Lumberjack Shirt	tailoring	intrinsic item metadata	public
42176	Pattern: Blue Workman's Shirt	tailoring	intrinsic item metadata	public
42177	Pattern: Red Workman's Shirt	tailoring	intrinsic item metadata	public
42178	Pattern: Rustic Workman's Shirt	tailoring	intrinsic item metadata	public
42179	Pattern: Green Workman's Shirt	tailoring	intrinsic item metadata	public
42225	Dragon's Eye	jewels	intrinsic item metadata	public
42253	Iceweb Spider Silk	cloth	intrinsic item metadata	public
42336	Bloodstone Band	armor	intrinsic item metadata	public
42337	Sun Rock Ring	armor	intrinsic item metadata	public
42338	Jade Dagger Pendant	armor	intrinsic item metadata	public
42339	Blood Sun Necklace	armor	intrinsic item metadata	public
42340	Dream Signet	armor	intrinsic item metadata	public
42396	Glyph of Circle of Healing	inscription	intrinsic item metadata	public
42397	Glyph of Purify	inscription	intrinsic item metadata	public
42398	Glyph of Fade	inscription	intrinsic item metadata	public
42399	Glyph of Fear Ward	inscription	intrinsic item metadata	public
42400	Glyph of Inner Sanctum	inscription	intrinsic item metadata	public
42401	Glyph of Holy Nova	inscription	intrinsic item metadata	public
42402	Glyph of Inner Fire	inscription	intrinsic item metadata	public
42403	Glyph of Deep Wells	inscription	intrinsic item metadata	public
42404	Glyph of Mass Dispel	inscription	intrinsic item metadata	public
42405	Glyph of Psychic Horror	inscription	intrinsic item metadata	public
42406	Glyph of Holy Fire	inscription	intrinsic item metadata	public
42407	Glyph of Weakened Soul	inscription	intrinsic item metadata	public
42408	Glyph of Power Word: Shield	inscription	intrinsic item metadata	public
42409	Glyph of Spirit of Redemption	inscription	intrinsic item metadata	public
42410	Glyph of Psychic Scream	inscription	intrinsic item metadata	public
42411	Glyph of Renew	inscription	intrinsic item metadata	public
42412	Glyph of Scourge Imprisonment	inscription	intrinsic item metadata	public
42414	Glyph of Mind Blast	inscription	intrinsic item metadata	public
42415	Glyph of Dispel Magic	inscription	intrinsic item metadata	public
42416	Glyph of Smite	inscription	intrinsic item metadata	public
42417	Glyph of Prayer of Mending	inscription	intrinsic item metadata	public
42420	Shadow Crystal Focusing Lens	jewels	specialized bag and profession data	public
42421	Shadow Jade Focusing Lens	jewels	specialized bag and profession data	public
42428	Carrot Cupcake	food	intrinsic item metadata	public
42429	Red Velvet Cupcake	food	intrinsic item metadata	public
42430	Dalaran Doughnut	food	intrinsic item metadata	public
42431	Dalaran Brownie	food	intrinsic item metadata	public
42432	Berry Pie Slice	food	intrinsic item metadata	public
42433	Chocolate Cake Slice	food	intrinsic item metadata	public
42434	Lovely Cake Slice	food	intrinsic item metadata	public
42435	Titansteel Shanker	weapons	intrinsic item metadata	public
42443	Cudgel of Saronite Justice	weapons	intrinsic item metadata	public
42453	Glyph of Hand of Gul'dan	inscription	intrinsic item metadata	public
42454	Glyph of Conflagrate	inscription	intrinsic item metadata	public
42455	Glyph of Siphon Life	inscription	intrinsic item metadata	public
42456	Glyph of Verdant Spheres	inscription	intrinsic item metadata	public
42457	Glyph of Nightmares	inscription	intrinsic item metadata	public
42458	Glyph of Fear	inscription	intrinsic item metadata	public
42459	Glyph of Felguard	inscription	intrinsic item metadata	public
42460	Glyph of Demon Training	inscription	intrinsic item metadata	public
42461	Glyph of Health Funnel	inscription	intrinsic item metadata	public
42462	Glyph of Healthstone	inscription	intrinsic item metadata	public
42463	Glyph of Subtlety	inscription	intrinsic item metadata	public
42464	Glyph of Curse of the Elements	inscription	intrinsic item metadata	public
42465	Glyph of Imp Swarm	inscription	intrinsic item metadata	public
42466	Glyph of Havoc	inscription	intrinsic item metadata	public
42467	Glyph of Shadow Bolt	inscription	intrinsic item metadata	public
42468	Faded Glyph	inscription	specialized bag and profession data	public
42469	Charred Glyph	inscription	specialized bag and profession data	public
42470	Glyph of Soulstone	inscription	intrinsic item metadata	public
42471	Glyph of Carrion Swarm	inscription	intrinsic item metadata	public
42472	Glyph of Unstable Affliction	inscription	intrinsic item metadata	public
42473	Glyph of Falling Meteor	inscription	intrinsic item metadata	public
42500	Titanium Shield Spike	enchanting	intrinsic item metadata	public
42508	Titansteel Shield Wall	armor	intrinsic item metadata	public
42545	Runic Mana Injector	alchemy	intrinsic item metadata	public
42546	Mana Injector Kit	engineering	specialized bag and profession data	public
42548	Deprecated Speed Potion Injector		deprecated client record	excluded
42641	Global Thermal Sapper Charge	engineering	specialized bag and profession data	public
42642	Titanium Impact Band	armor	intrinsic item metadata	public
42643	Titanium Earthguard Ring	armor	intrinsic item metadata	public
42644	Titanium Spellshock Ring	armor	intrinsic item metadata	public
42645	Titanium Impact Choker	armor	intrinsic item metadata	public
42646	Titanium Earthguard Chain	armor	intrinsic item metadata	public
42647	Titanium Spellshock Necklace	armor	intrinsic item metadata	public
42701	Enchanted Pearl	jewels	intrinsic item metadata	public
42702	Enchanted Tear	jewels	intrinsic item metadata	public
42723	Ornate Saronite Bracers	armor	intrinsic item metadata	public
42724	Ornate Saronite Gauntlets	armor	intrinsic item metadata	public
42725	Ornate Saronite Hauberk	armor	intrinsic item metadata	public
42726	Ornate Saronite Legplates	armor	intrinsic item metadata	public
42727	Ornate Saronite Pauldrons	armor	intrinsic item metadata	public
42728	Ornate Saronite Skullshield	armor	intrinsic item metadata	public
42729	Ornate Saronite Waistguard	armor	intrinsic item metadata	public
42730	Ornate Saronite Walkers	armor	intrinsic item metadata	public
42731	Leggings of Visceral Strikes	armor	intrinsic item metadata	public
42734	Charred Glyph	inscription	specialized bag and profession data	public
42735	Glyph of Loose Mana	inscription	intrinsic item metadata	public
42736	Glyph of Arcane Explosion	inscription	intrinsic item metadata	public
42737	Glyph of Blink	inscription	intrinsic item metadata	public
42738	Glyph of Evocation	inscription	intrinsic item metadata	public
42739	Glyph of Combustion	inscription	intrinsic item metadata	public
42740	Charred Glyph	inscription	specialized bag and profession data	public
42741	Glyph of Frost Nova	inscription	intrinsic item metadata	public
42742	Faded Glyph	inscription	specialized bag and profession data	public
42743	Glyph of Momentum	inscription	intrinsic item metadata	public
42744	Glyph of Ice Block	inscription	intrinsic item metadata	public
42745	Glyph of Splitting Ice	inscription	intrinsic item metadata	public
42746	Glyph of Cone of Cold	inscription	intrinsic item metadata	public
42747	Charred Glyph	inscription	specialized bag and profession data	public
42748	Glyph of Rapid Displacement	inscription	intrinsic item metadata	public
42749	Glyph of Mana Gem	inscription	intrinsic item metadata	public
42750	Charred Glyph	inscription	specialized bag and profession data	public
42751	Glyph of Crittermorph	inscription	intrinsic item metadata	public
42752	Glyph of Polymorph	inscription	intrinsic item metadata	public
42753	Glyph of Icy Veins	inscription	intrinsic item metadata	public
42754	Glyph of Spellsteal	inscription	intrinsic item metadata	public
42777	Crusader's Waterskin	food	intrinsic item metadata	public
42778	Crusader's Rations	food	intrinsic item metadata	public
42779	Steaming Chicken Soup	food	intrinsic item metadata	public
42897	Glyph of Aspects	inscription	intrinsic item metadata	public
42898	Glyph of Camouflage	inscription	intrinsic item metadata	public
42899	Glyph of Liberation	inscription	intrinsic item metadata	public
42900	Glyph of Mending	inscription	intrinsic item metadata	public
42901	Glyph of Distracting Shot	inscription	intrinsic item metadata	public
42902	Glyph of Endless Wrath	inscription	intrinsic item metadata	public
42903	Glyph of Deterrence	inscription	intrinsic item metadata	public
42904	Glyph of Disengage	inscription	intrinsic item metadata	public
42905	Glyph of Freezing Trap	inscription	intrinsic item metadata	public
42906	Glyph of Ice Trap	inscription	intrinsic item metadata	public
42907	Glyph of Misdirection	inscription	intrinsic item metadata	public
42908	Glyph of Explosive Trap	inscription	intrinsic item metadata	public
42909	Glyph of Animal Bond	inscription	intrinsic item metadata	public
42910	Glyph of No Escape	inscription	intrinsic item metadata	public
42911	Glyph of Pathfinding	inscription	intrinsic item metadata	public
42912	Glyph of Tame Beast	inscription	intrinsic item metadata	public
42913	Glyph of Snake Trap	inscription	intrinsic item metadata	public
42914	Glyph of Aimed Shot	inscription	intrinsic item metadata	public
42915	Glyph of Mend Pet	inscription	intrinsic item metadata	public
42916	Charred Glyph	inscription	specialized bag and profession data	public
42917	Glyph of Solace	inscription	intrinsic item metadata	public
42942	Baked Manta Ray	food	intrinsic item metadata	public
42954	Glyph of Shadow Walk	inscription	intrinsic item metadata	public
42955	Glyph of Ambush	inscription	intrinsic item metadata	public
42956	Glyph of Decoy	inscription	intrinsic item metadata	public
42957	Glyph of Blade Flurry	inscription	intrinsic item metadata	public
42958	Glyph of Sharp Knives	inscription	intrinsic item metadata	public
42959	Glyph of Recuperate	inscription	intrinsic item metadata	public
42960	Glyph of Evasion	inscription	intrinsic item metadata	public
42961	Glyph of Recovery	inscription	intrinsic item metadata	public
42962	Glyph of Expose Armor	inscription	intrinsic item metadata	public
42963	Glyph of Feint	inscription	intrinsic item metadata	public
42964	Glyph of Garrote	inscription	intrinsic item metadata	public
42965	Glyph of Detection	inscription	intrinsic item metadata	public
42966	Glyph of Gouge	inscription	intrinsic item metadata	public
42967	Glyph of Hemorrhage	inscription	intrinsic item metadata	public
42968	Glyph of Smoke Bomb	inscription	intrinsic item metadata	public
42969	Glyph of Cheap Shot	inscription	intrinsic item metadata	public
42970	Glyph of Hemorraghing Veins	inscription	intrinsic item metadata	public
42971	Glyph of Kick	inscription	intrinsic item metadata	public
42972	Glyph of Redirect	inscription	intrinsic item metadata	public
42973	Glyph of Shiv	inscription	intrinsic item metadata	public
42974	Glyph of Sprint	inscription	intrinsic item metadata	public
42986	The RP-GG	engineering	specialized bag and profession data	public
42993	Spicy Fried Herring	food	intrinsic item metadata	public
42994	Rhinolicious Wormsteak	food	intrinsic item metadata	public
42995	Hearty Rhino	food	intrinsic item metadata	public
42996	Snapper Extreme	food	intrinsic item metadata	public
42997	Blackened Worg Steak	food	intrinsic item metadata	public
42998	Cuttlesteak	food	intrinsic item metadata	public
42999	Blackened Dragonfin	food	intrinsic item metadata	public
43000	Dragonfin Filet	food	intrinsic item metadata	public
43001	Tracker Snacks	food	intrinsic item metadata	public
43002	Inflatable Land Mines	engineering	specialized bag and profession data	public
43004	Critter Bites	food	intrinsic item metadata	public
43005	Spiced Mammoth Treats	food	intrinsic item metadata	public
43007	Northern Spices	fish	single profession category	public
43009	Shoveltusk Flank	fish	intrinsic item metadata	public
43010	Worm Meat	fish	intrinsic item metadata	public
43011	Worg Haunch	fish	intrinsic item metadata	public
43012	Rhino Meat	fish	intrinsic item metadata	public
43013	Chilled Meat	fish	intrinsic item metadata	public
43015	Fish Feast	food	intrinsic item metadata	public
43038	The Naked Bomb	engineering	specialized bag and profession data	public
43086	Fresh Apple Juice	food	intrinsic item metadata	public
43087	Crisp Dalaran Apple	food	intrinsic item metadata	public
43097	Fur Lining - Attack Power	enchanting	intrinsic item metadata	public
43098	Ochre Pigment [PH]		placeholder item	excluded
43102	Frozen Orb	profession_supplies	curated shared crafting reagent	public
43103	Verdant Pigment	inscription	specialized bag and profession data	public
43104	Burnt Pigment	inscription	specialized bag and profession data	public
43105	Indigo Pigment	inscription	specialized bag and profession data	public
43106	Ruby Pigment	inscription	specialized bag and profession data	public
43107	Sapphire Pigment	inscription	specialized bag and profession data	public
43108	Ebon Pigment	inscription	specialized bag and profession data	public
43109	Icy Pigment	inscription	specialized bag and profession data	public
43115	Hunter's Ink	inscription	specialized bag and profession data	public
43116	Lion's Ink	inscription	specialized bag and profession data	public
43117	Dawnstar Ink	inscription	specialized bag and profession data	public
43118	Jadefire Ink	inscription	specialized bag and profession data	public
43119	Royal Ink	inscription	specialized bag and profession data	public
43120	Celestial Ink	inscription	specialized bag and profession data	public
43121	Fiery Ink	inscription	specialized bag and profession data	public
43122	Shimmering Ink	inscription	specialized bag and profession data	public
43123	Ink of the Sky	inscription	specialized bag and profession data	public
43124	Ethereal Ink	inscription	specialized bag and profession data	public
43125	Darkflame Ink	inscription	specialized bag and profession data	public
43126	Ink of the Sea	inscription	specialized bag and profession data	public
43127	Snowfall Ink	inscription	specialized bag and profession data	public
43129	Razorstrike Breastplate	armor	intrinsic item metadata	public
43130	Virulent Spaulders	armor	intrinsic item metadata	public
43131	Eaglebane Bracers	armor	intrinsic item metadata	public
43132	Nightshock Hood	armor	intrinsic item metadata	public
43133	Nightshock Girdle	armor	intrinsic item metadata	public
43145	Ruined Vellum	enchanting	curated player-facing category	public
43146	Ruined Vellum	enchanting	curated player-facing category	public
43236	Star's Sorrow	food	intrinsic item metadata	public
43244	Crystal Citrine Necklace	armor	intrinsic item metadata	public
43245	Crystal Chalcedony Amulet	armor	intrinsic item metadata	public
43248	Stoneguard Band	armor	intrinsic item metadata	public
43249	Shadowmight Ring	armor	intrinsic item metadata	public
43250	Ring of Earthen Might	armor	intrinsic item metadata	public
43251	Ring of Scarlet Shadows	armor	intrinsic item metadata	public
43252	Windfire Band	armor	intrinsic item metadata	public
43253	Ring of Northern Tears	armor	intrinsic item metadata	public
43255	Seafoam Gauntlets	armor	intrinsic item metadata	public
43256	Jormscale Footpads	armor	intrinsic item metadata	public
43257	Wildscale Breastplate	armor	intrinsic item metadata	public
43258	Purehorn Spaulders	armor	intrinsic item metadata	public
43260	Eviscerator's Facemask	armor	intrinsic item metadata	public
43261	Overcast Headguard	armor	intrinsic item metadata	public
43262	Overcast Spaulders	armor	intrinsic item metadata	public
43263	Overcast Chestguard	armor	intrinsic item metadata	public
43264	Overcast Bracers	armor	intrinsic item metadata	public
43265	Overcast Handwraps	armor	intrinsic item metadata	public
43266	Overcast Belt	armor	intrinsic item metadata	public
43268	Dalaran Clam Chowder	food	intrinsic item metadata	public
43271	Overcast Leggings	armor	intrinsic item metadata	public
43273	Overcast Boots	armor	intrinsic item metadata	public
43316	Glyph of Aquatic Form	inscription	intrinsic item metadata	public
43331	Glyph of Blooming	inscription	intrinsic item metadata	public
43332	Glyph of Grace	inscription	intrinsic item metadata	public
43334	Glyph of the Chameleon	inscription	intrinsic item metadata	public
43335	Glyph of Charm Woodland Creature	inscription	intrinsic item metadata	public
43336	Deprecated Glyph of the Black Bear		deprecated client record	excluded
43337	Deprecated Glyph of the Forest Lynx		deprecated client record	excluded
43338	Glyph of Revive Pet	inscription	intrinsic item metadata	public
43339	Glyph of the Porcupine	inscription	intrinsic item metadata	public
43340	Glyph of the Mounted King	inscription	intrinsic item metadata	public
43342	Glyph of Shadow Ravens	inscription	intrinsic item metadata	public
43343	Glyph of Pick Pocket	inscription	intrinsic item metadata	public
43344	Glyph of Healing Storm	inscription	intrinsic item metadata	public
43350	Glyph of Lesser Proportion	inscription	intrinsic item metadata	public
43351	Glyph of Fireworks	inscription	intrinsic item metadata	public
43354	Charred Glyph	inscription	specialized bag and profession data	public
43355	Glyph of Aspect of the Pack	inscription	intrinsic item metadata	public
43356	Glyph of Stampede	inscription	intrinsic item metadata	public
43357	Charred Glyph	inscription	specialized bag and profession data	public
43359	Glyph of Conjure Familiar	inscription	intrinsic item metadata	public
43360	Glyph of the Monkey	inscription	intrinsic item metadata	public
43361	Glyph of the Penguin	inscription	intrinsic item metadata	public
43362	Glyph of the Bear Cub	inscription	intrinsic item metadata	public
43364	Glyph of Arcane Language	inscription	intrinsic item metadata	public
43365	Glyph of Contemplation	inscription	intrinsic item metadata	public
43366	Glyph of Winged Vengeance	inscription	intrinsic item metadata	public
43367	Glyph of Flash of Light	inscription	intrinsic item metadata	public
43368	Glyph of Seal of Blood	inscription	intrinsic item metadata	public
43369	Glyph of Fire From the Heavens	inscription	intrinsic item metadata	public
43370	Glyph of Levitate	inscription	intrinsic item metadata	public
43371	Glyph of Borrowed Time	inscription	intrinsic item metadata	public
43372	Glyph of Reflective Shield	inscription	intrinsic item metadata	public
43373	Glyph of Shackle Undead	inscription	intrinsic item metadata	public
43374	Glyph of Dark Archangel	inscription	intrinsic item metadata	public
43376	Glyph of Distract	inscription	intrinsic item metadata	public
43377	Glyph of Pick Lock	inscription	intrinsic item metadata	public
43378	Glyph of Safe Fall	inscription	intrinsic item metadata	public
43379	Glyph of Blurred Speed	inscription	intrinsic item metadata	public
43380	Glyph of Poisons	inscription	intrinsic item metadata	public
43381	Glyph of Astral Recall	inscription	intrinsic item metadata	public
43383	Deprecated Glyph of the Arctic Wolf		deprecated client record	excluded
43384	Deprecated Glyph of the Black Wolf		deprecated client record	excluded
43385	Glyph of Far Sight	inscription	intrinsic item metadata	public
43386	Glyph of the Spectral Wolf	inscription	intrinsic item metadata	public
43388	Glyph of Totemic Encirclement	inscription	intrinsic item metadata	public
43389	Glyph of Unending Breath	inscription	intrinsic item metadata	public
43390	Glyph of Soul Consumption	inscription	intrinsic item metadata	public
43391	Glyph of Eye of Kilrogg	inscription	intrinsic item metadata	public
43392	Glyph of Curse of Exhaustion	inscription	intrinsic item metadata	public
43393	Glyph of Subjugate Demon	inscription	intrinsic item metadata	public
43394	Glyph of Soulwell	inscription	intrinsic item metadata	public
43395	Glyph of Mystic Shout	inscription	intrinsic item metadata	public
43396	Glyph of Bloodcurdling Shout	inscription	intrinsic item metadata	public
43397	Glyph of Long Charge	inscription	intrinsic item metadata	public
43398	Glyph of Gushing Wound	inscription	intrinsic item metadata	public
43399	Glyph of Unending Rage	inscription	intrinsic item metadata	public
43400	Glyph of Mighty Victory	inscription	intrinsic item metadata	public
43412	Glyph of Bloody Healing	inscription	intrinsic item metadata	public
43413	Glyph of Enraged Speed	inscription	intrinsic item metadata	public
43414	Glyph of Hindering Strikes	inscription	intrinsic item metadata	public
43415	Glyph of Heavy Repercussions	inscription	intrinsic item metadata	public
43416	Glyph of Bloodthirst	inscription	intrinsic item metadata	public
43417	Glyph of Rude Interruption	inscription	intrinsic item metadata	public
43418	Glyph of Gag Order	inscription	intrinsic item metadata	public
43419	Glyph of Blitz	inscription	intrinsic item metadata	public
43420	Charred Glyph	inscription	specialized bag and profession data	public
43421	Glyph of Mortal Strike	inscription	intrinsic item metadata	public
43422	Glyph of Die by the Sword	inscription	intrinsic item metadata	public
43423	Glyph of Hamstring	inscription	intrinsic item metadata	public
43424	Glyph of Hold the Line	inscription	intrinsic item metadata	public
43425	Glyph of Shield Slam	inscription	intrinsic item metadata	public
43426	Charred Glyph	inscription	specialized bag and profession data	public
43427	Glyph of Hoarse Voice	inscription	intrinsic item metadata	public
43428	Glyph of Sweeping Strikes	inscription	intrinsic item metadata	public
43429	Charred Glyph	inscription	specialized bag and profession data	public
43430	Glyph of Resonating Power	inscription	intrinsic item metadata	public
43431	Glyph of Victory Rush	inscription	intrinsic item metadata	public
43432	Glyph of Raging Wind	inscription	intrinsic item metadata	public
43433	Eviscerator's Shoulderpads	armor	intrinsic item metadata	public
43434	Eviscerator's Chestguard	armor	intrinsic item metadata	public
43435	Eviscerator's Bindings	armor	intrinsic item metadata	public
43436	Eviscerator's Gauntlets	armor	intrinsic item metadata	public
43437	Eviscerator's Waistguard	armor	intrinsic item metadata	public
43438	Eviscerator's Legguards	armor	intrinsic item metadata	public
43439	Eviscerator's Treads	armor	intrinsic item metadata	public
43442	Swiftarrow Belt	armor	intrinsic item metadata	public
43443	Swiftarrow Boots	armor	intrinsic item metadata	public
43444	Swiftarrow Bracers	armor	intrinsic item metadata	public
43445	Swiftarrow Hauberk	armor	intrinsic item metadata	public
43446	Swiftarrow Gauntlets	armor	intrinsic item metadata	public
43447	Swiftarrow Helm	armor	intrinsic item metadata	public
43448	Swiftarrow Leggings	armor	intrinsic item metadata	public
43449	Swiftarrow Shoulderguards	armor	intrinsic item metadata	public
43450	Stormhide Belt	armor	intrinsic item metadata	public
43451	Stormhide Stompers	armor	intrinsic item metadata	public
43452	Stormhide Wristguards	armor	intrinsic item metadata	public
43453	Stormhide Hauberk	armor	intrinsic item metadata	public
43454	Stormhide Grips	armor	intrinsic item metadata	public
43455	Stormhide Crown	armor	intrinsic item metadata	public
43456	Stormhide Legguards	armor	intrinsic item metadata	public
43457	Stormhide Shoulders	armor	intrinsic item metadata	public
43458	Giantmaim Legguards	armor	intrinsic item metadata	public
43459	Giantmaim Bracers	armor	intrinsic item metadata	public
43461	Revenant's Breastplate	armor	intrinsic item metadata	public
43463	Scroll of Agility VII	inscription	specialized bag and profession data	public
43464	Scroll of Agility VIII	inscription	specialized bag and profession data	public
43465	Scroll of Strength VII	inscription	specialized bag and profession data	public
43466	Scroll of Strength VIII	inscription	specialized bag and profession data	public
43467	Scroll of Protection VII	inscription	specialized bag and profession data	public
43468	Scroll of Protection VIII	inscription	specialized bag and profession data	public
43469	Revenant's Treads	armor	intrinsic item metadata	public
43478	Gigantic Feast	food	intrinsic item metadata	public
43480	Small Feast	food	intrinsic item metadata	public
43481	Trollwoven Spaulders	armor	intrinsic item metadata	public
43482	Savage Titanium Ring	armor	intrinsic item metadata	public
43484	Trollwoven Girdle	armor	intrinsic item metadata	public
43488	Last Week's Mammoth	food	intrinsic item metadata	public
43490	Tasty Cupcake	food	intrinsic item metadata	public
43491	Bad Clams	food	intrinsic item metadata	public
43492	Haunted Herring	food	intrinsic item metadata	public
43495	Earthgiving Legguards	armor	intrinsic item metadata	public
43498	Savage Titanium Band	armor	intrinsic item metadata	public
43501	Northern Egg	fish	intrinsic item metadata	public
43502	Earthgiving Boots	armor	intrinsic item metadata	public
43515	Mystic Tome	armor	intrinsic item metadata	public
43530	Argent Mana Potion	alchemy	intrinsic item metadata	public
43531	Argent Healing Potion	alchemy	intrinsic item metadata	public
43533	Glyph of Anti-Magic Shell	inscription	intrinsic item metadata	public
43534	Glyph of Unholy Frenzy	inscription	intrinsic item metadata	public
43535	Glyph of the Geist	inscription	intrinsic item metadata	public
43536	Glyph of Icebound Fortitude	inscription	intrinsic item metadata	public
43537	Glyph of Chains of Ice	inscription	intrinsic item metadata	public
43538	Charred Glyph	inscription	specialized bag and profession data	public
43539	Glyph of Death's Embrace	inscription	intrinsic item metadata	public
43540	Deprecated Glyph		deprecated client record	excluded
43541	Glyph of Death Grip	inscription	intrinsic item metadata	public
43542	Glyph of Death and Decay	inscription	intrinsic item metadata	public
43543	Glyph of Shifting Presences	inscription	intrinsic item metadata	public
43544	Glyph of Horn of Winter	inscription	intrinsic item metadata	public
43545	Charred Glyph	inscription	specialized bag and profession data	public
43546	Glyph of Icy Touch	inscription	intrinsic item metadata	public
43547	Glyph of Enduring Infection	inscription	intrinsic item metadata	public
43548	Glyph of Pestilence	inscription	intrinsic item metadata	public
43549	Glyph of Mind Freeze	inscription	intrinsic item metadata	public
43550	Glyph of Army of the Dead	inscription	intrinsic item metadata	public
43551	Glyph of Foul Menagerie	inscription	intrinsic item metadata	public
43552	Glyph of Strangulate	inscription	intrinsic item metadata	public
43553	Glyph of Pillar of Frost	inscription	intrinsic item metadata	public
43554	Glyph of Vampiric Blood	inscription	intrinsic item metadata	public
43557	Poisonous Ivy Berries	inscription	specialized bag and profession data	public
43558	Nightbloom Lilac	inscription	specialized bag and profession data	public
43559	Locust Wing	inscription	specialized bag and profession data	public
43560	Firefly Dust	inscription	specialized bag and profession data	public
43561	Iridescent Pollen	inscription	specialized bag and profession data	public
43562	Nightmare Berries	inscription	specialized bag and profession data	public
43563	Frozen Beetle Husk	inscription	specialized bag and profession data	public
43565	Durable Nerubhide Cape	armor	intrinsic item metadata	public
43566	Ice Striker's Cloak	armor	intrinsic item metadata	public
43571	Sewer Carp	fish	intrinsic item metadata	public
43572	Magic Eater	fish	intrinsic item metadata	public
43582	Titanium Frostguard Ring	armor	intrinsic item metadata	public
43583	Glacial Robe	armor	intrinsic item metadata	public
43584	Glacial Waistband	armor	intrinsic item metadata	public
43585	Glacial Slippers	armor	intrinsic item metadata	public
43586	Icebane Chestguard	armor	intrinsic item metadata	public
43587	Icebane Girdle	armor	intrinsic item metadata	public
43588	Icebane Treads	armor	intrinsic item metadata	public
43590	Polar Vest	armor	intrinsic item metadata	public
43591	Polar Cord	armor	intrinsic item metadata	public
43592	Polar Boots	armor	intrinsic item metadata	public
43593	Icy Scale Chestguard	armor	intrinsic item metadata	public
43594	Icy Scale Belt	armor	intrinsic item metadata	public
43595	Icy Scale Boots	armor	intrinsic item metadata	public
43602	Deprecated Thriving Ink		deprecated client record	excluded
43603	Deprecated Demon's Blood Ink		deprecated client record	excluded
43604	Deprecated Gorefellow Ink		deprecated client record	excluded
43605	Deprecated Starshine Ink		deprecated client record	excluded
43606	Deprecated Void Ink		deprecated client record	excluded
43607	Deprecated Noble's Ink		deprecated client record	excluded
43614	Broken Wrath Elixir		broken internal record	excluded
43620	Broken Spellpower Elixir		broken internal record	excluded
43621	Broken Noggenfogger Elixir		broken internal record	excluded
43643	Prince Magni Bronzebeard's Silver Coin	fish	specialized bag and profession data	public
43644	A Peasant's Silver Coin	fish	specialized bag and profession data	public
43645	Bent Fishing Hook	fish	specialized bag and profession data	public
43646	Fountain Goldfish	fish	intrinsic item metadata	public
43647	Shimmering Minnow	fish	intrinsic item metadata	public
43652	Slippery Eel	fish	intrinsic item metadata	public
43653	Partially Eaten Fish	fish	specialized bag and profession data	public
43654	Tome of the Dawn	armor	intrinsic item metadata	public
43655	Book of Survival	armor	intrinsic item metadata	public
43656	Tome of Kings	armor	intrinsic item metadata	public
43657	Royal Guide of Escape Routes	armor	intrinsic item metadata	public
43658	Partially Rusted File	fish	specialized bag and profession data	public
43659	Bloodied Prison Shank	weapons	intrinsic item metadata	public
43660	Fire Eater's Guide	armor	intrinsic item metadata	public
43661	Book of Stars	armor	intrinsic item metadata	public
43663	Stormbound Tome	armor	intrinsic item metadata	public
43664	Manual of Clouds	armor	intrinsic item metadata	public
43666	Hellfire Tome	armor	intrinsic item metadata	public
43667	Book of Clever Tricks	armor	intrinsic item metadata	public
43671	Glyph of Path of Frost	inscription	intrinsic item metadata	public
43672	Glyph of Resilient Grip	inscription	intrinsic item metadata	public
43673	Glyph of Death Gate	inscription	intrinsic item metadata	public
43674	Glyph of Dash	inscription	intrinsic item metadata	public
43675	Fandral Staghelm's Silver Coin	fish	specialized bag and profession data	public
43676	Arcanist Doan's Silver Coin	fish	specialized bag and profession data	public
43677	High Tinker Mekkatorque's Silver Coin	fish	specialized bag and profession data	public
43678	Antonidas' Silver Coin	fish	specialized bag and profession data	public
43679	Muradin Bronzebeard's Silver Coin	fish	specialized bag and profession data	public
43680	King Varian Wrynn's Silver Coin	fish	specialized bag and profession data	public
43681	King Terenas Menethil's Silver Coin	fish	specialized bag and profession data	public
43682	King Anasterian Sunstrider's Silver Coin	fish	specialized bag and profession data	public
43683	Khadgar's Silver Coin	fish	specialized bag and profession data	public
43684	Medivh's Silver Coin	fish	specialized bag and profession data	public
43685	Maiev Shadowsong's Silver Coin	fish	specialized bag and profession data	public
43686	Alleria's Silver Coin	fish	specialized bag and profession data	public
43687	Aegwynn's Silver Coin	fish	specialized bag and profession data	public
43694	Drowned Rat	fish	specialized bag and profession data	public
43695	Half Full Bottle of Prison Moonshine	food	intrinsic item metadata	public
43696	Half Empty Bottle of Prison Moonshine	food	intrinsic item metadata	public
43701	A Footman's Copper Coin	fish	specialized bag and profession data	public
43702	Alonsus Faol's Copper Coin	fish	specialized bag and profession data	public
43703	Ansirem's Copper Coin	fish	specialized bag and profession data	public
43704	Attumen's Copper Coin	fish	specialized bag and profession data	public
43705	Danath's Copper Coin	fish	specialized bag and profession data	public
43706	Dornaa's Shiny Copper Coin	fish	specialized bag and profession data	public
43707	Eitrigg's Copper Coin	fish	specialized bag and profession data	public
43708	Elling Trias' Copper Coin	fish	specialized bag and profession data	public
43709	Falstad Wildhammer's Copper Coin	fish	specialized bag and profession data	public
43710	Genn's Copper Coin	fish	specialized bag and profession data	public
43711	Inigo's Copper Coin	fish	specialized bag and profession data	public
43712	Krasus' Copper Coin	fish	specialized bag and profession data	public
43713	Kryll's Copper Coin	fish	specialized bag and profession data	public
43714	Landro Longshot's Copper Coin	fish	specialized bag and profession data	public
43715	Molok's Copper Coin	fish	specialized bag and profession data	public
43716	Murky's Copper Coin	fish	specialized bag and profession data	public
43717	Princess Calia Menethil's Copper Coin	fish	specialized bag and profession data	public
43718	Private Marcus Jonathan's Copper Coin	fish	specialized bag and profession data	public
43719	Salandria's Shiny Copper Coin	fish	specialized bag and profession data	public
43720	Squire Rowe's Copper Coin	fish	specialized bag and profession data	public
43721	Stalvan's Copper Coin	fish	specialized bag and profession data	public
43722	Vereesa's Copper Coin	fish	specialized bag and profession data	public
43723	Vargoth's Copper Coin	fish	specialized bag and profession data	public
43725	Glyph of Ghost Wolf	inscription	intrinsic item metadata	public
43825	Glyph of Unholy Command	inscription	intrinsic item metadata	public
43826	Glyph of Outbreak	inscription	intrinsic item metadata	public
43827	Glyph of Corpse Explosion	inscription	intrinsic item metadata	public
43850	Certificate of Ownership	inscription	specialized bag and profession data	public
43853	Titanium Skeleton Key	blacksmithing	single crafted-product category	public
43854	Cobalt Skeleton Key	blacksmithing	single crafted-product category	public
43860	Brilliant Saronite Belt	armor	intrinsic item metadata	public
43864	Brilliant Saronite Bracers	armor	intrinsic item metadata	public
43865	Brilliant Saronite Pauldrons	armor	intrinsic item metadata	public
43867	Glyph of Denounce	inscription	intrinsic item metadata	public
43868	Glyph of Dazing Shield	inscription	intrinsic item metadata	public
43869	Glyph of Immediate Truth	inscription	intrinsic item metadata	public
43870	Brilliant Saronite Helm	armor	intrinsic item metadata	public
43871	Saronite Spellblade	weapons	intrinsic item metadata	public
43969	Frostsavage Belt	armor	intrinsic item metadata	public
43970	Frostsavage Boots	armor	intrinsic item metadata	public
43971	Frostsavage Cowl	armor	intrinsic item metadata	public
43972	Frostsavage Robe	armor	intrinsic item metadata	public
43973	Frostsavage Shoulders	armor	intrinsic item metadata	public
43974	Frostsavage Bracers	armor	intrinsic item metadata	public
43975	Frostsavage Leggings	armor	intrinsic item metadata	public
43987	Enchant Weapon - Black Magic	enchanting	intrinsic item metadata	public
44066	Kharmaa's Grace	jewels	intrinsic item metadata	public
44076	Swift Starflare Diamond	jewels	intrinsic item metadata	public
44078	Tireless Starflare Diamond	jewels	intrinsic item metadata	public
44081	Enigmatic Starflare Diamond	jewels	intrinsic item metadata	public
44082	Impassive Starflare Diamond	jewels	intrinsic item metadata	public
44084	Forlorn Starflare Diamond	jewels	intrinsic item metadata	public
44087	Persistent Earthshatter Diamond	jewels	intrinsic item metadata	public
44088	Powerful Earthshatter Diamond	jewels	intrinsic item metadata	public
44089	Trenchant Earthshatter Diamond	jewels	intrinsic item metadata	public
44119	Recipe: Big Bear Steak [PH]		placeholder item	excluded
44128	Arctic Fur	leather	intrinsic item metadata	public
44142	Strange Tarot	inscription	single crafted-product category	public
44161	Arcane Tarot	inscription	single crafted-product category	public
44163	Shadowy Tarot	inscription	single crafted-product category	public
44210	Faces of Doom	armor	intrinsic item metadata	public
44211	Frostwoven Gloves	armor	intrinsic item metadata	public
44314	Scroll of Recall II	inscription	specialized bag and profession data	public
44315	Scroll of Recall III	inscription	specialized bag and profession data	public
44316	Darkmoon Card	inscription	single crafted-product category	public
44317	Greater Darkmoon Card	inscription	single crafted-product category	public
44318	Darkmoon Card of the North	inscription	single crafted-product category	public
44325	Elixir of Accuracy	alchemy	intrinsic item metadata	public
44327	Elixir of Deadly Strikes	alchemy	intrinsic item metadata	public
44328	Elixir of Mighty Defense	alchemy	intrinsic item metadata	public
44329	Elixir of Expertise	alchemy	intrinsic item metadata	public
44330	Elixir of Armor Piercing	alchemy	intrinsic item metadata	public
44331	Elixir of Lightning Speed	alchemy	intrinsic item metadata	public
44332	Elixir of Mighty Thoughts	alchemy	intrinsic item metadata	public
44413	Mekgineer's Chopper	engineering	specialized bag and profession data	public
44432	DEPRECATED Glyph of the Ghoul		deprecated client record	excluded
44436	Dark Frostscale Leggings	armor	intrinsic item metadata	public
44437	Dark Frostscale Breastplate	armor	intrinsic item metadata	public
44438	Dragonstompers	armor	intrinsic item metadata	public
44440	Dark Iceborne Leggings	armor	intrinsic item metadata	public
44441	Dark Iceborne Chestguard	armor	intrinsic item metadata	public
44442	Bugsquashers	armor	intrinsic item metadata	public
44443	Dark Nerubian Leggings	armor	intrinsic item metadata	public
44444	Dark Nerubian Chestpiece	armor	intrinsic item metadata	public
44445	Scaled Icewalkers	armor	intrinsic item metadata	public
44446	Pack of Endless Pockets	bags	intrinsic item metadata	public
44449	Enchant Boots - Assault	enchanting	intrinsic item metadata	public
44453	Enchant Weapon - Greater Potency	enchanting	intrinsic item metadata	public
44455	Shield Enchant - Greater Intellect	enchanting	intrinsic item metadata	public
44456	Enchant Cloak - Speed	enchanting	intrinsic item metadata	public
44457	Enchant Cloak - Major Agility	enchanting	intrinsic item metadata	public
44458	Enchant Gloves - Crusher	enchanting	intrinsic item metadata	public
44463	Enchant 2H Weapon - Massacre	enchanting	intrinsic item metadata	public
44464	Crude Eating Utensils	fish	specialized bag and profession data	public
44465	Enchant Chest - Powerful Stats	enchanting	intrinsic item metadata	public
44466	Enchant Weapon - Superior Potency	enchanting	intrinsic item metadata	public
44467	Enchant Weapon - Mighty Spellpower	enchanting	intrinsic item metadata	public
44468	Water Soaked Letter	fish	specialized bag and profession data	public
44469	Enchant Boots - Greater Assault	enchanting	intrinsic item metadata	public
44470	Enchant Bracer - Superior Spellpower	enchanting	intrinsic item metadata	public
44475	Reinforced Crate	fish	specialized bag and profession data	public
44493	Enchant Weapon - Berserking	enchanting	intrinsic item metadata	public
44497	Enchant Weapon - Accuracy	enchanting	intrinsic item metadata	public
44499	Salvaged Iron Golem Parts	engineering	specialized bag and profession data	public
44500	Elementium-Plated Exhaust Pipe	engineering	specialized bag and profession data	public
44501	Goblin-Machined Piston	engineering	specialized bag and profession data	public
44504	Nesingwary 4000	weapons	intrinsic item metadata	public
44505	Dustbringer	weapons	intrinsic item metadata	public
44506	Saronite Arrow Maker	engineering	specialized bag and profession data	public
44507	Ultrasafe Bullet Machine	engineering	specialized bag and profession data	public
44508	Discovery!	alchemy	intrinsic item metadata	public
44554	Flying Carpet	tailoring	single crafted-product category	public
44570	Glass of Eversong Wine	food	intrinsic item metadata	public
44571	Bottle of Silvermoon Port	food	intrinsic item metadata	public
44573	Cup of Frog Venom Brew	food	intrinsic item metadata	public
44574	Skin of Mulgore Firewater	food	intrinsic item metadata	public
44575	Flask of Bitter Cactus Cider	food	intrinsic item metadata	public
44598	Shrapnel Grenade	engineering	specialized bag and profession data	public
44607	Aged Dalaran Sharp	food	intrinsic item metadata	public
44608	Dalaran Swiss	food	intrinsic item metadata	public
44609	Fresh Dalaran Bread Slice	food	intrinsic item metadata	public
44614	Starleaf Seed	herbs	specialized bag and profession data	public
44616	Glass of Dalaran White	food	intrinsic item metadata	public
44617	Glass of Dalaran Red	food	intrinsic item metadata	public
44618	Glass of Aged Dalaran Red	food	intrinsic item metadata	public
44619	Glass of Peaked Dalaran Red	food	intrinsic item metadata	public
44620	Glass of Vintage Dalaran Red	food	intrinsic item metadata	public
44646	Dalaran Bandage	first_aid	intrinsic item metadata	public
44684	Glyph of Frostfire Bolt	inscription	intrinsic item metadata	public
44700	Brooding Darkwater Clam	fish	specialized bag and profession data	public
44703	Dark Herring	weapons	intrinsic item metadata	public
44716	Mysterious Fermented Liquid	food	intrinsic item metadata	public
44722	Aged Yolk	food	intrinsic item metadata	public
44728	Endless Rejuvenation Potion	alchemy	intrinsic item metadata	public
44739	Diamond-Cut Refractor Scope	engineering	specialized bag and profession data	public
44740	Mechanized Snow Goggles	armor	intrinsic item metadata	public
44741	Mechanized Snow Goggles	armor	intrinsic item metadata	public
44742	Mechanized Snow Goggles	armor	intrinsic item metadata	public
44749	Salted Yeti Cheese	food	intrinsic item metadata	public
44750	Mountain Water	food	intrinsic item metadata	public
44815	Enchant Bracer - Greater Assault	enchanting	intrinsic item metadata	public
44834	Wild Turkey	fish	intrinsic item metadata	public
44835	Autumnal Herbs	fish	single profession category	public
44836	Pumpkin Pie	food	intrinsic item metadata	public
44837	Spice Bread Stuffing	food	intrinsic item metadata	public
44838	Slow-Roasted Turkey	food	intrinsic item metadata	public
44839	Candied Sweet Potato	food	intrinsic item metadata	public
44840	Cranberry Chutney	food	intrinsic item metadata	public
44851	Thanksgiving Cookbook	fish	intrinsic item metadata	public
44853	Honey	fish	single profession category	public
44854	Tangy Wetland Cranberries	food	intrinsic item metadata	public
44855	Teldrassil Sweet Potato	food	intrinsic item metadata	public
44856	Turkey Parts	fish	intrinsic item metadata	public
44920	Glyph of Remove Curse	inscription	intrinsic item metadata	public
44922	Glyph of Stars	inscription	intrinsic item metadata	public
44923	Glyph of Thunderstorm	inscription	intrinsic item metadata	public
44928	Glyph of Master Shapeshifter	inscription	intrinsic item metadata	public
44930	Windripper Boots	armor	intrinsic item metadata	public
44931	Windripper Leggings	armor	intrinsic item metadata	public
44936	Titanium Plating	enchanting	intrinsic item metadata	public
44940	Corn-Breaded Sausage	food	intrinsic item metadata	public
44941	Fresh-Squeezed Limeade	food	intrinsic item metadata	public
44943	Icy Prism	jewels	single crafted-product category	public
44946	Enchant Weapon - Titanguard	enchanting	intrinsic item metadata	public
44947	Enchant Bracer - Major Stamina	enchanting	intrinsic item metadata	public
44951	Box of Bombs	engineering	specialized bag and profession data	public
44953	Worg Tartare	food	intrinsic item metadata	public
44955	Glyph of Arcane Power	inscription	intrinsic item metadata	public
44958	Ethereal Oil	alchemy	single crafted-product category	public
44963	Earthen Leg Armor	enchanting	intrinsic item metadata	public
45006	Jillian's Tonic of Endless Rage	alchemy	intrinsic item metadata	public
45007	Jillian's Tonic of Pure Mojo	alchemy	intrinsic item metadata	public
45008	Jillian's Tonic of Stoneblood	alchemy	intrinsic item metadata	public
45009	Jillian's Tonic of the Frost Wyrm	alchemy	intrinsic item metadata	public
45054	Prismatic Black Diamond	jewels	intrinsic item metadata	public
45056	Enchant Staff - Greater Spellpower	enchanting	intrinsic item metadata	public
45060	Enchant Staff - Spellpower	enchanting	intrinsic item metadata	public
45085	Titansteel Spellblade	weapons	intrinsic item metadata	public
45087	Runed Orb	profession_supplies	curated shared crafting reagent	public
45088	Plans: Belt of the Titans	blacksmithing	intrinsic item metadata	public
45089	Plans: Battlelord's Plate Boots	blacksmithing	intrinsic item metadata	public
45090	Plans: Plate Girdle of Righteousness	blacksmithing	intrinsic item metadata	public
45091	Plans: Treads of Destiny	blacksmithing	intrinsic item metadata	public
45092	Plans: Indestructible Plate Girdle	blacksmithing	intrinsic item metadata	public
45093	Plans: Spiked Deathdealers	blacksmithing	intrinsic item metadata	public
45094	Pattern: Belt of Dragons	leatherworking	intrinsic item metadata	public
45095	Pattern: Boots of Living Scale	leatherworking	intrinsic item metadata	public
45096	Pattern: Blue Belt of Chaos	leatherworking	intrinsic item metadata	public
45097	Pattern: Lightning Grounded Boots	leatherworking	intrinsic item metadata	public
45098	Pattern: Death-Warmed Belt	leatherworking	intrinsic item metadata	public
45099	Pattern: Footpads of Silence	leatherworking	intrinsic item metadata	public
45100	Pattern: Belt of Arctic Life	leatherworking	intrinsic item metadata	public
45101	Pattern: Boots of Wintry Endurance	leatherworking	intrinsic item metadata	public
45102	Pattern: Sash of Ancient Power	tailoring	intrinsic item metadata	public
45103	Pattern: Spellslinger's Slippers	tailoring	intrinsic item metadata	public
45104	Pattern: Cord of the White Dawn	tailoring	intrinsic item metadata	public
45105	Pattern: Savior's Slippers	tailoring	intrinsic item metadata	public
45120	Basic Fishing Pole	weapons	intrinsic item metadata	public
45123	Monster - (Weapon) Blacksmith Hammer	weapons	intrinsic item metadata	public
45188	Withered Kelp	fish	specialized bag and profession data	public
45189	Torn Sail	fish	specialized bag and profession data	public
45190	Driftwood	fish	specialized bag and profession data	public
45191	Empty Clam	fish	specialized bag and profession data	public
45194	Tangled Fishing Line	fish	specialized bag and profession data	public
45195	Empty Rum Bottle	fish	specialized bag and profession data	public
45196	Tattered Cloth	fish	specialized bag and profession data	public
45197	Tree Branch	fish	specialized bag and profession data	public
45198	Weeds	fish	specialized bag and profession data	public
45199	Old Boot	fish	specialized bag and profession data	public
45200	Sickly Fish	fish	specialized bag and profession data	public
45201	Rock	fish	specialized bag and profession data	public
45202	Water Snail	fish	specialized bag and profession data	public
45276	Jillian's Genius Juice	alchemy	intrinsic item metadata	public
45277	Jillian's Savior Sauce	alchemy	intrinsic item metadata	public
45550	Belt of the Titans	armor	intrinsic item metadata	public
45551	Indestructible Plate Girdle	armor	intrinsic item metadata	public
45552	Plate Girdle of Righteousness	armor	intrinsic item metadata	public
45553	Belt of Dragons	armor	intrinsic item metadata	public
45554	Blue Belt of Chaos	armor	intrinsic item metadata	public
45555	Death-Warmed Belt	armor	intrinsic item metadata	public
45556	Belt of Arctic Life	armor	intrinsic item metadata	public
45557	Sash of Ancient Power	armor	intrinsic item metadata	public
45558	Cord of the White Dawn	armor	intrinsic item metadata	public
45559	Battlelord's Plate Boots	armor	intrinsic item metadata	public
45560	Spiked Deathdealers	armor	intrinsic item metadata	public
45561	Treads of Destiny	armor	intrinsic item metadata	public
45562	Boots of Living Scale	armor	intrinsic item metadata	public
45563	Lightning Grounded Boots	armor	intrinsic item metadata	public
45564	Footpads of Silence	armor	intrinsic item metadata	public
45565	Boots of Wintry Endurance	armor	intrinsic item metadata	public
45566	Spellslinger's Slippers	armor	intrinsic item metadata	public
45567	Savior's Slippers	armor	intrinsic item metadata	public
45601	Glyph of Survival Instincts	inscription	intrinsic item metadata	public
45602	Glyph of Wild Growth	inscription	intrinsic item metadata	public
45603	Glyph of Might of Ursoc	inscription	intrinsic item metadata	public
45604	Glyph of Stampeding Roar	inscription	intrinsic item metadata	public
45621	Elixir of Minor Accuracy	alchemy	intrinsic item metadata	public
45622	Glyph of Cyclone	inscription	intrinsic item metadata	public
45623	Glyph of Barkskin	inscription	intrinsic item metadata	public
45625	Glyph of Chimera Shot	inscription	intrinsic item metadata	public
45626	Spidersilk Drape	armor	intrinsic item metadata	public
45627	Amulet of Truesight	armor	intrinsic item metadata	public
45628	Enchant Boots - Lesser Accuracy	enchanting	intrinsic item metadata	public
45631	High-Powered Flashlight	trinkets	intrinsic item metadata	public
45731	Glyph of Tranquilizing Shot	inscription	intrinsic item metadata	public
45732	Glyph of Aspect of the Cheetah	inscription	intrinsic item metadata	public
45733	Glyph of Master's Call	inscription	intrinsic item metadata	public
45734	Glyph of Scatter Shot	inscription	intrinsic item metadata	public
45735	Glyph of Mirrored Blades	inscription	intrinsic item metadata	public
45736	Glyph of Water Elemental	inscription	intrinsic item metadata	public
45737	Glyph of Slow	inscription	intrinsic item metadata	public
45738	Glyph of Illusion	inscription	intrinsic item metadata	public
45739	Glyph of Mirror Image	inscription	intrinsic item metadata	public
45740	Glyph of Deep Freeze	inscription	intrinsic item metadata	public
45741	Glyph of Beacon of Light	inscription	intrinsic item metadata	public
45742	Glyph of Hammer of the Righteous	inscription	intrinsic item metadata	public
45743	Glyph of Divine Storm	inscription	intrinsic item metadata	public
45744	Glyph of the Alabaster Shield	inscription	intrinsic item metadata	public
45745	Glyph of Divine Plea	inscription	intrinsic item metadata	public
45746	Glyph of Holy Shock	inscription	intrinsic item metadata	public
45747	Glyph of Inquisition	inscription	intrinsic item metadata	public
45753	Glyph of Dispersion	inscription	intrinsic item metadata	public
45755	Glyph of Leap of Faith	inscription	intrinsic item metadata	public
45756	Glyph of Penance	inscription	intrinsic item metadata	public
45757	Glyph of Focused Mending	inscription	intrinsic item metadata	public
45758	Glyph of Mind Spike	inscription	intrinsic item metadata	public
45760	Glyph of Binding Heal	inscription	intrinsic item metadata	public
45761	Glyph of Vendetta	inscription	intrinsic item metadata	public
45762	Glyph of Killing Spree	inscription	intrinsic item metadata	public
45764	Glyph of Stealth	inscription	intrinsic item metadata	public
45766	Glyph of Deadly Momentum	inscription	intrinsic item metadata	public
45767	Glyph of Tricks of the Trade	inscription	intrinsic item metadata	public
45768	Glyph of Disguise	inscription	intrinsic item metadata	public
45769	Glyph of Cloak of Shadows	inscription	intrinsic item metadata	public
45770	Glyph of Thunder	inscription	intrinsic item metadata	public
45771	Glyph of Feral Spirit	inscription	intrinsic item metadata	public
45772	Glyph of Riptide	inscription	intrinsic item metadata	public
45773	Emerald Bag	bags	intrinsic item metadata	public
45775	Glyph of Deluge	inscription	intrinsic item metadata	public
45776	Glyph of Shamanistic Rage	inscription	intrinsic item metadata	public
45777	Glyph of Hex	inscription	intrinsic item metadata	public
45778	Glyph of Totemic Vigor	inscription	intrinsic item metadata	public
45779	Glyph of Drain Life	inscription	intrinsic item metadata	public
45780	Glyph of Demon Hunting	inscription	intrinsic item metadata	public
45781	Glyph of Ember Tap	inscription	intrinsic item metadata	public
45782	Glyph of Demonic Circle	inscription	intrinsic item metadata	public
45783	Glyph of Unending Resolve	inscription	intrinsic item metadata	public
45785	Glyph of Life Tap	inscription	intrinsic item metadata	public
45789	Glyph of Crimson Banish	inscription	intrinsic item metadata	public
45790	Glyph of Whirlwind	inscription	intrinsic item metadata	public
45792	Glyph of Death From Above	inscription	intrinsic item metadata	public
45793	Glyph of Victorious Throw	inscription	intrinsic item metadata	public
45794	Glyph of Intimidating Shout	inscription	intrinsic item metadata	public
45795	Glyph of Spell Reflection	inscription	intrinsic item metadata	public
45797	Glyph of Shield Wall	inscription	intrinsic item metadata	public
45799	Glyph of Dancing Rune Weapon	inscription	intrinsic item metadata	public
45800	Glyph of Dark Simulacrum	inscription	intrinsic item metadata	public
45803	Charred Glyph	inscription	specialized bag and profession data	public
45804	Glyph of Death Coil	inscription	intrinsic item metadata	public
45805	Charred Glyph	inscription	specialized bag and profession data	public
45806	Glyph of Tranquil Grip	inscription	intrinsic item metadata	public
45808	Runed Mana Band	armor	intrinsic item metadata	public
45809	Scarlet Signet	armor	intrinsic item metadata	public
45810	Cloak of Crimson Snow	armor	intrinsic item metadata	public
45811	Frostguard Drape	armor	intrinsic item metadata	public
45812	Emerald Choker	armor	intrinsic item metadata	public
45813	Sky Sapphire Amulet	armor	intrinsic item metadata	public
45849	Twilight Tome	armor	intrinsic item metadata	public
45854	Rituals of the New Moon	armor	intrinsic item metadata	public
45859	The 5 Ring	armor	intrinsic item metadata	public
45861	Diamond-Tipped Cane	weapons	intrinsic item metadata	public
45862	Bold Stormjewel	jewels	intrinsic item metadata	public
45879	Delicate Stormjewel	jewels	intrinsic item metadata	public
45880	Solid Stormjewel	jewels	intrinsic item metadata	public
45881	Sparkling Stormjewel	jewels	intrinsic item metadata	public
45882	Brilliant Stormjewel	jewels	intrinsic item metadata	public
45883	Brilliant Stormjewel	jewels	intrinsic item metadata	public
45901	Homemade Fish Fry	food	intrinsic item metadata	public
45907	Mostly-Eaten Bonescale Snapper	fish	specialized bag and profession data	public
45909	Giant Darkwater Clam	fish	specialized bag and profession data	public
45912	Book of Glyph Mastery	inscription	specialized bag and profession data	public
45932	Black Jelly	food	intrinsic item metadata	public
45977	Porcelain Bell	fish	specialized bag and profession data	public
45978	Solid Gold Coin	fish	specialized bag and profession data	public
45979	Tower Key	fish	specialized bag and profession data	public
45980	Whale Statue	fish	specialized bag and profession data	public
45981	New Age Painting	fish	specialized bag and profession data	public
45984	Unusual Compass	fish	specialized bag and profession data	public
45986	Tiny Titanium Lockbox	lockboxes	intrinsic item metadata	public
45987	Rigid Stormjewel	jewels	intrinsic item metadata	public
45994	Lost Ring	armor	intrinsic item metadata	public
45995	Forgotten Necklace	armor	intrinsic item metadata	public
45998	Battered Jungle Hat	armor	intrinsic item metadata	public
45999	Worthless Piece of White Glass	fish	specialized bag and profession data	public
46000	Worthless Piece of Red Glass	fish	specialized bag and profession data	public
46001	Worthless Piece of Green Glass	fish	specialized bag and profession data	public
46002	Worthless Piece of Violet Glass	fish	specialized bag and profession data	public
46003	Worthless Piece of Orange Glass	fish	specialized bag and profession data	public
46023	A Steamy Romance Novel: Northern Exposure	fish	specialized bag and profession data	public
46026	Enchant Weapon - Blade Ward	enchanting	intrinsic item metadata	public
46054	Journeyman Fishing - Fishing for Dummies	fish	intrinsic item metadata	public
46055	Grand Master Fishing - Deep Sea Adventures	fish	intrinsic item metadata	public
46098	Enchant Weapon - Blood Draining	enchanting	intrinsic item metadata	public
46359	Velociraptor Skull	fish	specialized bag and profession data	public
46360	Stuffed Shark Head	fish	specialized bag and profession data	public
46361	Crafted Star	fish	specialized bag and profession data	public
46376	Flask of the Frost Wyrm	alchemy	intrinsic item metadata	public
46377	Flask of Endless Rage	alchemy	intrinsic item metadata	public
46378	Flask of Pure Mojo	alchemy	intrinsic item metadata	public
46379	Flask of Stoneblood	alchemy	intrinsic item metadata	public
46691	Bread of the Dead	food	intrinsic item metadata	public
46784	Ripe Elwynn Pumpkin	food	intrinsic item metadata	public
46793	Tangy Southfury Cranberries	food	intrinsic item metadata	public
46796	Ripe Tirisfal Pumpkin	food	intrinsic item metadata	public
46797	Mulgore Sweet Potato	food	intrinsic item metadata	public
46845	Massive Seaforium Charge 2	engineering	specialized bag and profession data	public
46849	Titanium Powder	enchanting	intrinsic item metadata	public
46852	H17 Ammunition Buddy	engineering	specialized bag and profession data	public
46887	Bountiful Feast	food	intrinsic item metadata	public
47556	Crusader Orb	profession_supplies	curated shared crafting reagent	public
47570	Saronite Swordbreakers	armor	intrinsic item metadata	public
47571	Saronite Swordbreakers	armor	intrinsic item metadata	public
47572	Titanium Spikeguards	armor	intrinsic item metadata	public
47573	Titanium Spikeguards	armor	intrinsic item metadata	public
47574	Sunforged Bracers	armor	intrinsic item metadata	public
47575	Sunforged Bracers	armor	intrinsic item metadata	public
47576	Crusader's Dragonscale Bracers	armor	intrinsic item metadata	public
47577	Crusader's Dragonscale Bracers	armor	intrinsic item metadata	public
47579	Black Chitin Bracers	armor	intrinsic item metadata	public
47580	Black Chitin Bracers	armor	intrinsic item metadata	public
47581	Bracers of Swift Death	armor	intrinsic item metadata	public
47582	Bracers of Swift Death	armor	intrinsic item metadata	public
47583	Moonshadow Armguards	armor	intrinsic item metadata	public
47584	Moonshadow Armguards	armor	intrinsic item metadata	public
47585	Bejeweled Wizard's Bracers	armor	intrinsic item metadata	public
47586	Bejeweled Wizard's Bracers	armor	intrinsic item metadata	public
47587	Royal Moonshroud Bracers	armor	intrinsic item metadata	public
47588	Royal Moonshroud Bracers	armor	intrinsic item metadata	public
47589	Titanium Razorplate	armor	intrinsic item metadata	public
47590	Titanium Razorplate	armor	intrinsic item metadata	public
47591	Breastplate of the White Knight	armor	intrinsic item metadata	public
47592	Breastplate of the White Knight	armor	intrinsic item metadata	public
47593	Sunforged Breastplate	armor	intrinsic item metadata	public
47594	Sunforged Breastplate	armor	intrinsic item metadata	public
47595	Crusader's Dragonscale Breastplate	armor	intrinsic item metadata	public
47596	Crusader's Dragonscale Breastplate	armor	intrinsic item metadata	public
47597	Ensorcelled Nerubian Breastplate	armor	intrinsic item metadata	public
47598	Ensorcelled Nerubian Breastplate	armor	intrinsic item metadata	public
47599	Knightbane Carapace	armor	intrinsic item metadata	public
47600	Knightbane Carapace	armor	intrinsic item metadata	public
47601	Lunar Eclipse Robes	armor	intrinsic item metadata	public
47602	Lunar Eclipse Robes	armor	intrinsic item metadata	public
47603	Merlin's Robe	armor	intrinsic item metadata	public
47604	Merlin's Robe	armor	intrinsic item metadata	public
47605	Royal Moonshroud Robe	armor	intrinsic item metadata	public
47606	Royal Moonshroud Robe	armor	intrinsic item metadata	public
47622	Plans: Breastplate of the White Knight	blacksmithing	intrinsic item metadata	public
47623	Plans: Saronite Swordbreakers	blacksmithing	intrinsic item metadata	public
47624	Plans: Titanium Razorplate	blacksmithing	intrinsic item metadata	public
47625	Plans: Titanium Spikeguards	blacksmithing	intrinsic item metadata	public
47626	Plans: Sunforged Breastplate	blacksmithing	intrinsic item metadata	public
47627	Plans: Sunforged Bracers	blacksmithing	intrinsic item metadata	public
47628	Pattern: Ensorcelled Nerubian Breastplate	leatherworking	intrinsic item metadata	public
47629	Pattern: Black Chitin Bracers	leatherworking	intrinsic item metadata	public
47630	Pattern: Crusader's Dragonscale Breastplate	leatherworking	intrinsic item metadata	public
47631	Pattern: Crusader's Dragonscale Bracers	leatherworking	intrinsic item metadata	public
47632	Pattern: Lunar Eclipse Robes	leatherworking	intrinsic item metadata	public
47633	Pattern: Moonshadow Armguards	leatherworking	intrinsic item metadata	public
47634	Pattern: Knightbane Carapace	leatherworking	intrinsic item metadata	public
47635	Pattern: Bracers of Swift Death	leatherworking	intrinsic item metadata	public
47636	Pattern: Royal Moonshroud Robe	tailoring	intrinsic item metadata	public
47637	Pattern: Royal Moonshroud Bracers	tailoring	intrinsic item metadata	public
47638	Pattern: Merlin's Robe	tailoring	intrinsic item metadata	public
47639	Pattern: Bejeweled Wizard's Bracers	tailoring	intrinsic item metadata	public
47640	Plans: Breastplate of the White Knight	blacksmithing	intrinsic item metadata	public
47641	Plans: Saronite Swordbreakers	blacksmithing	intrinsic item metadata	public
47642	Plans: Sunforged Bracers	blacksmithing	intrinsic item metadata	public
47643	Plans: Sunforged Breastplate	blacksmithing	intrinsic item metadata	public
47644	Plans: Titanium Razorplate	blacksmithing	intrinsic item metadata	public
47645	Plans: Titanium Spikeguards	blacksmithing	intrinsic item metadata	public
47646	Pattern: Black Chitin Bracers	leatherworking	intrinsic item metadata	public
47647	Pattern: Bracers of Swift Death	leatherworking	intrinsic item metadata	public
47648	Pattern: Crusader's Dragonscale Bracers	leatherworking	intrinsic item metadata	public
47649	Pattern: Crusader's Dragonscale Breastplate	leatherworking	intrinsic item metadata	public
47650	Pattern: Ensorcelled Nerubian Breastplate	leatherworking	intrinsic item metadata	public
47651	Pattern: Knightbane Carapace	leatherworking	intrinsic item metadata	public
47652	Pattern: Lunar Eclipse Robes	leatherworking	intrinsic item metadata	public
47653	Pattern: Moonshadow Armguards	leatherworking	intrinsic item metadata	public
47654	Pattern: Bejeweled Wizard's Bracers	tailoring	intrinsic item metadata	public
47655	Pattern: Merlin's Robe	tailoring	intrinsic item metadata	public
47656	Pattern: Royal Moonshroud Bracers	tailoring	intrinsic item metadata	public
47657	Pattern: Royal Moonshroud Robe	tailoring	intrinsic item metadata	public
47828	Goblin Beam Welder	engineering	specialized bag and profession data	public
47842	SERVER CRASHING ITEM [PROGRAMMER ONLY -- DO NOT MAKE]		programmer-only crash item	excluded
48720	Glyph of Ferocious Bite	inscription	intrinsic item metadata	public
48933	Wormhole Generator: Northrend	engineering	specialized bag and profession data	public
48945	Gnomish Thinking Cap	armor	intrinsic item metadata	public
49084	Glyph of Thunder Strike	inscription	intrinsic item metadata	public
49110	Nightmare Tear	jewels	intrinsic item metadata	public
49253	Slightly Worm-Eaten Hardtack	food	intrinsic item metadata	public
49254	Tarp Collected Dew	food	intrinsic item metadata	public
49334	Scale of Onyxia 2.0	leather	intrinsic item metadata	public
49360	Gilneas Spring Water	food	intrinsic item metadata	public
49361	Lamb Shank	food	intrinsic item metadata	public
49397	Half-Eaten Rat	food	intrinsic item metadata	public
49398	Filtered Bilge Water	food	intrinsic item metadata	public
49600	Goblin Shortbread	food	intrinsic item metadata	public
49601	Volcanic Spring Water	food	intrinsic item metadata	public
49602	Earl Black Tea	food	intrinsic item metadata	public
49603	Hot Cross Buns	food	intrinsic item metadata	public
49626	Dented Fish Scale	fish	specialized bag and profession data	public
49627	Broken Fishbones		broken internal record	excluded
49632	Runescroll of Fortitude	inscription	specialized bag and profession data	public
49633	Drums of Forgotten Kings	leatherworking	specialized bag and profession data	public
49634	Drums of the Wild	leatherworking	specialized bag and profession data	public
49640	Essence or Dust	enchanting	intrinsic item metadata	public
49768	Runescroll of Brilliance	inscription	specialized bag and profession data	public
49890	Deathfrost Boots	armor	intrinsic item metadata	public
49891	Leggings of Woven Death	armor	intrinsic item metadata	public
49892	Lightweave Leggings	armor	intrinsic item metadata	public
49893	Sandals of Consecration	armor	intrinsic item metadata	public
49894	Blessed Cenarion Boots	armor	intrinsic item metadata	public
49895	Footpads of Impending Death	armor	intrinsic item metadata	public
49896	Earthsoul Boots	armor	intrinsic item metadata	public
49897	Rock-Steady Treads	armor	intrinsic item metadata	public
49898	Legwraps of Unleashed Nature	armor	intrinsic item metadata	public
49899	Bladeborn Leggings	armor	intrinsic item metadata	public
49900	Lightning-Infused Leggings	armor	intrinsic item metadata	public
49901	Draconic Bonesplinter Legguards	armor	intrinsic item metadata	public
49902	Puresteel Legplates	armor	intrinsic item metadata	public
49903	Legplates of Painful Death	armor	intrinsic item metadata	public
49904	Pillars of Might	armor	intrinsic item metadata	public
49905	Protectors of Life	armor	intrinsic item metadata	public
49906	Hellfrozen Bonegrinders	armor	intrinsic item metadata	public
49907	Boots of Kingly Upheaval	armor	intrinsic item metadata	public
49908	Primordial Saronite	profession_supplies	curated shared crafting reagent	public
50045	Glyph of Counterspell	inscription	intrinsic item metadata	public
50077	Glyph of Eternal Resolve	inscription	intrinsic item metadata	public
50125	Charred Glyph	inscription	specialized bag and profession data	public
50166	Technique: Glyph of Counterspell	inscription	intrinsic item metadata	public
50167	Moldy Parchment	inscription	specialized bag and profession data	public
50168	Technique: Glyph of Everlasting Affliction	inscription	intrinsic item metadata	public
50422	Crafty Bomb	engineering	specialized bag and profession data	public
50816	Enchant Gloves - Angler	enchanting	intrinsic item metadata	public
51950	Pyrium Bar	ore	intrinsic item metadata	public
52022	Ruined Schematic	engineering	specialized bag and profession data	public
52023	Ruined Schematic	engineering	specialized bag and profession data	public
52078	Chaos Orb	profession_supplies	curated shared crafting reagent	public
52081	Bold Carnelian	jewels	intrinsic item metadata	public
52082	Delicate Carnelian	jewels	intrinsic item metadata	public
52083	Flashing Carnelian	jewels	intrinsic item metadata	public
52084	Brilliant Carnelian	jewels	intrinsic item metadata	public
52085	Precise Carnelian	jewels	intrinsic item metadata	public
52086	Solid Zephyrite	jewels	intrinsic item metadata	public
52087	Sparkling Zephyrite	jewels	intrinsic item metadata	public
52088	Stormy Zephyrite	jewels	intrinsic item metadata	public
52089	Rigid Zephyrite	jewels	intrinsic item metadata	public
52090	Subtle Alicite	jewels	intrinsic item metadata	public
52091	Smooth Alicite	jewels	intrinsic item metadata	public
52092	Mystic Alicite	jewels	intrinsic item metadata	public
52093	Quick Alicite	jewels	intrinsic item metadata	public
52094	Fractured Alicite	jewels	intrinsic item metadata	public
52095	Sovereign Nightstone	jewels	intrinsic item metadata	public
52096	Shifting Nightstone	jewels	intrinsic item metadata	public
52097	Defender's Nightstone	jewels	intrinsic item metadata	public
52098	Timeless Nightstone	jewels	intrinsic item metadata	public
52099	Guardian's Nightstone	jewels	intrinsic item metadata	public
52100	Purified Nightstone	jewels	intrinsic item metadata	public
52101	Etched Nightstone	jewels	intrinsic item metadata	public
52102	Glinting Nightstone	jewels	intrinsic item metadata	public
52103	Retaliating Nightstone	jewels	intrinsic item metadata	public
52104	Veiled Nightstone	jewels	intrinsic item metadata	public
52105	Accurate Nightstone	jewels	intrinsic item metadata	public
52106	Polished Hessonite	jewels	intrinsic item metadata	public
52107	Resolute Hessonite	jewels	intrinsic item metadata	public
52108	Inscribed Hessonite	jewels	intrinsic item metadata	public
52109	Deadly Hessonite	jewels	intrinsic item metadata	public
52110	Potent Hessonite	jewels	intrinsic item metadata	public
52111	Fierce Hessonite	jewels	intrinsic item metadata	public
52112	Deft Hessonite	jewels	intrinsic item metadata	public
52113	Reckless Hessonite	jewels	intrinsic item metadata	public
52114	Skillful Hessonite	jewels	intrinsic item metadata	public
52115	Adept Hessonite	jewels	intrinsic item metadata	public
52116	Fine Hessonite	jewels	intrinsic item metadata	public
52117	Artful Hessonite	jewels	intrinsic item metadata	public
52118	Keen Hessonite	jewels	intrinsic item metadata	public
52119	Regal Jasper	jewels	intrinsic item metadata	public
52120	Nimble Jasper	jewels	intrinsic item metadata	public
52121	Jagged Jasper	jewels	intrinsic item metadata	public
52122	Piercing Jasper	jewels	intrinsic item metadata	public
52123	Steady Jasper	jewels	intrinsic item metadata	public
52124	Forceful Jasper	jewels	intrinsic item metadata	public
52125	Lightning Jasper	jewels	intrinsic item metadata	public
52126	Puissant Jasper	jewels	intrinsic item metadata	public
52127	Zen Jasper	jewels	intrinsic item metadata	public
52128	Sensei's Jasper	jewels	intrinsic item metadata	public
52129	Perfect Sensei's Jasper	jewels	intrinsic item metadata	public
52130	Perfect Zen Jasper	jewels	intrinsic item metadata	public
52131	Perfect Puissant Jasper	jewels	intrinsic item metadata	public
52132	Perfect Lightning Jasper	jewels	intrinsic item metadata	public
52133	Perfect Forceful Jasper	jewels	intrinsic item metadata	public
52134	Perfect Steady Jasper	jewels	intrinsic item metadata	public
52135	Perfect Piercing Jasper	jewels	intrinsic item metadata	public
52136	Perfect Jagged Jasper	jewels	intrinsic item metadata	public
52137	Perfect Nimble Jasper	jewels	intrinsic item metadata	public
52138	Perfect Regal Jasper	jewels	intrinsic item metadata	public
52139	Perfect Keen Hessonite	jewels	intrinsic item metadata	public
52140	Perfect Artful Hessonite	jewels	intrinsic item metadata	public
52141	Perfect Fine Hessonite	jewels	intrinsic item metadata	public
52142	Perfect Adept Hessonite	jewels	intrinsic item metadata	public
52143	Perfect Skillful Hessonite	jewels	intrinsic item metadata	public
52144	Perfect Reckless Hessonite	jewels	intrinsic item metadata	public
52145	Perfect Deft Hessonite	jewels	intrinsic item metadata	public
52146	Perfect Fierce Hessonite	jewels	intrinsic item metadata	public
52147	Perfect Potent Hessonite	jewels	intrinsic item metadata	public
52148	Perfect Deadly Hessonite	jewels	intrinsic item metadata	public
52149	Perfect Inscribed Hessonite	jewels	intrinsic item metadata	public
52150	Perfect Resolute Hessonite	jewels	intrinsic item metadata	public
52151	Perfect Polished Hessonite	jewels	intrinsic item metadata	public
52152	Perfect Accurate Nightstone	jewels	intrinsic item metadata	public
52153	Perfect Veiled Nightstone	jewels	intrinsic item metadata	public
52154	Perfect Retaliating Nightstone	jewels	intrinsic item metadata	public
52155	Perfect Glinting Nightstone	jewels	intrinsic item metadata	public
52156	Perfect Etched Nightstone	jewels	intrinsic item metadata	public
52157	Perfect Purified Nightstone	jewels	intrinsic item metadata	public
52158	Perfect Guardian's Nightstone	jewels	intrinsic item metadata	public
52159	Perfect Timeless Nightstone	jewels	intrinsic item metadata	public
52160	Perfect Defender's Nightstone	jewels	intrinsic item metadata	public
52161	Perfect Shifting Nightstone	jewels	intrinsic item metadata	public
52162	Perfect Sovereign Nightstone	jewels	intrinsic item metadata	public
52163	Perfect Fractured Alicite	jewels	intrinsic item metadata	public
52164	Perfect Quick Alicite	jewels	intrinsic item metadata	public
52165	Perfect Mystic Alicite	jewels	intrinsic item metadata	public
52166	Perfect Smooth Alicite	jewels	intrinsic item metadata	public
52167	Perfect Subtle Alicite	jewels	intrinsic item metadata	public
52168	Perfect Rigid Zephyrite	jewels	intrinsic item metadata	public
52169	Perfect Stormy Zephyrite	jewels	intrinsic item metadata	public
52170	Perfect Sparkling Zephyrite	jewels	intrinsic item metadata	public
52171	Perfect Solid Zephyrite	jewels	intrinsic item metadata	public
52172	Perfect Precise Carnelian	jewels	intrinsic item metadata	public
52173	Perfect Brilliant Carnelian	jewels	intrinsic item metadata	public
52174	Perfect Flashing Carnelian	jewels	intrinsic item metadata	public
52175	Perfect Delicate Carnelian	jewels	intrinsic item metadata	public
52176	Perfect Bold Carnelian	jewels	intrinsic item metadata	public
52177	Carnelian	jewels	intrinsic item metadata	public
52178	Zephyrite	jewels	intrinsic item metadata	public
52179	Alicite	jewels	intrinsic item metadata	public
52180	Nightstone	jewels	intrinsic item metadata	public
52181	Hessonite	jewels	intrinsic item metadata	public
52182	Jasper	jewels	intrinsic item metadata	public
52183	Pyrite Ore	ore	intrinsic item metadata	public
52184	Black Iron Ore	ore	intrinsic item metadata	public
52185	Elementium Ore	ore	intrinsic item metadata	public
52186	Elementium Bar	ore	intrinsic item metadata	public
52187	Black Iron Bar	ore	intrinsic item metadata	public
52188	Jeweler's Setting	jewels	specialized bag and profession data	public
52190	Inferno Ruby	jewels	intrinsic item metadata	public
52191	Ocean Sapphire	jewels	intrinsic item metadata	public
52192	Dream Emerald	jewels	intrinsic item metadata	public
52193	Ember Topaz	jewels	intrinsic item metadata	public
52194	Demonseye	jewels	intrinsic item metadata	public
52195	Amberjewel	jewels	intrinsic item metadata	public
52196	Chimera's Eye	jewels	intrinsic item metadata	public
52203	Accurate Demonseye	jewels	intrinsic item metadata	public
52204	Adept Ember Topaz	jewels	intrinsic item metadata	public
52205	Artful Ember Topaz	jewels	intrinsic item metadata	public
52206	Bold Inferno Ruby	jewels	intrinsic item metadata	public
52207	Brilliant Inferno Ruby	jewels	intrinsic item metadata	public
52208	Reckless Ember Topaz	jewels	intrinsic item metadata	public
52209	Deadly Ember Topaz	jewels	intrinsic item metadata	public
52210	Defender's Demonseye	jewels	intrinsic item metadata	public
52211	Deft Ember Topaz	jewels	intrinsic item metadata	public
52212	Delicate Inferno Ruby	jewels	intrinsic item metadata	public
52213	Etched Demonseye	jewels	intrinsic item metadata	public
52214	Fierce Ember Topaz	jewels	intrinsic item metadata	public
52215	Fine Ember Topaz	jewels	intrinsic item metadata	public
52216	Flashing Inferno Ruby	jewels	intrinsic item metadata	public
52217	Veiled Demonseye	jewels	intrinsic item metadata	public
52218	Forceful Dream Emerald	jewels	intrinsic item metadata	public
52219	Fractured Amberjewel	jewels	intrinsic item metadata	public
52220	Glinting Demonseye	jewels	intrinsic item metadata	public
52221	Guardian's Demonseye	jewels	intrinsic item metadata	public
52222	Inscribed Ember Topaz	jewels	intrinsic item metadata	public
52223	Jagged Dream Emerald	jewels	intrinsic item metadata	public
52224	Keen Ember Topaz	jewels	intrinsic item metadata	public
52225	Lightning Dream Emerald	jewels	intrinsic item metadata	public
52226	Mystic Amberjewel	jewels	intrinsic item metadata	public
52227	Nimble Dream Emerald	jewels	intrinsic item metadata	public
52228	Piercing Dream Emerald	jewels	intrinsic item metadata	public
52229	Polished Ember Topaz	jewels	intrinsic item metadata	public
52230	Precise Inferno Ruby	jewels	intrinsic item metadata	public
52231	Puissant Dream Emerald	jewels	intrinsic item metadata	public
52232	Quick Amberjewel	jewels	intrinsic item metadata	public
52233	Regal Dream Emerald	jewels	intrinsic item metadata	public
52234	Retaliating Demonseye	jewels	intrinsic item metadata	public
52235	Rigid Ocean Sapphire	jewels	intrinsic item metadata	public
52236	Purified Demonseye	jewels	intrinsic item metadata	public
52237	Sensei's Dream Emerald	jewels	intrinsic item metadata	public
52238	Shifting Demonseye	jewels	intrinsic item metadata	public
52239	Potent Ember Topaz	jewels	intrinsic item metadata	public
52240	Skillful Ember Topaz	jewels	intrinsic item metadata	public
52241	Smooth Amberjewel	jewels	intrinsic item metadata	public
52242	Solid Ocean Sapphire	jewels	intrinsic item metadata	public
52243	Sovereign Demonseye	jewels	intrinsic item metadata	public
52244	Sparkling Ocean Sapphire	jewels	intrinsic item metadata	public
52245	Steady Dream Emerald	jewels	intrinsic item metadata	public
52246	Stormy Ocean Sapphire	jewels	intrinsic item metadata	public
52247	Subtle Amberjewel	jewels	intrinsic item metadata	public
52248	Timeless Demonseye	jewels	intrinsic item metadata	public
52249	Resolute Ember Topaz	jewels	intrinsic item metadata	public
52250	Zen Dream Emerald	jewels	intrinsic item metadata	public
52289	Fleet Shadowspirit Diamond	jewels	intrinsic item metadata	public
52291	Chaotic Shadowspirit Diamond	jewels	intrinsic item metadata	public
52292	Bracing Shadowspirit Diamond	jewels	intrinsic item metadata	public
52293	Eternal Shadowspirit Diamond	jewels	intrinsic item metadata	public
52294	Austere Shadowspirit Diamond	jewels	intrinsic item metadata	public
52295	Effulgent Shadowspirit Diamond	jewels	intrinsic item metadata	public
52296	Ember Shadowspirit Diamond	jewels	intrinsic item metadata	public
52297	Revitalizing Shadowspirit Diamond	jewels	intrinsic item metadata	public
52298	Destructive Shadowspirit Diamond	jewels	intrinsic item metadata	public
52299	Powerful Shadowspirit Diamond	jewels	intrinsic item metadata	public
52300	Enigmatic Shadowspirit Diamond	jewels	intrinsic item metadata	public
52301	Impassive Shadowspirit Diamond	jewels	intrinsic item metadata	public
52302	Forlorn Shadowspirit Diamond	jewels	intrinsic item metadata	public
52303	Shadowspirit Diamond	jewels	intrinsic item metadata	public
52304	Fire Prism	jewels	single crafted-product category	public
52306	Jasper Ring	armor	intrinsic item metadata	public
52307	Alicite Pendant	armor	intrinsic item metadata	public
52308	Hessonite Band	armor	intrinsic item metadata	public
52309	Nightstone Choker	armor	intrinsic item metadata	public
52318	Band of Blades	armor	intrinsic item metadata	public
52319	Ring of Warring Elements	armor	intrinsic item metadata	public
52320	Elementium Moebius Band	armor	intrinsic item metadata	public
52321	Entwined Elementium Choker	armor	intrinsic item metadata	public
52322	Eye of Many Deaths	armor	intrinsic item metadata	public
52323	Elementium Guardian	armor	intrinsic item metadata	public
52325	Volatile Fire	elemental	intrinsic item metadata	public
52326	Volatile Water	elemental	intrinsic item metadata	public
52327	Volatile Earth	elemental	intrinsic item metadata	public
52328	Volatile Air	elemental	intrinsic item metadata	public
52329	Volatile Life	elemental	intrinsic item metadata	public
52330	Volatile Shadow	elemental	intrinsic item metadata	public
52332	Spark of Ragnaros	elemental	intrinsic item metadata	public
52333	Azsharaen Sphere	elemental	intrinsic item metadata	public
52335	Stormlord's Favor	elemental	intrinsic item metadata	public
52337	Lifegiving Seed	elemental	intrinsic item metadata	public
52338	Darkfathom Pearl	jewels	intrinsic item metadata	public
52339	Flawless Pearl	jewels	intrinsic item metadata	public
52340	Abyssal Clam	fish	specialized bag and profession data	public
52341	Fiery Silk Gland	cloth	intrinsic item metadata	public
52342	Nightstone Focusing Lens	jewels	specialized bag and profession data	public
52348	Elementium Destroyer's Ring	armor	intrinsic item metadata	public
52350	Brazen Elementium Medallion	armor	intrinsic item metadata	public
52363	Design: Flashing Carnelian	jewels	intrinsic item metadata	public
52364	Design: Stormy Zephyrite	jewels	intrinsic item metadata	public
52365	Design: Subtle Alicite	jewels	intrinsic item metadata	public
52366	Design: Defender's Nightstone	jewels	intrinsic item metadata	public
52367	Design: Guardian's Nightstone	jewels	intrinsic item metadata	public
52368	Design: Purified Nightstone	jewels	intrinsic item metadata	public
52369	Design: Retaliating Nightstone	jewels	intrinsic item metadata	public
52370	Design: Polished Hessonite	jewels	intrinsic item metadata	public
52371	Design: Inscribed Hessonite	jewels	intrinsic item metadata	public
52372	Design: Deadly Hessonite	jewels	intrinsic item metadata	public
52373	Design: Potent Hessonite	jewels	intrinsic item metadata	public
52374	Design: Fierce Hessonite	jewels	intrinsic item metadata	public
52375	Design: Deft Hessonite	jewels	intrinsic item metadata	public
52376	Design: Fine Hessonite	jewels	intrinsic item metadata	public
52377	Design: Keen Hessonite	jewels	intrinsic item metadata	public
52378	Design: Regal Jasper	jewels	intrinsic item metadata	public
52379	Design: Nimble Jasper	jewels	intrinsic item metadata	public
52382	Design: Piercing Jasper	jewels	intrinsic item metadata	public
52383	Design: Steady Jasper	jewels	intrinsic item metadata	public
52385	Design: Forceful Jasper	jewels	intrinsic item metadata	public
52386	Design: Lightning Jasper	jewels	intrinsic item metadata	public
52388	Design: Zen Jasper	jewels	intrinsic item metadata	public
52485	Jeweler's Ruby Monocle	armor	intrinsic item metadata	public
52486	Jeweler's Sapphire Monocle	armor	intrinsic item metadata	public
52487	Jeweler's Amber Monocle	armor	intrinsic item metadata	public
52489	Rhinestone Sunglasses	armor	intrinsic item metadata	public
52492	Carnelian Spikes	weapons	intrinsic item metadata	public
52493	The Perforator	weapons	intrinsic item metadata	public
52494	Design: Jeweler's Ruby Monocle	jewels	intrinsic item metadata	public
52495	Design: Jeweler's Sapphire Monocle	jewels	intrinsic item metadata	public
52496	Design: Jeweler's Amber Monocle	jewels	intrinsic item metadata	public
52497	Design: Jeweler's Sapphire Monocle	jewels	intrinsic item metadata	public
52510	Enchanting Vellum	enchanting	intrinsic item metadata	public
52555	Hypnotic Dust	enchanting	intrinsic item metadata	public
52687	Enchant Gloves - Mastery	enchanting	intrinsic item metadata	public
52718	Lesser Celestial Essence	enchanting	intrinsic item metadata	public
52719	Greater Celestial Essence	enchanting	intrinsic item metadata	public
52720	Small Heavenly Shard	enchanting	intrinsic item metadata	public
52721	Heavenly Shard	enchanting	intrinsic item metadata	public
52722	Maelstrom Crystal	enchanting	intrinsic item metadata	public
52743	Enchant Boots - Earthen Vitality	enchanting	intrinsic item metadata	public
52744	Enchant Chest - Mighty Stats	enchanting	intrinsic item metadata	public
52745	Enchant Cloak - Lesser Power	enchanting	intrinsic item metadata	public
52746	Enchant Bracer - Speed	enchanting	intrinsic item metadata	public
52747	Enchant Weapon - Mending	enchanting	intrinsic item metadata	public
52748	Enchant Weapon - Avalanche	enchanting	intrinsic item metadata	public
52749	Enchant Gloves - Haste	enchanting	intrinsic item metadata	public
52750	Enchant Boots - Haste	enchanting	intrinsic item metadata	public
52751	Enchant Chest - Stamina	enchanting	intrinsic item metadata	public
52752	Enchant Bracer - Critical Strike	enchanting	intrinsic item metadata	public
52753	Enchant Cloak - Intellect	enchanting	intrinsic item metadata	public
52754	Enchant Shield - Protection	enchanting	intrinsic item metadata	public
52755	Enchant Weapon - Elemental Slayer	enchanting	intrinsic item metadata	public
52756	Enchant Gloves - Exceptional Strength	enchanting	intrinsic item metadata	public
52757	Enchant Boots - Major Agility	enchanting	intrinsic item metadata	public
52758	Enchant Chest - Mighty Resilience	enchanting	intrinsic item metadata	public
52759	Enchant Gloves - Greater Expertise	enchanting	intrinsic item metadata	public
52760	Enchant Weapon - Hurricane	enchanting	intrinsic item metadata	public
52761	Enchant Weapon - Heartsong	enchanting	intrinsic item metadata	public
52762	Enchant Shield - Mastery	enchanting	intrinsic item metadata	public
52763	Enchant Bracer - Superior Dodge	enchanting	intrinsic item metadata	public
52764	Enchant Cloak - Critical Strike	enchanting	intrinsic item metadata	public
52765	Enchant Chest - Exceptional Spirit	enchanting	intrinsic item metadata	public
52766	Enchant Bracer - Precision	enchanting	intrinsic item metadata	public
52767	Enchant Cloak - Protection	enchanting	intrinsic item metadata	public
52768	Enchant Off-Hand - Superior Intellect	enchanting	intrinsic item metadata	public
52769	Enchant Boots - Precision	enchanting	intrinsic item metadata	public
52770	Enchant Bracer - Exceptional Spirit	enchanting	intrinsic item metadata	public
52771	Enchant Boots - Mastery	enchanting	intrinsic item metadata	public
52772	Enchant Bracer - Greater Expertise	enchanting	intrinsic item metadata	public
52773	Enchant Cloak - Greater Intellect	enchanting	intrinsic item metadata	public
52774	Enchant Weapon - Power Torrent	enchanting	intrinsic item metadata	public
52775	Enchant Weapon - Windwalk	enchanting	intrinsic item metadata	public
52776	Enchant Weapon - Landslide	enchanting	intrinsic item metadata	public
52777	Enchant Cloak - Greater Critical Strike	enchanting	intrinsic item metadata	public
52778	Enchant Bracer - Greater Critical Strike	enchanting	intrinsic item metadata	public
52779	Enchant Chest - Peerless Stats	enchanting	intrinsic item metadata	public
52780	Enchant Chest - Greater Stamina	enchanting	intrinsic item metadata	public
52781	Enchant Boots - Assassin's Step	enchanting	intrinsic item metadata	public
52782	Enchant Boots - Lavawalker	enchanting	intrinsic item metadata	public
52783	Enchant Gloves - Mighty Strength	enchanting	intrinsic item metadata	public
52784	Enchant Gloves - Greater Mastery	enchanting	intrinsic item metadata	public
52785	Enchant Bracer - Greater Speed	enchanting	intrinsic item metadata	public
52843	Dwarf Rune Stone	archaeology	MoP archaeology keystone data	public
52976	Savage Leather	leather	intrinsic item metadata	public
52977	Savage Leather Scraps	leather	intrinsic item metadata	public
52979	Blackened Dragonscale	leather	intrinsic item metadata	public
52980	Pristine Hide	leather	intrinsic item metadata	public
52981	Scarred Shell Fragment	leather	intrinsic item metadata	public
52982	Deepsea Scale	leather	intrinsic item metadata	public
52983	Cinderbloom	herbs	intrinsic item metadata	public
52984	Stormvine	herbs	intrinsic item metadata	public
52985	Azshara's Veil	herbs	intrinsic item metadata	public
52986	Heartblossom	herbs	intrinsic item metadata	public
52987	Twilight Jasmine	herbs	intrinsic item metadata	public
52988	Whiptail	herbs	intrinsic item metadata	public
52989	Deathspore Pod	herbs	intrinsic item metadata	public
53010	Embersilk Cloth	cloth	intrinsic item metadata	public
53038	Obsidium Ore	ore	intrinsic item metadata	public
53039	Hardened Elementium Bar	ore	intrinsic item metadata	public
53049	Embersilk Bandage	first_aid	intrinsic item metadata	public
53050	Heavy Embersilk Bandage	first_aid	intrinsic item metadata	public
53051	Dense Embersilk Bandage	first_aid	intrinsic item metadata	public
53062	Sharptooth	fish	intrinsic item metadata	public
53063	Mountain Trout	fish	intrinsic item metadata	public
53064	Highland Guppy	fish	intrinsic item metadata	public
53065	Albino Cavefish	fish	intrinsic item metadata	public
53066	Blackbelly Mudfish	fish	intrinsic item metadata	public
53067	Striped Lurker	fish	intrinsic item metadata	public
53068	Lavascale Catfish	fish	intrinsic item metadata	public
53069	Murglesnout	fish	intrinsic item metadata	public
53070	Fathom Eel	fish	intrinsic item metadata	public
53071	Algaefin Rockfish	fish	intrinsic item metadata	public
53072	Deepsea Sagefish	fish	intrinsic item metadata	public
53643	Bolt of Embersilk Cloth	cloth	intrinsic item metadata	public
54441	Black Embersilk Gown	armor	intrinsic item metadata	public
54442	Embersilk Net	tailoring	single crafted-product category	public
54443	Embersilk Bag	bags	intrinsic item metadata	public
54444	Illusionary Bag	bags	intrinsic item metadata	public
54445	Otherworldly Bag	bags	intrinsic item metadata	public
54446	Hyjal Expedition Bag	bags	intrinsic item metadata	public
54447	Enchanted Spellthread	enchanting	intrinsic item metadata	public
54448	Powerful Enchanted Spellthread	enchanting	intrinsic item metadata	public
54449	Ghostly Spellthread	enchanting	intrinsic item metadata	public
54450	Powerful Ghostly Spellthread	enchanting	intrinsic item metadata	public
54451	High Society Top Hat	armor	intrinsic item metadata	public
54464	Random Volatile Element	elemental	intrinsic item metadata	public
54469	Blank Slate	fish	specialized bag and profession data	public
54470	Fantasy Portrait	fish	specialized bag and profession data	public
54471	Deathsilk Belt	armor	intrinsic item metadata	public
54472	Deathsilk Leggings	armor	intrinsic item metadata	public
54473	Deathsilk Bracers	armor	intrinsic item metadata	public
54474	Deathsilk Shoulders	armor	intrinsic item metadata	public
54475	Deathsilk Robe	armor	intrinsic item metadata	public
54476	Deathsilk Cowl	armor	intrinsic item metadata	public
54477	Deathsilk Boots	armor	intrinsic item metadata	public
54478	Deathsilk Gloves	armor	intrinsic item metadata	public
54479	Spiritmend Shoulders	armor	intrinsic item metadata	public
54480	Spiritmend Bracers	armor	intrinsic item metadata	public
54481	Spiritmend Belt	armor	intrinsic item metadata	public
54482	Spiritmend Boots	armor	intrinsic item metadata	public
54483	Spiritmend Leggings	armor	intrinsic item metadata	public
54484	Spiritmend Gloves	armor	intrinsic item metadata	public
54485	Spiritmend Cowl	armor	intrinsic item metadata	public
54486	Spiritmend Robe	armor	intrinsic item metadata	public
54487	Fireweave Shoulders	armor	intrinsic item metadata	public
54488	Fireweave Bracers	armor	intrinsic item metadata	public
54489	Fireweave Belt	armor	intrinsic item metadata	public
54490	Fireweave Boots	armor	intrinsic item metadata	public
54491	Fireweave Pants	armor	intrinsic item metadata	public
54492	Fireweave Gloves	armor	intrinsic item metadata	public
54493	Fireweave Cowl	armor	intrinsic item metadata	public
54494	Fireweave Robe	armor	intrinsic item metadata	public
54495	Emberfire Robe	armor	intrinsic item metadata	public
54496	Emberfire Cowl	armor	intrinsic item metadata	public
54497	Emberfire Gloves	armor	intrinsic item metadata	public
54498	Emberfire Pants	armor	intrinsic item metadata	public
54499	Emberfire Boots	armor	intrinsic item metadata	public
54500	Emberfire Belt	armor	intrinsic item metadata	public
54501	Emberfire Bracers	armor	intrinsic item metadata	public
54502	Emberfire Shoulders	armor	intrinsic item metadata	public
54503	Dreamless Belt	armor	intrinsic item metadata	public
54504	Belt of the Depths	armor	intrinsic item metadata	public
54505	Breeches of Mended Nightmares	armor	intrinsic item metadata	public
54506	Flame-Ascended Pantaloons	armor	intrinsic item metadata	public
54616	Stackable Ruby	jewels	intrinsic item metadata	public
54641	Potion of Pure Genius	alchemy	intrinsic item metadata	public
54642	Potion of Ogre Rage	alchemy	intrinsic item metadata	public
54643	Potion of the Cobra	alchemy	intrinsic item metadata	public
54849	Obsidium Bar	ore	intrinsic item metadata	public
54850	Hardened Obsidium Bracers	armor	intrinsic item metadata	public
54852	Hardened Obsidium Gauntlets	armor	intrinsic item metadata	public
54853	Hardened Obsidium Belt	armor	intrinsic item metadata	public
54854	Hardened Obsidium Boots	armor	intrinsic item metadata	public
54876	Hardened Obsidium Shoulders	armor	intrinsic item metadata	public
55022	Hardened Obsidium Legguards	armor	intrinsic item metadata	public
55023	Hardened Obsidium Helm	armor	intrinsic item metadata	public
55024	Hardened Obsidium Breastplate	armor	intrinsic item metadata	public
55025	Redsteel Bracers	armor	intrinsic item metadata	public
55026	Redsteel Gauntlets	armor	intrinsic item metadata	public
55027	Redsteel Belt	armor	intrinsic item metadata	public
55028	Redsteel Boots	armor	intrinsic item metadata	public
55029	Redsteel Shoulders	armor	intrinsic item metadata	public
55030	Redsteel Legguards	armor	intrinsic item metadata	public
55031	Redsteel Helm	armor	intrinsic item metadata	public
55032	Redsteel Breastplate	armor	intrinsic item metadata	public
55033	Stormforged Bracers	armor	intrinsic item metadata	public
55034	Stormforged Gauntlets	armor	intrinsic item metadata	public
55035	Stormforged Belt	armor	intrinsic item metadata	public
55036	Stormforged Boots	armor	intrinsic item metadata	public
55037	Stormforged Shoulders	armor	intrinsic item metadata	public
55038	Stormforged Legguards	armor	intrinsic item metadata	public
55039	Stormforged Helm	armor	intrinsic item metadata	public
55040	Stormforged Breastplate	armor	intrinsic item metadata	public
55041	Hardened Obsidium Shield	armor	intrinsic item metadata	public
55042	Stormforged Shield	armor	intrinsic item metadata	public
55043	Decapitator's Razor	weapons	intrinsic item metadata	public
55044	Cold-Forged Shank	weapons	intrinsic item metadata	public
55045	Fire-Etched Dagger	weapons	intrinsic item metadata	public
55046	Lifeforce Hammer	weapons	intrinsic item metadata	public
55052	Obsidium Executioner	weapons	intrinsic item metadata	public
55053	Obsidium Skeleton Key	blacksmithing	single crafted-product category	public
55054	Ebonsteel Belt Buckle	enchanting	intrinsic item metadata	public
55055	Elementium Shield Spike	enchanting	intrinsic item metadata	public
55056	Pyrium Shield Spike	enchanting	intrinsic item metadata	public
55057	Pyrium Weapon Chain	enchanting	intrinsic item metadata	public
55058	Hardened Elementium Hauberk	armor	intrinsic item metadata	public
55059	Hardened Elementium Girdle	armor	intrinsic item metadata	public
55060	Elementium Deathplate	armor	intrinsic item metadata	public
55061	Elementium Girdle of Pain	armor	intrinsic item metadata	public
55062	Light Elementium Chestguard	armor	intrinsic item metadata	public
55063	Light Elementium Belt	armor	intrinsic item metadata	public
55064	Elementium Spellblade	weapons	intrinsic item metadata	public
55065	Elementium Hammer	weapons	intrinsic item metadata	public
55066	Elementium Poleaxe	weapons	intrinsic item metadata	public
55067	Elementium Bonesplitter	weapons	intrinsic item metadata	public
55068	Elementium Shank	weapons	intrinsic item metadata	public
55069	Elementium Earthguard	armor	intrinsic item metadata	public
55070	Elementium Stormshield	armor	intrinsic item metadata	public
55071	Bloodied Pyrium Bracers	armor	intrinsic item metadata	public
55072	Bloodied Pyrium Gauntlets	armor	intrinsic item metadata	public
55073	Bloodied Pyrium Belt	armor	intrinsic item metadata	public
55074	Bloodied Pyrium Boots	armor	intrinsic item metadata	public
55075	Bloodied Pyrium Shoulders	armor	intrinsic item metadata	public
55076	Bloodied Pyrium Legguards	armor	intrinsic item metadata	public
55077	Bloodied Pyrium Helm	armor	intrinsic item metadata	public
55078	Bloodied Pyrium Breastplate	armor	intrinsic item metadata	public
55079	Ornate Pyrium Bracers	armor	intrinsic item metadata	public
55080	Ornate Pyrium Gauntlets	armor	intrinsic item metadata	public
55081	Ornate Pyrium Belt	armor	intrinsic item metadata	public
55082	Ornate Pyrium Boots	armor	intrinsic item metadata	public
55083	Ornate Pyrium Shoulders	armor	intrinsic item metadata	public
55084	Ornate Pyrium Legguards	armor	intrinsic item metadata	public
55085	Ornate Pyrium Helm	armor	intrinsic item metadata	public
55086	Ornate Pyrium Breastplate	armor	intrinsic item metadata	public
55246	Obsidium Bladespear	weapons	intrinsic item metadata	public
56477	Savage Armor Kit	enchanting	intrinsic item metadata	public
56478	Savage Leather (UNUSED)		unused client record	excluded
56480	Savage Cloak	armor	intrinsic item metadata	public
56481	Tsunami Bracers	armor	intrinsic item metadata	public
56482	Tsunami Belt	armor	intrinsic item metadata	public
56483	Darkbrand Bracers	armor	intrinsic item metadata	public
56484	Darkbrand Gloves	armor	intrinsic item metadata	public
56489	Hardened Scale Cloak	armor	intrinsic item metadata	public
56490	Tsunami Gloves	armor	intrinsic item metadata	public
56491	Darkbrand Boots	armor	intrinsic item metadata	public
56494	Tsunami Boots	armor	intrinsic item metadata	public
56495	Darkbrand Shoulders	armor	intrinsic item metadata	public
56498	Tsunami Shoulders	armor	intrinsic item metadata	public
56499	Darkbrand Belt	armor	intrinsic item metadata	public
56502	Scorched Leg Armor	enchanting	intrinsic item metadata	public
56503	Twilight Leg Armor	enchanting	intrinsic item metadata	public
56504	Tsunami Chestguard	armor	intrinsic item metadata	public
56505	Darkbrand Helm	armor	intrinsic item metadata	public
56508	Tsunami Leggings	armor	intrinsic item metadata	public
56509	Darkbrand Chestguard	armor	intrinsic item metadata	public
56512	Tsunami Helm	armor	intrinsic item metadata	public
56513	Darkbrand Leggings	armor	intrinsic item metadata	public
56516	Heavy Savage Leather	leather	intrinsic item metadata	public
56517	Heavy Savage Armor Kit	enchanting	intrinsic item metadata	public
56518	Cloak of Beasts	armor	intrinsic item metadata	public
56519	Cloak of War	armor	intrinsic item metadata	public
56520	Bloodied Wyrmhide Bracers	armor	intrinsic item metadata	public
56521	Bloodied Wyrmhide Belt	armor	intrinsic item metadata	public
56522	Bloodied Leather Bracers	armor	intrinsic item metadata	public
56523	Bloodied Leather Gloves	armor	intrinsic item metadata	public
56524	Bloodied Scale Bracers	armor	intrinsic item metadata	public
56525	Bloodied Scale Gloves	armor	intrinsic item metadata	public
56526	Bloodied Dragonscale Bracers	armor	intrinsic item metadata	public
56527	Bloodied Dragonscale Shoulders	armor	intrinsic item metadata	public
56528	Bloodied Wyrmhide Gloves	armor	intrinsic item metadata	public
56529	Bloodied Wyrmhide Boots	armor	intrinsic item metadata	public
56530	Bloodied Leather Boots	armor	intrinsic item metadata	public
56531	Bloodied Leather Shoulders	armor	intrinsic item metadata	public
56532	Bloodied Scale Boots	armor	intrinsic item metadata	public
56533	Bloodied Scale Belt	armor	intrinsic item metadata	public
56534	Bloodied Dragonscale Boots	armor	intrinsic item metadata	public
56535	Bloodied Dragonscale Gloves	armor	intrinsic item metadata	public
56536	Lightning Lash	armor	intrinsic item metadata	public
56537	Belt of Nefarious Whispers	armor	intrinsic item metadata	public
56538	Stormleather Sash	armor	intrinsic item metadata	public
56539	Corded Viper Belt	armor	intrinsic item metadata	public
56540	Bloodied Wyrmhide Shoulders	armor	intrinsic item metadata	public
56541	Bloodied Wyrmhide Chest	armor	intrinsic item metadata	public
56542	Bloodied Leather Belt	armor	intrinsic item metadata	public
56543	Bloodied Leather Helm	armor	intrinsic item metadata	public
56544	Bloodied Scale Shoulders	armor	intrinsic item metadata	public
56545	Bloodied Scale Legs	armor	intrinsic item metadata	public
56546	Bloodied Dragonscale Belt	armor	intrinsic item metadata	public
56547	Bloodied Dragonscale Helm	armor	intrinsic item metadata	public
56548	Razor-Edged Cloak	armor	intrinsic item metadata	public
56549	Twilight Dragonscale Cloak	armor	intrinsic item metadata	public
56550	Dragonscale Leg Armor	enchanting	intrinsic item metadata	public
56551	Charscale Leg Armor	enchanting	intrinsic item metadata	public
56552	Bloodied Wyrmhide Legs	armor	intrinsic item metadata	public
56553	Bloodied Wyrmhide Helm	armor	intrinsic item metadata	public
56554	Bloodied Leather Chest	armor	intrinsic item metadata	public
56555	Bloodied Leather Legs	armor	intrinsic item metadata	public
56556	Bloodied Scale Chest	armor	intrinsic item metadata	public
56557	Bloodied Scale Helm	armor	intrinsic item metadata	public
56558	Bloodied Dragonscale Legs	armor	intrinsic item metadata	public
56559	Bloodied Dragonscale Chest	armor	intrinsic item metadata	public
56561	Chestguard of Nature's Fury	armor	intrinsic item metadata	public
56562	Assassin's Chestplate	armor	intrinsic item metadata	public
56563	Twilight Scale Chestguard	armor	intrinsic item metadata	public
56564	Dragonkiller Tunic	armor	intrinsic item metadata	public
56850	Deepstone Oil	alchemy	single crafted-product category	public
57099	Mysterious Potion	alchemy	intrinsic item metadata	public
57191	Mythical Healing Potion	alchemy	intrinsic item metadata	public
57192	Mythical Mana Potion	alchemy	intrinsic item metadata	public
57193	Mighty Rejuvenation Potion	alchemy	intrinsic item metadata	public
57194	Potion of Concentration	alchemy	intrinsic item metadata	public
58084	Ghost Elixir	alchemy	intrinsic item metadata	public
58085	Flask of Steelskin	alchemy	intrinsic item metadata	public
58086	Flask of the Draconic Mind	alchemy	intrinsic item metadata	public
58087	Flask of the Winds	alchemy	intrinsic item metadata	public
58088	Flask of Titanic Strength	alchemy	intrinsic item metadata	public
58089	Elixir of the Naga	alchemy	intrinsic item metadata	public
58090	Earthen Potion	alchemy	intrinsic item metadata	public
58091	Volcanic Potion	alchemy	intrinsic item metadata	public
58092	Elixir of the Cobra	alchemy	intrinsic item metadata	public
58093	Elixir of Deep Earth	alchemy	intrinsic item metadata	public
58094	Elixir of Impossible Accuracy	alchemy	intrinsic item metadata	public
58142	Deathblood Venom	alchemy	single crafted-product category	public
58143	Prismatic Elixir	alchemy	intrinsic item metadata	public
58144	Elixir of Mighty Speed	alchemy	intrinsic item metadata	public
58145	Potion of the Tol'vir	alchemy	intrinsic item metadata	public
58146	Golemblood Potion	alchemy	intrinsic item metadata	public
58148	Elixir of the Master	alchemy	intrinsic item metadata	public
58256	Sparkling Oasis Water	food	intrinsic item metadata	public
58257	Highland Spring Water	food	intrinsic item metadata	public
58258	Smoked String Cheese	food	intrinsic item metadata	public
58259	Highland Sheep Cheese	food	intrinsic item metadata	public
58260	Pine Nut Bread	food	intrinsic item metadata	public
58261	Buttery Wheat Roll	food	intrinsic item metadata	public
58262	Sliced Raw Billfish	food	intrinsic item metadata	public
58263	Grilled Shark	food	intrinsic item metadata	public
58264	Sour Green Apple	food	intrinsic item metadata	public
58265	Highland Pomegranate	food	intrinsic item metadata	public
58266	Violet Morel	food	intrinsic item metadata	public
58267	Scarlet Polypore	food	intrinsic item metadata	public
58268	Roasted Beef	food	intrinsic item metadata	public
58269	Massive Turkey Leg	food	intrinsic item metadata	public
58274	Fresh Water	food	intrinsic item metadata	public
58275	Hardtack	food	intrinsic item metadata	public
58276	Gilnean White	food	intrinsic item metadata	public
58277	Simmered Squid	food	intrinsic item metadata	public
58278	Tropical Sunfruit	food	intrinsic item metadata	public
58279	Tasty Puffball	food	intrinsic item metadata	public
58280	Stewed Rabbit	food	intrinsic item metadata	public
58480	Truegold	ore	intrinsic item metadata	public
58487	Potion of Deepholm	alchemy	intrinsic item metadata	public
58488	Potion of Treasure Finding	alchemy	intrinsic item metadata	public
58489	Potion of Illusion	alchemy	intrinsic item metadata	public
58865	Slimy Ring	fish	specialized bag and profession data	public
58866	Set of Rusty Keys	fish	specialized bag and profession data	public
59029	Greasy Whale Milk	food	intrinsic item metadata	public
59227	Rock-Hard Biscuit	food	intrinsic item metadata	public
59228	Vile Purple Fungus	food	intrinsic item metadata	public
59229	Murky Water	food	intrinsic item metadata	public
59230	Fungus Squeezings	food	intrinsic item metadata	public
59231	Oily Giblets	food	intrinsic item metadata	public
59232	Unidentifiable Meat Dish	food	intrinsic item metadata	public
59364	Overpowered Chicken Splitter	weapons	intrinsic item metadata	public
59367	Kickback 5000	weapons	intrinsic item metadata	public
59477	Subtle Cogwheel	jewels	intrinsic item metadata	public
59478	Smooth Cogwheel	jewels	intrinsic item metadata	public
59479	Quick Cogwheel	jewels	intrinsic item metadata	public
59480	Fractured Cogwheel	jewels	intrinsic item metadata	public
59489	Precise Cogwheel	jewels	intrinsic item metadata	public
59491	Flashing Cogwheel	jewels	intrinsic item metadata	public
59493	Rigid Cogwheel	jewels	intrinsic item metadata	public
59496	Sparkling Cogwheel	jewels	intrinsic item metadata	public
59594	Gnomish X-Ray Scope	engineering	specialized bag and profession data	public
59595	R19 Threatfinder	engineering	specialized bag and profession data	public
59596	Safety Catch Removal Kit	engineering	specialized bag and profession data	public
59597	Personal World Destroyer	battle_pets	intrinsic item metadata	public
59598	Finely-Tuned Throat Needler	weapons	intrinsic item metadata	public
59599	Volatile Thunderstick	weapons	intrinsic item metadata	public
60216	De-Weaponized Mechanical Companion	battle_pets	intrinsic item metadata	public
60217	Elementium Toolbox	bags	intrinsic item metadata	public
60218	Lure Master Tackle Box	bags	intrinsic item metadata	public
60222	Authentic Jr. Engineer Goggles	armor	intrinsic item metadata	public
60223	High-Powered Bolt Gun	engineering	specialized bag and profession data	public
60224	Handful of Obsidium Bolts	engineering	specialized bag and profession data	public
60265	Jungle Remedy	alchemy	intrinsic item metadata	public
60267	Country Pumpkin	food	intrinsic item metadata	public
60268	Hobo Surprise	food	intrinsic item metadata	public
60269	Well Water	food	intrinsic item metadata	public
60375	Cheery Cherry Pie	food	intrinsic item metadata	public
60377	Lots 'o Meat Pie	food	intrinsic item metadata	public
60378	Plumpkin Pie	food	intrinsic item metadata	public
60379	Mud Pie	food	intrinsic item metadata	public
60403	Elementium Dragonling	trinkets	intrinsic item metadata	public
60407	Trans-Dimensional Fabricator	engineering	specialized bag and profession data	public
60498	Trans-Dimensional Fabricator	engineering	specialized bag and profession data	public
60740	Dwarven Keystone	archaeology	MoP archaeology keystone data	public
60838	Mysterious Fortune Card	inscription	single crafted-product category	public
60852	Volatile Energy Converter	engineering	specialized bag and profession data	public
60853	Volatile Seaforium Blastpack	engineering	specialized bag and profession data	public
60854	Loot-A-Rang	engineering	specialized bag and profession data	public
60858	Goblin Barbecue	food	intrinsic item metadata	public
60891	Pat Test Hydraulic		internal test item	excluded
60893	Pat Test Cogwheel		internal test item	excluded
61978	Blackfallow Ink	inscription	specialized bag and profession data	public
61979	Ashen Pigment	inscription	specialized bag and profession data	public
61980	Burning Embers	inscription	specialized bag and profession data	public
61981	Inferno Ink	inscription	single crafted-product category	public
61982	Fizzy Fruit Wine	food	intrinsic item metadata	public
61983	Imported E.K. Ale	food	intrinsic item metadata	public
61984	Potent Pineapple Punch	food	intrinsic item metadata	public
61985	Banana Cocktail	food	intrinsic item metadata	public
61986	Tol Barad Coconut Rum	food	intrinsic item metadata	public
61987	Darkmoon Card of Destruction	inscription	single crafted-product category	public
62231	Book of Blood	armor	intrinsic item metadata	public
62233	Lord Rottington's Pressed Wisp Book	armor	intrinsic item metadata	public
62234	Dungeoneering Guide	armor	intrinsic item metadata	public
62235	Divine Companion	armor	intrinsic item metadata	public
62236	Battle Tome	armor	intrinsic item metadata	public
62238	Origami Rock	inscription	specialized bag and profession data	public
62239	Origami Slime	inscription	specialized bag and profession data	public
62251	Runescroll of Fortitude II	inscription	specialized bag and profession data	public
62274	Immaculate Fin	fish	specialized bag and profession data	public
62275	Mirrored Scale	fish	specialized bag and profession data	public
62313	Burned Recipe Fragments	inscription	specialized bag and profession data	public
62322	Polished Horn	inscription	specialized bag and profession data	public
62323	Deathwing Scale Fragment	inscription	specialized bag and profession data	public
62549	Charred Meat	fish	intrinsic item metadata	public
62649	Fortune Cookie	food	intrinsic item metadata	public
62651	Lightly Fried Lurker	food	intrinsic item metadata	public
62652	Seasoned Crab	food	intrinsic item metadata	public
62653	Salted Eye	food	intrinsic item metadata	public
62654	Lavascale Fillet	food	intrinsic item metadata	public
62655	Broiled Mountain Trout	food	intrinsic item metadata	public
62656	Whitecrest Gumbo	food	intrinsic item metadata	public
62657	Lurker Lunch	food	intrinsic item metadata	public
62658	Tender Baked Turtle	food	intrinsic item metadata	public
62659	Hearty Seafood Soup	food	intrinsic item metadata	public
62660	Pickled Guppy	food	intrinsic item metadata	public
62661	Baked Rockfish	food	intrinsic item metadata	public
62662	Grilled Dragon	food	intrinsic item metadata	public
62663	Lavascale Minestrone	food	intrinsic item metadata	public
62664	Crocolisk Au Gratin	food	intrinsic item metadata	public
62665	Basilisk Liverdog	food	intrinsic item metadata	public
62666	Delicious Sagefish Tail	food	intrinsic item metadata	public
62667	Mushroom Sauce Mudfish	food	intrinsic item metadata	public
62668	Blackbelly Sushi	food	intrinsic item metadata	public
62669	Skewered Eel	food	intrinsic item metadata	public
62670	Beer-Basted Crocolisk	food	intrinsic item metadata	public
62671	Severed Sagefish Head	food	intrinsic item metadata	public
62672	South Island Iced Tea	food	intrinsic item metadata	public
62673	Feathered Lure	fish	specialized bag and profession data	public
62674	Highland Spirits	food	intrinsic item metadata	public
62675	Starfire Espresso	food	intrinsic item metadata	public
62676	Blackened Surprise	food	intrinsic item metadata	public
62677	Fish Fry	food	intrinsic item metadata	public
62678	Crispy "Bakon" Snack	food	intrinsic item metadata	public
62679	Enriched Fish Biscuit	food	intrinsic item metadata	public
62680	Chocolate Cookie	food	intrinsic item metadata	public
62763	Glyph of Pyroblast	inscription	intrinsic item metadata	public
62764	Glyph of Cone of Cold	inscription	intrinsic item metadata	public
62765	Glyph of Mana Shield	inscription	intrinsic item metadata	public
62766	Glyph of Dragon's Breath	inscription	intrinsic item metadata	public
62767	Glyph of Slow	inscription	intrinsic item metadata	public
62773	Glyph of Conjuring	inscription	intrinsic item metadata	public
62778	Toughened Flesh	fish	intrinsic item metadata	public
62779	Monstrous Claw	fish	intrinsic item metadata	public
62780	Snake Eye	fish	intrinsic item metadata	public
62781	Giant Turtle Tongue	fish	intrinsic item metadata	public
62782	Dragon Flank	fish	intrinsic item metadata	public
62783	Basilisk "Liver"	fish	intrinsic item metadata	public
62784	Crocolisk Tail	fish	intrinsic item metadata	public
62785	Delicate Wing	fish	intrinsic item metadata	public
62786	Cocoa Beans	fish	single profession category	public
62790	Darkbrew Lager	food	intrinsic item metadata	public
62791	Blood Shrimp	fish	intrinsic item metadata	public
63122	Lifegiving Seed	herbs	specialized bag and profession data	public
63127	Highborne Scroll	archaeology	MoP archaeology keystone data	public
63128	Troll Tablet	archaeology	MoP archaeology keystone data	public
63140	Drums of the Burning Wild	leatherworking	specialized bag and profession data	public
63246	Origami Beetle	inscription	specialized bag and profession data	public
63251	Mei's Masterful Brew	food	intrinsic item metadata	public
63275	Gilnean Fortified Brandy	food	intrinsic item metadata	public
63291	Blood Red Ale	food	intrinsic item metadata	public
63292	Disgusting Rotgut	food	intrinsic item metadata	public
63293	Blackheart Grog	food	intrinsic item metadata	public
63296	Embalming Fluid	food	intrinsic item metadata	public
63299	Sunkissed Wine	food	intrinsic item metadata	public
63303	Scroll of Agility IX	inscription	specialized bag and profession data	public
63304	Scroll of Strength IX	inscription	specialized bag and profession data	public
63305	Scroll of Intellect IX	inscription	specialized bag and profession data	public
63306	Scroll of Stamina IX	inscription	specialized bag and profession data	public
63307	Scroll of Spirit IX	inscription	specialized bag and profession data	public
63308	Scroll of Protection IX	inscription	specialized bag and profession data	public
63388	Dust of Disappearance	inscription	specialized bag and profession data	public
63396	Big Daddy	engineering	specialized bag and profession data	public
63415	zzOLDGlyph of Armors		obsolete client record	excluded
63416	Glyph of Rapid Teleportation	inscription	intrinsic item metadata	public
63420	Glyph of Vanish	inscription	intrinsic item metadata	public
63481	Glyph of Colossus Smash	inscription	intrinsic item metadata	public
63530	Refreshing Pineapple Punch	food	intrinsic item metadata	public
63539	Glyph of Inferno Blast	inscription	intrinsic item metadata	public
63691	Brivelthwerp's Crunchy Ice Cream Bar	food	intrinsic item metadata	public
63692	Frozen "Cream" Custard	food	intrinsic item metadata	public
63693	Ooey Gooey Gelato	food	intrinsic item metadata	public
63694	Silithid-Free Sorbet	food	intrinsic item metadata	public
64392	Orc Blood Text	archaeology	MoP archaeology keystone data	public
64394	Draenei Tome	archaeology	MoP archaeology keystone data	public
64395	Vrykul Rune Stick	archaeology	MoP archaeology keystone data	public
64396	Nerubian Obelisk	archaeology	MoP archaeology keystone data	public
64397	Tol'vir Hieroglyphic	archaeology	MoP archaeology keystone data	public
64493	Glyph of Blind	inscription	intrinsic item metadata	public
64670	Vanishing Powder	inscription	specialized bag and profession data	public
65358	Elementium Rod	enchanting	intrinsic item metadata	public
65365	Folded Obsidium	ore	intrinsic item metadata	public
65891	Vial of the Sands	alchemy	single crafted-product category	public
65892	Pyrium-Laced Crystalline Vial	alchemy	single profession category	public
65893	Sands of Time	alchemy	single profession category	public
66918	Glyph of Protector of the Innocent	inscription	intrinsic item metadata	public
67229	Stag Flank	fish	intrinsic item metadata	public
67230	Venison Jerky	food	intrinsic item metadata	public
67231	Runescroll of Might	inscription	specialized bag and profession data	public
67274	Enchanted Lantern	battle_pets	intrinsic item metadata	public
67275	Magic Lamp	battle_pets	intrinsic item metadata	public
67319	Preserved Ogre Eye	inscription	specialized bag and profession data	public
67335	Silver Charm Bracelet	inscription	specialized bag and profession data	public
67348	Bleached Jawbone	inscription	specialized bag and profession data	public
67361	Strange Food	food	intrinsic item metadata	public
67362	Weird Food	food	intrinsic item metadata	public
67363	Puzzling Food	food	intrinsic item metadata	public
67364	Vegetarian Food	food	intrinsic item metadata	public
67365	Exotic Food	food	intrinsic item metadata	public
67366	Wriggling Food	food	intrinsic item metadata	public
67367	Strange Drink	food	intrinsic item metadata	public
67368	Weird Drink	food	intrinsic item metadata	public
67369	Puzzling Drink	food	intrinsic item metadata	public
67370	Vegetarian Drink	food	intrinsic item metadata	public
67371	Exotic Drink	food	intrinsic item metadata	public
67372	Wriggling Drink	food	intrinsic item metadata	public
67373	Bubbling Drink	food	intrinsic item metadata	public
67374	Bitter Drink	food	intrinsic item metadata	public
67375	Sweet Drink	food	intrinsic item metadata	public
67376	Foul Drink	food	intrinsic item metadata	public
67377	Steaming Drink	food	intrinsic item metadata	public
67378	Acidic Drink	food	intrinsic item metadata	public
67379	Bubbling Food	food	intrinsic item metadata	public
67380	Bitter Food	food	intrinsic item metadata	public
67381	Sweet Food	food	intrinsic item metadata	public
67382	Foul Food	food	intrinsic item metadata	public
67383	Steaming Food	food	intrinsic item metadata	public
67384	Acidic Food	food	intrinsic item metadata	public
67404	Glass Fishing Bobber	fish	specialized bag and profession data	public
67415	Draught of War	alchemy	intrinsic item metadata	public
67416	Mythical Battle Draught	alchemy	intrinsic item metadata	public
67435	Loot-A-Rang (INTERNAL ONLY)		internal-only record	excluded
67438	Flask of Flowing Water	alchemy	intrinsic item metadata	public
67482	Glyph of Bull Rush	inscription	intrinsic item metadata	public
67483	Glyph of Recklessness	inscription	intrinsic item metadata	public
67484	Glyph of Fae Silence	inscription	intrinsic item metadata	public
67485	Glyph of Faerie Fire	inscription	intrinsic item metadata	public
67486	Glyph of the Predator	inscription	intrinsic item metadata	public
67487	Glyph of Cat Form	inscription	intrinsic item metadata	public
67597	Sealed Crate	fish	specialized bag and profession data	public
67602	Elementium Gutslicer	weapons	intrinsic item metadata	public
67605	Forged Elementium Mindcrusher	weapons	intrinsic item metadata	public
67749	Electrified Ether	engineering	specialized bag and profession data	public
67944	Firelord's Draught	alchemy	intrinsic item metadata	public
68039	Glyph of the Treant	inscription	intrinsic item metadata	public
68047	Scavenged Dragon Horn	inscription	specialized bag and profession data	public
68049	Heat-Treated Spinning Lure	fish	specialized bag and profession data	public
68050	Shatterscale Mightfish	weapons	intrinsic item metadata	public
68134	Enchant 2H Weapon - Mighty Agility	enchanting	intrinsic item metadata	public
68140	Invigorating Pineapple Punch	food	intrinsic item metadata	public
68356	Willful Ember Topaz	jewels	intrinsic item metadata	public
68357	Lucent Ember Topaz	jewels	intrinsic item metadata	public
68358	Resplendent Ember Topaz	jewels	intrinsic item metadata	public
68660	Mystic Cogwheel	jewels	intrinsic item metadata	public
68687	Scalding Murglesnout	food	intrinsic item metadata	public
68741	Vivid Dream Emerald	jewels	intrinsic item metadata	public
68778	Agile Shadowspirit Diamond	jewels	intrinsic item metadata	public
68779	Reverberating Shadowspirit Diamond	jewels	intrinsic item metadata	public
68780	Burning Shadowspirit Diamond	jewels	intrinsic item metadata	public
68781	Design: Agile Shadowspirit Diamond	jewels	intrinsic item metadata	public
68782	Design: Reverberating Shadowspirit Diamond	jewels	intrinsic item metadata	public
68783	Design: Burning Shadowspirit Diamond	jewels	intrinsic item metadata	public
68784	Enchant Bracer - Agility	enchanting	intrinsic item metadata	public
68785	Enchant Bracer - Major Strength	enchanting	intrinsic item metadata	public
68786	Enchant Bracer - Mighty Intellect	enchanting	intrinsic item metadata	public
68787	Formula: Enchant Bracer - Agility	enchanting	intrinsic item metadata	public
68788	Formula: Enchant Bracer - Major Strength	enchanting	intrinsic item metadata	public
68789	Formula: Enchant Bracer - Mighty Intellect	enchanting	intrinsic item metadata	public
68793	Glyph of Dark Succor	inscription	intrinsic item metadata	public
68797	Stendel's Wedding Band	armor	intrinsic item metadata	public
68810	Technique: Glyph of Colossus Smash	inscription	intrinsic item metadata	public
69237	Living Ember	profession_supplies	curated shared crafting reagent	public
69243	Ice Cream Cake Slice	food	intrinsic item metadata	public
69244	Ice Cream Bar	food	intrinsic item metadata	public
69773	Glyph of Armors	inscription	intrinsic item metadata	public
69820	Design: Reckless Hessonite	jewels	intrinsic item metadata	public
69852	Punisher's Band	armor	intrinsic item metadata	public
69920	Thrice-Spiced Crunchy Stew	food	intrinsic item metadata	public
69922	Brilliant Blazejewel	jewels	intrinsic item metadata	public
69923	Delicate Blazejewel	jewels	intrinsic item metadata	public
69936	Fists of Fury	armor	intrinsic item metadata	public
69937	Eternal Elementium Handguards	armor	intrinsic item metadata	public
69938	Holy Flame Gauntlets	armor	intrinsic item metadata	public
69939	Dragonfire Gloves	armor	intrinsic item metadata	public
69941	Gloves of Unforgiving Flame	armor	intrinsic item metadata	public
69942	Clutches of Evil	armor	intrinsic item metadata	public
69943	Heavenly Gloves of the Moon	armor	intrinsic item metadata	public
69944	Grips of Altered Reality	armor	intrinsic item metadata	public
69945	Don Tayo's Inferno Mittens	armor	intrinsic item metadata	public
69946	Warboots of Mighty Lords	armor	intrinsic item metadata	public
69947	Mirrored Boots	armor	intrinsic item metadata	public
69948	Emberforged Elementium Boots	armor	intrinsic item metadata	public
69949	Earthen Scale Sabatons	armor	intrinsic item metadata	public
69950	Footwraps of Quenched Fire	armor	intrinsic item metadata	public
69951	Treads of the Craft	armor	intrinsic item metadata	public
69952	Ethereal Footfalls	armor	intrinsic item metadata	public
69953	Endless Dream Walkers	armor	intrinsic item metadata	public
69954	Boots of the Black Flame	armor	intrinsic item metadata	public
69955	Slimy Locket	fish	specialized bag and profession data	public
69957	Plans: Fists of Fury	blacksmithing	intrinsic item metadata	public
69958	Plans: Eternal Elementium Handguards	blacksmithing	intrinsic item metadata	public
69959	Plans: Holy Flame Gauntlets	blacksmithing	intrinsic item metadata	public
69960	Pattern: Dragonfire Gloves	leatherworking	intrinsic item metadata	public
69961	Pattern: Gloves of Unforgiving Flame	leatherworking	intrinsic item metadata	public
69962	Pattern: Clutches of Evil	leatherworking	intrinsic item metadata	public
69963	Pattern: Heavenly Gloves of the Moon	leatherworking	intrinsic item metadata	public
69965	Pattern: Grips of Altered Reality	tailoring	intrinsic item metadata	public
69966	Pattern: Don Tayo's Inferno Mittens	tailoring	intrinsic item metadata	public
69968	Plans: Warboots of Mighty Lords	blacksmithing	intrinsic item metadata	public
69969	Plans: Mirrored Boots	blacksmithing	intrinsic item metadata	public
69970	Plans: Emberforged Elementium Boots	blacksmithing	intrinsic item metadata	public
69971	Pattern: Earthen Scale Sabatons	leatherworking	intrinsic item metadata	public
69972	Pattern: Footwraps of Quenched Fire	leatherworking	intrinsic item metadata	public
69973	Pattern: Treads of the Craft	leatherworking	intrinsic item metadata	public
69974	Pattern: Ethereal Footfalls	leatherworking	intrinsic item metadata	public
69975	Pattern: Endless Dream Walkers	tailoring	intrinsic item metadata	public
69976	Pattern: Boots of the Black Flame	tailoring	intrinsic item metadata	public
70004	Bloodthirsty Pyrium Breastplate	armor	intrinsic item metadata	public
70005	Bloodthirsty Pyrium Boots	armor	intrinsic item metadata	public
70006	Bloodthirsty Pyrium Gauntlets	armor	intrinsic item metadata	public
70007	Bloodthirsty Pyrium Helm	armor	intrinsic item metadata	public
70008	Bloodthirsty Pyrium Legguards	armor	intrinsic item metadata	public
70009	Bloodthirsty Pyrium Shoulders	armor	intrinsic item metadata	public
70010	Bloodthirsty Pyrium Belt	armor	intrinsic item metadata	public
70011	Bloodthirsty Pyrium Bracers	armor	intrinsic item metadata	public
70012	Bloodthirsty Ornate Pyrium Breastplate	armor	intrinsic item metadata	public
70013	Bloodthirsty Ornate Pyrium Boots	armor	intrinsic item metadata	public
70014	Bloodthirsty Ornate Pyrium Gauntlets	armor	intrinsic item metadata	public
70015	Bloodthirsty Ornate Pyrium Helm	armor	intrinsic item metadata	public
70016	Bloodthirsty Ornate Pyrium Legguards	armor	intrinsic item metadata	public
70017	Bloodthirsty Ornate Pyrium Shoulders	armor	intrinsic item metadata	public
70018	Bloodthirsty Ornate Pyrium Belt	armor	intrinsic item metadata	public
70019	Bloodthirsty Ornate Pyrium Bracers	armor	intrinsic item metadata	public
70020	Bloodthirsty Leather Belt	armor	intrinsic item metadata	public
70021	Bloodthirsty Leather Boots	armor	intrinsic item metadata	public
70022	Bloodthirsty Leather Bracers	armor	intrinsic item metadata	public
70023	Bloodthirsty Leather Chest	armor	intrinsic item metadata	public
70024	Bloodthirsty Leather Gloves	armor	intrinsic item metadata	public
70025	Bloodthirsty Leather Helm	armor	intrinsic item metadata	public
70026	Bloodthirsty Leather Legs	armor	intrinsic item metadata	public
70027	Bloodthirsty Leather Shoulders	armor	intrinsic item metadata	public
70028	Bloodthirsty Wyrmhide Belt	armor	intrinsic item metadata	public
70029	Bloodthirsty Wyrmhide Boots	armor	intrinsic item metadata	public
70030	Bloodthirsty Wyrmhide Bracers	armor	intrinsic item metadata	public
70031	Bloodthirsty Wyrmhide Chest	armor	intrinsic item metadata	public
70032	Bloodthirsty Wyrmhide Gloves	armor	intrinsic item metadata	public
70033	Bloodthirsty Wyrmhide Helm	armor	intrinsic item metadata	public
70034	Bloodthirsty Wyrmhide Legs	armor	intrinsic item metadata	public
70035	Bloodthirsty Wyrmhide Shoulders	armor	intrinsic item metadata	public
70036	Bloodthirsty Dragonscale Belt	armor	intrinsic item metadata	public
70037	Bloodthirsty Dragonscale Boots	armor	intrinsic item metadata	public
70038	Bloodthirsty Dragonscale Bracers	armor	intrinsic item metadata	public
70039	Bloodthirsty Dragonscale Chest	armor	intrinsic item metadata	public
70040	Bloodthirsty Dragonscale Gloves	armor	intrinsic item metadata	public
70041	Bloodthirsty Dragonscale Helm	armor	intrinsic item metadata	public
70042	Bloodthirsty Dragonscale Legs	armor	intrinsic item metadata	public
70043	Bloodthirsty Dragonscale Shoulders	armor	intrinsic item metadata	public
70044	Bloodthirsty Charscale Belt	armor	intrinsic item metadata	public
70045	Bloodthirsty Charscale Boots	armor	intrinsic item metadata	public
70046	Bloodthirsty Charscale Bracers	armor	intrinsic item metadata	public
70047	Bloodthirsty Charscale Chest	armor	intrinsic item metadata	public
70048	Bloodthirsty Charscale Gloves	armor	intrinsic item metadata	public
70049	Bloodthirsty Charscale Helm	armor	intrinsic item metadata	public
70050	Bloodthirsty Charscale Legs	armor	intrinsic item metadata	public
70051	Bloodthirsty Charscale Shoulders	armor	intrinsic item metadata	public
70052	Bloodthirsty Fireweave Belt	armor	intrinsic item metadata	public
70053	Bloodthirsty Fireweave Boots	armor	intrinsic item metadata	public
70054	Bloodthirsty Fireweave Bracers	armor	intrinsic item metadata	public
70055	Bloodthirsty Fireweave Cowl	armor	intrinsic item metadata	public
70056	Bloodthirsty Fireweave Gloves	armor	intrinsic item metadata	public
70057	Bloodthirsty Fireweave Pants	armor	intrinsic item metadata	public
70058	Bloodthirsty Fireweave Robe	armor	intrinsic item metadata	public
70059	Bloodthirsty Fireweave Shoulders	armor	intrinsic item metadata	public
70060	Bloodthirsty Embersilk Robe	armor	intrinsic item metadata	public
70061	Bloodthirsty Embersilk Boots	armor	intrinsic item metadata	public
70062	Bloodthirsty Embersilk Belt	armor	intrinsic item metadata	public
70063	Bloodthirsty Embersilk Bracers	armor	intrinsic item metadata	public
70064	Bloodthirsty Embersilk Shoulders	armor	intrinsic item metadata	public
70065	Bloodthirsty Embersilk Gloves	armor	intrinsic item metadata	public
70066	Bloodthirsty Embersilk Pants	armor	intrinsic item metadata	public
70067	Bloodthirsty Embersilk Cowl	armor	intrinsic item metadata	public
70068	Bloodthirsty Fur Cloak	armor	intrinsic item metadata	public
70069	Bloodthirsty Hide Cloak	armor	intrinsic item metadata	public
70070	Bloodthirsty Embersilk Cape	armor	intrinsic item metadata	public
70071	Bloodthirsty Sapphire Ring	armor	intrinsic item metadata	public
70072	Bloodthirsty Amberjewel Band	armor	intrinsic item metadata	public
70073	Bloodthirsty Ruby Signet	armor	intrinsic item metadata	public
70074	Bloodthirsty Sapphire Necklace	armor	intrinsic item metadata	public
70075	Bloodthirsty Amberjewel Pendant	armor	intrinsic item metadata	public
70076	Bloodthirsty Ruby Choker	armor	intrinsic item metadata	public
70077	Bloodthirsty Charm of Triumph	inscription	single crafted-product category	public
70078	Bloodthirsty Eyeball of Dominance	inscription	single crafted-product category	public
70079	Bloodthirsty Jawbone of Conquest	inscription	single crafted-product category	public
70136	Royal Scribe's Satchel	bags	intrinsic item metadata	public
70137	Triple-Reinforced Mining Bag	bags	intrinsic item metadata	public
70138	Luxurious Silk Gem Bag	bags	intrinsic item metadata	public
70139	Flintlocke's Woodchucker	engineering	specialized bag and profession data	public
70155	Brainsplinter	weapons	intrinsic item metadata	public
70156	Masterwork Elementium Spellblade	weapons	intrinsic item metadata	public
70157	Lightforged Elementium Hammer	weapons	intrinsic item metadata	public
70158	Elementium-Edged Scalper	weapons	intrinsic item metadata	public
70162	Pyrium Spellward	weapons	intrinsic item metadata	public
70163	Unbreakable Guardian	weapons	intrinsic item metadata	public
70164	Masterwork Elementium Deathblade	weapons	intrinsic item metadata	public
70165	Witch-Hunter's Harvester	weapons	intrinsic item metadata	public
71077	Extreme-Impact Hole Puncher	weapons	intrinsic item metadata	public
71155	Glyph of Lightning Shield	inscription	intrinsic item metadata	public
71720	Drakehide Leg Armor	enchanting	intrinsic item metadata	public
71799	zzOLD Glyph of Stabbing		obsolete client record	excluded
71805	Queen's Garnet	jewels	intrinsic item metadata	public
71806	Lightstone	jewels	intrinsic item metadata	public
71807	Deepholm Iolite	jewels	intrinsic item metadata	public
71808	Lava Coral	jewels	intrinsic item metadata	public
71809	Shadow Spinel	jewels	intrinsic item metadata	public
71810	Elven Peridot	jewels	intrinsic item metadata	public
71817	Rigid Deepholm Iolite	jewels	intrinsic item metadata	public
71818	Stormy Deepholm Iolite	jewels	intrinsic item metadata	public
71819	Sparkling Deepholm Iolite	jewels	intrinsic item metadata	public
71820	Solid Deepholm Iolite	jewels	intrinsic item metadata	public
71822	Misty Elven Peridot	jewels	intrinsic item metadata	public
71823	Piercing Elven Peridot	jewels	intrinsic item metadata	public
71824	Lightning Elven Peridot	jewels	intrinsic item metadata	public
71825	Sensei's Elven Peridot	jewels	intrinsic item metadata	public
71826	Infused Elven Peridot	jewels	intrinsic item metadata	public
71827	Zen Elven Peridot	jewels	intrinsic item metadata	public
71828	Balanced Elven Peridot	jewels	intrinsic item metadata	public
71829	Vivid Elven Peridot	jewels	intrinsic item metadata	public
71830	Turbid Elven Peridot	jewels	intrinsic item metadata	public
71831	Radiant Elven Peridot	jewels	intrinsic item metadata	public
71832	Shattered Elven Peridot	jewels	intrinsic item metadata	public
71833	Energized Elven Peridot	jewels	intrinsic item metadata	public
71834	Jagged Elven Peridot	jewels	intrinsic item metadata	public
71835	Regal Elven Peridot	jewels	intrinsic item metadata	public
71836	Forceful Elven Peridot	jewels	intrinsic item metadata	public
71837	Nimble Elven Peridot	jewels	intrinsic item metadata	public
71838	Puissant Elven Peridot	jewels	intrinsic item metadata	public
71839	Steady Elven Peridot	jewels	intrinsic item metadata	public
71840	Deadly Lava Coral	jewels	intrinsic item metadata	public
71841	Crafty Lava Coral	jewels	intrinsic item metadata	public
71842	Potent Lava Coral	jewels	intrinsic item metadata	public
71843	Inscribed Lava Coral	jewels	intrinsic item metadata	public
71844	Polished Lava Coral	jewels	intrinsic item metadata	public
71845	Resolute Lava Coral	jewels	intrinsic item metadata	public
71846	Stalwart Lava Coral	jewels	intrinsic item metadata	public
71847	Champion's Lava Coral	jewels	intrinsic item metadata	public
71848	Deft Lava Coral	jewels	intrinsic item metadata	public
71849	Wicked Lava Coral	jewels	intrinsic item metadata	public
71850	Reckless Lava Coral	jewels	intrinsic item metadata	public
71851	Fierce Lava Coral	jewels	intrinsic item metadata	public
71852	Adept Lava Coral	jewels	intrinsic item metadata	public
71853	Keen Lava Coral	jewels	intrinsic item metadata	public
71854	Artful Lava Coral	jewels	intrinsic item metadata	public
71855	Fine Lava Coral	jewels	intrinsic item metadata	public
71856	Skillful Lava Coral	jewels	intrinsic item metadata	public
71857	Lucent Lava Coral	jewels	intrinsic item metadata	public
71858	Tenuous Lava Coral	jewels	intrinsic item metadata	public
71859	Willful Lava Coral	jewels	intrinsic item metadata	public
71860	Splendid Lava Coral	jewels	intrinsic item metadata	public
71861	Resplendent Lava Coral	jewels	intrinsic item metadata	public
71862	Glinting Shadow Spinel	jewels	intrinsic item metadata	public
71863	Accurate Shadow Spinel	jewels	intrinsic item metadata	public
71864	Veiled Shadow Spinel	jewels	intrinsic item metadata	public
71865	Retaliating Shadow Spinel	jewels	intrinsic item metadata	public
71866	Etched Shadow Spinel	jewels	intrinsic item metadata	public
71867	Mysterious Shadow Spinel	jewels	intrinsic item metadata	public
71868	Purified Shadow Spinel	jewels	intrinsic item metadata	public
71869	Shifting Shadow Spinel	jewels	intrinsic item metadata	public
71870	Guardian's Shadow Spinel	jewels	intrinsic item metadata	public
71871	Timeless Shadow Spinel	jewels	intrinsic item metadata	public
71872	Defender's Shadow Spinel	jewels	intrinsic item metadata	public
71873	Sovereign Shadow Spinel	jewels	intrinsic item metadata	public
71874	Smooth Lightstone	jewels	intrinsic item metadata	public
71875	Subtle Lightstone	jewels	intrinsic item metadata	public
71876	Quick Lightstone	jewels	intrinsic item metadata	public
71877	Fractured Lightstone	jewels	intrinsic item metadata	public
71878	Mystic Lightstone	jewels	intrinsic item metadata	public
71879	Delicate Queen's Garnet	jewels	intrinsic item metadata	public
71880	Precise Queen's Garnet	jewels	intrinsic item metadata	public
71881	Brilliant Queen's Garnet	jewels	intrinsic item metadata	public
71882	Flashing Queen's Garnet	jewels	intrinsic item metadata	public
71883	Bold Queen's Garnet	jewels	intrinsic item metadata	public
71966	Shiny Bronze Rivet	engineering	curated player-facing category	public
71980	Lavaquake Legwraps	armor	intrinsic item metadata	public
71981	World Mender's Pants	armor	intrinsic item metadata	public
71982	Pyrium Legplates of Purified Evil	armor	intrinsic item metadata	public
71983	Unstoppable Destroyer's Legplates	armor	intrinsic item metadata	public
71984	Foundations of Courage	armor	intrinsic item metadata	public
71985	Bladeshadow Leggings	armor	intrinsic item metadata	public
71986	Leggings of Nature's Champion	armor	intrinsic item metadata	public
71987	Rended Earth Leggings	armor	intrinsic item metadata	public
71988	Deathscale Leggings	armor	intrinsic item metadata	public
71989	Bracers of Unconquered Power	armor	intrinsic item metadata	public
71990	Dreamwraps of the Light	armor	intrinsic item metadata	public
71991	Soul Redeemer Bracers	armor	intrinsic item metadata	public
71992	Bracers of Destructive Strength	armor	intrinsic item metadata	public
71993	Titanguard Wristplates	armor	intrinsic item metadata	public
71994	Bladeshadow Wristguards	armor	intrinsic item metadata	public
71995	Bracers of Flowing Serenity	armor	intrinsic item metadata	public
71996	Bracers of the Hunter-Killer	armor	intrinsic item metadata	public
71997	Thundering Deathscale Wristguards	armor	intrinsic item metadata	public
71998	Essence of Destruction	profession_supplies	curated shared crafting reagent	public
71999	Pattern: Leggings of Nature's Champion	leatherworking	intrinsic item metadata	public
72000	Pattern: World Mender's Pants	tailoring	intrinsic item metadata	public
72001	Plans: Pyrium Legplates of Purified Evil	blacksmithing	intrinsic item metadata	public
72002	Pattern: Lavaquake Legwraps	tailoring	intrinsic item metadata	public
72003	Pattern: Dreamwraps of the Light	tailoring	intrinsic item metadata	public
72004	Pattern: Bracers of Unconquered Power	tailoring	intrinsic item metadata	public
72005	Pattern: Deathscale Leggings	leatherworking	intrinsic item metadata	public
72006	Pattern: Bladeshadow Leggings	leatherworking	intrinsic item metadata	public
72007	Pattern: Rended Earth Leggings	leatherworking	intrinsic item metadata	public
72008	Pattern: Bracers of Flowing Serenity	leatherworking	intrinsic item metadata	public
72009	Pattern: Thundering Deathscale Wristguards	leatherworking	intrinsic item metadata	public
72010	Pattern: Bladeshadow Wristguards	leatherworking	intrinsic item metadata	public
72011	Pattern: Bracers of the Hunter-Killer	leatherworking	intrinsic item metadata	public
72012	Plans: Unstoppable Destroyer's Legplates	blacksmithing	intrinsic item metadata	public
72013	Plans: Foundations of Courage	blacksmithing	intrinsic item metadata	public
72014	Plans: Soul Redeemer Bracers	blacksmithing	intrinsic item metadata	public
72015	Plans: Bracers of Destructive Strength	blacksmithing	intrinsic item metadata	public
72016	Plans: Titanguard Wristplates	blacksmithing	intrinsic item metadata	public
72070	Enchant Gloves - Assault	enchanting	intrinsic item metadata	public
72092	Ghost Iron Ore	ore	intrinsic item metadata	public
72093	Kyparite	ore	intrinsic item metadata	public
72094	Black Trillium Ore	ore	intrinsic item metadata	public
72095	Trillium Bar	ore	intrinsic item metadata	public
72096	Ghost Iron Bar	ore	intrinsic item metadata	public
72097	DEPRECATED Manticyte Bar		deprecated client record	excluded
72103	White Trillium Ore	ore	intrinsic item metadata	public
72104	Living Steel	ore	intrinsic item metadata	public
72120	Mist-Touched Leather	leather	intrinsic item metadata	public
72162	Sha-Touched Leather	leather	intrinsic item metadata	public
72163	Magnificent Hide	leather	intrinsic item metadata	public
72164	Type1 Leather [PH]		placeholder item	excluded
72165	Type2 Leather [PH]		placeholder item	excluded
72174	Type3 Leather [PH]		placeholder item	excluded
72175	Type4 Leather [PH]		placeholder item	excluded
72234	Green Tea Leaf	herbs	intrinsic item metadata	public
72235	Silkweed	herbs	intrinsic item metadata	public
72237	Rain Poppy	herbs	intrinsic item metadata	public
72238	Golden Lotus	herbs	intrinsic item metadata	public
72985	Windwool Bandage	first_aid	intrinsic item metadata	public
72986	Heavy Windwool Bandage	first_aid	intrinsic item metadata	public
72987	Dense Windwool Bandage DEPRECATED		deprecated client record	excluded
72988	Windwool Cloth	cloth	intrinsic item metadata	public
73260	Salty Sea Dog	food	intrinsic item metadata	public
74142	Darkmoon Firework	engineering	specialized bag and profession data	public
74247	Ethereal Shard	enchanting	intrinsic item metadata	public
74248	Sha Crystal	enchanting	intrinsic item metadata	public
74249	Spirit Dust	enchanting	intrinsic item metadata	public
74250	Mysterious Essence	enchanting	intrinsic item metadata	public
74251	Greater Mysterious Essence	enchanting	intrinsic item metadata	public
74252	Small Ethereal Shard	enchanting	intrinsic item metadata	public
74609	Battered Carp	food	intrinsic item metadata	public
74636	Golden Carp Consomme	food	intrinsic item metadata	public
74641	Fish Cake	food	intrinsic item metadata	public
74642	Charbroiled Tiger Steak	food	intrinsic item metadata	public
74643	Sauteed Carrots	food	intrinsic item metadata	public
74644	Swirling Mist Soup	food	intrinsic item metadata	public
74645	Eternal Blossom Fish	food	intrinsic item metadata	public
74646	Black Pepper Ribs and Shrimp	food	intrinsic item metadata	public
74647	Valley Stir Fry	food	intrinsic item metadata	public
74648	Sea Mist Rice Noodles	food	intrinsic item metadata	public
74649	Braised Turtle	food	intrinsic item metadata	public
74650	Mogu Fish Stew	food	intrinsic item metadata	public
74651	Shrimp Dumplings	food	intrinsic item metadata	public
74652	Fire Spirit Salmon	food	intrinsic item metadata	public
74653	Steamed Crab Surprise	food	intrinsic item metadata	public
74654	Wildfowl Roast	food	intrinsic item metadata	public
74655	Twin Fish Platter	food	intrinsic item metadata	public
74656	Chun Tian Spring Rolls	food	intrinsic item metadata	public
74659	Farm Chicken	fish	intrinsic item metadata	public
74660	Pandaren Peach	fish	intrinsic item metadata	public
74661	Black Pepper	fish	intrinsic item metadata	public
74662	Rice Flour	fish	intrinsic item metadata	public
74700	Enchant Bracer - Mastery	enchanting	intrinsic item metadata	public
74701	Enchant Bracer - Major Dodge	enchanting	intrinsic item metadata	public
74703	Enchant Bracer - Super Intellect	enchanting	intrinsic item metadata	public
74704	Enchant Bracer - Exceptional Strength	enchanting	intrinsic item metadata	public
74705	Enchant Bracer - Greater Agility	enchanting	intrinsic item metadata	public
74706	Enchant Chest - Super Resilience	enchanting	intrinsic item metadata	public
74707	Enchant Chest - Mighty Spirit	enchanting	intrinsic item metadata	public
74708	Enchant Chest - Glorious Stats	enchanting	intrinsic item metadata	public
74709	Enchant Chest - Superior Stamina	enchanting	intrinsic item metadata	public
74710	Enchant Cloak - Accuracy	enchanting	intrinsic item metadata	public
74711	Enchant Cloak - Greater Protection	enchanting	intrinsic item metadata	public
74712	Enchant Cloak - Superior Intellect	enchanting	intrinsic item metadata	public
74713	Enchant Cloak - Superior Critical Strike	enchanting	intrinsic item metadata	public
74715	Enchant Boots - Greater Haste	enchanting	intrinsic item metadata	public
74716	Enchant Boots - Greater Precision	enchanting	intrinsic item metadata	public
74717	Enchant Boots - Blurred Speed	enchanting	intrinsic item metadata	public
74718	Enchant Boots - Pandaren's Step	enchanting	intrinsic item metadata	public
74719	Enchant Gloves - Greater Haste	enchanting	intrinsic item metadata	public
74720	Enchant Gloves - Superior Expertise	enchanting	intrinsic item metadata	public
74721	Enchant Gloves - Super Strength	enchanting	intrinsic item metadata	public
74722	Enchant Gloves - Superior Mastery	enchanting	intrinsic item metadata	public
74723	Enchant Weapon - Windsong	enchanting	intrinsic item metadata	public
74724	Enchant Weapon - Jade Spirit	enchanting	intrinsic item metadata	public
74725	Enchant Weapon - Elemental Force	enchanting	intrinsic item metadata	public
74726	Enchant Weapon - Dancing Steel	enchanting	intrinsic item metadata	public
74727	Enchant Weapon - Colossus	enchanting	intrinsic item metadata	public
74728	Enchant Weapon - River's Song	enchanting	intrinsic item metadata	public
74729	Enchant Off-Hand - Major Intellect	enchanting	intrinsic item metadata	public
74822	Sasparilla Sinker	food	intrinsic item metadata	public
74832	Barley	fish	intrinsic item metadata	public
74833	Raw Tiger Steak	fish	intrinsic item metadata	public
74834	Mushan Ribs	fish	intrinsic item metadata	public
74837	Raw Turtle Meat	fish	intrinsic item metadata	public
74838	Raw Crab Meat	fish	intrinsic item metadata	public
74839	Wildfowl Breast	fish	intrinsic item metadata	public
74840	Green Cabbage	fish	intrinsic item metadata	public
74841	Juicycrunch Carrot	fish	intrinsic item metadata	public
74842	Mogu Pumpkin	fish	intrinsic item metadata	public
74843	Scallions	fish	intrinsic item metadata	public
74844	Red Blossom Leek	fish	intrinsic item metadata	public
74845	Ginseng	fish	intrinsic item metadata	public
74846	Witchberries	fish	intrinsic item metadata	public
74847	Jade Squash	fish	intrinsic item metadata	public
74848	Striped Melon	fish	intrinsic item metadata	public
74849	Pink Turnip	fish	intrinsic item metadata	public
74850	White Turnip	fish	intrinsic item metadata	public
74851	Rice	fish	intrinsic item metadata	public
74852	Yak Milk	fish	intrinsic item metadata	public
74853	100 Year Soy Sauce	fish	intrinsic item metadata	public
74854	Instant Noodles	fish	intrinsic item metadata	public
74856	Jade Lungfish	fish	intrinsic item metadata	public
74857	Giant Mantis Shrimp	fish	intrinsic item metadata	public
74859	Emperor Salmon	fish	intrinsic item metadata	public
74860	Redbelly Mandarin	fish	intrinsic item metadata	public
74861	Tiger Gourami	fish	intrinsic item metadata	public
74863	Jewel Danio	fish	intrinsic item metadata	public
74864	Reef Octopus	fish	intrinsic item metadata	public
74865	Krasarang Paddlefish	fish	intrinsic item metadata	public
74866	Golden Carp	fish	intrinsic item metadata	public
74919	Pandaren Banquet	food	intrinsic item metadata	public
74921	Darkmoon Doughnut	food	intrinsic item metadata	public
75014	Raw Crocolisk Belly	fish	intrinsic item metadata	public
75015	Sirloin Steak	fish	intrinsic item metadata	public
75016	Great Pandaren Banquet	food	intrinsic item metadata	public
75026	Ginseng Tea	food	intrinsic item metadata	public
75037	Jade Witch Brew	food	intrinsic item metadata	public
75038	Mad Brewer's Breakfast	food	intrinsic item metadata	public
75061	Vicious Charscale Shoulders	armor	intrinsic item metadata	public
75062	Vicious Fireweave Cowl	armor	intrinsic item metadata	public
75063	Vicious Fireweave Gloves	armor	intrinsic item metadata	public
75064	Vicious Embersilk Shoulders	armor	intrinsic item metadata	public
75065	Vicious Embersilk Cape	armor	intrinsic item metadata	public
75067	Vicious Sapphire Ring	armor	intrinsic item metadata	public
75068	Vicious Amberjewel Band	armor	intrinsic item metadata	public
75070	Vicious Embersilk Gloves	armor	intrinsic item metadata	public
75071	Vicious Ruby Signet	armor	intrinsic item metadata	public
75072	Vicious Embersilk Pants	armor	intrinsic item metadata	public
75073	Vicious Embersilk Cowl	armor	intrinsic item metadata	public
75074	Vicious Sapphire Necklace	armor	intrinsic item metadata	public
75075	Vicious Amberjewel Pendant	armor	intrinsic item metadata	public
75076	Vicious Fur Cloak	armor	intrinsic item metadata	public
75077	Vicious Hide Cloak	armor	intrinsic item metadata	public
75078	Vicious Ruby Choker	armor	intrinsic item metadata	public
75080	Vicious Wyrmhide Legs	armor	intrinsic item metadata	public
75081	Vicious Dragonscale Gloves	armor	intrinsic item metadata	public
75082	Vicious Fireweave Pants	armor	intrinsic item metadata	public
75083	Vicious Charscale Belt	armor	intrinsic item metadata	public
75084	Vicious Charscale Chest	armor	intrinsic item metadata	public
75085	Vicious Charscale Gloves	armor	intrinsic item metadata	public
75086	Vicious Fireweave Belt	armor	intrinsic item metadata	public
75087	Vicious Fireweave Boots	armor	intrinsic item metadata	public
75088	Vicious Fireweave Robe	armor	intrinsic item metadata	public
75089	Vicious Fireweave Bracers	armor	intrinsic item metadata	public
75090	Vicious Charscale Helm	armor	intrinsic item metadata	public
75091	Vicious Fireweave Shoulders	armor	intrinsic item metadata	public
75092	Vicious Charscale Boots	armor	intrinsic item metadata	public
75093	Vicious Embersilk Robe	armor	intrinsic item metadata	public
75094	Vicious Charscale Bracers	armor	intrinsic item metadata	public
75095	Vicious Embersilk Boots	armor	intrinsic item metadata	public
75096	Vicious Embersilk Belt	armor	intrinsic item metadata	public
75097	Vicious Charscale Legs	armor	intrinsic item metadata	public
75098	Vicious Embersilk Bracers	armor	intrinsic item metadata	public
75099	Vicious Wyrmhide Shoulders	armor	intrinsic item metadata	public
75100	Vicious Dragonscale Belt	armor	intrinsic item metadata	public
75101	Vicious Wyrmhide Boots	armor	intrinsic item metadata	public
75102	Vicious Dragonscale Helm	armor	intrinsic item metadata	public
75103	Vicious Leather Chest	armor	intrinsic item metadata	public
75104	Vicious Leather Gloves	armor	intrinsic item metadata	public
75105	Vicious Leather Helm	armor	intrinsic item metadata	public
75106	Vicious Wyrmhide Bracers	armor	intrinsic item metadata	public
75107	Vicious Wyrmhide Chest	armor	intrinsic item metadata	public
75108	Vicious Dragonscale Legs	armor	intrinsic item metadata	public
75109	Vicious Wyrmhide Gloves	armor	intrinsic item metadata	public
75110	Vicious Dragonscale Boots	armor	intrinsic item metadata	public
75111	Vicious Wyrmhide Helm	armor	intrinsic item metadata	public
75112	Vicious Leather Legs	armor	intrinsic item metadata	public
75113	Vicious Leather Shoulders	armor	intrinsic item metadata	public
75114	Vicious Dragonscale Bracers	armor	intrinsic item metadata	public
75115	Vicious Dragonscale Chest	armor	intrinsic item metadata	public
75116	Vicious Dragonscale Shoulders	armor	intrinsic item metadata	public
75117	Vicious Wyrmhide Belt	armor	intrinsic item metadata	public
75118	Vicious Ornate Pyrium Belt	armor	intrinsic item metadata	public
75119	Vicious Pyrium Shoulders	armor	intrinsic item metadata	public
75120	Vicious Pyrium Boots	armor	intrinsic item metadata	public
75121	Vicious Ornate Pyrium Gauntlets	armor	intrinsic item metadata	public
75122	Vicious Pyrium Gauntlets	armor	intrinsic item metadata	public
75123	Vicious Pyrium Belt	armor	intrinsic item metadata	public
75124	Vicious Pyrium Bracers	armor	intrinsic item metadata	public
75125	Vicious Ornate Pyrium Bracers	armor	intrinsic item metadata	public
75126	Vicious Pyrium Helm	armor	intrinsic item metadata	public
75127	Vicious Leather Belt	armor	intrinsic item metadata	public
75128	Vicious Ornate Pyrium Breastplate	armor	intrinsic item metadata	public
75129	Vicious Ornate Pyrium Helm	armor	intrinsic item metadata	public
75130	Vicious Leather Boots	armor	intrinsic item metadata	public
75131	Vicious Leather Bracers	armor	intrinsic item metadata	public
75132	Vicious Ornate Pyrium Boots	armor	intrinsic item metadata	public
75133	Vicious Ornate Pyrium Legguards	armor	intrinsic item metadata	public
75134	Vicious Ornate Pyrium Shoulders	armor	intrinsic item metadata	public
75135	Vicious Pyrium Breastplate	armor	intrinsic item metadata	public
75136	Vicious Pyrium Legguards	armor	intrinsic item metadata	public
75218	Electrified Oil	fish	specialized bag and profession data	public
76057	Spirit of Summer	elemental	intrinsic item metadata	public
76058	Spirit of Winter	elemental	intrinsic item metadata	public
76059	Spirit of Spring	elemental	intrinsic item metadata	public
76060	Spirit of Autumn	elemental	intrinsic item metadata	public
76075	Mantid Elixir	alchemy	intrinsic item metadata	public
76076	Mad Hozen Elixir	alchemy	intrinsic item metadata	public
76077	Elixir of Weaponry	alchemy	intrinsic item metadata	public
76078	Elixir of the Rapids	alchemy	intrinsic item metadata	public
76079	Elixir of Peace	alchemy	intrinsic item metadata	public
76080	Elixir of Perfection	alchemy	intrinsic item metadata	public
76081	Elixir of Mirrors	alchemy	intrinsic item metadata	public
76083	Monk's Elixir	alchemy	intrinsic item metadata	public
76084	Flask of Spring Blossoms	alchemy	intrinsic item metadata	public
76085	Flask of the Warm Sun	alchemy	intrinsic item metadata	public
76086	Flask of Falling Leaves	alchemy	intrinsic item metadata	public
76087	Flask of the Earth	alchemy	intrinsic item metadata	public
76088	Flask of Winter's Bite	alchemy	intrinsic item metadata	public
76089	Virmen's Bite	alchemy	intrinsic item metadata	public
76090	Potion of the Mountains	alchemy	intrinsic item metadata	public
76091	Greater Potion of Luck	alchemy	intrinsic item metadata	public
76092	Potion of Focus	alchemy	intrinsic item metadata	public
76093	Potion of the Jade Serpent	alchemy	intrinsic item metadata	public
76094	Alchemist's Rejuvenation	alchemy	intrinsic item metadata	public
76095	Potion of Mogu Power	alchemy	intrinsic item metadata	public
76096	Darkwater Potion	alchemy	intrinsic item metadata	public
76097	Master Healing Potion	alchemy	intrinsic item metadata	public
76098	Master Mana Potion	alchemy	intrinsic item metadata	public
76130	Tiger Opal	jewels	intrinsic item metadata	public
76131	Primordial Ruby	jewels	intrinsic item metadata	public
76132	Primal Diamond	jewels	intrinsic item metadata	public
76133	Lapis Lazuli	jewels	intrinsic item metadata	public
76134	Sunstone	jewels	intrinsic item metadata	public
76135	Roguestone	jewels	intrinsic item metadata	public
76136	Pandarian Garnet	jewels	intrinsic item metadata	public
76137	Alexandrite	jewels	intrinsic item metadata	public
76138	River's Heart	jewels	intrinsic item metadata	public
76139	Wild Jade	jewels	intrinsic item metadata	public
76140	Vermilion Onyx	jewels	intrinsic item metadata	public
76141	Imperial Amethyst	jewels	intrinsic item metadata	public
76142	Sun's Radiance	jewels	intrinsic item metadata	public
76502	Rigid Lapis Lazuli	jewels	intrinsic item metadata	public
76504	Stormy Lapis Lazuli	jewels	intrinsic item metadata	public
76505	Sparkling Lapis Lazuli	jewels	intrinsic item metadata	public
76506	Solid Lapis Lazuli	jewels	intrinsic item metadata	public
76507	Misty Alexandrite	jewels	intrinsic item metadata	public
76508	Piercing Alexandrite	jewels	intrinsic item metadata	public
76509	Lightning Alexandrite	jewels	intrinsic item metadata	public
76510	Sensei's Alexandrite	jewels	intrinsic item metadata	public
76511	Effulgent Alexandrite	jewels	intrinsic item metadata	public
76512	Zen Alexandrite	jewels	intrinsic item metadata	public
76513	Balanced Alexandrite	jewels	intrinsic item metadata	public
76514	Vivid Alexandrite	jewels	intrinsic item metadata	public
76515	Turbid Alexandrite	jewels	intrinsic item metadata	public
76517	Radiant Alexandrite	jewels	intrinsic item metadata	public
76518	Shattered Alexandrite	jewels	intrinsic item metadata	public
76519	Energized Alexandrite	jewels	intrinsic item metadata	public
76520	Jagged Alexandrite	jewels	intrinsic item metadata	public
76521	Regal Alexandrite	jewels	intrinsic item metadata	public
76522	Forceful Alexandrite	jewels	intrinsic item metadata	public
76523	Confounded Alexandrite	jewels	intrinsic item metadata	public
76524	Puissant Alexandrite	jewels	intrinsic item metadata	public
76525	Steady Alexandrite	jewels	intrinsic item metadata	public
76526	Deadly Tiger Opal	jewels	intrinsic item metadata	public
76527	Crafty Tiger Opal	jewels	intrinsic item metadata	public
76528	Potent Tiger Opal	jewels	intrinsic item metadata	public
76529	Inscribed Tiger Opal	jewels	intrinsic item metadata	public
76530	Polished Tiger Opal	jewels	intrinsic item metadata	public
76531	Resolute Tiger Opal	jewels	intrinsic item metadata	public
76532	Stalwart Tiger Opal	jewels	intrinsic item metadata	public
76533	Champion's Tiger Opal	jewels	intrinsic item metadata	public
76534	Deft Tiger Opal	jewels	intrinsic item metadata	public
76535	Wicked Tiger Opal	jewels	intrinsic item metadata	public
76536	Reckless Tiger Opal	jewels	intrinsic item metadata	public
76537	Fierce Tiger Opal	jewels	intrinsic item metadata	public
76538	Adept Tiger Opal	jewels	intrinsic item metadata	public
76539	Keen Tiger Opal	jewels	intrinsic item metadata	public
76540	Artful Tiger Opal	jewels	intrinsic item metadata	public
76541	Fine Tiger Opal	jewels	intrinsic item metadata	public
76542	Skillful Tiger Opal	jewels	intrinsic item metadata	public
76543	Lucent Tiger Opal	jewels	intrinsic item metadata	public
76544	Tenuous Tiger Opal	jewels	intrinsic item metadata	public
76545	Willful Tiger Opal	jewels	intrinsic item metadata	public
76546	Splendid Tiger Opal	jewels	intrinsic item metadata	public
76547	Resplendent Tiger Opal	jewels	intrinsic item metadata	public
76548	Glinting Roguestone	jewels	intrinsic item metadata	public
76549	Accurate Roguestone	jewels	intrinsic item metadata	public
76550	Veiled Roguestone	jewels	intrinsic item metadata	public
76551	Retaliating Roguestone	jewels	intrinsic item metadata	public
76552	Etched Roguestone	jewels	intrinsic item metadata	public
76553	Mysterious Roguestone	jewels	intrinsic item metadata	public
76554	Purified Roguestone	jewels	intrinsic item metadata	public
76555	Shifting Roguestone	jewels	intrinsic item metadata	public
76556	Guardian's Roguestone	jewels	intrinsic item metadata	public
76557	Timeless Roguestone	jewels	intrinsic item metadata	public
76558	Defender's Roguestone	jewels	intrinsic item metadata	public
76559	Sovereign Roguestone	jewels	intrinsic item metadata	public
76560	Delicate Pandarian Garnet	jewels	intrinsic item metadata	public
76561	Precise Pandarian Garnet	jewels	intrinsic item metadata	public
76562	Brilliant Pandarian Garnet	jewels	intrinsic item metadata	public
76563	Flashing Pandarian Garnet	jewels	intrinsic item metadata	public
76564	Bold Pandarian Garnet	jewels	intrinsic item metadata	public
76565	Smooth Sunstone	jewels	intrinsic item metadata	public
76566	Subtle Sunstone	jewels	intrinsic item metadata	public
76567	Quick Sunstone	jewels	intrinsic item metadata	public
76568	Fractured Sunstone	jewels	intrinsic item metadata	public
76569	Mystic Sunstone	jewels	intrinsic item metadata	public
76570	Perfect Rigid Lapis Lazuli	jewels	intrinsic item metadata	public
76571	Perfect Stormy Lapis Lazuli	jewels	intrinsic item metadata	public
76572	Perfect Sparkling Lapis Lazuli	jewels	intrinsic item metadata	public
76573	Perfect Solid Lapis Lazuli	jewels	intrinsic item metadata	public
76574	Perfect Misty Alexandrite	jewels	intrinsic item metadata	public
76575	Perfect Piercing Alexandrite	jewels	intrinsic item metadata	public
76576	Perfect Lightning Alexandrite	jewels	intrinsic item metadata	public
76577	Perfect Sensei's Alexandrite	jewels	intrinsic item metadata	public
76578	Perfect Effulgent Alexandrite	jewels	intrinsic item metadata	public
76579	Perfect Zen Alexandrite	jewels	intrinsic item metadata	public
76580	Perfect Balanced Alexandrite	jewels	intrinsic item metadata	public
76581	Perfect Vivid Alexandrite	jewels	intrinsic item metadata	public
76582	Perfect Turbid Alexandrite	jewels	intrinsic item metadata	public
76583	Perfect Radiant Alexandrite	jewels	intrinsic item metadata	public
76584	Perfect Shattered Alexandrite	jewels	intrinsic item metadata	public
76585	Perfect Energized Alexandrite	jewels	intrinsic item metadata	public
76586	Perfect Jagged Alexandrite	jewels	intrinsic item metadata	public
76587	Perfect Regal Alexandrite	jewels	intrinsic item metadata	public
76588	Perfect Forceful Alexandrite	jewels	intrinsic item metadata	public
76589	Perfect Confounded Alexandrite	jewels	intrinsic item metadata	public
76590	Perfect Puissant Alexandrite	jewels	intrinsic item metadata	public
76591	Perfect Steady Alexandrite	jewels	intrinsic item metadata	public
76592	Perfect Deadly Tiger Opal	jewels	intrinsic item metadata	public
76593	Perfect Crafty Tiger Opal	jewels	intrinsic item metadata	public
76594	Perfect Potent Tiger Opal	jewels	intrinsic item metadata	public
76595	Perfect Inscribed Tiger Opal	jewels	intrinsic item metadata	public
76596	Perfect Polished Tiger Opal	jewels	intrinsic item metadata	public
76597	Perfect Resolute Tiger Opal	jewels	intrinsic item metadata	public
76598	Perfect Stalwart Tiger Opal	jewels	intrinsic item metadata	public
76599	Perfect Champion's Tiger Opal	jewels	intrinsic item metadata	public
76600	Perfect Deft Tiger Opal	jewels	intrinsic item metadata	public
76601	Perfect Wicked Tiger Opal	jewels	intrinsic item metadata	public
76602	Perfect Reckless Tiger Opal	jewels	intrinsic item metadata	public
76603	Perfect Fierce Tiger Opal	jewels	intrinsic item metadata	public
76604	Perfect Adept Tiger Opal	jewels	intrinsic item metadata	public
76605	Perfect Keen Tiger Opal	jewels	intrinsic item metadata	public
76606	Perfect Artful Tiger Opal	jewels	intrinsic item metadata	public
76607	Perfect Fine Tiger Opal	jewels	intrinsic item metadata	public
76608	Perfect Skillful Tiger Opal	jewels	intrinsic item metadata	public
76609	Perfect Lucent Tiger Opal	jewels	intrinsic item metadata	public
76610	Perfect Tenuous Tiger Opal	jewels	intrinsic item metadata	public
76611	Perfect Willful Tiger Opal	jewels	intrinsic item metadata	public
76612	Perfect Splendid Tiger Opal	jewels	intrinsic item metadata	public
76613	Perfect Resplendent Tiger Opal	jewels	intrinsic item metadata	public
76614	Perfect Glinting Roguestone	jewels	intrinsic item metadata	public
76615	Perfect Accurate Roguestone	jewels	intrinsic item metadata	public
76616	Perfect Veiled Roguestone	jewels	intrinsic item metadata	public
76617	Perfect Retaliating Roguestone	jewels	intrinsic item metadata	public
76618	Perfect Etched Roguestone	jewels	intrinsic item metadata	public
76619	Perfect Mysterious Roguestone	jewels	intrinsic item metadata	public
76620	Perfect Purified Roguestone	jewels	intrinsic item metadata	public
76621	Perfect Shifting Roguestone	jewels	intrinsic item metadata	public
76622	Perfect Guardian's Roguestone	jewels	intrinsic item metadata	public
76623	Perfect Timeless Roguestone	jewels	intrinsic item metadata	public
76624	Perfect Defender's Roguestone	jewels	intrinsic item metadata	public
76625	Perfect Sovereign Roguestone	jewels	intrinsic item metadata	public
76626	Perfect Delicate Pandarian Garnet	jewels	intrinsic item metadata	public
76627	Perfect Precise Pandarian Garnet	jewels	intrinsic item metadata	public
76628	Perfect Brilliant Pandarian Garnet	jewels	intrinsic item metadata	public
76629	Perfect Flashing Pandarian Garnet	jewels	intrinsic item metadata	public
76630	Perfect Bold Pandarian Garnet	jewels	intrinsic item metadata	public
76631	Perfect Smooth Sunstone	jewels	intrinsic item metadata	public
76632	Perfect Subtle Sunstone	jewels	intrinsic item metadata	public
76633	Perfect Quick Sunstone	jewels	intrinsic item metadata	public
76634	Perfect Fractured Sunstone	jewels	intrinsic item metadata	public
76635	Perfect Mystic Sunstone	jewels	intrinsic item metadata	public
76636	Rigid River's Heart	jewels	intrinsic item metadata	public
76637	Stormy River's Heart	jewels	intrinsic item metadata	public
76638	Sparkling River's Heart	jewels	intrinsic item metadata	public
76639	Solid River's Heart	jewels	intrinsic item metadata	public
76640	Misty Wild Jade	jewels	intrinsic item metadata	public
76641	Piercing Wild Jade	jewels	intrinsic item metadata	public
76642	Lightning Wild Jade	jewels	intrinsic item metadata	public
76643	Sensei's Wild Jade	jewels	intrinsic item metadata	public
76644	Effulgent Wild Jade	jewels	intrinsic item metadata	public
76645	Zen Wild Jade	jewels	intrinsic item metadata	public
76646	Balanced Wild Jade	jewels	intrinsic item metadata	public
76647	Vivid Wild Jade	jewels	intrinsic item metadata	public
76648	Turbid Wild Jade	jewels	intrinsic item metadata	public
76649	Radiant Wild Jade	jewels	intrinsic item metadata	public
76650	Shattered Wild Jade	jewels	intrinsic item metadata	public
76651	Energized Wild Jade	jewels	intrinsic item metadata	public
76652	Jagged Wild Jade	jewels	intrinsic item metadata	public
76653	Regal Wild Jade	jewels	intrinsic item metadata	public
76654	Forceful Wild Jade	jewels	intrinsic item metadata	public
76655	Confounded Wild Jade	jewels	intrinsic item metadata	public
76656	Puissant Wild Jade	jewels	intrinsic item metadata	public
76657	Steady Wild Jade	jewels	intrinsic item metadata	public
76658	Deadly Vermilion Onyx	jewels	intrinsic item metadata	public
76659	Crafty Vermilion Onyx	jewels	intrinsic item metadata	public
76660	Potent Vermilion Onyx	jewels	intrinsic item metadata	public
76661	Inscribed Vermilion Onyx	jewels	intrinsic item metadata	public
76662	Polished Vermilion Onyx	jewels	intrinsic item metadata	public
76663	Resolute Vermilion Onyx	jewels	intrinsic item metadata	public
76664	Stalwart Vermilion Onyx	jewels	intrinsic item metadata	public
76665	Champion's Vermilion Onyx	jewels	intrinsic item metadata	public
76666	Deft Vermilion Onyx	jewels	intrinsic item metadata	public
76667	Wicked Vermilion Onyx	jewels	intrinsic item metadata	public
76668	Reckless Vermilion Onyx	jewels	intrinsic item metadata	public
76669	Fierce Vermilion Onyx	jewels	intrinsic item metadata	public
76670	Adept Vermilion Onyx	jewels	intrinsic item metadata	public
76671	Keen Vermilion Onyx	jewels	intrinsic item metadata	public
76672	Artful Vermilion Onyx	jewels	intrinsic item metadata	public
76673	Fine Vermilion Onyx	jewels	intrinsic item metadata	public
76674	Skillful Vermilion Onyx	jewels	intrinsic item metadata	public
76675	Lucent Vermilion Onyx	jewels	intrinsic item metadata	public
76676	Tenuous Vermilion Onyx	jewels	intrinsic item metadata	public
76677	Willful Vermilion Onyx	jewels	intrinsic item metadata	public
76678	Splendid Vermilion Onyx	jewels	intrinsic item metadata	public
76679	Resplendent Vermilion Onyx	jewels	intrinsic item metadata	public
76680	Glinting Imperial Amethyst	jewels	intrinsic item metadata	public
76681	Accurate Imperial Amethyst	jewels	intrinsic item metadata	public
76682	Veiled Imperial Amethyst	jewels	intrinsic item metadata	public
76683	Retaliating Imperial Amethyst	jewels	intrinsic item metadata	public
76684	Etched Imperial Amethyst	jewels	intrinsic item metadata	public
76685	Mysterious Imperial Amethyst	jewels	intrinsic item metadata	public
76686	Purified Imperial Amethyst	jewels	intrinsic item metadata	public
76687	Shifting Imperial Amethyst	jewels	intrinsic item metadata	public
76688	Guardian's Imperial Amethyst	jewels	intrinsic item metadata	public
76689	Timeless Imperial Amethyst	jewels	intrinsic item metadata	public
76690	Defender's Imperial Amethyst	jewels	intrinsic item metadata	public
76691	Sovereign Imperial Amethyst	jewels	intrinsic item metadata	public
76692	Delicate Primordial Ruby	jewels	intrinsic item metadata	public
76693	Precise Primordial Ruby	jewels	intrinsic item metadata	public
76694	Brilliant Primordial Ruby	jewels	intrinsic item metadata	public
76695	Flashing Primordial Ruby	jewels	intrinsic item metadata	public
76696	Bold Primordial Ruby	jewels	intrinsic item metadata	public
76697	Smooth Sun's Radiance	jewels	intrinsic item metadata	public
76698	Subtle Sun's Radiance	jewels	intrinsic item metadata	public
76699	Quick Sun's Radiance	jewels	intrinsic item metadata	public
76700	Fractured Sun's Radiance	jewels	intrinsic item metadata	public
76701	Mystic Sun's Radiance	jewels	intrinsic item metadata	public
76714	Perfect Rigid River's Heart	jewels	intrinsic item metadata	public
76729	zzOLD Glyph of the Chameleon		obsolete client record	excluded
76734	Serpent's Eye	jewels	intrinsic item metadata	public
76747	Scaling Food (TEST)		internal test item	excluded
76879	Ember Primal Diamond	jewels	intrinsic item metadata	public
76884	Agile Primal Diamond	jewels	intrinsic item metadata	public
76885	Burning Primal Diamond	jewels	intrinsic item metadata	public
76886	Reverberating Primal Diamond	jewels	intrinsic item metadata	public
76887	Fleet Primal Diamond	jewels	intrinsic item metadata	public
76888	Revitalizing Primal Diamond	jewels	intrinsic item metadata	public
76890	Destructive Primal Diamond	jewels	intrinsic item metadata	public
76891	Powerful Primal Diamond	jewels	intrinsic item metadata	public
76892	Enigmatic Primal Diamond	jewels	intrinsic item metadata	public
76893	Impassive Primal Diamond	jewels	intrinsic item metadata	public
76894	Forlorn Primal Diamond	jewels	intrinsic item metadata	public
76895	Austere Primal Diamond	jewels	intrinsic item metadata	public
76896	Eternal Primal Diamond	jewels	intrinsic item metadata	public
76897	Effulgent Primal Diamond	jewels	intrinsic item metadata	public
77101	Glyph of Shadow	inscription	intrinsic item metadata	public
77264	Small Bamboo Shoot	food	intrinsic item metadata	public
77272	Small Sugarcane Stalk	food	intrinsic item metadata	public
77273	Small Rice Cake	food	intrinsic item metadata	public
77276	Enchant Weapon - Ninja	enchanting	intrinsic item metadata	public
77467	Ghost Iron Bolts	engineering	single crafted-product category	public
77468	High-Explosive Gunpowder	engineering	single crafted-product category	public
77469	Salvaged Parts	engineering	specialized bag and profession data	public
77527	Big Game Hunter	weapons	intrinsic item metadata	public
77528	Long-Range Trillium Sniper	weapons	intrinsic item metadata	public
77529	Lord Blastington's Scope of Doom	engineering	specialized bag and profession data	public
77530	Ghost Iron Dragonling	trinkets	intrinsic item metadata	public
77531	Mirror Scope	engineering	specialized bag and profession data	public
77532	Locksmith's Powderkeg	engineering	specialized bag and profession data	public
77540	Subtle Tinker's Gear	jewels	intrinsic item metadata	public
77541	Smooth Tinker's Gear	jewels	intrinsic item metadata	public
77542	Quick Tinker's Gear	jewels	intrinsic item metadata	public
77543	Precise Tinker's Gear	jewels	intrinsic item metadata	public
77544	Flashing Tinker's Gear	jewels	intrinsic item metadata	public
77545	Rigid Tinker's Gear	jewels	intrinsic item metadata	public
77546	Sparkling Tinker's Gear	jewels	intrinsic item metadata	public
77547	Fractured Tinker's Gear	jewels	intrinsic item metadata	public
77589	G91 Landshark	engineering	specialized bag and profession data	public
78348	Formula: Enchant Weapon - Executioner	enchanting	intrinsic item metadata	public
78883	Darkmoon Firewater	alchemy	intrinsic item metadata	public
79010	Snow Lily	herbs	intrinsic item metadata	public
79011	Fool's Cap	herbs	intrinsic item metadata	public
79017	Mysterious Seed	herbs	specialized bag and profession data	public
79063	Reinforced Mining Pick	ore	specialized bag and profession data	public
79101	Prismatic Scale	leather	intrinsic item metadata	public
79119	Test Glyph 1		internal test item	excluded
79121	Item A [DO NOT TEST OR LOCALIZE]		internal test item	excluded
79122	Item B [DO NOT TEST OR LOCALIZE]		internal test item	excluded
79123	Item C [DO NOT TEST OR LOCALIZE]		internal test item	excluded
79201	Faded Glyph	inscription	specialized bag and profession data	public
79246	Delicate Blossom Petals	fish	intrinsic item metadata	public
79249	Tome of the Clear Mind	inscription	specialized bag and profession data	public
79250	Fresh Pomfruit	fish	intrinsic item metadata	public
79251	Shadow Pigment	inscription	specialized bag and profession data	public
79253	Misty Pigment	inscription	specialized bag and profession data	public
79254	Ink of Dreams	inscription	specialized bag and profession data	public
79255	Starlight Ink	inscription	specialized bag and profession data	public
79257	Runescroll of Fortitude III	inscription	specialized bag and profession data	public
79318	Darkmoon Card of Mists	inscription	single crafted-product category	public
79333	Inscribed Fan	armor	intrinsic item metadata	public
79334	Inscribed Jade Fan	armor	intrinsic item metadata	public
79335	Inscribed Red Fan	armor	intrinsic item metadata	public
79339	Rain Poppy Staff	weapons	intrinsic item metadata	public
79342	Ghost Iron Staff	weapons	intrinsic item metadata	public
79513	Glyph of Mind Flay	inscription	intrinsic item metadata	public
79514	Glyph of Shadow Word: Death	inscription	intrinsic item metadata	public
79515	Glyph of Vampiric Embrace	inscription	intrinsic item metadata	public
79538	Glyph of the Heavens	inscription	intrinsic item metadata	public
79710	Glyph	inscription	intrinsic item metadata	public
79740	Plain Wooden Staff	weapons	intrinsic item metadata	public
79868	Pandaren Pottery Shard	archaeology	MoP archaeology keystone data	public
79869	Mogu Statue Piece	archaeology	MoP archaeology keystone data	public
80153	Enchant Cloak - Minor Stats	enchanting	intrinsic item metadata	public
80154	Enchant Cloak - Lesser Stats	enchanting	intrinsic item metadata	public
80155	Enchant Cloak - Stats	enchanting	intrinsic item metadata	public
80156	Enchant Cloak - Greater Stats	enchanting	intrinsic item metadata	public
80157	Enchant Cloak - Superior Stats	enchanting	intrinsic item metadata	public
80158	Enchant Shield - Lesser Stats	enchanting	intrinsic item metadata	public
80167	Enchant Shield - Stats	enchanting	intrinsic item metadata	public
80221	Heavy Mist-Touched Leather	leather	intrinsic item metadata	public
80239	Mega Food 4000	food	intrinsic item metadata	public
80313	Ling-Ting's Favorite Tea	food	intrinsic item metadata	public
80431	Folded Ghost Iron	ore	intrinsic item metadata	public
80432	Heavy Ghost Iron Bar	ore	intrinsic item metadata	public
80433	Blood Spirit	profession_supplies	curated shared crafting reagent	public
80581	Glyph of Focused Wrath	inscription	intrinsic item metadata	public
80584	Glyph of the Falling Avenger	inscription	intrinsic item metadata	public
80585	Glyph of the Righteous Retreat	inscription	intrinsic item metadata	public
80586	Glyph of Bladed Judgment	inscription	intrinsic item metadata	public
80587	Glyph of Crow Feast	inscription	intrinsic item metadata	public
80588	Glyph of Burning Anger	inscription	intrinsic item metadata	public
80811	Spiritguard Helm	armor	intrinsic item metadata	public
80816	Spirit of the Season	elemental	intrinsic item metadata	public
80824	Sha Crystal (TEST VERSION) [PH]		placeholder item	excluded
81143	Advanced Deepdive Helmet	armor	intrinsic item metadata	public
81175	Crispy Dojani Eel	food	intrinsic item metadata	public
81400	Pounded Rice Cake	food	intrinsic item metadata	public
81401	Yak Cheese Curds	food	intrinsic item metadata	public
81402	Toasted Fish Jerky	food	intrinsic item metadata	public
81403	Dried Peaches	food	intrinsic item metadata	public
81404	Dried Needle Mushrooms	food	intrinsic item metadata	public
81405	Boiled Silkworm Pupa	food	intrinsic item metadata	public
81406	Roasted Barley Tea	food	intrinsic item metadata	public
81407	Four Wind Soju	food	intrinsic item metadata	public
81408	Red Bean Bun	food	intrinsic item metadata	public
81409	Tangy Yogurt	food	intrinsic item metadata	public
81410	Green Curry Fish	food	intrinsic item metadata	public
81411	Peach Pie	food	intrinsic item metadata	public
81412	Blanched Needle Mushrooms	food	intrinsic item metadata	public
81413	Skewered Peanut Chicken	food	intrinsic item metadata	public
81414	Pearl Milk Tea	food	intrinsic item metadata	public
81415	Pandaren Plum Wine	food	intrinsic item metadata	public
81889	Peppered Puffball	food	intrinsic item metadata	public
81916	Humongous Fungus	food	intrinsic item metadata	public
81917	Mutton Stew	food	intrinsic item metadata	public
81918	Pickled Pig's Snout	food	intrinsic item metadata	public
81919	Red Raspberry	food	intrinsic item metadata	public
81920	Plump Fig	food	intrinsic item metadata	public
81921	Chilton Stilton	food	intrinsic item metadata	public
81922	Redridge Roquefort	food	intrinsic item metadata	public
81923	Cobo Cola	food	intrinsic item metadata	public
81924	Carbonated Water	food	intrinsic item metadata	public
81956	Glyph of the Battle Healer	inscription	intrinsic item metadata	public
82343	Lordaeron Lambic	food	intrinsic item metadata	public
82344	Hearthglen Ambrosia	food	intrinsic item metadata	public
82345	Glyph of Rapid Rolling	inscription	intrinsic item metadata	public
82396	Recipe: Format Test		internal test item	excluded
82397	Windwool Hood	armor	intrinsic item metadata	public
82398	Windwool Shoulders	armor	intrinsic item metadata	public
82399	Windwool Tunic	armor	intrinsic item metadata	public
82400	Windwool Gloves	armor	intrinsic item metadata	public
82401	Windwool Pants	armor	intrinsic item metadata	public
82402	Windwool Bracers	armor	intrinsic item metadata	public
82403	Windwool Boots	armor	intrinsic item metadata	public
82404	Windwool Belt	armor	intrinsic item metadata	public
82421	Contender's Silk Cowl	armor	intrinsic item metadata	public
82422	Contender's Silk Amice	armor	intrinsic item metadata	public
82423	Contender's Silk Raiment	armor	intrinsic item metadata	public
82424	Contender's Silk Handwraps	armor	intrinsic item metadata	public
82425	Contender's Silk Pants	armor	intrinsic item metadata	public
82426	Contender's Silk Cuffs	armor	intrinsic item metadata	public
82427	Contender's Silk Footwraps	armor	intrinsic item metadata	public
82428	Contender's Silk Belt	armor	intrinsic item metadata	public
82429	Contender's Satin Cowl	armor	intrinsic item metadata	public
82430	Contender's Satin Amice	armor	intrinsic item metadata	public
82431	Contender's Satin Raiment	armor	intrinsic item metadata	public
82432	Contender's Satin Handwraps	armor	intrinsic item metadata	public
82433	Contender's Satin Pants	armor	intrinsic item metadata	public
82434	Contender's Satin Cuffs	armor	intrinsic item metadata	public
82435	Contender's Satin Footwraps	armor	intrinsic item metadata	public
82436	Contender's Satin Belt	armor	intrinsic item metadata	public
82437	Spelltwister's Grand Robe	armor	intrinsic item metadata	public
82438	Spelltwister's Gloves	armor	intrinsic item metadata	public
82439	Robes of Creation	armor	intrinsic item metadata	public
82440	Gloves of Creation	armor	intrinsic item metadata	public
82441	Bolt of Windwool Cloth	cloth	intrinsic item metadata	public
82442	Pearlescent Spellthread	enchanting	intrinsic item metadata	public
82443	Cerulean Spellthread	enchanting	intrinsic item metadata	public
82444	Greater Pearlescent Spellthread	enchanting	intrinsic item metadata	public
82445	Greater Cerulean Spellthread	enchanting	intrinsic item metadata	public
82446	Royal Satchel	bags	intrinsic item metadata	public
82448	Smoked Squid Belly	food	intrinsic item metadata	public
82449	Barnacle Bouillabaisse	food	intrinsic item metadata	public
82450	Cornmeal Biscuit	food	intrinsic item metadata	public
82451	Frybread	food	intrinsic item metadata	public
82453	Jeweled Onyx Panther	jewels	single crafted-product category	public
82774	Jade Owl	battle_pets	intrinsic item metadata	public
82775	Sapphire Cub	battle_pets	intrinsic item metadata	public
82829	Windwool Bandage	first_aid	intrinsic item metadata	public
82830	Heavy Windwool Bandage	first_aid	intrinsic item metadata	public
82896	Spiritguard Shoulders	armor	intrinsic item metadata	public
82897	Spiritguard Breastplate	armor	intrinsic item metadata	public
82898	Spiritguard Gauntlets	armor	intrinsic item metadata	public
82899	Spiritguard Legplates	armor	intrinsic item metadata	public
82900	Spiritguard Bracers	armor	intrinsic item metadata	public
82901	Spiritguard Boots	armor	intrinsic item metadata	public
82902	Spiritguard Belt	armor	intrinsic item metadata	public
82903	Ghost-Forged Helm	armor	intrinsic item metadata	public
82904	Ghost-Forged Shoulders	armor	intrinsic item metadata	public
82905	Ghost-Forged Breastplate	armor	intrinsic item metadata	public
82906	Ghost-Forged Gauntlets	armor	intrinsic item metadata	public
82907	Ghost-Forged Legplates	armor	intrinsic item metadata	public
82908	Ghost-Forged Bracers	armor	intrinsic item metadata	public
82909	Ghost-Forged Boots	armor	intrinsic item metadata	public
82910	Ghost-Forged Belt	armor	intrinsic item metadata	public
82911	Lightsteel Helm	armor	intrinsic item metadata	public
82912	Lightsteel Shoulders	armor	intrinsic item metadata	public
82913	Lightsteel Breastplate	armor	intrinsic item metadata	public
82914	Lightsteel Gauntlets	armor	intrinsic item metadata	public
82915	Lightsteel Legplates	armor	intrinsic item metadata	public
82916	Lightsteel Bracers	armor	intrinsic item metadata	public
82917	Lightsteel Boots	armor	intrinsic item metadata	public
82918	Lightsteel Belt	armor	intrinsic item metadata	public
82919	Masterwork Spiritguard Helm	armor	intrinsic item metadata	public
82920	Masterwork Spiritguard Shoulders	armor	intrinsic item metadata	public
82921	Masterwork Spiritguard Breastplate	armor	intrinsic item metadata	public
82922	Masterwork Spiritguard Gauntlets	armor	intrinsic item metadata	public
82923	Masterwork Spiritguard Legplates	armor	intrinsic item metadata	public
82924	Masterwork Spiritguard Bracers	armor	intrinsic item metadata	public
82925	Masterwork Spiritguard Boots	armor	intrinsic item metadata	public
82926	Masterwork Spiritguard Belt	armor	intrinsic item metadata	public
82927	Ghost-Forged Helm	armor	intrinsic item metadata	public
82928	Ghost-Forged Shoulders	armor	intrinsic item metadata	public
82929	Ghost-Forged Breastplate	armor	intrinsic item metadata	public
82930	Ghost-Forged Gauntlets	armor	intrinsic item metadata	public
82931	Ghost-Forged Legplates	armor	intrinsic item metadata	public
82932	Ghost-Forged Bracers	armor	intrinsic item metadata	public
82933	Ghost-Forged Boots	armor	intrinsic item metadata	public
82934	Ghost-Forged Belt	armor	intrinsic item metadata	public
82935	Masterwork Lightsteel Helm	armor	intrinsic item metadata	public
82936	Masterwork Lightsteel Shoulders	armor	intrinsic item metadata	public
82937	Masterwork Lightsteel Breastplate	armor	intrinsic item metadata	public
82938	Masterwork Lightsteel Gauntlets	armor	intrinsic item metadata	public
82939	Masterwork Lightsteel Legplates	armor	intrinsic item metadata	public
82940	Masterwork Lightsteel Bracers	armor	intrinsic item metadata	public
82941	Masterwork Lightsteel Boots	armor	intrinsic item metadata	public
82942	Masterwork Lightsteel Belt	armor	intrinsic item metadata	public
82943	Contender's Revenant Helm	armor	intrinsic item metadata	public
82944	Contender's Revenant Shoulders	armor	intrinsic item metadata	public
82945	Contender's Revenant Breastplate	armor	intrinsic item metadata	public
82946	Contender's Revenant Gauntlets	armor	intrinsic item metadata	public
82947	Contender's Revenant Legplates	armor	intrinsic item metadata	public
82948	Contender's Revenant Bracers	armor	intrinsic item metadata	public
82949	Contender's Revenant Boots	armor	intrinsic item metadata	public
82950	Contender's Revenant Belt	armor	intrinsic item metadata	public
82951	Contender's Spirit Helm	armor	intrinsic item metadata	public
82952	Contender's Spirit Shoulders	armor	intrinsic item metadata	public
82953	Contender's Spirit Breastplate	armor	intrinsic item metadata	public
82954	Contender's Spirit Gauntlets	armor	intrinsic item metadata	public
82955	Contender's Spirit Legplates	armor	intrinsic item metadata	public
82956	Contender's Spirit Bracers	armor	intrinsic item metadata	public
82957	Contender's Spirit Boots	armor	intrinsic item metadata	public
82958	Contender's Spirit Belt	armor	intrinsic item metadata	public
82959	Living Steel Buckle	enchanting	intrinsic item metadata	public
82960	Ghostly Skeleton Key	blacksmithing	single crafted-product category	public
82961	Lightsteel Shield	armor	intrinsic item metadata	public
82962	Spiritguard Shield	armor	intrinsic item metadata	public
82963	Forgewire Axe	weapons	intrinsic item metadata	public
82964	Ghost-Forged Blade	weapons	intrinsic item metadata	public
82965	Phantasmal Hammer	weapons	intrinsic item metadata	public
82966	Spiritblade Decimator	weapons	intrinsic item metadata	public
82967	Ghost Shard	weapons	intrinsic item metadata	public
82968	Masterwork Lightsteel Shield	armor	intrinsic item metadata	public
82969	Masterwork Spiritguard Shield	armor	intrinsic item metadata	public
82970	Masterwork Forgewire Axe	weapons	intrinsic item metadata	public
82971	Masterwork Ghost-Forged Blade	weapons	intrinsic item metadata	public
82972	Masterwork Phantasmal Hammer	weapons	intrinsic item metadata	public
82973	Masterwork Spiritblade Decimator	weapons	intrinsic item metadata	public
82974	Masterwork Ghost Shard	weapons	intrinsic item metadata	public
82975	Ghost Reaver's Breastplate	armor	intrinsic item metadata	public
82976	Ghost Reaver's Gauntlets	armor	intrinsic item metadata	public
82977	Living Steel Breastplate	armor	intrinsic item metadata	public
82978	Living Steel Gauntlets	armor	intrinsic item metadata	public
82979	Breastplate of Ancient Steel	armor	intrinsic item metadata	public
82980	Gauntlets of Ancient Steel	armor	intrinsic item metadata	public
83006	Greater Tiger Fang Inscription	enchanting	intrinsic item metadata	public
83007	Greater Tiger Claw Inscription	enchanting	intrinsic item metadata	public
83064	Spinefish	fish	specialized bag and profession data	public
83065	Desecrated Carcass	fish	specialized bag and profession data	public
83087	Ruby Panther	jewels	single crafted-product category	public
83088	Jade Panther	jewels	single crafted-product category	public
83089	Sunstone Panther	jewels	single crafted-product category	public
83090	Sapphire Panther	jewels	single crafted-product category	public
83092	Orb of Mystery	profession_supplies	curated shared crafting reagent	public
83094	Foote Tripel	food	intrinsic item metadata	public
83095	Lagrave Stout	food	intrinsic item metadata	public
83096	Glyph of Incite	inscription	intrinsic item metadata	public
83097	Tortoise Jerky	food	intrinsic item metadata	public
83107	Glyph of Mass Exorcism	inscription	intrinsic item metadata	public
83763	Ironscale Leg Armor	enchanting	intrinsic item metadata	public
83764	Shadowleather Leg Armor	enchanting	intrinsic item metadata	public
83765	Angerhide Leg Armor	enchanting	intrinsic item metadata	public
83793	Ornate Band	armor	intrinsic item metadata	public
83794	Shadowfire Necklace	armor	intrinsic item metadata	public
83795	Scrying Roguestone	jewels	specialized bag and profession data	public
83796	Heart of the Earth	armor	intrinsic item metadata	public
83798	Roguestone Shadowband	armor	intrinsic item metadata	public
83799	Lord's Signet	armor	intrinsic item metadata	public
83800	Lionsfall Ring	armor	intrinsic item metadata	public
83801	Band of Blood	armor	intrinsic item metadata	public
83802	Reflection of the Sea	armor	intrinsic item metadata	public
83803	Golembreaker Amulet	armor	intrinsic item metadata	public
83804	Widow Chain	armor	intrinsic item metadata	public
83805	Skymage Circle	armor	intrinsic item metadata	public
83806	Tiger Opal Pendant	armor	intrinsic item metadata	public
83807	Design: Accurate Imperial Amethyst	jewels	intrinsic item metadata	public
83808	Design: Accurate Roguestone	jewels	intrinsic item metadata	public
83809	Design: Adept Tiger Opal	jewels	intrinsic item metadata	public
83810	Design: Adept Vermilion Onyx	jewels	intrinsic item metadata	public
83812	Design: Alexandrite Necklace	jewels	intrinsic item metadata	public
83813	Design: Artful Tiger Opal	jewels	intrinsic item metadata	public
83814	Design: Artful Vermilion Onyx	jewels	intrinsic item metadata	public
83816	Design: Balanced Alexandrite	jewels	intrinsic item metadata	public
83817	Design: Balanced Wild Jade	jewels	intrinsic item metadata	public
83818	Design: Band of Blood	jewels	intrinsic item metadata	public
83819	Design: Bold Pandarian Garnet	jewels	intrinsic item metadata	public
83820	Design: Bold Primordial Ruby	jewels	intrinsic item metadata	public
83821	Design: Bold Serpent's Eye	jewels	intrinsic item metadata	public
83822	Design: Brilliant Pandarian Garnet	jewels	intrinsic item metadata	public
83823	Design: Brilliant Primordial Ruby	jewels	intrinsic item metadata	public
83824	Design: Brilliant Serpent's Eye	jewels	intrinsic item metadata	public
83826	Design: Champion's Tiger Opal	jewels	intrinsic item metadata	public
83827	Design: Champion's Vermilion Onyx	jewels	intrinsic item metadata	public
83828	Design: Crafty Tiger Opal	jewels	intrinsic item metadata	public
83829	Design: Crafty Vermilion Onyx	jewels	intrinsic item metadata	public
83831	Design: Deadly Tiger Opal	jewels	intrinsic item metadata	public
83832	Design: Deadly Vermilion Onyx	jewels	intrinsic item metadata	public
83833	Design: Defender's Imperial Amethyst	jewels	intrinsic item metadata	public
83834	Design: Defender's Roguestone	jewels	intrinsic item metadata	public
83835	Design: Deft Tiger Opal	jewels	intrinsic item metadata	public
83836	Design: Deft Vermilion Onyx	jewels	intrinsic item metadata	public
83837	Design: Delicate Pandarian Garnet	jewels	intrinsic item metadata	public
83838	Design: Delicate Primordial Ruby	jewels	intrinsic item metadata	public
83839	Design: Delicate Serpent's Eye	jewels	intrinsic item metadata	public
83841	Design: Effulgent Alexandrite	jewels	intrinsic item metadata	public
83843	Design: Effulgent Wild Jade	jewels	intrinsic item metadata	public
83846	Design: Energized Alexandrite	jewels	intrinsic item metadata	public
83847	Design: Energized Wild Jade	jewels	intrinsic item metadata	public
83849	Design: Etched Imperial Amethyst	jewels	intrinsic item metadata	public
83850	Design: Etched Roguestone	jewels	intrinsic item metadata	public
83852	Design: Fierce Tiger Opal	jewels	intrinsic item metadata	public
83853	Design: Fierce Vermilion Onyx	jewels	intrinsic item metadata	public
83854	Design: Fine Tiger Opal	jewels	intrinsic item metadata	public
83855	Design: Fine Vermilion Onyx	jewels	intrinsic item metadata	public
83856	Design: Flashing Pandarian Garnet	jewels	intrinsic item metadata	public
83857	Design: Flashing Primordial Ruby	jewels	intrinsic item metadata	public
83858	Design: Flashing Serpent's Eye	jewels	intrinsic item metadata	public
83860	Design: Forceful Alexandrite	jewels	intrinsic item metadata	public
83861	Design: Forceful Wild Jade	jewels	intrinsic item metadata	public
83863	Design: Fractured Serpent's Eye	jewels	intrinsic item metadata	public
83864	Design: Fractured Sun's Radiance	jewels	intrinsic item metadata	public
83865	Design: Fractured Sunstone	jewels	intrinsic item metadata	public
83866	Design: Glinting Imperial Amethyst	jewels	intrinsic item metadata	public
83867	Design: Glinting Roguestone	jewels	intrinsic item metadata	public
83868	Design: Golembreaker Amulet	jewels	intrinsic item metadata	public
83869	Design: Guardian's Imperial Amethyst	jewels	intrinsic item metadata	public
83870	Design: Guardian's Roguestone	jewels	intrinsic item metadata	public
83871	Design: Heart of the Earth	jewels	intrinsic item metadata	public
83873	Design: Inscribed Tiger Opal	jewels	intrinsic item metadata	public
83874	Design: Inscribed Vermilion Onyx	jewels	intrinsic item metadata	public
83875	Design: Jagged Alexandrite	jewels	intrinsic item metadata	public
83876	Design: Jagged Wild Jade	jewels	intrinsic item metadata	public
83878	Design: Keen Tiger Opal	jewels	intrinsic item metadata	public
83879	Design: Keen Vermilion Onyx	jewels	intrinsic item metadata	public
83880	Design: Lapis Lazuli Band	jewels	intrinsic item metadata	public
83881	Design: Lightning Alexandrite	jewels	intrinsic item metadata	public
83882	Design: Lightning Wild Jade	jewels	intrinsic item metadata	public
83883	Design: Lionsfall Ring	jewels	intrinsic item metadata	public
83884	Design: Lord's Signet	jewels	intrinsic item metadata	public
83885	Design: Lucent Tiger Opal	jewels	intrinsic item metadata	public
83886	Design: Lucent Vermilion Onyx	jewels	intrinsic item metadata	public
83887	Design: Misty Alexandrite	jewels	intrinsic item metadata	public
83888	Design: Misty Wild Jade	jewels	intrinsic item metadata	public
83889	Design: Mysterious Imperial Amethyst	jewels	intrinsic item metadata	public
83890	Design: Mysterious Roguestone	jewels	intrinsic item metadata	public
83891	Design: Mystic Sun's Radiance	jewels	intrinsic item metadata	public
83892	Design: Mystic Sunstone	jewels	intrinsic item metadata	public
83893	Design: Nimble Alexandrite	jewels	intrinsic item metadata	public
83894	Design: Nimble Wild Jade	jewels	intrinsic item metadata	public
83895	Design: Piercing Alexandrite	jewels	intrinsic item metadata	public
83896	Design: Piercing Wild Jade	jewels	intrinsic item metadata	public
83897	Design: Polished Tiger Opal	jewels	intrinsic item metadata	public
83898	Design: Polished Vermilion Onyx	jewels	intrinsic item metadata	public
83899	Design: Potent Tiger Opal	jewels	intrinsic item metadata	public
83900	Design: Potent Vermilion Onyx	jewels	intrinsic item metadata	public
83902	Design: Precise Pandarian Garnet	jewels	intrinsic item metadata	public
83903	Design: Precise Primordial Ruby	jewels	intrinsic item metadata	public
83904	Design: Precise Serpent's Eye	jewels	intrinsic item metadata	public
83905	Design: Puissant Alexandrite	jewels	intrinsic item metadata	public
83906	Design: Puissant Wild Jade	jewels	intrinsic item metadata	public
83907	Design: Purified Imperial Amethyst	jewels	intrinsic item metadata	public
83908	Design: Purified Roguestone	jewels	intrinsic item metadata	public
83909	Design: Quick Serpent's Eye	jewels	intrinsic item metadata	public
83910	Design: Quick Sun's Radiance	jewels	intrinsic item metadata	public
83911	Design: Quick Sunstone	jewels	intrinsic item metadata	public
83912	Design: Radiant Alexandrite	jewels	intrinsic item metadata	public
83913	Design: Radiant Wild Jade	jewels	intrinsic item metadata	public
83914	Design: Reckless Tiger Opal	jewels	intrinsic item metadata	public
83915	Design: Reckless Vermilion Onyx	jewels	intrinsic item metadata	public
83916	Design: Reflection of the Sea	jewels	intrinsic item metadata	public
83917	Design: Regal Alexandrite	jewels	intrinsic item metadata	public
83918	Design: Regal Wild Jade	jewels	intrinsic item metadata	public
83919	Design: Resolute Tiger Opal	jewels	intrinsic item metadata	public
83920	Design: Resolute Vermilion Onyx	jewels	intrinsic item metadata	public
83921	Design: Resplendent Tiger Opal	jewels	intrinsic item metadata	public
83922	Design: Resplendent Vermilion Onyx	jewels	intrinsic item metadata	public
83923	Design: Retaliating Imperial Amethyst	jewels	intrinsic item metadata	public
83924	Design: Retaliating Roguestone	jewels	intrinsic item metadata	public
83927	Design: Rigid Lapis Lazuli	jewels	intrinsic item metadata	public
83928	Design: Rigid River's Heart	jewels	intrinsic item metadata	public
83929	Design: Rigid Serpent's Eye	jewels	intrinsic item metadata	public
83930	Design: Roguestone Shadowband	jewels	intrinsic item metadata	public
83933	Design: Scrying Roguestone	jewels	intrinsic item metadata	public
83934	Design: Sensei's Alexandrite	jewels	intrinsic item metadata	public
83935	Design: Sensei's Wild Jade	jewels	intrinsic item metadata	public
83936	Design: Shattered Alexandrite	jewels	intrinsic item metadata	public
83937	Design: Shattered Wild Jade	jewels	intrinsic item metadata	public
83938	Design: Shifting Imperial Amethyst	jewels	intrinsic item metadata	public
83939	Design: Shifting Roguestone	jewels	intrinsic item metadata	public
83940	Design: Skillful Tiger Opal	jewels	intrinsic item metadata	public
83941	Design: Skillful Vermilion Onyx	jewels	intrinsic item metadata	public
83942	Design: Skymage Circle	jewels	intrinsic item metadata	public
83943	Design: Smooth Serpent's Eye	jewels	intrinsic item metadata	public
83944	Design: Smooth Sun's Radiance	jewels	intrinsic item metadata	public
83945	Design: Smooth Sunstone	jewels	intrinsic item metadata	public
83946	Design: Solid Lapis Lazuli	jewels	intrinsic item metadata	public
83947	Design: Solid River's Heart	jewels	intrinsic item metadata	public
83948	Design: Solid Serpent's Eye	jewels	intrinsic item metadata	public
83949	Design: Sovereign Imperial Amethyst	jewels	intrinsic item metadata	public
83950	Design: Sovereign Roguestone	jewels	intrinsic item metadata	public
83951	Design: Sparkling Lapis Lazuli	jewels	intrinsic item metadata	public
83952	Design: Sparkling River's Heart	jewels	intrinsic item metadata	public
83953	Design: Sparkling Serpent's Eye	jewels	intrinsic item metadata	public
83954	Design: Splendid Tiger Opal	jewels	intrinsic item metadata	public
83955	Design: Splendid Vermilion Onyx	jewels	intrinsic item metadata	public
83956	Design: Stalwart Tiger Opal	jewels	intrinsic item metadata	public
83957	Design: Stalwart Vermilion Onyx	jewels	intrinsic item metadata	public
83958	Design: Steady Alexandrite	jewels	intrinsic item metadata	public
83959	Design: Steady Wild Jade	jewels	intrinsic item metadata	public
83960	Design: Stormy Lapis Lazuli	jewels	intrinsic item metadata	public
83961	Design: Stormy River's Heart	jewels	intrinsic item metadata	public
83962	Design: Subtle Serpent's Eye	jewels	intrinsic item metadata	public
83963	Design: Subtle Sun's Radiance	jewels	intrinsic item metadata	public
83964	Design: Subtle Sunstone	jewels	intrinsic item metadata	public
83965	Design: Tenuous Tiger Opal	jewels	intrinsic item metadata	public
83966	Design: Tenuous Vermilion Onyx	jewels	intrinsic item metadata	public
83967	Design: Tiger Opal Pendant	jewels	intrinsic item metadata	public
83968	Design: Timeless Imperial Amethyst	jewels	intrinsic item metadata	public
83969	Design: Timeless Roguestone	jewels	intrinsic item metadata	public
83970	Design: Turbid Alexandrite	jewels	intrinsic item metadata	public
83971	Design: Turbid Wild Jade	jewels	intrinsic item metadata	public
83972	Design: Veiled Imperial Amethyst	jewels	intrinsic item metadata	public
83973	Design: Veiled Roguestone	jewels	intrinsic item metadata	public
83974	Design: Vivid Alexandrite	jewels	intrinsic item metadata	public
83975	Design: Vivid Wild Jade	jewels	intrinsic item metadata	public
83976	Design: Wicked Tiger Opal	jewels	intrinsic item metadata	public
83977	Design: Wicked Vermilion Onyx	jewels	intrinsic item metadata	public
83978	Design: Widow Chain	jewels	intrinsic item metadata	public
83979	Design: Willful Tiger Opal	jewels	intrinsic item metadata	public
83980	Design: Willful Vermilion Onyx	jewels	intrinsic item metadata	public
83981	Design: Zen Alexandrite	jewels	intrinsic item metadata	public
83982	Design: Zen Wild Jade	jewels	intrinsic item metadata	public
84122	Recipe: Alchemist's Flask	alchemy	intrinsic item metadata	public
84123	Recipe: Flask of Falling Leaves	alchemy	intrinsic item metadata	public
84124	Recipe: Master Healing Potion	alchemy	intrinsic item metadata	public
84125	Recipe: Transmute Sun's Radiance	alchemy	intrinsic item metadata	public
84126	Recipe: Transmute Vermilion Onyx	alchemy	intrinsic item metadata	public
84127	Recipe: Alchemist's Rejuvenation	alchemy	intrinsic item metadata	public
84128	Recipe: Desecrated Oil	alchemy	intrinsic item metadata	public
84129	Recipe: Elixir of Mirrors	alchemy	intrinsic item metadata	public
84130	Recipe: Elixir of Peace	alchemy	intrinsic item metadata	public
84131	Recipe: Elixir of Perfection	alchemy	intrinsic item metadata	public
84132	Recipe: Elixir of the Rapids	alchemy	intrinsic item metadata	public
84133	Recipe: Elixir of Weaponry	alchemy	intrinsic item metadata	public
84134	Recipe: Flask of Spring Blossoms	alchemy	intrinsic item metadata	public
84135	Recipe: Flask of the Earth	alchemy	intrinsic item metadata	public
84136	Recipe: Flask of the Warm Sun	alchemy	intrinsic item metadata	public
84137	Recipe: Flask of Winter's Bite	alchemy	intrinsic item metadata	public
84138	Recipe: Mad Hozen Elixir	alchemy	intrinsic item metadata	public
84139	Recipe: Mantid Elixir	alchemy	intrinsic item metadata	public
84140	Recipe: Master Mana Potion	alchemy	intrinsic item metadata	public
84141	Recipe: Monk's Elixir	alchemy	intrinsic item metadata	public
84142	Recipe: Darkwater Potion	alchemy	intrinsic item metadata	public
84143	Recipe: Potion of Focus	alchemy	intrinsic item metadata	public
84144	Recipe: Potion of Mogu Power	alchemy	intrinsic item metadata	public
84145	Recipe: Potion of Luck	alchemy	intrinsic item metadata	public
84146	Recipe: Potion of the Jade Serpent	alchemy	intrinsic item metadata	public
84147	Recipe: Potion of the Mountains	alchemy	intrinsic item metadata	public
84148	Recipe: Transmute Imperial Amethyst	alchemy	intrinsic item metadata	public
84149	Recipe: Transmute Living Steel	alchemy	intrinsic item metadata	public
84151	Recipe: Transmute Primordial Ruby	alchemy	intrinsic item metadata	public
84152	Recipe: Transmute River's Heart	alchemy	intrinsic item metadata	public
84153	Recipe: Transmute Trillium Bar	alchemy	intrinsic item metadata	public
84154	Recipe: Transmute Wild Jade	alchemy	intrinsic item metadata	public
84155	Recipe: Virmen's Bite	alchemy	intrinsic item metadata	public
84174	Plans: Forgewire Axe	blacksmithing	intrinsic item metadata	public
84176	Plans: Ghost Shard	blacksmithing	intrinsic item metadata	public
84177	Plans: Ghost-Forged Belt	blacksmithing	intrinsic item metadata	public
84178	Plans: Ghost-Forged Blade	blacksmithing	intrinsic item metadata	public
84179	Plans: Ghost-Forged Boots	blacksmithing	intrinsic item metadata	public
84180	Plans: Ghost-Forged Bracers	blacksmithing	intrinsic item metadata	public
84181	Plans: Ghost-Forged Breastplate	blacksmithing	intrinsic item metadata	public
84182	Plans: Ghost-Forged Gauntlets	blacksmithing	intrinsic item metadata	public
84183	Plans: Ghost-Forged Helm	blacksmithing	intrinsic item metadata	public
84184	Plans: Ghost-Forged Legplates	blacksmithing	intrinsic item metadata	public
84185	Plans: Ghost-Forged Shoulders	blacksmithing	intrinsic item metadata	public
84186	Plans: Ghostly Skeleton Key	blacksmithing	intrinsic item metadata	public
84187	Plans: Lightsteel Belt	blacksmithing	intrinsic item metadata	public
84188	Plans: Lightsteel Boots	blacksmithing	intrinsic item metadata	public
84189	Plans: Lightsteel Bracers	blacksmithing	intrinsic item metadata	public
84190	Plans: Lightsteel Breastplate	blacksmithing	intrinsic item metadata	public
84191	Plans: Lightsteel Gauntlets	blacksmithing	intrinsic item metadata	public
84192	Plans: Lightsteel Helm	blacksmithing	intrinsic item metadata	public
84193	Plans: Lightsteel Legplates	blacksmithing	intrinsic item metadata	public
84194	Plans: Lightsteel Shield	blacksmithing	intrinsic item metadata	public
84195	Plans: Lightsteel Shoulders	blacksmithing	intrinsic item metadata	public
84199	Plans: Masterwork Ghost-Forged Belt	blacksmithing	intrinsic item metadata	public
84201	Plans: Masterwork Ghost-Forged Boots	blacksmithing	intrinsic item metadata	public
84202	Plans: Masterwork Ghost-Forged Bracers	blacksmithing	intrinsic item metadata	public
84203	Plans: Masterwork Ghost-Forged Breastplate	blacksmithing	intrinsic item metadata	public
84204	Plans: Masterwork Ghost-Forged Gauntlets	blacksmithing	intrinsic item metadata	public
84205	Plans: Masterwork Ghost-Forged Helm	blacksmithing	intrinsic item metadata	public
84206	Plans: Masterwork Ghost-Forged Legplates	blacksmithing	intrinsic item metadata	public
84207	Plans: Masterwork Ghost-Forged Shoulders	blacksmithing	intrinsic item metadata	public
84209	Plans: Masterwork Lightsteel Belt	blacksmithing	intrinsic item metadata	public
84210	Plans: Masterwork Lightsteel Boots	blacksmithing	intrinsic item metadata	public
84211	Plans: Masterwork Lightsteel Bracers	blacksmithing	intrinsic item metadata	public
84212	Plans: Masterwork Lightsteel Breastplate	blacksmithing	intrinsic item metadata	public
84213	Plans: Masterwork Lightsteel Gauntlets	blacksmithing	intrinsic item metadata	public
84214	Plans: Masterwork Lightsteel Helm	blacksmithing	intrinsic item metadata	public
84215	Plans: Masterwork Lightsteel Legplates	blacksmithing	intrinsic item metadata	public
84216	Plans: Masterwork Lightsteel Shoulders	blacksmithing	intrinsic item metadata	public
84228	Plans: Phantasmal Hammer	blacksmithing	intrinsic item metadata	public
84229	Plans: Spiritblade Decimator	blacksmithing	intrinsic item metadata	public
84230	Plans: Spiritguard Belt	blacksmithing	intrinsic item metadata	public
84231	Plans: Spiritguard Boots	blacksmithing	intrinsic item metadata	public
84232	Plans: Spiritguard Bracers	blacksmithing	intrinsic item metadata	public
84233	Plans: Spiritguard Breastplate	blacksmithing	intrinsic item metadata	public
84234	Plans: Spiritguard Gauntlets	blacksmithing	intrinsic item metadata	public
84235	Plans: Spiritguard Helm	blacksmithing	intrinsic item metadata	public
84236	Plans: Spiritguard Legplates	blacksmithing	intrinsic item metadata	public
84237	Plans: Spiritguard Shield	blacksmithing	intrinsic item metadata	public
84238	Plans: Spiritguard Shoulders	blacksmithing	intrinsic item metadata	public
84553	Formula: Enchant Boots - Blurred Speed	enchanting	intrinsic item metadata	public
84554	Formula: Enchant Boots - Greater Haste	enchanting	intrinsic item metadata	public
84555	Formula: Enchant Boots - Greater Precision	enchanting	intrinsic item metadata	public
84556	Formula: Enchant Boots - Pandaren's Step	enchanting	intrinsic item metadata	public
84558	Formula: Enchant Bracer - Superior Dodge	enchanting	intrinsic item metadata	public
84560	Formula: Enchant Bracer - Mastery	enchanting	intrinsic item metadata	public
84562	Formula: Enchant Chest - Glorious Stats	enchanting	intrinsic item metadata	public
84563	Formula: Enchant Chest - Super Resilience	enchanting	intrinsic item metadata	public
84564	Formula: Enchant Chest - Mighty Spirit	enchanting	intrinsic item metadata	public
84565	Formula: Enchant Chest - Superior Stamina	enchanting	intrinsic item metadata	public
84566	Formula: Enchant Cloak - Greater Protection	enchanting	intrinsic item metadata	public
84567	Formula: Enchant Cloak - Superior Critical Strike	enchanting	intrinsic item metadata	public
84568	Formula: Enchant Cloak - Accuracy	enchanting	intrinsic item metadata	public
84569	Formula: Enchant Cloak - Superior Intellect	enchanting	intrinsic item metadata	public
84570	Formula: Enchant Gloves - Superior Expertise	enchanting	intrinsic item metadata	public
84571	Formula: Enchant Gloves - Greater Haste	enchanting	intrinsic item metadata	public
84572	Formula: Enchant Gloves - Superior Mastery	enchanting	intrinsic item metadata	public
84573	Formula: Enchant Gloves - Super Strength	enchanting	intrinsic item metadata	public
84574	Formula: Enchant Off-Hand - Major Intellect	enchanting	intrinsic item metadata	public
84575	Formula: Enchant Ring - Greater Agility	enchanting	intrinsic item metadata	public
84576	Formula: Enchant Ring - Greater Intellect	enchanting	intrinsic item metadata	public
84577	Formula: Enchant Ring - Greater Stamina	enchanting	intrinsic item metadata	public
84578	Formula: Enchant Ring - Greater Strength	enchanting	intrinsic item metadata	public
84579	Formula: Enchant Weapon - Colossus	enchanting	intrinsic item metadata	public
84581	Formula: Enchant Weapon - Elemental Force	enchanting	intrinsic item metadata	public
84582	Formula: Enchant Weapon - Windsong	enchanting	intrinsic item metadata	public
84652	Glyph of Transcendence	inscription	intrinsic item metadata	public
85221	Glyph of the Blazing Trail	inscription	intrinsic item metadata	public
85501	Viseclaw Soup	food	intrinsic item metadata	public
85504	Krasarang Fritters	food	intrinsic item metadata	public
85506	Viseclaw Meat	fish	intrinsic item metadata	public
85559	Sha Armor Kit	enchanting	intrinsic item metadata	public
85568	Brutal Leg Armor	enchanting	intrinsic item metadata	public
85569	Sha-Touched Leg Armor	enchanting	intrinsic item metadata	public
85570	Toughened Leg Armor	enchanting	intrinsic item metadata	public
85577	Tradeskill Food	food	intrinsic item metadata	public
85583	Needle Mushrooms	fish	intrinsic item metadata	public
85584	Silkworm Pupa	fish	intrinsic item metadata	public
85585	Red Beans	fish	intrinsic item metadata	public
85663	Herbalist's Spade	weapons	intrinsic item metadata	public
85683	Glyph of Aspect of the Beast	inscription	intrinsic item metadata	public
85684	Glyph of Black Ice	inscription	intrinsic item metadata	public
85685	Glyph of Breath of Fire	inscription	intrinsic item metadata	public
85686	zzOLD Glyph of Chi Wave		obsolete client record	excluded
85687	Glyph of Clash	inscription	intrinsic item metadata	public
85689	Glyph of Enduring Healing Sphere	inscription	intrinsic item metadata	public
85691	Glyph of Guard	inscription	intrinsic item metadata	public
85692	Glyph of Mana Tea	inscription	intrinsic item metadata	public
85695	Glyph of Zen Meditation	inscription	intrinsic item metadata	public
85696	Glyph of Renewing Mists	inscription	intrinsic item metadata	public
85697	Glyph of Spinning Crane Kick	inscription	intrinsic item metadata	public
85698	Glyph of Spinning Fire Blossom	inscription	intrinsic item metadata	public
85699	Glyph of Surging Mist	inscription	intrinsic item metadata	public
85700	Glyph of Touch of Death	inscription	intrinsic item metadata	public
85708	zzOLD Glyph of Vampiric Touch		obsolete client record	excluded
85711	zzOLD Glyph of the Bear Cub		obsolete client record	excluded
85712	zzOLD Glyph of Flying Serpent Kick		obsolete client record	excluded
85716	Glyph of Righteous Retreat	inscription	intrinsic item metadata	public
85740	Ink	inscription	specialized bag and profession data	public
85787	Chestguard of Earthen Harmony	armor	intrinsic item metadata	public
85788	Chestguard of Nemeses	armor	intrinsic item metadata	public
85789	Contender's Dragonscale Belt	armor	intrinsic item metadata	public
85790	Contender's Dragonscale Boots	armor	intrinsic item metadata	public
85791	Contender's Dragonscale Bracers	armor	intrinsic item metadata	public
85792	Contender's Dragonscale Chestguard	armor	intrinsic item metadata	public
85793	Contender's Dragonscale Gloves	armor	intrinsic item metadata	public
85794	Contender's Dragonscale Helm	armor	intrinsic item metadata	public
85795	Contender's Dragonscale Leggings	armor	intrinsic item metadata	public
85796	Contender's Dragonscale Shoulders	armor	intrinsic item metadata	public
85797	Contender's Leather Belt	armor	intrinsic item metadata	public
85798	Contender's Leather Boots	armor	intrinsic item metadata	public
85799	Contender's Leather Bracers	armor	intrinsic item metadata	public
85800	Contender's Leather Chestguard	armor	intrinsic item metadata	public
85801	Contender's Leather Gloves	armor	intrinsic item metadata	public
85802	Contender's Leather Helm	armor	intrinsic item metadata	public
85803	Contender's Leather Leggings	armor	intrinsic item metadata	public
85804	Contender's Leather Shoulders	armor	intrinsic item metadata	public
85805	Contender's Scale Belt	armor	intrinsic item metadata	public
85806	Contender's Scale Boots	armor	intrinsic item metadata	public
85807	Contender's Scale Bracers	armor	intrinsic item metadata	public
85808	Contender's Scale Chestguard	armor	intrinsic item metadata	public
85809	Contender's Scale Gloves	armor	intrinsic item metadata	public
85810	Contender's Scale Helm	armor	intrinsic item metadata	public
85811	Contender's Scale Leggings	armor	intrinsic item metadata	public
85812	Contender's Scale Shoulders	armor	intrinsic item metadata	public
85813	Contender's Wyrmhide Belt	armor	intrinsic item metadata	public
85814	Contender's Wyrmhide Boots	armor	intrinsic item metadata	public
85815	Contender's Wyrmhide Bracers	armor	intrinsic item metadata	public
85816	Contender's Wyrmhide Chestguard	armor	intrinsic item metadata	public
85817	Contender's Wyrmhide Gloves	armor	intrinsic item metadata	public
85818	Contender's Wyrmhide Helm	armor	intrinsic item metadata	public
85819	Contender's Wyrmhide Leggings	armor	intrinsic item metadata	public
85820	Contender's Wyrmhide Shoulders	armor	intrinsic item metadata	public
85821	Fists of Lightning	armor	intrinsic item metadata	public
85822	Gloves of Earthen Harmony	armor	intrinsic item metadata	public
85823	Greyshadow Chestguard	armor	intrinsic item metadata	public
85824	Greyshadow Gloves	armor	intrinsic item metadata	public
85825	Lifekeeper's Gloves	armor	intrinsic item metadata	public
85826	Lifekeeper's Robe	armor	intrinsic item metadata	public
85827	Liferuned Leather Gloves	armor	intrinsic item metadata	public
85828	Murderer's Gloves	armor	intrinsic item metadata	public
85829	Nightfire Robe	armor	intrinsic item metadata	public
85830	Raiment of Blood and Bone	armor	intrinsic item metadata	public
85831	Raven Lord's Gloves	armor	intrinsic item metadata	public
85832	Misthide Belt	armor	intrinsic item metadata	public
85833	Misthide Boots	armor	intrinsic item metadata	public
85834	Misthide Bracers	armor	intrinsic item metadata	public
85835	Misthide Chestguard	armor	intrinsic item metadata	public
85836	Misthide Gloves	armor	intrinsic item metadata	public
85837	Misthide Helm	armor	intrinsic item metadata	public
85838	Misthide Leggings	armor	intrinsic item metadata	public
85839	Misthide Shoulders	armor	intrinsic item metadata	public
85840	Stormbreaker Chestguard	armor	intrinsic item metadata	public
85841	Stormscale Belt	armor	intrinsic item metadata	public
85842	Stormscale Boots	armor	intrinsic item metadata	public
85843	Stormscale Bracers	armor	intrinsic item metadata	public
85844	Stormscale Chestguard	armor	intrinsic item metadata	public
85845	Stormscale Gloves	armor	intrinsic item metadata	public
85846	Stormscale Helm	armor	intrinsic item metadata	public
85847	Stormscale Leggings	armor	intrinsic item metadata	public
85848	Stormscale Shoulders	armor	intrinsic item metadata	public
85849	Wildblood Gloves	armor	intrinsic item metadata	public
85850	Wildblood Vest	armor	intrinsic item metadata	public
85851	Misthide Drape	armor	intrinsic item metadata	public
85852	Quick Strike Cloak	armor	intrinsic item metadata	public
85853	Stormscale Drape	armor	intrinsic item metadata	public
86026	Perfectly Cooked Instant Noodles	food	intrinsic item metadata	public
86057	Sliced Peaches	food	intrinsic item metadata	public
86069	Rice Pudding	food	intrinsic item metadata	public
86070	Wildfowl Ginseng Soup	food	intrinsic item metadata	public
86073	Spicy Salmon	food	intrinsic item metadata	public
86074	Spicy Vegetable Chips	food	intrinsic item metadata	public
86100	Farm Egg	fish	intrinsic item metadata	public
86238	Pattern: Chestguard of Nemeses	leatherworking	intrinsic item metadata	public
86272	Pattern: Fists of Lightning	leatherworking	intrinsic item metadata	public
86279	Pattern: Liferuned Leather Gloves	leatherworking	intrinsic item metadata	public
86280	Pattern: Murderer's Gloves	leatherworking	intrinsic item metadata	public
86281	Pattern: Nightfire Robe	leatherworking	intrinsic item metadata	public
86283	Pattern: Raiment of Blood and Bone	leatherworking	intrinsic item metadata	public
86284	Pattern: Raven Lord's Gloves	leatherworking	intrinsic item metadata	public
86297	Pattern: Stormbreaker Chestguard	leatherworking	intrinsic item metadata	public
86311	Robe of Eternal Rule	armor	intrinsic item metadata	public
86312	Legacy of the Emperor	armor	intrinsic item metadata	public
86313	Imperial Silk Gloves	armor	intrinsic item metadata	public
86314	Touch of the Light	armor	intrinsic item metadata	public
86379	Pattern: Robe of Eternal Rule	tailoring	intrinsic item metadata	public
86380	Pattern: Imperial Silk Gloves	tailoring	intrinsic item metadata	public
86381	Pattern: Legacy of the Emperor	tailoring	intrinsic item metadata	public
86382	Pattern: Touch of the Light	tailoring	intrinsic item metadata	public
86432	Banana Infused Rum	food	intrinsic item metadata	public
86541	Glyph of Confession	inscription	intrinsic item metadata	public
86561	Test Cookbook		internal test item	excluded
86597	Living Steel Weapon Chain	enchanting	intrinsic item metadata	public
86599	Ghost Iron Shield Spike	enchanting	intrinsic item metadata	public
86607	Goblin Dragon Gun, Mark II	engineering	specialized bag and profession data	public
87213	Mist-Piercing Goggles	armor	intrinsic item metadata	public
87215	Wormhole Generator: Pandaria	engineering	specialized bag and profession data	public
87216	Thermal Anvil	engineering	specialized bag and profession data	public
87226	Banquet of the Grill	food	intrinsic item metadata	public
87227	Recipe: Banquet of the Grill	fish	intrinsic item metadata	public
87228	Great Banquet of the Grill	food	intrinsic item metadata	public
87229	Recipe: Great Banquet of the Grill	fish	intrinsic item metadata	public
87230	Banquet of the Wok	food	intrinsic item metadata	public
87231	Recipe: Banquet of the Wok	fish	intrinsic item metadata	public
87232	Great Banquet of the Wok	food	intrinsic item metadata	public
87233	Recipe: Great Banquet of the Wok	fish	intrinsic item metadata	public
87234	Banquet of the Pot	food	intrinsic item metadata	public
87235	Recipe: Banquet of the Pot	fish	intrinsic item metadata	public
87236	Great Banquet of the Pot	food	intrinsic item metadata	public
87237	Recipe: Great Banquet of the Pot	fish	intrinsic item metadata	public
87238	Banquet of the Steamer	food	intrinsic item metadata	public
87239	Recipe: Banquet of the Steamer	fish	intrinsic item metadata	public
87240	Great Banquet of the Steamer	food	intrinsic item metadata	public
87241	Recipe: Great Banquet of the Steamer	fish	intrinsic item metadata	public
87242	Banquet of the Oven	food	intrinsic item metadata	public
87243	Recipe: Banquet of the Oven	fish	intrinsic item metadata	public
87244	Great Banquet of the Oven	food	intrinsic item metadata	public
87245	Recipe: Great Banquet of the Oven	fish	intrinsic item metadata	public
87246	Banquet of the Brew	food	intrinsic item metadata	public
87247	Recipe: Banquet of the Brew	fish	intrinsic item metadata	public
87248	Great Banquet of the Brew	food	intrinsic item metadata	public
87249	Recipe: Great Banquet of the Brew	fish	intrinsic item metadata	public
87250	Depleted-Kyparium Rocket	engineering	specialized bag and profession data	public
87251	Geosynchronous World Spinner	engineering	specialized bag and profession data	public
87252	Steam-Filled Balloon	engineering	specialized bag and profession data	public
87264	Four Senses Brew	food	intrinsic item metadata	public
87276	Glyph of Holy Resurrection	inscription	intrinsic item metadata	public
87277	Glyph of the Val'kyr	inscription	intrinsic item metadata	public
87278	Glyph of Direction	inscription	intrinsic item metadata	public
87279	Glyph of Marking	inscription	intrinsic item metadata	public
87392	Glyph of Shadowy Friends	inscription	intrinsic item metadata	public
87393	Glyph of Fetch	inscription	intrinsic item metadata	public
87402	Ornate Battleplate of the Master	armor	intrinsic item metadata	public
87403	Chestplate of Limitless Faith	armor	intrinsic item metadata	public
87404	Gauntlets of Unbound Devotion	armor	intrinsic item metadata	public
87405	Unyielding Bloodplate	armor	intrinsic item metadata	public
87406	Gauntlets of Battle Command	armor	intrinsic item metadata	public
87407	Bloodforged Warfists	armor	intrinsic item metadata	public
87408	Plans: Unyielding Bloodplate	blacksmithing	intrinsic item metadata	public
87409	Plans: Gauntlets of Battle Command	blacksmithing	intrinsic item metadata	public
87410	Plans: Ornate Battleplate of the Master	blacksmithing	intrinsic item metadata	public
87411	Plans: Bloodforged Warfists	blacksmithing	intrinsic item metadata	public
87412	Plans: Chestplate of Limitless Faith	blacksmithing	intrinsic item metadata	public
87413	Plans: Gauntlets of Unbound Devotion	blacksmithing	intrinsic item metadata	public
87414	Quality Folded Ghost Iron	ore	intrinsic item metadata	public
87415	Masterfully Folded Ghost Iron	ore	intrinsic item metadata	public
87416	Perfect Folded Ghost Iron	ore	intrinsic item metadata	public
87526	Mechanical Pandaren Dragonling	battle_pets	intrinsic item metadata	public
87559	Greater Crane Wing Inscription	enchanting	intrinsic item metadata	public
87560	Greater Ox Horn Inscription	enchanting	intrinsic item metadata	public
87561	Silver Inlaid Staff	weapons	intrinsic item metadata	public
87562	Rosethorn Staff	weapons	intrinsic item metadata	public
87565	Key to the Planes	weapons	intrinsic item metadata	public
87566	Runed Staff	weapons	intrinsic item metadata	public
87577	Ox Horn Inscription	enchanting	intrinsic item metadata	public
87578	Crane Wing Inscription	enchanting	intrinsic item metadata	public
87579	Tiger Claw Inscription	enchanting	intrinsic item metadata	public
87580	Tiger Fang Inscription	enchanting	intrinsic item metadata	public
87647	Origami Crane	inscription	specialized bag and profession data	public
87648	Origami Frog	inscription	specialized bag and profession data	public
87738	Schematic: Lord Blastington's Scope of Doom	engineering	intrinsic item metadata	public
87739	Schematic: Mirror Scope	engineering	intrinsic item metadata	public
87740	Schematic: Lightweight Retinal Armor	engineering	intrinsic item metadata	public
87741	Schematic: Agile Retinal Armor	engineering	intrinsic item metadata	public
87742	Schematic: Camouflage Retinal Armor	engineering	intrinsic item metadata	public
87743	Schematic: Deadly Retinal Armor	engineering	intrinsic item metadata	public
87744	Schematic: Energized Retinal Armor	engineering	intrinsic item metadata	public
87745	Schematic: Specialized Retinal Armor	engineering	intrinsic item metadata	public
87746	Schematic: Reinforced Retinal Armor	engineering	intrinsic item metadata	public
87747	Schematic: Locksmith's Powderkeg	engineering	intrinsic item metadata	public
87748	Schematic: Watergliding Jets	engineering	intrinsic item metadata	public
87750	Schematic: G91 Landshark	engineering	intrinsic item metadata	public
87751	Schematic: Goblin Flame Thrower, Mark II	engineering	intrinsic item metadata	public
87752	Schematic: Blingtron 4000	engineering	intrinsic item metadata	public
87753	Schematic: Mist-Piercing Goggles	engineering	intrinsic item metadata	public
87754	Schematic: Thermal Anvil	engineering	intrinsic item metadata	public
87755	Schematic: Wormhole Generator: Pandaria	engineering	intrinsic item metadata	public
87756	Schematic: Steam-Filled Balloon	engineering	intrinsic item metadata	public
87757	Schematic: Ghost Iron Dragonling	engineering	intrinsic item metadata	public
87758	Schematic: Mechanical Pandaren Dragonling	engineering	intrinsic item metadata	public
87759	Schematic: Big Game Hunter	engineering	intrinsic item metadata	public
87760	Schematic: Long-Range Trillium Sniper	engineering	intrinsic item metadata	public
87761	Schematic: Depleted-Kyparium Rocket	engineering	intrinsic item metadata	public
87762	Schematic: Geosynchronous World Spinner	engineering	intrinsic item metadata	public
87764	Serpent's Heart Firework	engineering	single crafted-product category	public
87831	Inscribed Monument	inscription	single crafted-product category	public
87872	Desecrated Oil	fish	specialized bag and profession data	public
87875	Glyph of Lightspring	inscription	intrinsic item metadata	public
87880	Glyph of Nimble Brew	inscription	intrinsic item metadata	public
87881	Glyph of Crackling Tiger Lightning	inscription	intrinsic item metadata	public
87882	Glyph of Flying Serpent Kick	inscription	intrinsic item metadata	public
87883	Glyph of Honor	inscription	intrinsic item metadata	public
87884	Glyph of Jab	inscription	intrinsic item metadata	public
87885	Glyph of Rising Tiger Kick	inscription	intrinsic item metadata	public
87886	zzOLD Glyph of Spinning Fire Blossom		obsolete client record	excluded
87887	Glyph of Spirit Roll	inscription	intrinsic item metadata	public
87888	Glyph of Fighting Pose	inscription	intrinsic item metadata	public
87889	Glyph of Water Roll	inscription	intrinsic item metadata	public
87890	Glyph of Zen Flight	inscription	intrinsic item metadata	public
87891	Glyph of Afterlife	inscription	intrinsic item metadata	public
87892	Glyph of Fists of Fury	inscription	intrinsic item metadata	public
87893	Glyph of Fortifying Brew	inscription	intrinsic item metadata	public
87894	Glyph of Leer of the Ox	inscription	intrinsic item metadata	public
87895	Glyph of Life Cocoon	inscription	intrinsic item metadata	public
87896	Glyph of Fortuitous Spheres	inscription	intrinsic item metadata	public
87897	Glyph of Paralysis	inscription	intrinsic item metadata	public
87898	Glyph of Sparring	inscription	intrinsic item metadata	public
87899	Glyph of Detox	inscription	intrinsic item metadata	public
87900	Glyph of Touch of Karma	inscription	intrinsic item metadata	public
87901	Glyph of Targeted Expulsion	inscription	intrinsic item metadata	public
87902	Glyph of Lightwell	inscription	intrinsic item metadata	public
88416	Adrenaline Shot	alchemy	intrinsic item metadata	public
88489	Jade Serpent Firework	engineering	specialized bag and profession data	public
88490	Triple-Distilled Brew	food	intrinsic item metadata	public
88491	Grand Celebration Firework	engineering	specialized bag and profession data	public
88492	Wicked Wikket	food	intrinsic item metadata	public
88493	Celestial Firework	engineering	specialized bag and profession data	public
88506	Plasma Sword	weapons	intrinsic item metadata	public
88529	Sparkling Water	food	intrinsic item metadata	public
88530	Bubbling Beverage	food	intrinsic item metadata	public
88531	Lao Chin's Last Mug	food	intrinsic item metadata	public
88532	Lotus Water	food	intrinsic item metadata	public
89367	Yu'lon Kite	battle_pets	intrinsic item metadata	public
89368	Chi-Ji Kite	battle_pets	intrinsic item metadata	public
89639	Desecrated Herb	herbs	intrinsic item metadata	public
89674	Tense Imperial Amethyst	jewels	intrinsic item metadata	public
89675	Tense Roguestone	jewels	intrinsic item metadata	public
89676	Perfect Tense Roguestone	jewels	intrinsic item metadata	public
89678	Assassin's Roguestone	jewels	intrinsic item metadata	public
89679	Perfect Assassin's Roguestone	jewels	intrinsic item metadata	public
89680	Assassin's Imperial Amethyst	jewels	intrinsic item metadata	public
89683	Hozen Cuervo	food	intrinsic item metadata	public
89737	Enchant Shield - Greater Parry	enchanting	intrinsic item metadata	public
89738	Essence or Dust	enchanting	intrinsic item metadata	public
89868	Glyph of the Cheetah	inscription	intrinsic item metadata	public
89888	Jade Blossom Firework	engineering	specialized bag and profession data	public
89893	Autumn Flower Firework	engineering	specialized bag and profession data	public
89990	Assorted Parts	engineering	specialized bag and profession data	public
89992	Schematic: Serpent's Heart Firework	engineering	intrinsic item metadata	public
89993	Schematic: Grand Celebration Firework	engineering	intrinsic item metadata	public
89994	Schematic: Celestial Firework	engineering	intrinsic item metadata	public
89996	Schematic: Autumn Flower Firework	engineering	intrinsic item metadata	public
89997	Schematic: Jade Blossom Firework	engineering	intrinsic item metadata	public
90046	Living Steel Belt Buckle	enchanting	intrinsic item metadata	public
90135	Thick-Cut Bacon	food	intrinsic item metadata	public
90146	Tinker's Kit	engineering	specialized bag and profession data	public
90396	Gem Fragments	fish	specialized bag and profession data	public
90407	Sparkling Shard	jewels	specialized bag and profession data	public
90457	Mah's Warm Yak-Tail Stew	food	intrinsic item metadata	public
90531	Plans: Ghost Iron Shield Spike	blacksmithing	intrinsic item metadata	public
90532	Plans: Living Steel Weapon Chain	blacksmithing	intrinsic item metadata	public
90548	Deathclaw Imprint	engineering	specialized bag and profession data	public
90550	Primitive Electron Collider	engineering	specialized bag and profession data	public
90551	Robot Brew	engineering	specialized bag and profession data	public
90552	Laser-Etched Leaf	engineering	specialized bag and profession data	public
90553	Premium Viscous Liquid	engineering	specialized bag and profession data	public
90554	Oily Glove	engineering	specialized bag and profession data	public
90555	Bottled Fire	engineering	specialized bag and profession data	public
90556	A Steamy Romance Novel: I'm In Love With a Robot	engineering	specialized bag and profession data	public
90557	Dead Mole	engineering	specialized bag and profession data	public
90558	Extreme Back Scratcher	engineering	specialized bag and profession data	public
90561	Eternium Rose	engineering	specialized bag and profession data	public
90659	Jasmine Tea	food	intrinsic item metadata	public
90660	Black Tea	food	intrinsic item metadata	public
90715	Glyph of Blackout Kick	inscription	intrinsic item metadata	public
92726	Bipsi's Gloves	armor	intrinsic item metadata	public
92727	Glyph of Discreet Magic	inscription	intrinsic item metadata	public
92747	Advanced Refrigeration Unit	bags	intrinsic item metadata	public
92941	Potion of Brawler's Might	alchemy	intrinsic item metadata	public
92942	Potion of Brawler's Cunning	alchemy	intrinsic item metadata	public
92943	Potion of Brawler's Deftness	alchemy	intrinsic item metadata	public
92954	Brawler's Healing Potion	alchemy	intrinsic item metadata	public
93197	Glyph of Supernova	inscription	intrinsic item metadata	public
93202	Glyph of Gateway Attunement	inscription	intrinsic item metadata	public
93203	Glyph of Focus	inscription	intrinsic item metadata	public
93205	Pierre	engineering	specialized bag and profession data	public
93208	Darkmoon P.I.E.	food	intrinsic item metadata	public
93351	Potion of Luck	alchemy	intrinsic item metadata	public
93420	Crafted Dreadful Gladiator's Cape of Cruelty	armor	intrinsic item metadata	public
93421	Crafted Dreadful Gladiator's Cape of Prowess	armor	intrinsic item metadata	public
93428	Crafted Dreadful Gladiator's Cord of Cruelty	armor	intrinsic item metadata	public
93429	Crafted Dreadful Gladiator's Cord of Accuracy	armor	intrinsic item metadata	public
93430	Crafted Dreadful Gladiator's Cord of Meditation	armor	intrinsic item metadata	public
93431	Crafted Dreadful Gladiator's Treads of Cruelty	armor	intrinsic item metadata	public
93432	Crafted Dreadful Gladiator's Treads of Alacrity	armor	intrinsic item metadata	public
93433	Crafted Dreadful Gladiator's Treads of Meditation	armor	intrinsic item metadata	public
93434	Crafted Dreadful Gladiator's Cuffs of Accuracy	armor	intrinsic item metadata	public
93435	Crafted Dreadful Gladiator's Cuffs of Prowess	armor	intrinsic item metadata	public
93436	Crafted Dreadful Gladiator's Cuffs of Meditation	armor	intrinsic item metadata	public
93437	Crafted Dreadful Gladiator's Drape of Cruelty	armor	intrinsic item metadata	public
93438	Crafted Dreadful Gladiator's Drape of Prowess	armor	intrinsic item metadata	public
93439	Crafted Dreadful Gladiator's Drape of Meditation	armor	intrinsic item metadata	public
93453	Crafted Dreadful Gladiator's Dreadplate Chestpiece	armor	intrinsic item metadata	public
93454	Crafted Dreadful Gladiator's Dreadplate Gauntlets	armor	intrinsic item metadata	public
93455	Crafted Dreadful Gladiator's Dreadplate Helm	armor	intrinsic item metadata	public
93456	Crafted Dreadful Gladiator's Dreadplate Legguards	armor	intrinsic item metadata	public
93457	Crafted Dreadful Gladiator's Dreadplate Shoulders	armor	intrinsic item metadata	public
93458	Crafted Dreadful Gladiator's Dragonhide Gloves	armor	intrinsic item metadata	public
93459	Crafted Dreadful Gladiator's Dragonhide Helm	armor	intrinsic item metadata	public
93460	Crafted Dreadful Gladiator's Dragonhide Legguards	armor	intrinsic item metadata	public
93461	Crafted Dreadful Gladiator's Dragonhide Robes	armor	intrinsic item metadata	public
93462	Crafted Dreadful Gladiator's Dragonhide Spaulders	armor	intrinsic item metadata	public
93463	Crafted Dreadful Gladiator's Belt of Meditation	armor	intrinsic item metadata	public
93464	Crafted Dreadful Gladiator's Leather Footguards of Meditation	armor	intrinsic item metadata	public
93465	Crafted Dreadful Gladiator's Bindings of Meditation	armor	intrinsic item metadata	public
93466	Crafted Dreadful Gladiator's Kodohide Gloves	armor	intrinsic item metadata	public
93467	Crafted Dreadful Gladiator's Kodohide Helm	armor	intrinsic item metadata	public
93468	Crafted Dreadful Gladiator's Kodohide Legguards	armor	intrinsic item metadata	public
93469	Crafted Dreadful Gladiator's Kodohide Robes	armor	intrinsic item metadata	public
93470	Crafted Dreadful Gladiator's Kodohide Spaulders	armor	intrinsic item metadata	public
93472	Crafted Dreadful Gladiator's Belt of Cruelty	armor	intrinsic item metadata	public
93473	Crafted Dreadful Gladiator's Leather Footguards of Alacrity	armor	intrinsic item metadata	public
93474	Crafted Dreadful Gladiator's Bindings of Prowess	armor	intrinsic item metadata	public
93475	Crafted Dreadful Gladiator's Wyrmhide Gloves	armor	intrinsic item metadata	public
93476	Crafted Dreadful Gladiator's Wyrmhide Helm	armor	intrinsic item metadata	public
93477	Crafted Dreadful Gladiator's Wyrmhide Legguards	armor	intrinsic item metadata	public
93478	Crafted Dreadful Gladiator's Wyrmhide Robes	armor	intrinsic item metadata	public
93479	Crafted Dreadful Gladiator's Wyrmhide Spaulders	armor	intrinsic item metadata	public
93488	Crafted Dreadful Gladiator's Links of Cruelty	armor	intrinsic item metadata	public
93489	Crafted Dreadful Gladiator's Links of Accuracy	armor	intrinsic item metadata	public
93490	Crafted Dreadful Gladiator's Sabatons of Cruelty	armor	intrinsic item metadata	public
93491	Crafted Dreadful Gladiator's Sabatons of Alacrity	armor	intrinsic item metadata	public
93492	Crafted Dreadful Gladiator's Wristguards of Alacrity	armor	intrinsic item metadata	public
93493	Crafted Dreadful Gladiator's Wristguards of Accuracy	armor	intrinsic item metadata	public
93494	Crafted Dreadful Gladiator's Chain Armor	armor	intrinsic item metadata	public
93495	Crafted Dreadful Gladiator's Chain Gauntlets	armor	intrinsic item metadata	public
93496	Crafted Dreadful Gladiator's Chain Helm	armor	intrinsic item metadata	public
93497	Crafted Dreadful Gladiator's Chain Leggings	armor	intrinsic item metadata	public
93498	Crafted Dreadful Gladiator's Chain Spaulders	armor	intrinsic item metadata	public
93499	Crafted Dreadful Gladiator's Silk Handguards	armor	intrinsic item metadata	public
93500	Crafted Dreadful Gladiator's Silk Cowl	armor	intrinsic item metadata	public
93501	Crafted Dreadful Gladiator's Silk Trousers	armor	intrinsic item metadata	public
93502	Crafted Dreadful Gladiator's Silk Robe	armor	intrinsic item metadata	public
93503	Crafted Dreadful Gladiator's Silk Amice	armor	intrinsic item metadata	public
93504	Crafted Dreadful Gladiator's Waistband of Cruelty	armor	intrinsic item metadata	public
93505	Crafted Dreadful Gladiator's Boots of Alacrity	armor	intrinsic item metadata	public
93506	Crafted Dreadful Gladiator's Armwraps of Accuracy	armor	intrinsic item metadata	public
93507	Crafted Dreadful Gladiator's Ironskin Gloves	armor	intrinsic item metadata	public
93509	Crafted Dreadful Gladiator's Ironskin Helm	armor	intrinsic item metadata	public
93511	Crafted Dreadful Gladiator's Ironskin Legguards	armor	intrinsic item metadata	public
93513	Crafted Dreadful Gladiator's Ironskin Spaulders	armor	intrinsic item metadata	public
93515	Crafted Dreadful Gladiator's Ironskin Tunic	armor	intrinsic item metadata	public
93517	Crafted Dreadful Gladiator's Copperskin Gloves	armor	intrinsic item metadata	public
93519	Crafted Dreadful Gladiator's Copperskin Helm	armor	intrinsic item metadata	public
93521	Crafted Dreadful Gladiator's Copperskin Legguards	armor	intrinsic item metadata	public
93523	Crafted Dreadful Gladiator's Copperskin Spaulders	armor	intrinsic item metadata	public
93525	Crafted Dreadful Gladiator's Copperskin Tunic	armor	intrinsic item metadata	public
93527	Crafted Dreadful Gladiator's Scaled Chestpiece	armor	intrinsic item metadata	public
93528	Crafted Dreadful Gladiator's Scaled Gauntlets	armor	intrinsic item metadata	public
93529	Crafted Dreadful Gladiator's Scaled Helm	armor	intrinsic item metadata	public
93530	Crafted Dreadful Gladiator's Scaled Legguards	armor	intrinsic item metadata	public
93531	Crafted Dreadful Gladiator's Scaled Shoulders	armor	intrinsic item metadata	public
93532	Crafted Dreadful Gladiator's Clasp of Cruelty	armor	intrinsic item metadata	public
93533	Crafted Dreadful Gladiator's Clasp of Meditation	armor	intrinsic item metadata	public
93534	Crafted Dreadful Gladiator's Greaves of Alacrity	armor	intrinsic item metadata	public
93535	Crafted Dreadful Gladiator's Greaves of Meditation	armor	intrinsic item metadata	public
93536	Crafted Dreadful Gladiator's Bracers of Prowess	armor	intrinsic item metadata	public
93537	Crafted Dreadful Gladiator's Bracers of Meditation	armor	intrinsic item metadata	public
93538	Crafted Dreadful Gladiator's Ornamented Chestguard	armor	intrinsic item metadata	public
93539	Crafted Dreadful Gladiator's Ornamented Gloves	armor	intrinsic item metadata	public
93540	Crafted Dreadful Gladiator's Ornamented Headcover	armor	intrinsic item metadata	public
93541	Crafted Dreadful Gladiator's Ornamented Legplates	armor	intrinsic item metadata	public
93542	Crafted Dreadful Gladiator's Ornamented Spaulders	armor	intrinsic item metadata	public
93543	Crafted Dreadful Gladiator's Girdle of Accuracy	armor	intrinsic item metadata	public
93544	Crafted Dreadful Gladiator's Girdle of Prowess	armor	intrinsic item metadata	public
93545	Crafted Dreadful Gladiator's Warboots of Cruelty	armor	intrinsic item metadata	public
93546	Crafted Dreadful Gladiator's Warboots of Alacrity	armor	intrinsic item metadata	public
93547	Crafted Dreadful Gladiator's Armplates of Proficiency	armor	intrinsic item metadata	public
93548	Crafted Dreadful Gladiator's Armplates of Alacrity	armor	intrinsic item metadata	public
93550	Crafted Dreadful Gladiator's Mooncloth Gloves	armor	intrinsic item metadata	public
93551	Crafted Dreadful Gladiator's Mooncloth Helm	armor	intrinsic item metadata	public
93552	Crafted Dreadful Gladiator's Mooncloth Leggings	armor	intrinsic item metadata	public
93553	Crafted Dreadful Gladiator's Mooncloth Robe	armor	intrinsic item metadata	public
93554	Crafted Dreadful Gladiator's Mooncloth Mantle	armor	intrinsic item metadata	public
93555	Crafted Dreadful Gladiator's Satin Gloves	armor	intrinsic item metadata	public
93556	Crafted Dreadful Gladiator's Satin Hood	armor	intrinsic item metadata	public
93557	Crafted Dreadful Gladiator's Satin Leggings	armor	intrinsic item metadata	public
93558	Crafted Dreadful Gladiator's Satin Robe	armor	intrinsic item metadata	public
93559	Crafted Dreadful Gladiator's Satin Mantle	armor	intrinsic item metadata	public
93566	Crafted Dreadful Gladiator's Waistband of Accuracy	armor	intrinsic item metadata	public
93567	Crafted Dreadful Gladiator's Boots of Cruelty	armor	intrinsic item metadata	public
93568	Crafted Dreadful Gladiator's Armwraps of Alacrity	armor	intrinsic item metadata	public
93569	Crafted Dreadful Gladiator's Leather Tunic	armor	intrinsic item metadata	public
93570	Crafted Dreadful Gladiator's Leather Gloves	armor	intrinsic item metadata	public
93571	Crafted Dreadful Gladiator's Leather Helm	armor	intrinsic item metadata	public
93572	Crafted Dreadful Gladiator's Leather Legguards	armor	intrinsic item metadata	public
93573	Crafted Dreadful Gladiator's Leather Spaulders	armor	intrinsic item metadata	public
93574	Crafted Dreadful Gladiator's Waistguard of Meditation	armor	intrinsic item metadata	public
93575	Crafted Dreadful Gladiator's Mail Footguards of Alacrity	armor	intrinsic item metadata	public
93576	Crafted Dreadful Gladiator's Mail Footguards of Meditation	armor	intrinsic item metadata	public
93577	Crafted Dreadful Gladiator's Armbands of Prowess	armor	intrinsic item metadata	public
93578	Crafted Dreadful Gladiator's Armbands of Meditation	armor	intrinsic item metadata	public
93579	Crafted Dreadful Gladiator's Ringmail Armor	armor	intrinsic item metadata	public
93580	Crafted Dreadful Gladiator's Ringmail Gauntlets	armor	intrinsic item metadata	public
93581	Crafted Dreadful Gladiator's Ringmail Helm	armor	intrinsic item metadata	public
93582	Crafted Dreadful Gladiator's Ringmail Leggings	armor	intrinsic item metadata	public
93583	Crafted Dreadful Gladiator's Ringmail Spaulders	armor	intrinsic item metadata	public
93584	Crafted Dreadful Gladiator's Linked Armor	armor	intrinsic item metadata	public
93585	Crafted Dreadful Gladiator's Linked Gauntlets	armor	intrinsic item metadata	public
93586	Crafted Dreadful Gladiator's Linked Helm	armor	intrinsic item metadata	public
93587	Crafted Dreadful Gladiator's Linked Leggings	armor	intrinsic item metadata	public
93588	Crafted Dreadful Gladiator's Linked Spaulders	armor	intrinsic item metadata	public
93589	Crafted Dreadful Gladiator's Waistguard of Cruelty	armor	intrinsic item metadata	public
93590	Crafted Dreadful Gladiator's Mail Armor	armor	intrinsic item metadata	public
93591	Crafted Dreadful Gladiator's Mail Gauntlets	armor	intrinsic item metadata	public
93592	Crafted Dreadful Gladiator's Mail Helm	armor	intrinsic item metadata	public
93593	Crafted Dreadful Gladiator's Mail Leggings	armor	intrinsic item metadata	public
93594	Crafted Dreadful Gladiator's Mail Spaulders	armor	intrinsic item metadata	public
93607	Crafted Dreadful Gladiator's Cloak of Alacrity	armor	intrinsic item metadata	public
93608	Crafted Dreadful Gladiator's Cloak of Prowess	armor	intrinsic item metadata	public
93615	Crafted Dreadful Gladiator's Felweave Handguards	armor	intrinsic item metadata	public
93616	Crafted Dreadful Gladiator's Felweave Cowl	armor	intrinsic item metadata	public
93617	Crafted Dreadful Gladiator's Felweave Trousers	armor	intrinsic item metadata	public
93618	Crafted Dreadful Gladiator's Felweave Raiment	armor	intrinsic item metadata	public
93619	Crafted Dreadful Gladiator's Felweave Amice	armor	intrinsic item metadata	public
93620	Crafted Dreadful Gladiator's Plate Chestpiece	armor	intrinsic item metadata	public
93621	Crafted Dreadful Gladiator's Plate Gauntlets	armor	intrinsic item metadata	public
93622	Crafted Dreadful Gladiator's Plate Helm	armor	intrinsic item metadata	public
93623	Crafted Dreadful Gladiator's Plate Legguards	armor	intrinsic item metadata	public
93624	Crafted Dreadful Gladiator's Plate Shoulders	armor	intrinsic item metadata	public
93705	Nimble Wild Jade	jewels	intrinsic item metadata	public
93706	Nimble Alexandrite	jewels	intrinsic item metadata	public
93707	Perfect Nimble Alexandrite	jewels	intrinsic item metadata	public
93742	Healing Potion	alchemy	intrinsic item metadata	public
94263	Haunted Steel Greaves	armor	intrinsic item metadata	public
94264	Haunted Steel Headcover	armor	intrinsic item metadata	public
94265	Haunted Steel Treads	armor	intrinsic item metadata	public
94266	Haunted Steel Greathelm	armor	intrinsic item metadata	public
94267	Haunted Steel Warboots	armor	intrinsic item metadata	public
94268	Haunted Steel Headguard	armor	intrinsic item metadata	public
94269	Quilen Hide Boots	armor	intrinsic item metadata	public
94270	Quilen Hide Helm	armor	intrinsic item metadata	public
94271	Dreadrunner Sabatons	armor	intrinsic item metadata	public
94272	Dreadrunner Helm	armor	intrinsic item metadata	public
94273	Spirit Keeper Footguards	armor	intrinsic item metadata	public
94274	Spirit Keeper Helm	armor	intrinsic item metadata	public
94275	Cloud Serpent Sabatons	armor	intrinsic item metadata	public
94276	Cloud Serpent Helm	armor	intrinsic item metadata	public
94277	Falling Blossom Treads	armor	intrinsic item metadata	public
94278	Falling Blossom Cowl	armor	intrinsic item metadata	public
94279	Falling Blossom Sandals	armor	intrinsic item metadata	public
94280	Falling Blossom Hood	armor	intrinsic item metadata	public
94289	Haunting Spirit	profession_supplies	curated shared crafting reagent	public
94535	Grilled Dinosaur Haunch	food	intrinsic item metadata	public
94564	Monster - (Weapon) Blacksmith Hammer (Offhand)	weapons	intrinsic item metadata	public
94575	The Planar Edge, Reborn	weapons	intrinsic item metadata	public
94576	Lunar Crescent, Reborn	weapons	intrinsic item metadata	public
94577	Black Planar Edge, Reborn	weapons	intrinsic item metadata	public
94578	Mooncleaver, Reborn	weapons	intrinsic item metadata	public
94579	Wicked Edge of the Planes, Reborn	weapons	intrinsic item metadata	public
94580	Bloodmoon, Reborn	weapons	intrinsic item metadata	public
94581	Drakefist Hammer, Reborn	weapons	intrinsic item metadata	public
94582	Thunder, Reborn	weapons	intrinsic item metadata	public
94583	Deep Thunder, Reborn	weapons	intrinsic item metadata	public
94584	Dragonmaw, Reborn	weapons	intrinsic item metadata	public
94585	Dragonstrike, Reborn	weapons	intrinsic item metadata	public
94586	Stormherald, Reborn	weapons	intrinsic item metadata	public
94587	Fireguard, Reborn	weapons	intrinsic item metadata	public
94588	Lionheart Blade, Reborn	weapons	intrinsic item metadata	public
94589	Blazeguard, Reborn	weapons	intrinsic item metadata	public
94590	Lionheart Champion, Reborn	weapons	intrinsic item metadata	public
94591	Blazefury, Reborn	weapons	intrinsic item metadata	public
94592	Lionheart Executioner, Reborn	weapons	intrinsic item metadata	public
94903	Pierre	battle_pets	intrinsic item metadata	public
95373	Mantid Amber Sliver	archaeology	MoP archaeology keystone data	public
95393	Tangled Kelp	fish	specialized bag and profession data	public
95394	Gokk'lok's Shimmering Pearl	fish	specialized bag and profession data	public
95395	Octopus Egg	fish	specialized bag and profession data	public
95396	Crystallized Barnacle	fish	specialized bag and profession data	public
95397	Dimly Glowing Scale	fish	specialized bag and profession data	public
95398	Humming Jade Scale	fish	specialized bag and profession data	public
95399	Diamond-Crusted Golden Hook	fish	specialized bag and profession data	public
95400	Yaungol Horn Fragment	fish	specialized bag and profession data	public
95401	Failed Experiment Brew	fish	specialized bag and profession data	public
95402	Yun's Chocolate Stout	fish	specialized bag and profession data	public
95403	Nam Adam's Pumpkin Stout	fish	specialized bag and profession data	public
95404	Fishcicle	fish	specialized bag and profession data	public
95405	Master Snowdrift's Vial	fish	specialized bag and profession data	public
95406	Ruby Ring	fish	specialized bag and profession data	public
95407	Jin'yu Pearl	fish	specialized bag and profession data	public
95416	Sky Golem	engineering	single crafted-product category	public
95508	Mantid Amber Piece	archaeology	MoP archaeology keystone data	public
95536	Magnificent Hide Pack	bags	intrinsic item metadata	public
97306	Revitalizing Primal Diamond	jewels	intrinsic item metadata	public
97307	Sparkling River's Heart	jewels	intrinsic item metadata	public
97308	Misty Wild Jade	jewels	intrinsic item metadata	public
97310	Purified Imperial Amethyst	jewels	intrinsic item metadata	public
97311	Quick Sun's Radiance	jewels	intrinsic item metadata	public
97312	Energized Wild Jade	jewels	intrinsic item metadata	public
97313	Brilliant Primordial Ruby	jewels	intrinsic item metadata	public
97512	Ghost Iron Nugget	ore	intrinsic item metadata	public
97534	Burning Primal Diamond	jewels	intrinsic item metadata	public
97535	Mystic Sun's Radiance	jewels	intrinsic item metadata	public
97536	Mysterious Imperial Amethyst	jewels	intrinsic item metadata	public
97537	Stormy River's Heart	jewels	intrinsic item metadata	public
97538	Perfect Willful Tiger Opal	jewels	intrinsic item metadata	public
97546	Kyparite Fragment	ore	intrinsic item metadata	public
97547	Mysterious Imperial Amethyst	jewels	intrinsic item metadata	public
97619	Torn Green Tea Leaf	herbs	intrinsic item metadata	public
97620	Rain Poppy Petal	herbs	intrinsic item metadata	public
97621	Silkweed Stem	herbs	intrinsic item metadata	public
97622	Snow Lily Petal	herbs	intrinsic item metadata	public
97623	Fool's Cap Spores	herbs	intrinsic item metadata	public
97624	Desecrated Herb Pod	herbs	intrinsic item metadata	public
97937	Burning Primal Diamond	jewels	intrinsic item metadata	public
97938	Mystic Sun's Radiance	jewels	intrinsic item metadata	public
97939	Mysterious Imperial Amethyst	jewels	intrinsic item metadata	public
97941	Stormy River's Heart	jewels	intrinsic item metadata	public
97943	Perfect Willful Tiger Opal	jewels	intrinsic item metadata	public
98025	Piercing Wild Jade	jewels	intrinsic item metadata	public
98026	Smooth Sun's Radiance	jewels	intrinsic item metadata	public
98027	Smooth Sun's Radiance	jewels	intrinsic item metadata	public
98028	Crafty Vermilion Onyx	jewels	intrinsic item metadata	public
98051	Potent Vermilion Onyx	jewels	intrinsic item metadata	public
98088	Fractured Sun's Radiance	jewels	intrinsic item metadata	public
98089	Keen Vermilion Onyx	jewels	intrinsic item metadata	public
98090	Rigid River's Heart	jewels	intrinsic item metadata	public
98094	Brilliant Primordial Ruby	jewels	intrinsic item metadata	public
98111	K.R.E.	food	intrinsic item metadata	public
98116	Freeze-Dried Hyena Jerky	food	intrinsic item metadata	public
98118	Scorpion Crunchies	food	intrinsic item metadata	public
98599	White Cloud Leggings	armor	intrinsic item metadata	public
98600	Pennyroyal Leggings	armor	intrinsic item metadata	public
98601	Krasari Prowler Britches	armor	intrinsic item metadata	public
98602	Blessed Trillium Greaves	armor	intrinsic item metadata	public
98603	Leggings of the Night Sky	armor	intrinsic item metadata	public
98604	Snow Lily Britches	armor	intrinsic item metadata	public
98605	Gorge Stalker Legplates	armor	intrinsic item metadata	public
98606	Protector's Trillium Legguards	armor	intrinsic item metadata	public
98607	Avenger's Trillium Legplates	armor	intrinsic item metadata	public
98608	White Cloud Belt	armor	intrinsic item metadata	public
98609	Pennyroyal Belt	armor	intrinsic item metadata	public
98610	Krasari Prowler Belt	armor	intrinsic item metadata	public
98611	Blessed Trillium Belt	armor	intrinsic item metadata	public
98612	Belt of the Night Sky	armor	intrinsic item metadata	public
98613	Snow Lily Belt	armor	intrinsic item metadata	public
98614	Gorge Stalker Belt	armor	intrinsic item metadata	public
98615	Protector's Trillium Waistguard	armor	intrinsic item metadata	public
98616	Avenger's Trillium Waistplate	armor	intrinsic item metadata	public
98756	Crafted Malevolent Gladiator's Cape of Cruelty	armor	intrinsic item metadata	public
98757	Crafted Malevolent Gladiator's Cape of Prowess	armor	intrinsic item metadata	public
98763	Crafted Malevolent Gladiator's Cord of Cruelty	armor	intrinsic item metadata	public
98764	Crafted Malevolent Gladiator's Cord of Accuracy	armor	intrinsic item metadata	public
98765	Crafted Malevolent Gladiator's Cord of Meditation	armor	intrinsic item metadata	public
98766	Crafted Malevolent Gladiator's Treads of Cruelty	armor	intrinsic item metadata	public
98767	Crafted Malevolent Gladiator's Treads of Alacrity	armor	intrinsic item metadata	public
98768	Crafted Malevolent Gladiator's Treads of Meditation	armor	intrinsic item metadata	public
98769	Crafted Malevolent Gladiator's Cuffs of Accuracy	armor	intrinsic item metadata	public
98770	Crafted Malevolent Gladiator's Cuffs of Prowess	armor	intrinsic item metadata	public
98771	Crafted Malevolent Gladiator's Cuffs of Meditation	armor	intrinsic item metadata	public
98772	Crafted Malevolent Gladiator's Drape of Cruelty	armor	intrinsic item metadata	public
98773	Crafted Malevolent Gladiator's Drape of Prowess	armor	intrinsic item metadata	public
98774	Crafted Malevolent Gladiator's Drape of Meditation	armor	intrinsic item metadata	public
98776	Crafted Malevolent Gladiator's Barrier	armor	intrinsic item metadata	public
98784	Crafted Malevolent Gladiator's Dreadplate Chestpiece	armor	intrinsic item metadata	public
98785	Crafted Malevolent Gladiator's Dreadplate Gauntlets	armor	intrinsic item metadata	public
98786	Crafted Malevolent Gladiator's Dreadplate Helm	armor	intrinsic item metadata	public
98787	Crafted Malevolent Gladiator's Dreadplate Legguards	armor	intrinsic item metadata	public
98788	Crafted Malevolent Gladiator's Dreadplate Shoulders	armor	intrinsic item metadata	public
98789	Crafted Malevolent Gladiator's Dragonhide Gloves	armor	intrinsic item metadata	public
98790	Crafted Malevolent Gladiator's Dragonhide Helm	armor	intrinsic item metadata	public
98791	Crafted Malevolent Gladiator's Dragonhide Legguards	armor	intrinsic item metadata	public
98792	Crafted Malevolent Gladiator's Dragonhide Robes	armor	intrinsic item metadata	public
98793	Crafted Malevolent Gladiator's Dragonhide Spaulders	armor	intrinsic item metadata	public
98794	Crafted Malevolent Gladiator's Belt of Meditation	armor	intrinsic item metadata	public
98795	Crafted Malevolent Gladiator's Footguards of Meditation	armor	intrinsic item metadata	public
98796	Crafted Malevolent Gladiator's Bindings of Meditation	armor	intrinsic item metadata	public
98797	Crafted Malevolent Gladiator's Kodohide Gloves	armor	intrinsic item metadata	public
98798	Crafted Malevolent Gladiator's Kodohide Helm	armor	intrinsic item metadata	public
98799	Crafted Malevolent Gladiator's Kodohide Legguards	armor	intrinsic item metadata	public
98800	Crafted Malevolent Gladiator's Kodohide Robes	armor	intrinsic item metadata	public
98801	Crafted Malevolent Gladiator's Kodohide Spaulders	armor	intrinsic item metadata	public
98802	Crafted Malevolent Gladiator's Belt of Cruelty	armor	intrinsic item metadata	public
98803	Crafted Malevolent Gladiator's Footguards of Alacrity	armor	intrinsic item metadata	public
98804	Crafted Malevolent Gladiator's Bindings of Prowess	armor	intrinsic item metadata	public
98805	Crafted Malevolent Gladiator's Wyrmhide Gloves	armor	intrinsic item metadata	public
98806	Crafted Malevolent Gladiator's Wyrmhide Helm	armor	intrinsic item metadata	public
98807	Crafted Malevolent Gladiator's Wyrmhide Legguards	armor	intrinsic item metadata	public
98808	Crafted Malevolent Gladiator's Wyrmhide Robes	armor	intrinsic item metadata	public
98809	Crafted Malevolent Gladiator's Wyrmhide Spaulders	armor	intrinsic item metadata	public
98810	Crafted Malevolent Gladiator's Redoubt	armor	intrinsic item metadata	public
98814	Crafted Malevolent Gladiator's Links of Cruelty	armor	intrinsic item metadata	public
98815	Crafted Malevolent Gladiator's Links of Accuracy	armor	intrinsic item metadata	public
98816	Crafted Malevolent Gladiator's Sabatons of Cruelty	armor	intrinsic item metadata	public
98817	Crafted Malevolent Gladiator's Sabatons of Alacrity	armor	intrinsic item metadata	public
98818	Crafted Malevolent Gladiator's Wristguards of Alacrity	armor	intrinsic item metadata	public
98819	Crafted Malevolent Gladiator's Wristguards of Accuracy	armor	intrinsic item metadata	public
98820	Crafted Malevolent Gladiator's Chain Armor	armor	intrinsic item metadata	public
98821	Crafted Malevolent Gladiator's Chain Gauntlets	armor	intrinsic item metadata	public
98822	Crafted Malevolent Gladiator's Chain Helm	armor	intrinsic item metadata	public
98823	Crafted Malevolent Gladiator's Chain Leggings	armor	intrinsic item metadata	public
98824	Crafted Malevolent Gladiator's Chain Spaulders	armor	intrinsic item metadata	public
98825	Crafted Malevolent Gladiator's Silk Handguards	armor	intrinsic item metadata	public
98826	Crafted Malevolent Gladiator's Silk Cowl	armor	intrinsic item metadata	public
98827	Crafted Malevolent Gladiator's Silk Trousers	armor	intrinsic item metadata	public
98828	Crafted Malevolent Gladiator's Silk Robe	armor	intrinsic item metadata	public
98829	Crafted Malevolent Gladiator's Silk Amice	armor	intrinsic item metadata	public
98830	Crafted Malevolent Gladiator's Waistband of Cruelty	armor	intrinsic item metadata	public
98831	Crafted Malevolent Gladiator's Boots of Alacrity	armor	intrinsic item metadata	public
98832	Crafted Malevolent Gladiator's Armwraps of Accuracy	armor	intrinsic item metadata	public
98833	Crafted Malevolent Gladiator's Ironskin Gloves	armor	intrinsic item metadata	public
98834	Crafted Malevolent Gladiator's Ironskin Helm	armor	intrinsic item metadata	public
98835	Crafted Malevolent Gladiator's Ironskin Legguards	armor	intrinsic item metadata	public
98836	Crafted Malevolent Gladiator's Ironskin Spaulders	armor	intrinsic item metadata	public
98837	Crafted Malevolent Gladiator's Ironskin Tunic	armor	intrinsic item metadata	public
98838	Crafted Malevolent Gladiator's Copperskin Gloves	armor	intrinsic item metadata	public
98839	Crafted Malevolent Gladiator's Copperskin Helm	armor	intrinsic item metadata	public
98840	Crafted Malevolent Gladiator's Copperskin Legguards	armor	intrinsic item metadata	public
98841	Crafted Malevolent Gladiator's Copperskin Spaulders	armor	intrinsic item metadata	public
98842	Crafted Malevolent Gladiator's Copperskin Tunic	armor	intrinsic item metadata	public
98843	Crafted Malevolent Gladiator's Scaled Chestpiece	armor	intrinsic item metadata	public
98844	Crafted Malevolent Gladiator's Scaled Gauntlets	armor	intrinsic item metadata	public
98845	Crafted Malevolent Gladiator's Scaled Helm	armor	intrinsic item metadata	public
98846	Crafted Malevolent Gladiator's Scaled Legguards	armor	intrinsic item metadata	public
98847	Crafted Malevolent Gladiator's Scaled Shoulders	armor	intrinsic item metadata	public
98848	Crafted Malevolent Gladiator's Clasp of Cruelty	armor	intrinsic item metadata	public
98849	Crafted Malevolent Gladiator's Clasp of Meditation	armor	intrinsic item metadata	public
98850	Crafted Malevolent Gladiator's Greaves of Alacrity	armor	intrinsic item metadata	public
98851	Crafted Malevolent Gladiator's Greaves of Meditation	armor	intrinsic item metadata	public
98852	Crafted Malevolent Gladiator's Bracers of Prowess	armor	intrinsic item metadata	public
98853	Crafted Malevolent Gladiator's Bracers of Meditation	armor	intrinsic item metadata	public
98854	Crafted Malevolent Gladiator's Ornamented Chestguard	armor	intrinsic item metadata	public
98855	Crafted Malevolent Gladiator's Ornamented Gloves	armor	intrinsic item metadata	public
98856	Crafted Malevolent Gladiator's Ornamented Headcover	armor	intrinsic item metadata	public
98857	Crafted Malevolent Gladiator's Ornamented Legplates	armor	intrinsic item metadata	public
98858	Crafted Malevolent Gladiator's Ornamented Spaulders	armor	intrinsic item metadata	public
98859	Crafted Malevolent Gladiator's Girdle of Accuracy	armor	intrinsic item metadata	public
98860	Crafted Malevolent Gladiator's Girdle of Prowess	armor	intrinsic item metadata	public
98861	Crafted Malevolent Gladiator's Warboots of Cruelty	armor	intrinsic item metadata	public
98862	Crafted Malevolent Gladiator's Warboots of Alacrity	armor	intrinsic item metadata	public
98863	Crafted Malevolent Gladiator's Armplates of Proficiency	armor	intrinsic item metadata	public
98864	Crafted Malevolent Gladiator's Armplates of Alacrity	armor	intrinsic item metadata	public
98865	Crafted Malevolent Gladiator's Mooncloth Gloves	armor	intrinsic item metadata	public
98866	Crafted Malevolent Gladiator's Mooncloth Helm	armor	intrinsic item metadata	public
98867	Crafted Malevolent Gladiator's Mooncloth Leggings	armor	intrinsic item metadata	public
98868	Crafted Malevolent Gladiator's Mooncloth Robe	armor	intrinsic item metadata	public
98869	Crafted Malevolent Gladiator's Mooncloth Mantle	armor	intrinsic item metadata	public
98870	Crafted Malevolent Gladiator's Satin Gloves	armor	intrinsic item metadata	public
98871	Crafted Malevolent Gladiator's Satin Hood	armor	intrinsic item metadata	public
98872	Crafted Malevolent Gladiator's Satin Leggings	armor	intrinsic item metadata	public
98873	Crafted Malevolent Gladiator's Satin Robe	armor	intrinsic item metadata	public
98874	Crafted Malevolent Gladiator's Satin Mantle	armor	intrinsic item metadata	public
98881	Crafted Malevolent Gladiator's Waistband of Accuracy	armor	intrinsic item metadata	public
98882	Crafted Malevolent Gladiator's Boots of Cruelty	armor	intrinsic item metadata	public
98883	Crafted Malevolent Gladiator's Armwraps of Alacrity	armor	intrinsic item metadata	public
98884	Crafted Malevolent Gladiator's Leather Tunic	armor	intrinsic item metadata	public
98885	Crafted Malevolent Gladiator's Leather Gloves	armor	intrinsic item metadata	public
98886	Crafted Malevolent Gladiator's Leather Helm	armor	intrinsic item metadata	public
98887	Crafted Malevolent Gladiator's Leather Legguards	armor	intrinsic item metadata	public
98888	Crafted Malevolent Gladiator's Leather Spaulders	armor	intrinsic item metadata	public
98889	Crafted Malevolent Gladiator's Waistguard of Meditation	armor	intrinsic item metadata	public
98890	Crafted Malevolent Gladiator's Footguards of Alacrity	armor	intrinsic item metadata	public
98891	Crafted Malevolent Gladiator's Footguards of Meditation	armor	intrinsic item metadata	public
98892	Crafted Malevolent Gladiator's Armbands of Prowess	armor	intrinsic item metadata	public
98893	Crafted Malevolent Gladiator's Armbands of Meditation	armor	intrinsic item metadata	public
98894	Crafted Malevolent Gladiator's Ringmail Armor	armor	intrinsic item metadata	public
98895	Crafted Malevolent Gladiator's Ringmail Gauntlets	armor	intrinsic item metadata	public
98896	Crafted Malevolent Gladiator's Ringmail Helm	armor	intrinsic item metadata	public
98897	Crafted Malevolent Gladiator's Ringmail Leggings	armor	intrinsic item metadata	public
98898	Crafted Malevolent Gladiator's Ringmail Spaulders	armor	intrinsic item metadata	public
98899	Crafted Malevolent Gladiator's Linked Armor	armor	intrinsic item metadata	public
98900	Crafted Malevolent Gladiator's Linked Gauntlets	armor	intrinsic item metadata	public
98901	Crafted Malevolent Gladiator's Linked Helm	armor	intrinsic item metadata	public
98902	Crafted Malevolent Gladiator's Linked Leggings	armor	intrinsic item metadata	public
98903	Crafted Malevolent Gladiator's Linked Spaulders	armor	intrinsic item metadata	public
98904	Crafted Malevolent Gladiator's Waistguard of Cruelty	armor	intrinsic item metadata	public
98905	Crafted Malevolent Gladiator's Mail Armor	armor	intrinsic item metadata	public
98906	Crafted Malevolent Gladiator's Mail Gauntlets	armor	intrinsic item metadata	public
98907	Crafted Malevolent Gladiator's Mail Helm	armor	intrinsic item metadata	public
98908	Crafted Malevolent Gladiator's Mail Leggings	armor	intrinsic item metadata	public
98909	Crafted Malevolent Gladiator's Mail Spaulders	armor	intrinsic item metadata	public
98913	Crafted Malevolent Gladiator's Cloak of Alacrity	armor	intrinsic item metadata	public
98914	Crafted Malevolent Gladiator's Cloak of Prowess	armor	intrinsic item metadata	public
98920	Crafted Malevolent Gladiator's Shield Wall	armor	intrinsic item metadata	public
98921	Crafted Malevolent Gladiator's Felweave Handguards	armor	intrinsic item metadata	public
98922	Crafted Malevolent Gladiator's Felweave Cowl	armor	intrinsic item metadata	public
98923	Crafted Malevolent Gladiator's Felweave Trousers	armor	intrinsic item metadata	public
98924	Crafted Malevolent Gladiator's Felweave Raiment	armor	intrinsic item metadata	public
98925	Crafted Malevolent Gladiator's Felweave Amice	armor	intrinsic item metadata	public
98926	Crafted Malevolent Gladiator's Plate Chestpiece	armor	intrinsic item metadata	public
98927	Crafted Malevolent Gladiator's Plate Gauntlets	armor	intrinsic item metadata	public
98928	Crafted Malevolent Gladiator's Plate Helm	armor	intrinsic item metadata	public
98929	Crafted Malevolent Gladiator's Plate Legguards	armor	intrinsic item metadata	public
98930	Crafted Malevolent Gladiator's Plate Shoulders	armor	intrinsic item metadata	public
100734	Backside of Fire	engineering	specialized bag and profession data	public
100735	Blingtron Heart Key	engineering	specialized bag and profession data	public
100736	"Human Improved"	engineering	specialized bag and profession data	public
100737	Bling-Bons	engineering	specialized bag and profession data	public
100738	Damaged Generosity Circuit	engineering	specialized bag and profession data	public
100739	Super-Heated Oil	engineering	specialized bag and profession data	public
100905	Rascal-Bot	battle_pets	intrinsic item metadata	public
101630	Noodle Cart Kit	food	intrinsic item metadata	public
101661	Deluxe Noodle Cart Kit	food	intrinsic item metadata	public
101662	Pandaren Treasure Noodle Cart Kit	food	intrinsic item metadata	public
101727	Grand Noodle Cart Kit	food	intrinsic item metadata	public
101729	Grand Deluxe Noodle Cart Kit	food	intrinsic item metadata	public
101740	Grand Pandaren Treasure Noodle Cart Kit	food	intrinsic item metadata	public
101745	Mango Ice	food	intrinsic item metadata	public
101746	Seasoned Pomfruit Slices	food	intrinsic item metadata	public
101747	Farmer's Delight	food	intrinsic item metadata	public
101748	Spiced Blossom Soup	food	intrinsic item metadata	public
101749	Stuffed Lushrooms	food	intrinsic item metadata	public
101750	Fluffy Silkfeather Omelet	food	intrinsic item metadata	public
102153	Glyph of Angels	inscription	intrinsic item metadata	public
102218	Spirit of War	profession_supplies	curated shared crafting reagent	public
102351	Drums of Rage	leatherworking	specialized bag and profession data	public
102483	Crafted Malevolent Gladiator's Medallion of Tenacity	trinkets	intrinsic item metadata	public
102536	Fresh Lushroom	fish	intrinsic item metadata	public
102537	Fresh Silkfeather Hawk Eggs	fish	intrinsic item metadata	public
102538	Fresh Shao-Tien Rice	fish	intrinsic item metadata	public
102539	Fresh Strawberries	fish	intrinsic item metadata	public
102540	Fresh Mangos	fish	intrinsic item metadata	public
102541	Aged Balsamic Vinegar	fish	intrinsic item metadata	public
102542	Ancient Pandaren Spices	fish	intrinsic item metadata	public
102543	Aged Mogu'shan Cheese	fish	intrinsic item metadata	public
104046	Glyph of Swift Death	inscription	intrinsic item metadata	public
104047	Glyph of Loud Horn	inscription	intrinsic item metadata	public
104048	Glyph of Regenerative Magic	inscription	intrinsic item metadata	public
104049	Glyph of Festering Blood	inscription	intrinsic item metadata	public
104050	Glyph of Divine Shield	inscription	intrinsic item metadata	public
104051	Glyph of Hand of Sacrifice	inscription	intrinsic item metadata	public
104052	Glyph of Purging	inscription	intrinsic item metadata	public
104053	Glyph of Eternal Earth	inscription	intrinsic item metadata	public
104054	Glyph of Havoc	inscription	intrinsic item metadata	public
104055	Glyph of Impaling Throws	inscription	intrinsic item metadata	public
104056	Glyph of the Executor	inscription	intrinsic item metadata	public
104099	Glyph of the Skeleton	inscription	intrinsic item metadata	public
104101	Glyph of the Long Winter	inscription	intrinsic item metadata	public
104102	Glyph of the Sprouting Mushroom	inscription	intrinsic item metadata	public
104103	Glyph of One with Nature	inscription	intrinsic item metadata	public
104104	Glyph of the Unbound Elemental	inscription	intrinsic item metadata	public
104105	Glyph of Evaporation	inscription	intrinsic item metadata	public
104106	Glyph of Condensation	inscription	intrinsic item metadata	public
104107	Glyph of the Exorcist	inscription	intrinsic item metadata	public
104108	Glyph of Pillar of Light	inscription	intrinsic item metadata	public
104109	Glyph of Angels	inscription	intrinsic item metadata	public
104120	Glyph of the Sha	inscription	intrinsic item metadata	public
104121	Glyph of Shifted Appearances	inscription	intrinsic item metadata	public
104122	Glyph of Inspired Hymns	inscription	intrinsic item metadata	public
104123	Glyph of Headhunting	inscription	intrinsic item metadata	public
104124	Glyph of Improved Distraction	inscription	intrinsic item metadata	public
104126	Glyph of Spirit Raptors	inscription	intrinsic item metadata	public
104127	Glyph of Lingering Ancestors	inscription	intrinsic item metadata	public
104128	Glyph of Spirit Wolf	inscription	intrinsic item metadata	public
104129	Glyph of Flaming Serpent	inscription	intrinsic item metadata	public
104130	Glyph of the Compy	inscription	intrinsic item metadata	public
104131	Glyph of Elemental Familiars	inscription	intrinsic item metadata	public
104133	Glyph of Astral Fixation	inscription	intrinsic item metadata	public
104134	Glyph of Rain of Frogs	inscription	intrinsic item metadata	public
104135	Glyph of the Raging Whirlwind	inscription	intrinsic item metadata	public
104136	Glyph of the Subtle Defender	inscription	intrinsic item metadata	public
104137	Glyph of the Watchful Eye	inscription	intrinsic item metadata	public
104138	Glyph of the Weaponmaster	inscription	intrinsic item metadata	public
104209	Technique: Glyph of Loud Horn	inscription	intrinsic item metadata	public
104210	Technique: Glyph of Regenerative Magic	inscription	intrinsic item metadata	public
104216	Technique: Glyph of Havoc	inscription	intrinsic item metadata	public
104217	Technique: Glyph of Impaling Throws	inscription	intrinsic item metadata	public
104219	Technique: Glyph of Skeleton	inscription	intrinsic item metadata	public
104222	Technique: Glyph of One with Nature	inscription	intrinsic item metadata	public
104224	Technique: Glyph of Evaporation	inscription	intrinsic item metadata	public
104225	Technique: Glyph of Condensation	inscription	intrinsic item metadata	public
104227	Technique: Glyph of Pillar of Light	inscription	intrinsic item metadata	public
104230	Technique: Glyph of Shifted Appearances	inscription	intrinsic item metadata	public
104231	Technique: Glyph of Inspired Hymns	inscription	intrinsic item metadata	public
104232	Technique: Glyph of Headhunting	inscription	intrinsic item metadata	public
104235	Technique: Glyph of Lingering Ancestors	inscription	intrinsic item metadata	public
104241	Technique: Glyph of Rain of Frogs	inscription	intrinsic item metadata	public
104244	Technique: Glyph of the Watchful Eye	inscription	intrinsic item metadata	public
104245	Technique: Glyph of the Weaponmaster	inscription	intrinsic item metadata	public
104270	Glyph of the Lean Pack	inscription	intrinsic item metadata	public
104274	Glyph of Focused Fire	inscription	intrinsic item metadata	public
104276	Glyph of Enduring Deceit	inscription	intrinsic item metadata	public
104277	Potion of Illusion <New>	alchemy	intrinsic item metadata	public
104278	Glyph of Chameleon	inscription	intrinsic item metadata	public
104279	Technique: Glyph of the Lean Pack	inscription	intrinsic item metadata	public
104314	Dragon P.I.E.	food	intrinsic item metadata	public
104316	Spectral Grog	food	intrinsic item metadata	public
104339	Harmonious River Noodles	food	intrinsic item metadata	public
104340	Crazy Snake Noodles	food	intrinsic item metadata	public
104341	Steaming Goat Noodles	food	intrinsic item metadata	public
104342	Spicy Mushan Noodles	food	intrinsic item metadata	public
104343	Golden Dragon Noodles	food	intrinsic item metadata	public
104344	Lucky Mushroom Noodles	food	intrinsic item metadata	public
104348	Timeless Tea	food	intrinsic item metadata	public
105700	Kun-Lai Kicker	food	intrinsic item metadata	public
105701	Greenstone Brew	food	intrinsic item metadata	public
105702	Boomer Brew	food	intrinsic item metadata	public
105703	Stormstout Brew	food	intrinsic item metadata	public
105704	Yan-Zhu's Blazing Brew	food	intrinsic item metadata	public
105705	Chani's Bitter Brew	food	intrinsic item metadata	public
105706	Shado-Pan Brew	food	intrinsic item metadata	public
105707	Unga Brew	food	intrinsic item metadata	public
105708	Shimmering Amber-Brew	food	intrinsic item metadata	public
105711	Funky Monkey Brew	food	intrinsic item metadata	public
105717	Rice-Wine Mushrooms	food	intrinsic item metadata	public
105718	Sha Crystal Fragment	enchanting	intrinsic item metadata	public
105719	Brew-Curried Whitefish	food	intrinsic item metadata	public
105720	Candied Apple	food	intrinsic item metadata	public
105721	Hot Papaya Milk	food	intrinsic item metadata	public
105722	Nutty Brew-Bun	food	intrinsic item metadata	public
105723	Peanut Pork Chops	food	intrinsic item metadata	public
105724	Fried Cheese Dumplings	food	intrinsic item metadata	public
108920	Lemon Flower Pudding	food	intrinsic item metadata	public
185848	Greater Drums of Battle	leatherworking	specialized bag and profession data	public
185849	Greater Drums of Panic	leatherworking	specialized bag and profession data	public
185850	Greater Drums of Restoration	leatherworking	specialized bag and profession data	public
185851	Greater Drums of Speed	leatherworking	specialized bag and profession data	public
185852	Greater Drums of War	leatherworking	specialized bag and profession data	public
191061	Brilliant Glass	jewels	single crafted-product category	public
204385	Charred Glyph	inscription	intrinsic item metadata	public
206580	Charred Glyph	inscription	intrinsic item metadata	public
206759	Essence or Dust	enchanting	intrinsic item metadata	public
206953	Charred Glyph	inscription	intrinsic item metadata	public
231998	Rock-Hard Biscuit	food	intrinsic item metadata	public
247800	Recipe: Venerable Potion of Invisibility	alchemy	intrinsic item metadata	public
247802	Venerable Potion of Invisibility	alchemy	intrinsic item metadata	public
254314	Enchant Weapon - Tyranny	enchanting	intrinsic item metadata	public
]==]
local records
local function decode(value)
    return (string.gsub(value, "%%(%x%x)", function(hex)
        return string.char(tonumber(hex, 16))
    end))
end
function GBO:LoadProfessionReference()
    if records then return records end
    records = {}
    for id, name, category, evidence, status in string.gmatch(packed,
        "(%d+)\t([^\t]*)\t([^\t]*)\t([^\t]*)\t([^\n]*)") do
        local itemID = tonumber(id)
        records[itemID] = {itemID = itemID, name = decode(name),
            categoryKey = category ~= "" and decode(category) or nil,
            evidence = decode(evidence), status = decode(status)}
    end
    packed = nil
    self.professionReferenceLoaded = true
    return records
end
