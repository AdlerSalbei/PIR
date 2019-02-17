

if (!isServer) exitWith {};
	 
dam_fnc_setunconscious = {
	params[ "_unit" ];
[ _unit, true ] remoteExec [ "setUnconscious", _unit ];
	
};

dam_fnc_wake = {
	params[ "_unit" ];
[ _unit, false ] remoteExec [ "setUnconscious", _unit ];
	
};

//Добавляем  юнитам отслеживание попадания
_units = [];
while { (true) } do {

	{



		
		if ((_x isKindOf "Man")) then
        {

            if (("INCAPACITATED" != lifeState _x) && (alive _x) && !(_x getVariable ["dam_ignore_hit0",false]) && (AnimationState _x != "ainjppnemrunsnonwnondb") && (AnimationState _x != "ainjppnemrunsnonwnondb_still") && (AnimationState _x != "UnconsciousFaceDown") && (AnimationState _x != "UnconsciousFaceUp") && (AnimationState _x != "UnconsciousReviveDefault_C") && (AnimationState _x != "UnconsciousOutProne")) then 
			{
			 _units pushBack _x; 

			 _x removeAllMPEventHandlers "MPHit";
 			 _x setVariable ["dam_ignore_hit0",true];
				if (!isplayer _x) then {
				 _x addMPEventHandler ["MPHit", {_this spawn PiR}];
				} else {
					if !(PiR_injuriplayer_on) exitwith {};
				_x addMPEventHandler ["MPHit", {_this spawn PiR0}];
				};
			 };
	
		};
	
	} forEach allUnits;

sleep 60;

};








