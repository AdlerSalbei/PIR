if (!isServer) exitWith {}; 

_unit = _this select 0;
_anim = _this select 1;
_shans = _this select 2;
_unitGrp = group _unit;
_unitGrpPR = str side group _unit;

private [ "_unit", "_anim", "_shans", "_unitGrp", "_unitGrpPR", "_numberOfKits" ];





if  (alive _unit) then {

 _numberOfKits = {"FirstAidKit" == _x} count (items _unit);	
 _unit removeItems "firstaidkit";	
	
 _unit playmove (selectRandom ["AinvPknlMstpSlayWrflDnon_healed", "AinvPknlMstpSlayWrflDnon_healed2" ]);


	waitUntil { sleep 0.1; ((AnimationState _unit == "AinvPknlMstpSlayWrflDnon_healed") or (AnimationState _unit == "AinvPknlMstpSlayWrflDnon_healed2") or (!alive _unit)) 
	};
 sleep (3 + (random 2));	 
	if (!alive _unit) exitWith {
	 _unit setVariable ["dam_ignore_injured0",false];
	};

	 
//__________________________________________________________Выход_______________________________________________________________	 
	 
	if (_numberOfKits > 0 ) then {
	 for "_i" from 1 to _numberOfKits do { _unit addItem "FirstAidKit"};
	};


	if ((_shans - (random 15)) >=0) then {
		if ((_shans - (random 18)) >=0) then {		

		 _null = [_unit, _anim, _shans] spawn Crawl0;
	
		} else {	

		 _null = [_unit, _anim, _shans] spawn Uncondition0;

		};

	} else {
					

			 _unit setVariable ["dam_ignore_injured0",false];
			 _unit addMPEventHandler ["MPHit", {_this spawn PiR0}];
			};	 

//_______________________________________________________________________________________________________________________________					

};

		 
