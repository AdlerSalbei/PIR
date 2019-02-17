
//#include "BIS_AddonInfo.hpp"
class CfgPatches
{
	class PiR
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.68;
		requiredAddons[] = {};
		author[] = {"Persian MO, 0-0"};
		authorUrl = "";
	};
};

class CfgFunctions
{
		class SPA0
	{
	file="\PiR\Functions\EyeEffect0.sqf";
	};
	class SPA
	{
		class PiRClass
		{	
			class PiRInit
			{	
				postInit = 1;
				file="\PiR\Functions\PiRInit.sqf";
			};
		};
	};
};


class CfgSounds
{
	#include "PiR.hpp"
};


class CfgVehicles 
{
	class SportItems_base_F;



	class Land_Shar_Prozrachniy : SportItems_base_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		mapSize = 0.200000;

		class SimpleObject 
		{
			eden = 1;
			animate[] = { };
			hide[] = { };
			verticalOffset = 0.091000;
			verticalOffsetWorld = 0;
			init = "''";
		};
		editorPreview = "";
		_generalMacro = "";
		scope = 2;
		scopeCurator = 2;
		displayName = "Land_Shar_Prozrachniy";
		model = "PiR\Models\Land_Shar_Prozrachniy.p3d";
		DLC = "";
		icon = "";
	};
};

class RscPicture ;

class RscTitles 
{

	class PIR_SCREEN_BLOOD 
	{
		idd = -1;
		movingEnable = 0;
		duration = 0.500000;
		fadein = 2;
		fadeout = 10;
		name = "PIR_SCREEN_BLOOD";
		controls[] = {
				"PIR_SCREEN_BLOOD"
		};

		class PIR_SCREEN_BLOOD : RscPicture
		{
			text = "PiR\Models\Blood.paa";
			style = 48;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";
		};
	};


};


class CfgRemoteExec
{
	class Functions
	{
		mode = 2;
		jip = 0;
		class EyeEffect0 {allowedTargets = 1;};
	};
};	