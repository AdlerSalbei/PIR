
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
#include "CfgFunctions.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"

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
